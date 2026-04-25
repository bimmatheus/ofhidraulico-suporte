# Perda de carga em hidrômetros

> **Disponibilidade:** Projeto com entidade OFH criada
> **Onde configurar:** Gerenciador de peças (vazão máxima do hidrômetro)
> **Onde aparece:** Cálculo de pressão do sistema

## O que faz

O OFHidraulico calcula a **perda de carga gerada pelo hidrômetro** automaticamente,
usando a **vazão máxima** especificada para a peça. O resultado é convertido em
**comprimento equivalente** e somado à perda de carga distribuída do sistema.

## Equações usadas

### Perda de carga no hidrômetro

$$ \Delta h = (36 \cdot Q)^2 \cdot (Q_{max})^{-2} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| Δh | Perda de carga no hidrômetro | kPa |
| Q | Vazão estimada na seção considerada | L/s |
| Q_max | Vazão máxima especificada para o hidrômetro | m³/h |

### Conversão para comprimento equivalente

$$ L_{EQ} = \frac{\Delta h}{J} $$

| Símbolo | Significado | Unidade |
|---|---|---|
| J | Perda de carga unitária do sistema | m/m |
| L_EQ | Comprimento equivalente do hidrômetro | m |

## Vazões máximas comuns

A `Q_max` depende do **tipo de hidrômetro** escolhido pelo projetista. Os
valores padrão suportados pelo plugin são:

| Q_max (m³/h) | Uso típico |
|:---:|---|
| **1,5** | Residencial pequeno (apartamento, casa pequena) |
| **3** | Residencial médio |
| **5** | Residencial grande / pequeno comercial |
| **7** | Comercial médio |
| **10** | Comercial / pequena indústria |
| **20** | Industrial / grande comercial |
| **30** | Industrial |

## Como configurar Q_max em um hidrômetro

1. Abra **OFHidraulico → Configurações → Equipment Manager**
2. Navegue até a categoria **Acessórios** → grupo onde está seu hidrômetro
3. Selecione o hidrômetro desejado na árvore
4. No painel direito, encontre o campo **Vazão Máxima (m³/h)**
5. Escolha o valor correspondente ao seu hidrômetro físico
6. Salve

> Ver detalhes em [Gerenciador de peças → campos](../catalogo-e-pecas/gerenciador-de-pecas.md#campos-de-propriedade-por-tipo-de-peca).

## Onde o resultado aparece

Após calcular o sistema:

- A perda de carga do hidrômetro entra na **memória de cálculo** do trecho onde
  ele está instalado
- Aparece como **comprimento equivalente** somado ao trecho real
- Visível em **Gerenciador de sistemas → Mostrar detalhes de pressão**

## Problemas comuns

- **Sintoma:** "Hidrômetro está como 'Equipamento sem fixture units / vazão
  indefinida'" — **Causa:** Q_max não foi preenchida — **Solução:** configure no
  Equipment Manager (passos acima) — [vídeo](https://youtu.be/m0pJoot1iXc){ target=_blank }
- **Sintoma:** "Perda de carga no hidrômetro está muito maior que esperado" —
  **Causa:** Q_max está abaixo da vazão real do projeto (hidrômetro
  subdimensionado) — **Solução:** revise se o hidrômetro físico do projeto
  está adequado e ajuste Q_max
- **Sintoma:** "Aviso de perda excessiva em hidrômetro" — **Causa:** Q ≈ Q_max
  (operação no limite) — **Solução:** considere hidrômetro com Q_max maior

## Material relacionado

- 📄 PDF oficial (2 páginas): [Perda de carga em hidrômetros.pdf](../downloads/perda-de-carga-hidrometros.pdf) *(941 KB)*
- 🎬 Vídeo: [youtu.be/L4UvAhX3L2Y](https://youtu.be/L4UvAhX3L2Y){ target=_blank } (perda excessiva em hidrômetros)
- 🔗 Ver também:
    - [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md)
    - [Cálculo de pressão (perda de carga)](calculo-de-pressao.md)

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
