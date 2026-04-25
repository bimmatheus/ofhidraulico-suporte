# Gerenciador de sistemas

> **Disponibilidade:** Projeto com entidade OFH criada
> **Painel do ribbon:** Configurações
> **Atalho:** F1 sobre o botão abre vídeo oficial

## O que faz

Abre a janela central de **dimensionamento e validação** de todos os sistemas
hidráulicos do projeto. É a partir daqui que você:

- **Calcula fluxo e pressão** de cada sistema
- **Edita** elementos, fontes, destinos e dependências entre sistemas
- **Identifica avisos** (níveis baixo, médio, alto, crítico) e suas soluções
- **Visualiza fluxo por filtros de cor** sobre o modelo
- **Inspeciona memorial de cálculo** trecho por trecho
- **Exporta para Excel** a memória completa de dimensionamento

## Quando usar

- Depois de **modelar a rede** e configurar peças no **Gerenciador de peças**
- Quando precisar **validar alertas** antes de fechar uma etapa do projeto
- Para **exportar memorial** para anexar ao caderno técnico
- Para **bloquear trechos** de bombas reservas ou rotas alternativas

## Pré-requisitos

- [ ] Rede modelada no Revit (tubos + peças conectadas)
- [ ] Peças configuradas no [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md) com pesos e vazões
- [ ] Sistemas do Revit **vinculados** aos sistemas do plugin em **Configurações → Sistemas**

!!! warning "Sistemas não aparecem na lista?"
    Se a lista de sistemas estiver vazia mesmo com tubulação no projeto, vá em
    [**Configurações** → aba **Sistemas**](../primeiros-passos/configuracoes-gerais.md#aba-sistemas)
    e faça o **link** entre os sistemas do Revit e os 4 sistemas do plugin
    (Recalque/Sucção, Água Fria, Água Quente, Indefinido).

## Como abrir

No ribbon: **OFHidraulico → Configurações → System Manager**.

## Layout da janela — 4 áreas

A janela é dividida em 4 áreas funcionais:

| Área | Função |
|---|---|
| **1 — Toolbar superior (multi-sistema)** | Ações em vários sistemas selecionados ao mesmo tempo |
| **2 — Abas por tipo de sistema** | Filtra a lista por tipo (Água Fria Doméstica, Água Quente, Recalque, Indefinido) |
| **3 — Tabela de sistemas** | Lista os sistemas — clique para selecionar; botão direito seleciona o sistema no Revit |
| **4 — Comandos por sistema selecionado** | Edição, automações, análise, cálculos, exportação e configurações |

!!! tip "Sistemas principais e secundários"
    No lado esquerdo da tabela há checkboxes para marcar **sistemas principais**.
    Útil para distinguir, por exemplo, alimentação do reservatório (principal) de
    sistemas alimentados por ele (secundários).

---

## Comandos por sistema (Área 4)

Após selecionar um sistema na tabela, os comandos abaixo ficam disponíveis. Estão
agrupados em **Edição**, **Automações**, **Análise**, **Cálculos**, **Exportar** e **Configurações**.

### 4.1 — Edição

#### Editar sistema

Permite ajustar os elementos que compõem o sistema. A janela usa um código de
cores:

| Cor | Significado |
|---|---|
| 🟦 Azul | Itens selecionados |
| ⬜ Branco | Itens disponíveis para seleção |
| 🟩 Verde | Itens que já estão no sistema |
| 🟧 Laranja | Fonte selecionada |

Funções dentro da edição:

- **Editar elementos adicionais** — adiciona elementos que estão fora do sistema
  Revit padrão. Exemplo: incluir um chuveiro no sistema de água fria.
- **Editar fontes do sistema** — define **quem alimenta** o sistema. Em água fria
  geralmente é a caixa d'água (ou suas saídas).
- **Editar destinos do sistema** — define **quem consome**: as peças de utilização
  do sistema.
- **Atribuir fontes aos destinos** — quando há múltiplas fontes, define qual
  fonte alimenta quais destinos. Exemplo: se há duas caixas d'água, indica qual
  abastece cada peça.

!!! tip "Atribuir fontes pelo modelo"
    No 3D do Revit, **clique 1× sobre a caixa** (ou 2× sobre seu nome no painel)
    para abrir a edição dos destinos daquela fonte.

#### Editar sistemas dependentes

Define **dependências entre sistemas**. Exemplo clássico: o sistema *Água quente
06* é alimentado por um boiler que está conectado ao sistema *Água fria potável 5*
— então o quente **depende** do frio.

1. Selecione **Água fria potável 5** na tabela
2. Clique em **Editar sistemas dependentes**
3. Marque o sistema *Água quente 06* na lista
4. **Salvar**

!!! info "Caso especial: chuveiro como elemento adicional"
    Para adicionar o chuveiro (ou qualquer elemento de água quente) ao sistema de
    água fria, **primeiro** marque o sistema de água quente como dependente. Só
    depois disso a edição de elementos adicionais aceita o chuveiro.

#### Ajustar caminhos permitidos

Bloqueia trechos para impedir que o cálculo de fluxo passe por eles. Caso de uso
clássico: **bomba reserva** que não deve receber fluxo no cenário normal.

| Cor | Significado |
|---|---|
| 🟥 Vermelho | Trechos desabilitados |
| 🟩 Verde | Trechos habilitados |
| 🟦 Azul | Trechos selecionados |

Duas formas de desabilitar:

1. **Selecionando no Revit** e clicando nas setas para cima/baixo na janela do plugin
2. **Selecionando na janela** do OF Hidráulico e usando as setas

### 4.2 — Automações

#### Calcular fluxo e pressão do sistema

Roda o dimensionamento completo do sistema selecionado. Após o cálculo:

- Instâncias **calculadas** mudam de aparência (ícone diferente)
- Trechos não calculados continuam com aparência "pendente"

!!! tip "Calcular tudo"
    Selecione múltiplos sistemas na Área 1 e use o comando equivalente da toolbar
    superior para calcular todos de uma vez.

### 4.3 — Análise

#### Verificar avisos do sistema

Janela com **todos os avisos** do sistema selecionado. Cada aviso tem um nível:

| Símbolo | Nível | Ação |
|:---:|---|---|
| 🔴 | **Alto / Crítico** | Bloqueia o dimensionamento — resolva antes de calcular novamente |
| 🟠 | **Médio** | Pode afetar resultados — revise quando possível |
| 🟡 | **Baixo** | Informativo — analise se é relevante para o seu caso |

**Interagindo com os avisos:**

- **Mouse sobre o ícone** → tooltip com explicação, nível e possíveis soluções
- **Mouse sobre o item + clique esquerdo** → seleciona a instância no modelo Revit
- **Mouse sobre o item + clique direito** → menu com possíveis soluções automáticas

#### Verificar fluxo do sistema

Cria um **filtro de cores** sobre a vista do Revit, classificando trechos por
faixas de vazão. O plugin gera os perfis de cor e seus intervalos automaticamente.

- **Tecla `Espaço`** abre a lista de instâncias daquele intervalo
- **Botão direito** sobre instâncias permite selecionar no Revit ou copiar IDs

### 4.4 — Cálculos

#### Mostrar detalhes de pressão

Janela com a **memória completa de cálculo** trecho por trecho do sistema. Recursos:

- Filtros por **ID** ou **Trecho**
- Checkbox **"Apenas caminho crítico"** — mostra só os trechos do path mais
  desfavorável
- Checkbox **"Apenas peças de utilização"**
- Mouse sobre os ícones de informação nas colunas exibe **dicas** sobre cada
  campo, unidades e fórmulas

**Para inspecionar um trecho:**
- Clique direito → **Mostrar Detalhes** (ou tecla `Espaço`) → expande os
  elementos que compõem o trecho
- Clique direito → **Selecionar** → seleciona todos os elementos do trecho no Revit

#### Mostrar detalhes de pressão de peças

Variante da janela acima, mas centrada nas **peças de utilização**. Cada linha é
um **caminho** (da fonte até a peça). Mesmos filtros e ações.

### 4.5 — Exportar

#### Exportar Memória de Cálculo para Excel

Gera um arquivo `.xlsx` com **uma planilha por sistema**. Cada planilha contém
três tabelas:

| Tabela | Conteúdo |
|---|---|
| **Sistema** | Todos os trechos calculados, com diâmetros, velocidades, perdas |
| **Caminho Crítico** | Apenas os trechos que compõem o caminho mais desfavorável |
| **Peças** | Lista das peças com suas vazões e pressões finais |

### 4.6 — Configurações

#### Configurações do sistema

Cada sistema pode ter sua **configuração própria** de:

##### Vazão (método de cálculo de fluxo)

Dois métodos disponíveis (escolha conforme a NBR 5626 e o tipo de uso do projeto):

- **Pesos (Vazão Máxima Provável)** — `Q = 0,3 × √ΣP`
    Soma dos pesos das peças no trecho. **Recomendado para uso residencial**.
    Não usar em locais com uso intenso e simultâneo (quartéis, colégios, vestiários).

- **Vazão (Vazão Máxima Possível)** — soma direta das vazões das peças.
    Pressupõe **uso simultâneo** de todas as peças. Mais conservador.
    Usado em ambientes com alta probabilidade de uso simultâneo.

> Ver detalhes em [Fluxo de água quente e fria](../dimensionamento/fluxo-agua-quente-fria.md).

##### Perda de Carga (método)

Duas equações disponíveis:

- **Darcy-Weisbach** — equação universal, usa coeficiente de atrito (Reynolds + rugosidade)
- **Fair-Whipple-Hsiao** — fórmulas empíricas separadas para tubos lisos e rugosos

> Ver detalhes em [Cálculo de pressão (perda de carga)](../dimensionamento/calculo-de-pressao.md).

---

## Tipos de aviso mais comuns

Cada aviso aponta para vídeo dedicado disponível pela tecla **F1** sobre o botão correspondente:

| Aviso | Nível | Vídeo |
|---|:---:|---|
| Ciclo no sistema | 🔴 Alto | [youtu.be/2gE3MSp8swY](https://youtu.be/2gE3MSp8swY){ target=_blank } |
| Pressão insuficiente em peça | 🟠 Médio | [youtu.be/-RF5_2WCzww](https://youtu.be/-RF5_2WCzww){ target=_blank } |
| Diâmetro subdimensionado | 🟠 Médio | [youtu.be/E7NG9JWaxhk](https://youtu.be/E7NG9JWaxhk){ target=_blank } |
| Conexão entre sistemas distintos | 🟠 Médio | [youtu.be/yVp2WnPVX7k](https://youtu.be/yVp2WnPVX7k){ target=_blank } |
| Equipamento sem fixture units / vazão | 🟡 Baixo | [youtu.be/m0pJoot1iXc](https://youtu.be/m0pJoot1iXc){ target=_blank } |
| Comprimento equivalente faltando | 🟡 Baixo | [youtu.be/MinT506vluI](https://youtu.be/MinT506vluI){ target=_blank } |
| Bloqueio de fluxo | 🟠 Médio | [youtu.be/FBbgUXu9dgg](https://youtu.be/FBbgUXu9dgg){ target=_blank } |
| Misturadores desbalanceados | 🟡 Baixo | [youtu.be/edkc5899Wjk](https://youtu.be/edkc5899Wjk){ target=_blank } |
| Elementos desconectados no sistema | 🟡 Baixo | [youtu.be/ns5SkzqmNbY](https://youtu.be/ns5SkzqmNbY){ target=_blank } |

## Problemas comuns

- **Sintoma:** "O Gerenciador está vazio mesmo com tubos no projeto" — **Causa:**
  os tipos de sistema do Revit não foram vinculados aos do plugin —
  **Solução:** [**Configurações → Sistemas**](../primeiros-passos/configuracoes-gerais.md#aba-sistemas)
  e faça o link
- **Sintoma:** "Cálculo trava ou não conclui" — **Causa:** ciclo na rede —
  **Solução:** resolva avisos de ciclo primeiro
- **Sintoma:** "Pressão insuficiente em todos os pontos" — **Causa:** falta de
  fonte, bomba sem curva ou reservatório com altura zero — **Solução:** ver
  [vídeo de pressão insuficiente](https://youtu.be/-RF5_2WCzww){ target=_blank }
- **Sintoma:** "Misturador acusando desbalanceamento mesmo com pressões parecidas"
  — **Causa:** o limite percentual de balanceamento na aba **Aviso** das
  Configurações está apertado — **Solução:** ajuste o percentual
  ([ver Configurações → Aviso](../primeiros-passos/configuracoes-gerais.md#aba-aviso))

## Material relacionado

- 📄 PDF oficial (20 páginas): [Gerenciador de sistemas.pdf](../downloads/gerenciador-de-sistemas.pdf) *(2,8 MB)*
- 🎬 Vídeo principal: [youtu.be/Sr7Nk7psMPo](https://youtu.be/Sr7Nk7psMPo){ target=_blank }
- 🔗 Ver também:
    - [Configurações gerais](../primeiros-passos/configuracoes-gerais.md) — vincular sistemas e configurar avisos
    - [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md) — peso e vazão das peças
    - [Cálculo de pressão](../dimensionamento/calculo-de-pressao.md) — métodos de perda de carga
    - [Fluxo de água quente e fria](../dimensionamento/fluxo-agua-quente-fria.md) — métodos de cálculo de vazão

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
