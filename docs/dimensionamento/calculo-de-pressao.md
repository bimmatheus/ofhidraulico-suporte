# Cálculo de pressão (perda de carga)

> **Disponibilidade:** Projeto com entidade OFH criada
> **Painel do ribbon:** Utilitários hidraúlica
> **Comando relacionado:** **Pressure** + configuração no Gerenciador de sistemas

## O que faz

O OFHidraulico calcula **pressão e perda de carga** em sistemas hidráulicos
usando duas equações reconhecidas pela literatura — você escolhe qual aplicar
em cada sistema:

- **Darcy-Weisbach** — equação universal, considera regime de escoamento (Reynolds)
  e rugosidade do material
- **Fair-Whipple-Hsiao** — fórmulas empíricas separadas para tubos lisos e rugosos

A configuração é feita **por sistema**, então sistemas diferentes (água fria,
quente, recalque) podem usar métodos diferentes.

## Diretrizes da NBR 5626 (1998)

Antes do cálculo, vale lembrar os limites normativos:

| Critério | Limite | Observação |
|---|---|---|
| **Pressão estática máxima** | ≤ 400 KPa (40 mca) | Diferença reservatório → ponto de consumo deve ser < 40 m |
| **Pressão dinâmica mínima geral** | ≥ 10 KPa | — |
| **Válvula de descarga (bacia sanitária)** | ≥ 15 KPa | — |
| **Caixa de descarga (bacia sanitária)** | ≥ 5 KPa | — |

O OFHidraulico não impõe esses limites — você é quem julga. Mas eles aparecem
nos avisos de pressão insuficiente/excessiva no Gerenciador de sistemas.

## Como configurar o método em um sistema

1. Abra o ribbon: **OFHidraulico → Configurações → System Manager**
2. Selecione o sistema desejado na tabela
3. Clique em **Configurações do sistema**
4. No grupo **Pressão**, escolha entre **Darcy-Weisbach** ou **Fair-Whipple-Hsiao**
5. Salve

A escolha vale para o sistema selecionado — repita para os demais conforme
necessário.

---

## Equação de Darcy-Weisbach (Universal)

### Perda de carga distribuída

$$ H = f \cdot \frac{L}{D} \cdot \frac{V^2}{2 \cdot g} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| H | Perda de carga distribuída | mca |
| f | Coeficiente de atrito (depende de Reynolds e rugosidade relativa e/D) | — |
| L | Comprimento do tubo | m |
| D | Diâmetro do tubo | m |
| V | Velocidade do fluido | m/s |
| g | Gravidade | m/s² |

### Perda de carga localizada

$$ H = K \cdot \frac{V^2}{2 \cdot g} $$

| Símbolo | Significado |
|---|---|
| K | Coeficiente de perda localizada (tabelado por peça) |
| V, g | Como acima |

### Tabela de coeficientes K (peças comuns)

Valores extraídos de Azevedo Netto, Fernandez & Araujo (1998):

| Peça | K | | Peça | K |
|---|---:|---|---|---:|
| Ampliação gradual | 0,3 | | Medidor Venturi | 2,5 |
| Comporta aberta | 1,0 | | Pequena derivação | 0,03 |
| Controlador de vazão | 2,5 | | Redução gradual | 0,15 |
| Cotovelo / joelho 45° | 0,4 | | Saída de canalização | 1,0 |
| Cotovelo / joelho 90° | 0,9 | | Tê de passagem direta | 0,6 |
| Crivo | 0,75 | | Tê de saída bilateral | 1,8 |
| Curva 22,5° | 0,1 | | Tê de saída de lado | 1,3 |
| Curva 45° | 0,2 | | Válvula de retenção | 2,5 |
| Curva 90° | 0,4 | | Válvula de ângulo aberta | 5,0 |
| Entrada de borda | 1,0 | | Válvula de gaveta aberta | 0,2 |
| Entrada normal | 0,5 | | Válvula de pé | 1,75 |
| Junção | 0,4 | | Válvula globo aberta | 10,0 |

### Número de Reynolds

$$ Re = \frac{U \cdot D}{\nu} $$

| Símbolo | Significado |
|---|---|
| U | Velocidade média de escoamento (m/s) |
| D | Diâmetro (m) |
| ν | Viscosidade cinemática (m²/s) — depende da temperatura |

**Viscosidade cinemática da água:**

| Temperatura | ν (m²/s) |
|---|---|
| 20 °C | 1,0 × 10⁻⁶ |
| 40 °C | 0,658 × 10⁻⁶ |

**Regime do escoamento:**

| Regime | Reynolds |
|---|---|
| Laminar | Re < 2000 |
| Transição | 2000 < Re < 4000 |
| Turbulento | Re > 4000 |

### Coeficiente de atrito (`f`)

**Escoamento laminar:**

$$ f = \frac{64}{Re} $$

**Escoamento turbulento (Colebrook-White):**

$$ \frac{1}{\sqrt{f}} = -2 \log \left( \frac{e}{3{,}71 \cdot D} + \frac{2{,}51}{Re \sqrt{f}} \right) $$

### Rugosidade absoluta (`e`) por material

| Material | Rugosidade `e` (mm) |
|---|---:|
| PVC marrom | 0,06 |
| CPVC | 0,06 |
| PPR | 0,007 |
| PEX | 0,007 |
| Aço galvanizado | 0,016 |

!!! info "Origem dos valores"
    Os valores acima são referência de catálogo de fabricantes. Você pode
    sobrescrever na [aba Dimensionamento das Configurações](../primeiros-passos/configuracoes-gerais.md#aba-dimensionamento).

---

## Equação de Fair-Whipple-Hsiao

Empírica, mais simples — bom para verificação rápida ou quando você não tem todos
os parâmetros para Darcy-Weisbach.

### Tubos rugosos (aço carbono galvanizado ou não)

$$ J = \frac{20{,}2 \cdot 10^6 \cdot Q^{1{,}88}}{D^{4{,}88}} $$

### Tubos lisos (plásticos, cobre, ligas de cobre)

$$ J = \frac{8{,}69 \cdot 10^6 \cdot Q^{1{,}75}}{D^{4{,}75}} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| J | Perda de carga unitária | m/m |
| Q | Vazão estimada na seção | L/s |
| D | Diâmetro interno | mm |

---

## Quando usar cada método

| Cenário | Método recomendado |
|---|---|
| Projeto residencial padrão, materiais comuns | **Fair-Whipple-Hsiao** (simples, rápido) |
| Projeto comercial / industrial com necessidade de precisão | **Darcy-Weisbach** |
| Sistemas com mistura de materiais | **Darcy-Weisbach** (mais preciso por trecho) |
| Validação rápida durante modelagem | **Fair-Whipple-Hsiao** |
| Memorial técnico para órgão fiscalizador | Verifique exigência local — geralmente **Darcy-Weisbach** |

## Onde os resultados aparecem

Após calcular o sistema (no Gerenciador de sistemas → **Calcular fluxo e pressão**),
os valores ficam disponíveis em:

- **Mostrar detalhes de pressão** — memória trecho a trecho
- **Mostrar detalhes de pressão de peças** — caminhos por peça de utilização
- **Exportar Memória de Cálculo para Excel** — `.xlsx` com tabelas

> Ver [Gerenciador de sistemas](../sistemas-hidraulicos/gerenciador-de-sistemas.md#44-calculos)
> para detalhes de cada janela.

## Problemas comuns

- **Sintoma:** "Perda de carga vem alta demais" — **Causa:** rugosidade do material
  está incorreta — **Solução:** revise [Configurações → Dimensionamento](../primeiros-passos/configuracoes-gerais.md#aba-dimensionamento)
- **Sintoma:** "Resultado bate com Darcy-Weisbach mas não com Fair-Whipple-Hsiao
  (ou vice-versa)" — **Causa:** os métodos divergem em regimes específicos —
  **Solução:** Darcy-Weisbach é universal e geralmente mais preciso; use ele como
  referência
- **Sintoma:** "Os coeficientes K das conexões não correspondem ao catálogo" —
  **Causa:** o plugin usa **Comprimento Equivalente**, não K direto —
  **Solução:** configure no [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md)
  o **Comprimento Equivalente (m)** por diâmetro

## Material relacionado

- 📄 PDF oficial (7 páginas): [Perda de carga.pdf](../downloads/perda-de-carga.pdf) *(987 KB)*
- 🎬 Vídeo: [youtu.be/Sr7Nk7psMPo](https://youtu.be/Sr7Nk7psMPo){ target=_blank }
- 🔗 Ver também:
    - [Gerenciador de sistemas](../sistemas-hidraulicos/gerenciador-de-sistemas.md) — onde rodar o cálculo
    - [Configurações gerais — aba Dimensionamento](../primeiros-passos/configuracoes-gerais.md#aba-dimensionamento) — rugosidade por material
    - [Perda de carga em hidrômetros](perda-de-carga-hidrometros.md) — caso particular

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
