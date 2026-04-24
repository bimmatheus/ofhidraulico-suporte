# Central de Suporte OFHidraulico

Site oficial de documentação e suporte do plugin **OFHidraulico** para o Autodesk Revit,
construído com [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) e publicado
via GitHub Pages.

O blueprint completo (inventário de comandos, árvore de navegação, template de artigo,
cronograma) vive no repositório do plugin, em
`OFHidraulico/Docs/SupportSitePlan.md`.

## Rodar localmente

Pré-requisito: Python 3.10+.

```bash
python -m venv .venv
.venv\Scripts\activate          # Windows (PowerShell/cmd)
# source .venv/bin/activate     # Linux/macOS
pip install -r requirements.txt
mkdocs serve
```

Abre em http://127.0.0.1:8000/ e recarrega a cada edição de `.md`.

## Estrutura

```
.
├── mkdocs.yml                 # configuração (tema, nav, extensões)
├── requirements.txt           # dependências Python pinadas
├── scripts/copy-pdfs.sh       # sincroniza PDFs do repo do plugin (uso local)
├── docs/                      # conteúdo em markdown
│   ├── index.md               # home com cards das categorias
│   ├── stylesheets/extra.css  # ajustes visuais
│   ├── downloads/             # PDFs técnicos (committados neste repo)
│   ├── primeiros-passos/
│   ├── catalogo-e-pecas/
│   ├── sistemas-hidraulicos/
│   └── ...
└── .github/workflows/deploy.yml  # deploy automático no GitHub Pages
```

## Atualizar PDFs

Os PDFs oficiais vivem no repositório do plugin em
`OFHidraulico/Resources/Files/`. Quando houver versão nova, rode localmente:

```bash
OFH_REPO=c:/ORCAFASCIOPrograms/OFCommon bash scripts/copy-pdfs.sh
git add docs/downloads/*.pdf
git commit -m "chore: sync pdfs"
git push
```

## Publicar

Push para `main` aciona `.github/workflows/deploy.yml` — que roda `mkdocs gh-deploy`
publicando na branch `gh-pages`.

**Primeira vez:** no GitHub, ir em *Settings → Pages* e apontar **Source** para
`Deploy from a branch` → `gh-pages` → `/ (root)`.

**Domínio customizado** (quando pronto): configurar em *Settings → Pages → Custom domain*
e criar `docs/CNAME` com o domínio. Atualizar DNS com CNAME para `bimmatheus.github.io`.

## Convenções de conteúdo

- Todo artigo segue o template de `SupportSitePlan.md §6` (no repo do plugin)
- Leads podem ser copiados dos tooltips PT-BR em `OFHidraulicoRibbon.pt-BR.resx`
- Ícones de ribbon vivem em `OFHidraulico/Resources/Images/` (padrão `<Comando>32.png`)

## Status

Esqueleto da central + 3 artigos-piloto (Configurações gerais, Gerenciador de peças,
Gerenciador de sistemas) com estrutura completa e placeholders para screenshots.
Próximos lotes de artigos seguem o cronograma em `SupportSitePlan.md §7`.
