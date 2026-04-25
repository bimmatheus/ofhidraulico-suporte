# Histórico de versões

Notas das versões publicadas do **OFHidraulico**.

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
