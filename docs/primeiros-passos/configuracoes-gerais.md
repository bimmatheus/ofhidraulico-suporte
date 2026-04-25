# Configurações gerais

> **Disponibilidade:** Projeto aberto
> **Painel do ribbon:** Configurações
> **Atalho:** F1 sobre o botão abre o vídeo oficial

## O que faz

Abre o assistente principal de configurações do projeto OFHidraulico. As
configurações ficam **salvas dentro do arquivo Revit** (via `DocumentEntityManager`),
portanto acompanham o projeto mesmo em outra máquina.

A janela tem **4 abas**:

| Aba | Foco |
|---|---|
| **Geral** | Filtros de cores na visualização |
| **Sistemas** | Vínculo entre sistemas do Revit e os 4 sistemas do plugin |
| **Dimensionamento** | Tubulação por segmento: rugosidade, tipo, diâmetros referentes |
| **Aviso** | Limites para alertas (ex: balanceamento de misturadores) |

## Quando usar

- **Iniciando um projeto novo** — antes de modelar qualquer coisa
- Para **mudar padrões** (unidade de pressão, tipo de tubulação padrão) em projeto existente
- Para **importar configurações** de outro projeto via JSON

## Pré-requisitos

- [ ] Projeto Revit aberto
- [ ] Plugin OFHidraulico ativado (aba **OFHidraulico** visível no ribbon)
- [ ] Idealmente: famílias OFH já transferidas (para que combos de "Família" mostrem opções)

## Como abrir

No ribbon: **OFHidraulico → Configurações → Settings**.

---

## Aba Geral

Tem uma única configuração:

### Filtros de cores

Ativa ou desativa os filtros de cor que o plugin aplica em comandos específicos
para facilitar identificação visual:

- **Edição de sistemas** (cores azul/verde/laranja na janela de edição)
- **Bloqueio de fluxo** (vermelho/verde para trechos desabilitados)

!!! tip "Performance"
    **Desmarcar aumenta a velocidade** das operações de edição de sistemas em
    projetos grandes. Marque apenas quando estiver editando ativamente — pode
    desmarcar para o uso normal.

---

## Aba Sistemas

Define o **vínculo entre os tipos de sistema do Revit** (PipingSystem types) e
os **4 sistemas reconhecidos pelo plugin**:

| Sistema do plugin | Uso típico |
|---|---|
| **Recalque/Sucção** | Tubulação de bombas (sucção e recalque) |
| **Água Fria** | Sistemas de água potável fria |
| **Água Quente** | Sistemas de água quente (boiler, aquecedor) |
| **Indefinido** | Tubulação que não se encaixa nos anteriores |

!!! warning "Sem o link, o Gerenciador de sistemas fica vazio"
    Se o **Gerenciador de sistemas** não mostrar nenhum sistema apesar de você
    ter tubulação no projeto, a causa quase sempre é falta de link aqui. **Apenas
    sistemas com link aparecem na lista.**

**Como vincular:**

1. Abra a aba **Sistemas**
2. Para cada sistema do plugin, escolha no combo qual sistema Revit corresponde
3. Sistemas que **não estão presentes no projeto/template** não aparecem como opção

---

## Aba Dimensionamento

Aqui você configura **cada segmento de tubulação** que existe no projeto/template.

### Por segmento de tubo

Para cada segmento, defina:

| Campo | Descrição |
|---|---|
| **Rugosidade Equivalente** | Valor de referência (em mm) para perda de carga distribuída |
| **Tipo** (do material) | Identificador do material da tubulação |

Valores típicos de rugosidade (extraídos da literatura):

| Material | Rugosidade (mm) |
|---|---:|
| PVC marrom | 0,06 |
| CPVC | 0,06 |
| PPR | 0,007 |
| PEX | 0,007 |
| Aço galvanizado | 0,016 |

!!! info "Catálogos x norma"
    Esses valores vêm de catálogos dos fabricantes — sirvam de **referência
    inicial**. Se você usa material específico ou norma diferente, ajuste aqui.

### Diâmetros referentes

Defina os **diâmetros nominais em polegadas** que o plugin precisa reconhecer.
Esses valores são usados para extrair:

- **Diâmetro interno** correto da tubulação
- **Comprimento equivalente** das conexões específicas (do Gerenciador de peças)

Sem essas conversões corretas, o cálculo de perda de carga distribuída fica
errado.

---

## Aba Aviso

Configura os **limites e propriedades dos avisos** que o plugin gera durante o
cálculo de sistemas.

### Balanceamento de misturadores

Aviso disparado quando há **misturadores** (águas fria + quente) e a diferença
de pressão entre as duas pernas está acima do limite.

**Como funciona o limite percentual:**

- Você define um percentual aceitável (ex: **10 %**)
- Se a pressão da água fria for **1,2 mca** e a da água quente **1,0 mca**, a
  diferença é 16,7 % → acima de 10 % → **dispara aviso**
- Se as duas estivessem em **1,1 e 1,05 mca**, diferença ≈ 4,5 % → abaixo de 10 % → não dispara

!!! tip "Quando ajustar"
    O padrão (10 %) costuma funcionar. Se você está recebendo muitos avisos de
    balanceamento em projetos que aceitam diferenças maiores (ex: misturadores
    termostáticos modernos), aumente para 15-20 %. Se quiser ser mais rigoroso
    em projetos críticos, baixe para 5 %.

---

## Importar / exportar configurações

A janela de Configurações tem botões para **exportar todas as abas** para um
arquivo `.json` e **importar** em outro projeto. Isso permite manter padrões
consistentes entre obras sem refazer setup do zero.

1. **Exportar:** ao final da configuração, clique no botão de exportar e escolha onde salvar
2. **Importar:** em outro projeto, abra Configurações e clique em importar — o `.json` carrega todos os 4 grupos

!!! info "Comando relacionado: Import Project Settings"
    Há um comando dedicado **Import Project Settings** ([vídeo](https://www.youtube.com/watch?v=irMM_FV_Bmc){ target=_blank })
    para importar configurações sem precisar abrir esta janela manualmente.

## Problemas comuns

- **Sintoma:** "O Gerenciador de sistemas está vazio" — **Causa:** sistemas do
  Revit não foram vinculados na aba Sistemas — **Solução:** abra a aba e faça os
  links
- **Sintoma:** "Os campos de família estão vazios" — **Causa:** famílias não
  foram transferidas para o projeto — **Solução:** rode **Transfer families** primeiro
- **Sintoma:** "Cálculo de perda de carga vem com valores estranhos" — **Causa:**
  diâmetros referentes incorretos ou rugosidade fora do padrão do material —
  **Solução:** revise a aba Dimensionamento
- **Sintoma:** "Recebo aviso de balanceamento em todos os misturadores" —
  **Causa:** percentual muito apertado — **Solução:** ajuste o limite na aba Aviso
- **Sintoma:** "A janela de edição de sistemas está lenta" — **Causa:** filtros
  de cores ativos com muitos elementos — **Solução:** desmarque na aba Geral

## Material relacionado

- 📄 PDF oficial (4 páginas): [Configurações gerais.pdf](../downloads/configuracoes-gerais.pdf) *(843 KB)*
- 🎬 Vídeo: [youtu.be/dPam0LiZwKY](https://youtu.be/dPam0LiZwKY){ target=_blank }
- 🎬 Import settings: [youtube.com/watch?v=irMM_FV_Bmc](https://www.youtube.com/watch?v=irMM_FV_Bmc){ target=_blank }
- 🔗 Ver também:
    - [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md)
    - [Gerenciador de sistemas](../sistemas-hidraulicos/gerenciador-de-sistemas.md)
    - [Cálculo de pressão (perda de carga)](../dimensionamento/calculo-de-pressao.md)

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
