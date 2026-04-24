# Histórico de versões

Lista de todas as versões publicadas do **OFHidraulico** com os principais
ajustes, novas funcionalidades e correções de cada uma.

!!! tip "Como saber qual versão você tem"
    No Revit, abra a aba **OFHidraulico**: o número da versão aparece no rodapé da
    janela de Configurações gerais e nas mensagens de update do plugin.

---

## :material-package-variant-closed: Versão atual

### 2.5.9.10 — 24/04/2026

A versão em produção neste momento. Veja os destaques na linha 2.5.9 abaixo.

---

## 2.5.9 — Revit 2027, ConnectTo SOLID e Progress UI

Família focada em compatibilidade com a próxima versão do Revit, refatoração do
fluxo de conexão e introdução de uma nova UI de progresso reutilizável para
operações longas.

| Versão | Data | Destaque |
|---|---|---|
| **2.5.9.10** | 24/04/2026 | Framework de Progress UI reutilizável + assistente AutoSewerColumns para colunas de esgoto |
| 2.5.9.8 | 16/04/2026 | Otimização de carregamento de sistemas; refinamento do tratamento de sistemas indefinidos no SystemFactory |
| 2.5.9.5 | 14/04/2026 | Correção do build do Revit 2027 no pipeline de deploy |
| 2.5.9.4 | 10/04/2026 | **Suporte ao Revit 2027**; ocultação do hidrante de incêndio para usuários; refatoração do ConnectTo |
| 2.5.9.3 | 06/04/2026 | DataGrid mais largo com colunas centralizadas e estilo Material Design; checkbox "selecionar tudo" |
| 2.5.9.1 | 30/03/2026 | Constante `PREVTO24` para builds 2021–2023; melhorias diversas |

---

## 2.5.8 — ProjectHub e rastreamento de alterações

Linha que trouxe o **Project Hub** (centralizador de referências do projeto) e
um sistema robusto de undo/redo nas configurações.

| Versão | Data | Destaque |
|---|---|---|
| **2.5.8.3** | 28/03/2026 | **Project Hub**: gerenciador centralizado de referências do projeto |
| 2.5.8.2 | 20/03/2026 | `HighlightTestCommand`: ferramenta de debug com destaque em camadas |
| 2.5.8.1 | 16/03/2026 | UI aprimorada, filtragem e rastreamento de alterações no setup |
| 2.5.8.0 | 12/03/2026 | Refatoração do change tracking com novas classes de entrada |

---

## 2.5.7 — UI Material Design e drag-and-drop

Reformulação visual do plugin com base no Material Design e fluxo multi-passos
no setup principal.

| Versão | Data | Destaque |
|---|---|---|
| **2.5.7.2** | 06/02/2026 | Reformulação completa do UI de setup em **multi-passos com Material Design** |
| 2.5.7.1 | 23/01/2026 | UI e lógica aprimoradas para edição de colunas de tubulação |
| 2.5.7.0 | 28/11/2025 | UI mais rica, **drag-and-drop** e refatoração de modelos |

---

## 2.5.6 — Refatoração geral

| Versão | Data | Destaque |
|---|---|---|
| 2.5.6.1 | 10/11/2025 | Refatoração da lógica de roteamento e melhor tratamento de erros |
| **2.5.6.0** | 05/11/2025 | Refatoração e limpeza geral do codebase |

---

## 2.5.0 a 2.5.5 — Suporte ao Revit 2026 e maturidade

Linha 2.5 introduziu o suporte ao Revit 2026 e amadureceu o gerenciamento de
tubulação iniciado em 2.4.

| Versão | Data | Destaque |
|---|---|---|
| 2.5.5.3 | 06/10/2025 | `SelectionChanged` funcionando no Revit 2026 |
| 2.5.5.1 | 30/09/2025 | Refatoração do tratamento de comandos e melhorias de UI |
| 2.5.5.0 | 19/09/2025 | Atualização da lógica de roteamento de tubulação |
| 2.5.4.2 | 10/09/2025 | Atualização de configurações de projeto e elementos de UI |
| 2.5.4.0 | 02/09/2025 | Aprimoramento do formulário de e-mail |
| 2.5.3.1 | 01/09/2025 | Atualização de versão e funcionalidade de comandos |
| 2.5.2.0 | 25/08/2025 | Atualização de metadados e melhorias no `OFHidraulicoExtApp` |
| 2.5.1.0 | 18/08/2025 | Nova propriedade `ShouldLogUsage` em executers; refinamento de logging |
| **2.5.0.0** | 28/07/2025 | Bump para 2.5.0 e refatoração do gerenciamento de tubulação |

---

## 2.4 — Novas vistas, correções e bombas

Linha que estabilizou o cálculo de bombas, adicionou geração de vistas
automaticamente e várias correções importantes no Equipment Manager.

| Versão | Data | Destaque |
|---|---|---|
| 2.4.6.0 | 15/07/2025 | Bump para 2.4.6 e tratamento aprimorado de falhas |
| 2.4.4.0 | 26/06/2025 | Correções diversas |
| 2.4.3.2 | 26/06/2025 | Banheira configurável como peça quente/fria em sistemas de água fria; melhorias no PathAnalysisBase para válvula de pressão horizontal |
| 2.4.2.2 | 23/06/2025 | **Correção do export/import de configurações do Equipment Manager**; PipeBuilder cria tubos no mesmo eixo Z |
| 2.4.2.0 | 16/06/2025 | Limpeza geral, refatoração e melhorias de legibilidade |
| 2.4.1.0 | 13/06/2025 | Correção do cálculo de fluxo com aquecedor de passagem |
| 2.4.0.1 | 09/06/2025 | Geração automática de **plantas baixas e vistas 3D**; comando para importar famílias |
| **2.4.0.0** | 15/05/2025 | Bump para 2.4 |

---

## 2.3 — PipeBuilder, cálculo de bombas e PathAnalysis

A linha 2.3 foi a mais importante em termos de **funcionalidades novas**:
catálogo de bombas, dimensionamento, PipeBuilder e análise de caminho.

| Versão | Data | Destaque |
|---|---|---|
| 2.3.8.0 | 22/04/2025 | Bump para 2.3.8 |
| 2.3.7.1 | 16/04/2025 | Implementação final do **PathAnalysis** |
| 2.3.7.0 | 07/04/2025 | Correção da remoção de filtros; correção de crash fatal do Revit ao abrir família com janela de propriedades aberta |
| 2.3.4.1 | 02/04/2025 | **PipeBuilder** para gerar tubulação e conexões de banheiro; janela de criação de tubos |
| 2.3.4.0 | 25/03/2025 | Suporte à criação automática de tubos do OF Elétrico |
| 2.3.3.0 | 18/03/2025 | Botão para copiar IDs de elementos; aviso de desbalanceamento detalhado; correção de sistema dependente não atualizando ao deletar |
| 2.3.1.0 | 10/03/2025 | Correções no WaterPump View; **comando para criar tabelas de dimensionamento** no Revit |
| **2.3.0.0** | 27/02/2025 | **Catálogo de bombas e dimensionamento (Pump Sizing)** lançados |

---

## 2.2 — Estabilização do installer

| Versão | Data | Destaque |
|---|---|---|
| 2.2.3.1 | 21/02/2025 | Pequenas correções |
| 2.2.1.0 | 28/01/2025 | Pequenas correções |
| **2.2.0.0** | 06/01/2025 | Atualização do installer e da estrutura de release |

---

## 2.1 — Lançamento da versão 2.0

A linha 2.1 inaugurou a arquitetura nova do plugin (post-rewrite do v1.0).

| Versão | Data | Destaque |
|---|---|---|
| 2.1.7.0 | 04/12/2024 | Importação de todas as funções da versão 1.0 |
| 2.1.4.0 | 25/11/2024 | Adição de views e viewmodels |
| **2.1.3.0** | 18/11/2024 | Primeira versão pública da arquitetura 2.0 |

---

## :material-history: Migração da versão 1.0 para 2.0

A migração do OFHidraulico 1.0 para o 2.0 foi uma **reescrita completa** do
plugin, com mudanças profundas nos comandos de dimensionamento e configuração
de peças. As principais notas dessa transição:

!!! warning "Suporte da versão 1.0"
    A **versão 1.0 não recebe mais atualizações**. Desde **01/01/2025**, ela não
    está mais disponível para download oficial. Todos os usuários devem migrar
    para a 2.0.

### Posso usar 1.0 e 2.0 ao mesmo tempo?

Sim. Você pode ter o Revit em duas versões instaladas (ex: Revit 2023 e Revit 2024)
e instalar o plugin 1.0 em uma e o 2.0 na outra. Ou pode desinstalar e reinstalar
conforme necessário — usar o 2.0 não apaga as configurações da 1.0.

### Vou perder configurações se reinstalar o 1.0?

Não. Reinstalar a 1.0 sobre o 2.0 não afeta o uso da 2.0, e vice-versa.

### Sou novo no plugin — qual versão devo instalar?

A 2.0. A 1.0 está descontinuada e não recebe mais atualizações ou correções.

### Existe um projeto template?

Sim — disponível no [site da Orçafascio](https://www.orcafascio.com){ target=_blank }.
Inclui um **projeto base** já totalmente configurado, ideal para fazer testes e
entender o fluxo do plugin.

### Como aprender o 2.0?

- **F1 sobre os botões do ribbon** abre o vídeo oficial daquele comando
- **Playlist no YouTube**: [OF Hidráulico 2.0](https://www.youtube.com/watch?v=dPam0LiZwKY&list=PLEHUqB9ix5mGgWZKRhnbwjyVjQ0Ohaqcl){ target=_blank }
- **Cursos completos** na plataforma [Movimente](https://movimente.orcafascio.com/courses/of-hidraulico-2-0/){ target=_blank }
- Esta central — em construção, mas já com artigos para os comandos mais usados

---

## Material relacionado

- 📄 PDF da migração 1.0 → 2.0: [Atualização OF Hidraúlico.pdf](../downloads/notas-de-atualizacao.pdf)
- 🔗 [Página inicial](../index.md) · [Contato e suporte](../contato/index.md)

---
*Atualizado em 2026-04-24 · OFHidraulico v2.5.9.10*
