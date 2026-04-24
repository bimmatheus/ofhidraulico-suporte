# Configurações gerais

> **Disponibilidade:** Projeto aberto
> **Painel do ribbon:** Configurações
> **Desde a versão:** 2.5.x

## O que faz

Abre o assistente principal de configuração do OFHidraulico, onde você define as **configurações principais do projeto** — unidades, padrões de família, parâmetros globais de cálculo, preferências de colunas, tags padrão e demais opções que o plugin usa em todos os outros comandos.

Essas configurações ficam salvas **dentro do próprio arquivo Revit** (via `DocumentEntityManager`), portanto acompanham o projeto mesmo em outra máquina.

## Quando usar

- Ao iniciar um **novo projeto** com o OFHidraulico — antes de modelar qualquer coisa
- Quando precisar **mudar padrões** em um projeto existente (ex: tipo de tubulação padrão, unidade de pressão)
- Para **importar configurações** de outro projeto via exportação JSON

!!! tip "Dica"
    Configure uma vez, exporte para JSON e reaproveite em projetos futuros. É o caminho mais rápido para padronizar entre obras.

## Pré-requisitos

- [ ] Projeto Revit aberto
- [ ] Plugin OFHidraulico ativado (ícone deve aparecer na aba OFHidraulico)
- [ ] (Opcional) Famílias já transferidas via **Transfer families** — necessário para que alguns campos mostrem opções

## Passo a passo

1. No ribbon **OFHidraulico → Configurações**, clique em **Settings**.
2. O assistente abre com abas laterais — cada aba é um grupo de configurações (Geral, Sistemas, Colunas, Etiquetas, etc.).
3. *[TODO: screenshot da janela principal]*
4. Ajuste cada aba conforme o projeto.
5. Clique em **OK** para salvar. As configurações ficam persistidas no documento Revit.

!!! info "Desfazer"
    O assistente tem **undo/redo interno** via o botão na barra superior. Alterações só são aplicadas ao projeto depois de clicar OK.

## Campos e opções

*[TODO: tabela com os principais campos de cada aba. Priorizar o que causa mais dúvida no suporte.]*

| Aba | Campo | Descrição | Valor padrão |
|---|---|---|---|
| Geral | ... | ... | ... |
| Sistemas | ... | ... | ... |

## Importar / exportar configurações

O plugin permite **exportar todas as configurações para um arquivo JSON** e reimportar em outro projeto.

1. Na janela de Configurações, clique em **Exportar**.
2. Escolha onde salvar o `.json`.
3. Em outro projeto, abra as Configurações e clique em **Importar**.

*[TODO: screenshot dos botões importar/exportar]*

## Problemas comuns

- **Sintoma:** "Os campos de família aparecem vazios" — **Causa:** famílias não foram transferidas para o projeto — **Solução:** execute **Transfer families** primeiro
- **Sintoma:** "Ao mudar a unidade de pressão, cálculos antigos somem" — **Causa:** unidades não convertem automaticamente em resultados já salvos — **Solução:** refaça o cálculo de pressão após mudar a unidade

## Material relacionado

- 📄 PDF: [Configurações gerais.pdf](../downloads/configuracoes-gerais.pdf) *(843 KB)*
- 🎬 Vídeo: [youtu.be/dPam0LiZwKY](https://youtu.be/dPam0LiZwKY){ target=_blank }
- 🔗 Ver também: [Gerenciador de peças](../catalogo-e-pecas/gerenciador-de-pecas.md)

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
