# Painel de propriedades (OFH)

> **Disponibilidade:** Projeto aberto
> **Painel do ribbon:** Janelas
> **Comando:** **Show Properties** (`ShowOFHPropertiesCommand`)

## O que faz

Abre uma **janela flutuante (modeless)** que pode ser **encaixada na interface
do Revit** (na lateral, em outra tela, etc.) e mostra as **propriedades OFH** da
instância selecionada no modelo. Funciona em paralelo com o painel de
propriedades padrão do Revit, mas com os campos específicos do plugin.

## Quando usar

- Para **inspecionar** propriedades hidráulicas de uma peça/equipamento sem ter
  que abrir o Equipment Manager
- Para **editar valores por instância** que diferem do tipo cadastrado (ex: uma
  bomba específica com parâmetros customizados)
- Para configurar **vazão de bombas e hidrômetros** no fluxo de trabalho normal,
  selecionando o elemento no modelo

## Pré-requisitos

- [ ] Plugin OFHidraulico ativado
- [ ] Projeto aberto (a entidade OFH é opcional para apenas visualizar; obrigatória para editar valores)

## Como abrir

No ribbon: **OFHidraulico → Janelas → Show Properties**.

A janela abre como **flutuante**. Você pode:

- **Arrastar para a lateral do Revit** — encaixa como painel ancorado
- **Mover para uma segunda tela** — útil em setup multi-monitor
- Manter **sempre visível** durante a modelagem

## Como funciona

1. **Selecione qualquer instância** OFH no modelo (peça, conexão, acessório, equipamento)
2. A janela atualiza automaticamente com os campos relevantes daquela instância
3. **Edite diretamente os campos** quando precisar de valor customizado por instância
4. Mudanças são aplicadas imediatamente (entram nos próximos cálculos)

## O que aparece na janela

Os campos exibidos dependem da **categoria do elemento** selecionado. Em geral:

- **Identificação** — sigla do equipamento, família, tipo
- **Geometria** — altura, cota, diâmetro mínimo
- **Hidráulica** — vazão máxima, pressão mínima/máxima, perda localizada,
  comprimento equivalente
- **Resultados de cálculo** (depois de rodar o Gerenciador de sistemas) — vazão
  efetiva, pressão dinâmica, velocidade

> Para ver todos os possíveis campos por categoria, consulte [Gerenciador de
> peças → Campos de propriedade](../catalogo-e-pecas/gerenciador-de-pecas.md#campos-de-propriedade-por-tipo-de-peca).

## Casos de uso comuns

### Configurar uma bomba específica

1. Selecione a **instância** da bomba no modelo
2. Na janela de Propriedades (OFH), preencha **Diâmetro mínimo** e demais
  parâmetros relevantes
3. Rode o cálculo do sistema de Recalque/Sucção

> Detalhes em [Bombas](../dimensionamento/bombas-e-dimensionamento.md).

### Definir vazão máxima de hidrômetro

1. Selecione a **instância** do hidrômetro no modelo
2. No campo **Vazão Máxima (m³/h)**, escolha entre 1,5 / 3 / 5 / 7 / 10 / 20 / 30
3. Rode o cálculo do sistema correspondente

> Detalhes em [Perda de carga em hidrômetros](../dimensionamento/perda-de-carga-hidrometros.md).

### Customizar fixture units de uma peça específica

Se uma peça do projeto tem requisito diferente do cadastrado no Equipment Manager
(exemplo: uma torneira de jardim com vazão maior), você pode sobrescrever na
**instância** sem alterar o tipo:

1. Selecione a peça
2. Edite os campos diretamente no painel
3. Os novos valores valem **só para essa instância**

## Comparação: Painel OFH vs Equipment Manager

| Característica | Painel OFH | Equipment Manager |
|---|---|---|
| Escopo | Por **instância** | Por **tipo** (família + tipo Revit) |
| Acesso | Selecionando elemento no modelo | Janela dedicada com árvore |
| Quando usar | Caso pontual, valor customizado | Padrão para todas as instâncias do tipo |
| Persiste | No próprio elemento Revit | Na entidade OFH do documento |

## Problemas comuns

- **Sintoma:** "A janela não atualiza ao selecionar elemento" — **Causa:** o
  elemento não é de categoria reconhecida pelo plugin (`OST_PlumbingFixtures`,
  `OST_PipeFitting`, `OST_PipeAccessory`, `OST_MechanicalEquipment`) — **Solução:**
  verifique a categoria no editor de família
- **Sintoma:** "Edito o valor mas não persiste" — **Causa:** projeto sem entidade
  OFH criada — **Solução:** rode **Configurações** ao menos uma vez
- **Sintoma:** "A janela some quando alterno entre vistas" — **Causa:** Revit
  pode reordenar painéis flutuantes — **Solução:** ancore a janela na lateral

## Material relacionado

- 📄 PDF oficial (2 páginas): [Mostrar propriedades.pdf](../downloads/mostrar-propriedades.pdf) *(1,2 MB)*
- 🔗 Ver também:
    - [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md) — configuração por tipo
    - [Bombas](../dimensionamento/bombas-e-dimensionamento.md) — uso típico para bombas
    - [Perda de carga em hidrômetros](../dimensionamento/perda-de-carga-hidrometros.md) — uso típico para hidrômetros

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
