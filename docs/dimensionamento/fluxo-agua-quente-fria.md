# Fluxo de água quente e fria — métodos de cálculo de vazão

> **Disponibilidade:** Projeto com entidade OFH criada
> **Onde configurar:** Gerenciador de sistemas → Configurações do sistema → Vazão

## O que faz

O OFHidraulico **não usa mais os parâmetros de fluxo de água do Revit**. Em vez
disso, oferece **dois métodos** baseados na NBR 5626/2020 — você escolhe qual
aplicar em cada sistema:

- **Pesos (Vazão Máxima Provável)** — soma dos pesos relativos das peças (`Q = 0,3 × √ΣP`)
- **Vazão (Vazão Máxima Possível)** — soma direta das vazões individuais

Ambos respeitam o **diâmetro mínimo** configurado em cada peça do **Gerenciador
de peças** — o tubo do sub-ramal nunca fica abaixo do mínimo da peça.

---

## Equações geométricas

Para os dois métodos, o plugin usa as relações fundamentais:

**Área da tubulação:**

$$ A = \frac{\pi \cdot D^2}{4} $$

**Vazão pela velocidade:**

$$ Q = V \cdot A $$

**Diâmetro pela vazão:**

$$ D = \sqrt{\frac{4 \cdot Q}{\pi \cdot V}} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| A | Área do tubo | m² |
| Q | Vazão | m³/s |
| V | Velocidade | m/s |
| D | Diâmetro | m |

---

## Método 1 — Pesos (Vazão Máxima Provável)

**Premissa:** uso **não simultâneo** das peças. Estima quantas peças estarão em
uso a qualquer momento. Mais econômico no dimensionamento.

**Recomendado para:** **uso residencial**.

**Não usar em:** ambientes com uso intenso e simultâneo (quartéis, colégios,
vestiários).

### Equação

$$ Q = 0{,}3 \cdot \sqrt{\sum P} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| Q | Vazão do trecho | L/s |
| ΣP | Soma dos pesos das peças alimentadas pelo trecho | — |

### Como o plugin aplica

1. **Pesos (P)** das peças vêm do **Gerenciador de peças** (campo `Peso (UC)`)
2. Para cada **trecho** da rede, o plugin soma ΣP das peças a jusante
3. Aplica `Q = 0,3 × √ΣP` para obter a vazão do trecho

### Exemplo

Trecho que alimenta um banheiro residencial com 4 peças:

| Peça | Peso |
|---|---:|
| Lavatório | 0,30 |
| Chuveiro | 0,40 |
| Tanque | 0,70 |
| Banheira | 1,00 |
| **ΣP** | **2,40** |

$$ Q = 0{,}3 \cdot \sqrt{2{,}40} = 0{,}3 \cdot 1{,}549 = 0{,}465 \text{ L/s} $$

---

## Método 2 — Vazão (Vazão Máxima Possível)

**Premissa:** **todas as peças em uso simultaneamente**. Mais conservador.

**Recomendado para:** ambientes com **alta probabilidade de uso simultâneo**
(quartéis, vestiários, colégios, banheiros públicos com horário fixo). Referência:
Creder (2006).

### Equação

$$ Q = \sum Q_i $$

Soma direta das **vazões individuais** das peças (campo de vazão de projeto na peça).

### Exemplo

Mesmo banheiro com 4 peças, mas usando vazões individuais:

| Peça | Vazão (L/s) |
|---|---:|
| Lavatório | 0,15 |
| Chuveiro | 0,20 |
| Tanque | 0,25 |
| Banheira | 0,30 |
| **ΣQ** | **0,90** |

$$ Q = 0{,}90 \text{ L/s} $$

Quase **2× maior** que o método de pesos (0,465 L/s) — o que é esperado: este
método assume tudo aberto ao mesmo tempo.

---

## Tabela de referência — NBR 5626 (1998)

Pesos e vazões de projeto para os principais aparelhos sanitários:

| Aparelho sanitário | Peça de utilização | Vazão (L/s) | Peso |
|---|---|---:|---:|
| Bacia sanitária | Caixa de descarga | 0,15 | 0,3 |
| Bacia sanitária | Válvula de descarga | 1,7 | 32 |
| Banheira | Misturador (água fria) | 0,3 | 1 |
| Bebedouro | Registro de pressão | 0,1 | 0,1 |
| Bidê | Misturador (água fria) | 0,1 | 0,1 |
| Chuveiro / ducha | Misturador (água fria) | 0,2 | 0,4 |
| Chuveiro elétrico | Registro de pressão | 0,1 | 0,1 |
| Lavadora de pratos / roupas | Registro de pressão | 0,3 | 1 |
| Lavatório | Torneira ou misturador | 0,15 | 0,3 |
| Mictório cerâmico c/ sifão integrado | Válvula de descarga | 0,5 | 2,8 |
| Mictório cerâmico s/ sifão integrado | Caixa/registro/válvula de descarga | 0,15 | 0,3 |
| Mictório tipo calha | Caixa de descarga ou registro de pressão | 0,15/m | 0,3 |
| Pia | Torneira ou misturador (água fria) | 0,25 | 0,7 |
| Pia | Torneira elétrica | 0,1 | 0,1 |
| Tanque | Torneira | 0,25 | 0,7 |
| Torneira de jardim ou lavagem | Torneira | 0,2 | 0,4 |

> Fonte: adaptado da NBR 5626 (ABNT, 1998).

Esses valores são o **default** que o plugin importa quando você usa
**Importar Configurações do Template Padrão** no Equipment Manager.

---

## Como configurar o método em um sistema

1. Abra **OFHidraulico → Configurações → System Manager**
2. Selecione o sistema desejado na tabela
3. Clique em **Configurações do sistema**
4. No grupo **Vazão**, escolha entre **Pesos** ou **Vazão**
5. Salve

A configuração vale para o **sistema selecionado** — repita para os demais.

## Quando usar cada método

| Cenário | Método recomendado |
|---|---|
| Casa, apartamento residencial | **Pesos** |
| Edifício residencial multifamiliar | **Pesos** (com critério para colunas) |
| Vestiário industrial / academia | **Vazão** |
| Banheiro público com pico definido (escola, cinema) | **Vazão** |
| Hotel (conservador) | **Vazão** ou Pesos com fator |
| Comercial pequeno | **Pesos** |

## Diâmetro mínimo

Independente do método, **o diâmetro do sub-ramal nunca fica abaixo do
"Diâmetro mínimo"** configurado na peça (no Equipment Manager, painel direito).

Mesmo que a vazão calculada permita um tubo menor, o plugin **respeita o mínimo
da peça** — porque a peça tem requisito construtivo de diâmetro mínimo.

## Problemas comuns

- **Sintoma:** "Vazões absurdamente altas" — **Causa:** método **Vazão** aplicado
  em projeto residencial — **Solução:** use **Pesos**
- **Sintoma:** "Vazões muito baixas em vestiário público" — **Causa:** método
  **Pesos** subestima uso simultâneo — **Solução:** use **Vazão**
- **Sintoma:** "Tubo está maior que o cálculo sugere" — **Causa:** o **Diâmetro
  mínimo** da peça está acima do calculado — **Solução:** revise no Equipment
  Manager se o diâmetro mínimo está adequado
- **Sintoma:** "Misturadores não somam para água quente" — **Causa:** sistema
  quente não está marcado como **dependente** do frio — **Solução:** ver
  [Editar sistemas dependentes](../sistemas-hidraulicos/gerenciador-de-sistemas.md#editar-sistemas-dependentes)

## Material relacionado

- 📄 PDF oficial (6 páginas): [Fluxo dos tubos de água quente e fria.pdf](../downloads/fluxo-agua-quente-fria.pdf) *(971 KB)*
- 🔗 Ver também:
    - [Gerenciador de sistemas](../sistemas-hidraulicos/gerenciador-de-sistemas.md) — onde escolher o método
    - [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md) — pesos e vazões individuais
    - [Cálculo de pressão (perda de carga)](calculo-de-pressao.md)

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
