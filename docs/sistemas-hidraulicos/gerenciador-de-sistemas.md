# Gerenciador de sistemas

> **Disponibilidade:** Projeto com entidade OFH criada
> **Painel do ribbon:** Configurações
> **Desde a versão:** 2.5.x

## O que faz

Abre a janela do gerenciador de sistemas, **listando todos os sistemas de tubulação existentes no projeto**. A partir dela você pode:

- **Calcular e dimensionar** cada sistema
- **Analisar** conflitos e alertas (ciclos, sistemas desconectados, pressões insuficientes, etc.)
- **Exportar** os dados gerados pelo plugin para Excel
- **Editar propriedades** como fonte, destino, unidade de consumo, fluido

É a janela central de trabalho para quem faz dimensionamento e validação da rede hidráulica.

## Quando usar

- Após **modelar a rede** e querer calcular os sistemas pela primeira vez
- Para **verificar alertas** antes de fechar o projeto (conexões erradas, diâmetros subdimensionados)
- Quando precisar **exportar os resultados** para memorial ou planilha de dimensionamento

!!! tip "Fluxo recomendado"
    **Configurações → Transfer families → Equipment Manager → Modelar → Systems Manager** — nesta ordem. O Systems Manager é o ponto de validação final.

## Pré-requisitos

- [ ] Rede hidráulica já modelada no Revit (tubos + peças conectadas)
- [ ] Peças configuradas no **Gerenciador de peças** com pesos e vazões
- [ ] Configurações gerais com unidade, fluido e norma aplicável já definidos

## Passo a passo

1. No ribbon **OFHidraulico → Configurações**, clique em **System Manager**.
2. A janela abre listando todos os sistemas do projeto.
3. *[TODO: screenshot da janela com lista de sistemas]*
4. Selecione um sistema para ver detalhes à direita.
5. Clique em **Calcular** (ou **Calcular todos**) para rodar o dimensionamento.
6. Alertas aparecem com cor e ícone específico (ver tabela abaixo).
7. *[TODO: screenshot dos alertas]*
8. Clique em **Exportar** para salvar um `.xlsx` com os resultados.

## Tipos de alerta

| Ícone | Alerta | Causa comum |
|---|---|---|
| 🔴 | Ciclo no sistema | Tubulação em loop — verificar conexões |
| 🟠 | Pressão insuficiente em ponto de utilização | Dimensionamento incorreto ou bomba sub-dimensionada |
| 🟠 | Diâmetro subdimensionado | Vazão acima do limite para o diâmetro atual |
| 🟡 | Equipamento sem fixture units definido | Peça sem configuração no Equipment Manager |
| 🟡 | Elementos desconectados no sistema | Conexão quebrada — use ConnectTo |
| 🔵 | Conexão entre sistemas distintos | Duas redes sendo tratadas como uma |

*[TODO: ampliar com screenshots e vídeos específicos de cada alerta]*

## Problemas comuns

- **Sintoma:** "O gerenciador está vazio mesmo com tubos no projeto" — **Causa:** os tubos não foram atribuídos a um PipingSystem do OFH — **Solução:** use **Edit Systems** ou modele com tipos de sistema reconhecidos pelo plugin
- **Sintoma:** "Cálculo não conclui e trava" — **Causa:** ciclo infinito na rede — **Solução:** resolver alertas de ciclo primeiro ([vídeo](https://youtu.be/2gE3MSp8swY){ target=_blank })
- **Sintoma:** "Pressão insuficiente em todos os pontos" — **Causa:** bomba sem curva, reservatório com altura zero, ou falta de fonte — **Solução:** verificar [vídeo sobre pressão](https://youtu.be/-RF5_2WCzww){ target=_blank }

## Material relacionado

- 📄 PDF: [Gerenciador de sistemas.pdf](../downloads/gerenciador-de-sistemas.pdf) *(2,8 MB)*
- 🎬 Vídeo principal: [youtu.be/Sr7Nk7psMPo](https://youtu.be/Sr7Nk7psMPo){ target=_blank } (cálculo de pressão)
- 🎬 Vídeos de alertas:
    - [Ciclos](https://youtu.be/2gE3MSp8swY){ target=_blank }
    - [Diâmetros subdimensionados](https://youtu.be/E7NG9JWaxhk){ target=_blank }
    - [Conexão entre sistemas distintos](https://youtu.be/yVp2WnPVX7k){ target=_blank }
    - [Pressão insuficiente em peças](https://youtu.be/-RF5_2WCzww){ target=_blank }
- 🔗 Ver também: [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md), [Configurações gerais](../primeiros-passos/configuracoes-gerais.md)

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
