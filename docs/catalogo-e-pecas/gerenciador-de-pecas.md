# Gerenciador de peças

> **Disponibilidade:** Projeto com entidade OFH criada (após executar Configurações gerais pela primeira vez)
> **Painel do ribbon:** Configurações
> **Desde a versão:** 2.5.x

## O que faz

Abre a janela de **configuração das peças hidrossanitárias** da solução OFHidraulico. É onde você define quais famílias Revit são:

- **Pontos de utilização** (chuveiros, torneiras, vasos, etc.) — com seus pesos de consumo (*fixture units*) e vazões mínimas
- **Conexões** (joelhos, tês, reduções) — com comprimentos equivalentes
- **Registros** e **válvulas** — com perdas de carga
- **Equipamentos** (bombas, hidrômetros, caixas d'água) — com propriedades específicas

O plugin usa esse catálogo em **todos os cálculos** (dimensionamento, pressão, perda de carga) e na **geração automática de tubulação** (PipeBuilder).

## Quando usar

- Após **transferir famílias** para um projeto novo, para configurar pesos e parâmetros
- Quando **adicionar uma nova família** ao projeto que o plugin precisa reconhecer
- Para **alterar pesos** de consumo conforme a norma aplicada (NBR 5626, etc.)

!!! warning "Importante"
    Alterar pesos em um projeto que já tem sistemas calculados **não recalcula automaticamente** os sistemas. Use **Cálculo de pressão** ou **Relatório de dimensionamento** depois para atualizar os valores.

## Pré-requisitos

- [ ] Projeto Revit aberto
- [ ] Configurações gerais já executada ao menos uma vez (gera a entidade OFH no documento)
- [ ] Famílias transferidas via **Transfer families**

## Passo a passo

1. No ribbon **OFHidraulico → Configurações**, clique em **Equipment Manager**.
2. A janela abre com abas por categoria de peça.
3. *[TODO: screenshot da janela]*
4. Selecione uma peça da lista à esquerda.
5. Configure nas abas da direita: fixture units, tipo, perdas de carga, etc.
6. Clique em **OK** ou **Aplicar** para salvar.

## Campos e opções

*[TODO: tabela completa após screenshots]*

### Pontos de utilização
| Campo | Descrição | Exemplo |
|---|---|---|
| Peso (UC) | Unidade de consumo da peça | 0,3 para torneira de pia |
| Vazão mínima | Vazão em L/s necessária no ponto | 0,15 L/s |
| Tipo de água | Fria, Quente, Mista | Fria |

### Conexões
| Campo | Descrição |
|---|---|
| Comprimento equivalente | Perda de carga localizada em metros lineares equivalentes |

## Problemas comuns

- **Sintoma:** "Minha família não aparece no gerenciador" — **Causa:** a família não foi carregada no projeto, ou a categoria Revit não é compatível — **Solução:** carregue a família primeiro; verifique se a categoria é *Plumbing Fixtures* / *Pipe Fittings* / *Pipe Accessories*
- **Sintoma:** "O peso que configurei não aparece nos cálculos" — **Causa:** instâncias da peça foram inseridas **antes** da configuração — **Solução:** rode o recálculo após alterar o peso; novas instâncias já usam o valor novo
- **Sintoma:** "Equipamento com fixture units e vazão indefinidos" — **Causa:** campo vazio no gerenciador — **Solução:** ver [vídeo específico](https://youtu.be/m0pJoot1iXc){ target=_blank }

## Material relacionado

- 📄 PDF: [Gerenciador de peças.pdf](../downloads/gerenciador-de-pecas.pdf) *(1,1 MB)*
- 🎬 Vídeo: [youtu.be/JRBKcnvFpPg](https://youtu.be/JRBKcnvFpPg){ target=_blank }
- 🔗 Ver também: [Configurações gerais](../primeiros-passos/configuracoes-gerais.md), [Gerenciador de sistemas](../sistemas-hidraulicos/gerenciador-de-sistemas.md)

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
