# Gerenciador de peças

> **Disponibilidade:** Projeto com entidade OFH criada (rode **Configurações gerais** ao menos uma vez)
> **Painel do ribbon:** Configurações
> **Atalho:** F1 sobre o botão abre o vídeo oficial

## O que faz

Abre a janela central de configuração das **peças, conexões, acessórios, reservatórios e
bombas** do plugin OFHidraulico. É onde você diz ao plugin **quais famílias do Revit têm
significado hidráulico** e **quais propriedades** elas carregam (fixture units, vazão,
pressão, comprimento equivalente, etc.).

Tudo o que você configura aqui é usado em:

- **PipeBuilder** — auto-roteamento usa diâmetros mínimos e ângulos de conexão
- **Gerenciador de sistemas** — usa fixture units e vazões para calcular sistema
- **Cálculo de pressão** — usa comprimentos equivalentes e perdas localizadas
- **Relatório de dimensionamento** — exporta tudo isso para Excel

## Quando usar

- Ao **iniciar um projeto novo**, depois de transferir famílias e antes de modelar
- Quando **carregar uma família nova** no Revit que o plugin precisa reconhecer
- Para **alterar pesos** (fixture units) conforme a norma do projeto
- Para **importar um catálogo** já configurado de outro projeto

!!! warning "Atenção ao recálculo"
    Alterar valores de peças com **sistemas já calculados não recalcula** automaticamente.
    Após salvar mudanças aqui, rode novamente o **Gerenciador de sistemas** para
    refletir os novos valores.

## Pré-requisitos

- [ ] Projeto Revit aberto
- [ ] **Configurações gerais** já executada (cria a entidade OFH no documento)
- [ ] Famílias hidráulicas carregadas no projeto

## Como abrir

No ribbon: **OFHidraulico → Configurações → Equipment Manager**.

A janela é redimensionável — começa em 900×650 e tem mínimo de 650×500.

## Layout da janela — 4 áreas

A janela do Gerenciador é dividida em **4 áreas funcionais**:

| Área | Função |
|---|---|
| **1 — Toolbar superior esquerda** | Botões de import/export e configurações do template |
| **2 — Toolbar superior direita** | Adicionar / remover / limpar tudo |
| **3 — Configuração automática** | Botão para configurar conexões a partir de parâmetros da família |
| **4 — Painel de visualização (4 sub-áreas)** | Propriedades, ângulos, controles de diâmetro e tabela |

### Área 1 — Toolbar de import/export

| Botão | Ação |
|---|---|
| **Importar Configurações** | Carrega catálogo de um arquivo `.json` exportado anteriormente |
| **Exportar Configurações** | Salva o catálogo atual em `.json` para reutilizar em outros projetos |
| **Importar Configurações do Template Padrão** | Carrega o catálogo padrão BIMSPACE/OF Hidráulico (peças mais comuns já configuradas) |

### Área 2 — Adicionar / remover / limpar

| Botão | Ação |
|---|---|
| **Criar (Grupos, Tipos)** | Adiciona novo grupo, modelo ou tipo dentro da categoria selecionada |
| **Remover (Grupos, Tipos)** | Remove o item selecionado da árvore |
| **Remove Tudo** | Apaga **todas as configurações** de peças (use com cuidado, é irreversível por undo do Revit) |

!!! tip "Dica"
    Você também pode **clicar com o botão direito** sobre uma categoria, grupo ou tipo na
    árvore para acessar essas mesmas opções no menu de contexto.

### Área 3 — Configurar conexões automaticamente

Botão **Configurar Automaticamente as Conexões** lê um parâmetro específico das famílias
de conexão (Pipe Fittings) e cria a estrutura completa de ângulos e diâmetros sem você
precisar preencher tipo a tipo. É a forma mais rápida de configurar conexões padrão (PVC
soldável, ferro galvanizado, etc.) quando as famílias já vêm com os parâmetros corretos.

### Área 4 — Painel de visualização

Quando você seleciona um item na árvore à esquerda, o painel direito mostra:

- **4.1 — Propriedades** da peça selecionada (campos abaixo)
- **4.2 — Ângulos** disponíveis na conexão (botões `+` / `−` para criar ou remover)
- **4.3 — Controles de diâmetro** — adiciona/remove linhas na tabela 4.4 ou cria uma nova
  coluna com Comprimento Equivalente
- **4.4 — Tabela de diâmetros** com o **Comprimento Equivalente** correspondente, usado
  pelo plugin no dimensionamento

## Campos de propriedade por tipo de peça

Conforme a categoria, o painel 4.1 expõe um subconjunto destes campos:

| Campo | Unidade | Descrição |
|---|---|---|
| **Sigla Equipamento** | — | Identificador curto que aparece em etiquetas e relatórios |
| **Família** | — | Nome da família Revit vinculada (somente leitura) |
| **Tipo** | — | Nome do tipo dentro da família Revit (somente leitura) |
| **Diâmetro Mínimo** | mm | Menor diâmetro que o plugin pode atribuir ao conectar nessa peça |
| **Cota Norma** | m | Altura padrão de instalação segundo a norma aplicável |
| **Altura** | cm | Altura específica desta peça (sobrepõe a Cota Norma quando preenchida) |
| **Pressão Mínima** | KPa | Pressão necessária para o ponto operar corretamente |
| **Pressão Máxima** | KPa | Limite superior aceitável de pressão |
| **Vazão Máxima** | m³/h | Vazão de regime que a peça suporta |
| **Perda Localizada** | mca | Perda de carga localizada (usada em registros, hidrômetros) |
| **Comprimento Equivalente** | m | Em conexões, o equivalente em tubo reto para perda distribuída |

## Como adicionar uma peça nova

1. Selecione na árvore a **Categoria** desejada (Peças hidráulicas, Conexões, Acessórios
   ou Equipamentos).
2. Clique em **Criar (Grupos, Tipos)** ou **botão direito → Novo Grupo / Novo Modelo / Novo Tipo**.
3. A janela "Criar peças" abre com **todos os tipos de famílias do projeto** que pertencem
   àquela categoria.
4. Use os filtros para encontrar a família desejada:
    - **Pesquisa por nome** — campo de busca; alterne a coluna alvo entre **Família** e **Tipo**
    - **Filtro por categoria do Revit** — combo de categoria
    - **Caixa "Instâncias"** — quando marcada, mostra apenas tipos que **já têm instâncias** no projeto
5. Marque os tipos que deseja adicionar.
6. Clique em **OK**.
7. De volta ao gerenciador, com a peça nova selecionada, preencha os campos do painel direito.

## Importar e exportar o catálogo

### Exportar
**Toolbar (Área 1) → Exportar Configurações** → escolha onde salvar o `.json`. O arquivo
contém **todas as categorias, grupos, modelos e tipos** com seus valores configurados.

### Importar
**Toolbar (Área 1) → Importar Configurações** → escolha um `.json` exportado antes. O
plugin **mescla** com o catálogo atual:

- Grupos/modelos/tipos novos são adicionados
- Tipos que já existiam (mesma família + tipo) **mantêm os valores atuais** — não sobrescreve

### Importar do template padrão
**Toolbar (Área 1) → Importar Configurações do Template Padrão** carrega o catálogo de
fábrica do OFHidraulico, com peças comuns (PVC soldável, ferro galvanizado, vasos sanitários
padrão, etc.) já pré-configuradas conforme a NBR 5626.

## Avisos e como resolver

A árvore mostra dois tipos de aviso visual quando algo está mal configurado:

### Aviso no nó pai (categoria/grupo)
> *Para remover este aviso e evitar inconsistências no cálculo de pressão, é necessário
> criar um ângulo, estabelecer diâmetros e definir os valores de Comprimento Equivalente
> nos tipos correspondentes.*

**Causa:** algum tipo abaixo deste nó não tem a estrutura completa de ângulos + diâmetros + comprimento equivalente.

**Solução:** abra os tipos sob esse nó até encontrar o(s) que está(ão) incompleto(s) e
preencha os campos faltantes na **Área 4** da janela.

### Aviso no nó tipo
**Causa:** este tipo individual não está corretamente configurado (campo essencial vazio,
ângulo sem diâmetro, etc.).

**Solução:** selecione o tipo e revise as 4 sub-áreas do painel direito até o aviso sumir.

## Problemas comuns

- **Sintoma:** "Minha família não aparece na janela de criar peças" — **Causa:** a família
  não foi carregada no projeto, ou a categoria do Revit não está entre as 4 monitoradas
  (`OST_PlumbingFixtures`, `OST_PipeFitting`, `OST_PipeAccessory`, `OST_MechanicalEquipment`)
  — **Solução:** carregue a família no Revit e verifique a categoria no editor de família
- **Sintoma:** "Mudei o peso e os cálculos não atualizaram" — **Causa:** sistemas já
  calculados não recalculam sozinhos — **Solução:** abra o **Gerenciador de sistemas** e
  rode **Calcular todos** novamente
- **Sintoma:** "Equipamento com fixture units e vazão indefinidos" — **Causa:** campo
  vazio no gerenciador — **Solução:** veja o [vídeo específico](https://youtu.be/m0pJoot1iXc){ target=_blank }
- **Sintoma:** "Importei do template e o catálogo ficou misturado" — **Causa:** já havia
  catálogo prévio; o import faz merge — **Solução:** se quiser começar limpo, use
  **Remove Tudo** antes de importar
- **Sintoma:** "Tô tentando configurar conexões uma a uma e tô levando horas" — **Solução:**
  use **Configurar Automaticamente as Conexões** (Área 3) — funciona se as famílias têm o
  parâmetro adequado; senão, importe o template padrão

## Material relacionado

- 📄 PDF: [Gerenciador de peças.pdf](../downloads/gerenciador-de-pecas.pdf) *(1,1 MB — versão
  oficial em PDF que serviu de base para este artigo)*
- 🎬 Vídeo principal: [youtu.be/JRBKcnvFpPg](https://youtu.be/JRBKcnvFpPg){ target=_blank }
- 🎬 Vídeo de equipamento sem fixture units: [youtu.be/m0pJoot1iXc](https://youtu.be/m0pJoot1iXc){ target=_blank }
- 🔗 Ver também:
    - [Configurações gerais](../primeiros-passos/configuracoes-gerais.md) — o que precisa
      estar feito antes
    - [Gerenciador de sistemas](../sistemas-hidraulicos/gerenciador-de-sistemas.md) — onde
      o catálogo é efetivamente usado

---
*Última revisão: 2026-04-24 · OFHidraulico v2.5.9.10*
