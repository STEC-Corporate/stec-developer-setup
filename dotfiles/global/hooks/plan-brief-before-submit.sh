#!/usr/bin/env bash
# beforeSubmitPrompt: lembra workflow-prompt-profissional em pedidos de plano novo, brainstorm explícito ou ajuda com prompt (ligado por padrão).
# Desligar: export PLAN_BRIEF_GATE=0 em local.env (esta pasta). Ver hooks/README.md.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/local.env" ]]; then
  # shellcheck disable=SC1090
  source "$SCRIPT_DIR/local.env"
fi

export PLAN_BRIEF_GATE="${PLAN_BRIEF_GATE:-1}"

PY="python3"
if ! command -v "$PY" >/dev/null 2>&1; then
  PY="python"
fi

exec "$PY" "$SCRIPT_DIR/plan-brief-before-submit.py"
