---
hide:
  - toc
---

# Dimensionamento e cálculo

A parte "matemática" do OFHidraulico — como o plugin calcula vazões, perdas de
carga, pressões e dimensiona bombas. Esta seção tem **4 artigos** cobrindo os
principais cálculos do plugin com as fórmulas reais, exemplos numéricos e
tabelas de referência da NBR 5626.

## Artigos

<div class="grid cards" markdown>

-   :material-pipe-valve:{ .lg .middle } __[Fluxo de água quente e fria](fluxo-agua-quente-fria.md)__

    Os 2 métodos de cálculo de vazão: **Pesos (Vazão Máxima Provável)** e
    **Vazão (Vazão Máxima Possível)**. Tabela completa de pesos NBR 5626.

-   :material-gauge:{ .lg .middle } __[Cálculo de pressão (perda de carga)](calculo-de-pressao.md)__

    As 2 equações disponíveis (**Darcy-Weisbach** e **Fair-Whipple-Hsiao**),
    coeficientes K, Reynolds, rugosidade por material.

-   :material-water:{ .lg .middle } __[Perda de carga em hidrômetros](perda-de-carga-hidrometros.md)__

    Como o plugin calcula Δh do hidrômetro a partir da Q_max e converte em
    comprimento equivalente.

-   :material-pump:{ .lg .middle } __[Bombas e dimensionamento](bombas-e-dimensionamento.md)__

    **Vazão de projeto**, **diâmetro de recalque/sucção (Forchheimmer)** e
    **altura manométrica**. Exemplo passo-a-passo.

</div>

## Em preparação

- *Sizing Report — exportando o relatório de dimensionamento*
- *Caminho crítico: como o plugin determina*
- *Configurando uma bomba para projeto residencial*

## Pré-requisitos comuns

Para qualquer cálculo, você precisa ter rodado antes:

- [ ] **Configurações gerais** — define unidades, método de cálculo, rugosidade por material
- [ ] **Equipment Manager** — peças com pesos, vazões e diâmetros mínimos
- [ ] **Sistemas vinculados** — cada sistema do Revit ligado ao tipo do plugin
- [ ] **Rede modelada** com fontes (caixas, bombas) e destinos (peças)

## Como rodar o cálculo

Todos os cálculos são disparados a partir do **Gerenciador de sistemas**:

1. **OFHidraulico → Configurações → System Manager**
2. Selecione o sistema
3. **Configurações do sistema** — escolha método de Vazão e Perda de Carga
4. **Calcular fluxo e pressão**
5. Resultados em **Mostrar detalhes de pressão** ou **Exportar para Excel**

> Detalhes em [Gerenciador de sistemas](../sistemas-hidraulicos/gerenciador-de-sistemas.md).
