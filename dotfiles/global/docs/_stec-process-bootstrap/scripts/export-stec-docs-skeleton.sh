#!/usr/bin/env bash
# Gera ou actualiza neutral-pack/docs a partir de docs/ live com allowlist + denylist.
# Não substitui o fluxo P0 do orchestrator — ferramenta de manutenção do pacote neutro.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ALLOW_FILE="${SCRIPT_DIR}/export-allow.txt"
DENY_FILE="${SCRIPT_DIR}/export-deny.txt"
DEFAULT_OUT="$(cd "$SCRIPT_DIR/../neutral-pack/docs" && pwd)"

DRY_RUN=0
VERBOSE=0
OUT_DIR=""
LIVE_ROOT=""

usage() {
  cat >&2 <<'EOF'
Uso: export-stec-docs-skeleton.sh [opções] <repo-raiz-live>

  repo-raiz-live   Raiz do repositório com pasta docs/ (gestao-tarefas, gestao-ideias).

Opções:
  --out DIR        Destino (defeito: neutral-pack/docs junto a este script)
  --dry-run        Listar ficheiros incluídos / rejeitados; não escrever
  --verbose        Mais linhas de diagnóstico
  -h, --help       Esta ajuda

Revisão humana obrigatória antes de commit do pacote neutro.
EOF
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --verbose) VERBOSE=1; shift ;;
    --out)
      [[ -n "${2:-}" ]] || usage
      OUT_DIR="$(cd "$2" && pwd)"
      shift 2
      ;;
    -h|--help) usage ;;
    *)
      [[ -z "$LIVE_ROOT" ]] || usage
      LIVE_ROOT="$(cd "$1" && pwd)"
      shift
      ;;
  esac
done

[[ -n "$LIVE_ROOT" ]] || usage
[[ -z "$OUT_DIR" ]] && OUT_DIR="$DEFAULT_OUT"

SRC_DOCS="$LIVE_ROOT/docs"
[[ -d "$SRC_DOCS" ]] || { echo "ERRO: não existe $SRC_DOCS" >&2; exit 2; }
[[ -f "$ALLOW_FILE" ]] || { echo "ERRO: falta allow list $ALLOW_FILE" >&2; exit 3; }

# --- regras duras (defesa em profundidade) ---
hard_deny() {
  local rel="$1"
  if [[ "$rel" == gestao-tarefas/03-especificacao-produto/* ]]; then
    [[ "$rel" == "gestao-tarefas/03-especificacao-produto/README.md" ]] && return 1
    return 0
  fi
  local base
  base="$(basename "$rel")"
  if [[ "$base" == fe-*.md ]] && [[ "$rel" != *"/_templates/"* ]]; then
    return 0
  fi
  return 1
}

file_denied_by_list() {
  local rel="$1"
  [[ -f "$DENY_FILE" ]] || return 1
  local tmp
  tmp="$(mktemp)"
  grep -v '^[[:space:]]*$\|^[[:space:]]*#' "$DENY_FILE" >"$tmp" || true
  if [[ ! -s "$tmp" ]]; then
    rm -f "$tmp"
    return 1
  fi
  if printf '%s\n' "$rel" | grep -Ef "$tmp" -q; then
    rm -f "$tmp"
    return 0
  fi
  rm -f "$tmp"
  return 1
}

is_denied() {
  local rel="$1"
  hard_deny "$rel" && return 0
  file_denied_by_list "$rel" && return 0
  return 1
}

is_allowed() {
  local rel="$1"
  local line p
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "${line// }" ]] && continue
    [[ "$line" =~ ^[[:space:]]*# ]] && continue
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"
    if [[ "$line" == @* ]]; then
      p="${line#@}"
      if [[ "$p" == */ ]]; then
        [[ "$rel" == "$p"* ]] && return 0
      else
        [[ "$rel" == "$p/"* || "$rel" == "$p" ]] && return 0
      fi
    else
      [[ "$rel" == "$line" ]] && return 0
    fi
  done <"$ALLOW_FILE"
  return 1
}

LIST_INCLUDE="$(mktemp)"
LIST_REJECT="$(mktemp)"
trap 'rm -f "$LIST_INCLUDE" "$LIST_REJECT"' EXIT

pushd() { builtin pushd "$@" >/dev/null; }
popd() { builtin popd "$@" >/dev/null; }

pushd "$SRC_DOCS"
while IFS= read -r rel; do
  [[ -z "$rel" ]] && continue
  if is_denied "$rel"; then
    echo "$rel" >>"$LIST_REJECT"
    [[ "$VERBOSE" -eq 1 ]] && echo "  [deny] $rel" >&2
    continue
  fi
  if ! is_allowed "$rel"; then
    echo "$rel" >>"$LIST_REJECT"
    [[ "$VERBOSE" -eq 1 ]] && echo "  [skip] $rel" >&2
    continue
  fi
  echo "$rel" >>"$LIST_INCLUDE"
  [[ "$VERBOSE" -eq 1 ]] && echo "  [ok]   $rel" >&2
done < <(find gestao-tarefas gestao-ideias -type f 2>/dev/null | LC_ALL=C sort -u)
popd

INC_COUNT="$(wc -l <"$LIST_INCLUDE" | tr -d ' ')"
REJ_COUNT="$(wc -l <"$LIST_REJECT" | tr -d ' ')"
echo "Export: $INC_COUNT ficheiros incluídos, $REJ_COUNT rejeitados/ignorados (allow+deny)."
echo "Origem: $SRC_DOCS"
echo "Destino: $OUT_DIR"

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "[dry-run] Ficheiros que seriam copiados:"
  sed 's/^/  /' "$LIST_INCLUDE"
  echo "[dry-run] Nenhuma escrita em disco."
  exit 0
fi

mkdir -p "$OUT_DIR"
while IFS= read -r rel; do
  [[ -z "$rel" ]] && continue
  parent="$OUT_DIR/$(dirname "$rel")"
  mkdir -p "$parent"
  cp -f "$SRC_DOCS/$rel" "$OUT_DIR/$rel"
done <"$LIST_INCLUDE"

echo "OK: cópia concluída para $OUT_DIR"
echo "Reveja o diff (git diff) antes de commitar o pacote neutro."
