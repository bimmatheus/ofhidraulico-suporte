# Bombas: vazão de projeto, recalque e altura manométrica

> **Disponibilidade:** Projeto com entidade OFH criada
> **Painel do ribbon:** Utilitários hidraúlica
> **Comando relacionado:** **Water Pump Sizing** + propriedades por instância

## O que faz

O OFHidraulico calcula automaticamente o **diâmetro de recalque**, o **diâmetro
de sucção** e a **altura manométrica** das bombas a partir da **vazão de projeto**.
A vazão de projeto é derivada do consumo diário e do tempo de funcionamento que
você atribui à bomba.

## Vazão de projeto (Q)

$$ Q = \frac{CD}{T_F \cdot 3600} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| Q | Vazão de recalque | m³/h |
| CD | Consumo diário total | m³/dia |
| T_F | Tempo de funcionamento da bomba | h |

### Exemplo (sistema com 2 reservatórios)

- Cada reservatório tem **20 000 L/dia** de consumo → CD = 40 m³/dia
- Bomba funciona **6 h/dia** → T_F = 6

$$ Q = \frac{40}{6 \cdot 3600} \approx 0{,}001\,851 \text{ m}^3/\text{h} $$

---

## Diâmetro de recalque — equação de Forchheimmer

$$ D_r = 1{,}3 \cdot \sqrt{Q} \cdot \sqrt[4]{X} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| D_r | Diâmetro de recalque | m |
| X | Razão entre tempo de funcionamento e horas no dia: T_F / 24 | — |

### Continuando o exemplo

$$ X = \frac{6}{24} = 0{,}25 $$

$$ D_r = 1{,}3 \cdot \sqrt{0{,}001\,851} \cdot \sqrt[4]{0{,}25} = 0{,}0395 \text{ m} = 39{,}5 \text{ mm} $$

## Diâmetro de sucção

$$ D_{succ} \geq D_r $$

A norma exige que o diâmetro de sucção seja **igual ou maior** que o de recalque.
Geralmente o plugin sugere o **diâmetro comercial imediatamente acima** do
recalque calculado.

---

## Altura manométrica

A altura manométrica é a soma das perdas de carga (distribuída + localizada) ao
longo do caminho da bomba até o ponto mais desfavorável. O OFHidraulico usa as
mesmas duas equações disponíveis para o sistema (escolha em **Configurações do
sistema → Pressão**):

### Darcy-Weisbach (universal)

**Distribuída:**

$$ H = f \cdot \frac{L}{D} \cdot \frac{V^2}{2 \cdot g} $$

**Localizada:**

$$ H = K \cdot \frac{V^2}{2 \cdot g} $$

### Fair-Whipple-Hsiao

**Tubos rugosos:**

$$ J = \frac{20{,}2 \cdot 10^6 \cdot Q^{1{,}88}}{D^{4{,}88}} $$

**Tubos lisos:**

$$ J = \frac{8{,}69 \cdot 10^6 \cdot Q^{1{,}75}}{D^{4{,}75}} $$

> Detalhes dos símbolos, coeficientes e regimes em
> [Cálculo de pressão (perda de carga)](calculo-de-pressao.md).

---

## Como configurar uma bomba no projeto

### 1. Adicionar a família da bomba ao Equipment Manager

Categoria **Equipamentos** (`OST_MechanicalEquipment`):

1. Abra **Equipment Manager**
2. Crie um Tipo dentro da árvore com a família da bomba do Revit
3. Configure a sigla, altura padrão, etc.

> Ver [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md).

### 2. Configurar a instância via Painel de propriedades

1. Selecione **uma instância da bomba** no modelo Revit
2. Abra a janela **Propriedades (OFH)** (`Show Properties`)
3. Preencha os campos necessários:
    - **Diâmetro mínimo** — usado pelo cálculo de recalque
    - Demais propriedades específicas (vazão, altura, curva da bomba, conforme cadastrado)

> Ver [Painel de propriedades (OFH)](../documentacao/painel-de-propriedades.md).

### 3. Calcular com o Gerenciador de sistemas

No sistema **Recalque/Sucção** correspondente:

1. Selecione o sistema
2. **Calcular fluxo e pressão**
3. Veja resultados em **Mostrar detalhes de pressão**
4. Caso queira o memorial completo, **Exportar Memória de Cálculo para Excel**

## Boas práticas

- **Tempo de funcionamento (T_F)** afeta diretamente o diâmetro de recalque —
  bombas que rodam mais horas por dia têm diâmetros menores
- Para **bomba reserva** (em paralelo com a principal), use **Ajustar caminhos
  permitidos** no Gerenciador de sistemas para bloquear o fluxo no cenário de operação normal
  — isso evita que o cálculo divida o fluxo entre as duas
- **Boiler ou aquecedor** alimentado pela bomba precisa estar como **dependência**
  do sistema da bomba (ver [Editar sistemas dependentes](../sistemas-hidraulicos/gerenciador-de-sistemas.md#editar-sistemas-dependentes))

## Problemas comuns

- **Sintoma:** "Diâmetro de recalque calculado fora do padrão comercial" —
  **Causa:** o cálculo dá o **mínimo teórico** — **Solução:** arredonde para o
  diâmetro comercial imediatamente acima
- **Sintoma:** "Altura manométrica muito alta" — **Causa:** caminho crítico passa
  por trecho com perda excessiva — **Solução:** revise no **Mostrar detalhes de
  pressão de peças** (variante "por peça" mostra os caminhos)
- **Sintoma:** "Bomba reserva está sendo considerada no cálculo" — **Causa:**
  trecho dela não foi bloqueado — **Solução:** **Ajustar caminhos permitidos**
  para bloquear

## Material relacionado

- 📄 PDF oficial (3 páginas): [Bombas.pdf](../downloads/bombas.pdf) *(1,0 MB)*
- 🎬 Vídeo (sucção/recalque): [youtu.be/sY3X7B-ivSk](https://youtu.be/sY3X7B-ivSk){ target=_blank }
- 🔗 Ver também:
    - [Painel de propriedades (OFH)](../documentacao/painel-de-propriedades.md) — onde editar a bomba por instância
    - [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md) — cadastrar a família
    - [Cálculo de pressão (perda de carga)](calculo-de-pressao.md) — equações da altura manométrica

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
