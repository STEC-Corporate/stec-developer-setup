#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Uso: $0 [--dry-run] <repo-raiz>" >&2
  echo "  repo-raiz = raiz do repositório consumidor (deve conter .cursor/agents)." >&2
  exit 1
}

DRY=()
DRY_LABEL=""
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY=(--dry-run)
  DRY_LABEL=" [dry-run]"
  shift
fi

[[ -n "${1:-}" ]] || usage
DEST="$(cd "$1" && pwd)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK="$(cd "$SCRIPT_DIR/../neutral-pack/docs" && pwd)"

if [[ ! -d "$DEST/.cursor/agents" || ! -d "$DEST/.cursor/skills" || ! -d "$DEST/.cursor/rules" ]]; then
  echo "ERRO: Submodule .cursor incompleto (faltam agents/skills/rules). Consulte .cursor/SUBMODULES.md" >&2
  exit 2
fi

if [[ ! -d "$PACK" ]]; then
  echo "ERRO: Pacote neutro não encontrado: $PACK" >&2
  exit 3
fi

mkdir -p "$DEST/docs"
rsync -a "${DRY[@]}" "$PACK/" "$DEST/docs/"
echo "OK${DRY_LABEL}: pacote de $PACK -> $DEST/docs/"
