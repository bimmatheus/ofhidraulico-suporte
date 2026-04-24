#!/usr/bin/env bash
# Sincroniza os PDFs a partir de OFHidraulico/Resources/Files/ para docs/downloads/
# usando slugs URL-friendly. Ferramenta LOCAL — os PDFs resultantes devem ser
# committados neste repositório (o CI não tem acesso ao repo do plugin).
#
# Uso:
#   OFH_REPO=c:/ORCAFASCIOPrograms/OFCommon bash scripts/copy-pdfs.sh
#
# Se a variável OFH_REPO não for definida, o script tenta o caminho padrão
# c:/ORCAFASCIOPrograms/OFCommon.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

OFH_REPO="${OFH_REPO:-c:/ORCAFASCIOPrograms/OFCommon}"
SRC="$OFH_REPO/OFHidraulico/Resources/Files"
DEST="$REPO_ROOT/docs/downloads"

if [[ ! -d "$SRC" ]]; then
  echo "ERRO: diretório de origem não encontrado: $SRC"
  echo "Defina OFH_REPO para o caminho local do repositório OFCommon."
  exit 1
fi

mkdir -p "$DEST"

copy_if_exists() {
  local from="$1"
  local to="$2"
  if [[ -f "$SRC/$from" ]]; then
    cp "$SRC/$from" "$DEST/$to"
    echo "  ✓ $to"
  else
    echo "  ⚠ fonte não encontrada: $from"
  fi
}

echo "Sincronizando PDFs de $SRC para $DEST:"

copy_if_exists "Configurações gerais.pdf"                 "configuracoes-gerais.pdf"
copy_if_exists "Gerenciador de peças.pdf"                 "gerenciador-de-pecas.pdf"
copy_if_exists "Gerenciador de sistemas.pdf"              "gerenciador-de-sistemas.pdf"
copy_if_exists "Bombas.pdf"                                "bombas.pdf"
copy_if_exists "Perda de carga.pdf"                        "perda-de-carga.pdf"
copy_if_exists "Perda de carga em hidrômetros.pdf"        "perda-de-carga-hidrometros.pdf"
copy_if_exists "Fluxo tubos de água quente e fria.pdf"    "fluxo-agua-quente-fria.pdf"
copy_if_exists "Mostrar propriedades.pdf"                  "mostrar-propriedades.pdf"
copy_if_exists "Atualização OF Hidraúlico.pdf"            "notas-de-atualizacao.pdf"
copy_if_exists "Documentações.pdf"                        "documentacoes-compilado.pdf"
copy_if_exists "EULA OFHidraulico.pdf"                     "eula.pdf"

echo ""
echo "Feito. Não esqueça de commitar os PDFs novos/atualizados:"
echo "  git add docs/downloads/*.pdf"
echo "  git commit -m 'chore: sync pdfs'"
