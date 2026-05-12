#!/usr/bin/env bash
# Cursor Hook: stop — stub para logging ou fecho de tarefa (Notion/API via comando externo).
set -euo pipefail

if [[ -t 0 ]]; then
  :
else
  cat >/dev/null || true
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

LOCAL_ENV="$(dirname "${BASH_SOURCE[0]}")/local.env"
if [[ -f "$LOCAL_ENV" ]]; then
  # shellcheck disable=SC1090
  source "$LOCAL_ENV"
fi

STOP_CMD="${CURSOR_HOOK_STOP_CMD:-}"

if [[ -z "$STOP_CMD" ]]; then
  echo "[cursor-hooks] stop: sem CURSOR_HOOK_STOP_CMD — no-op" >&2
  exit 0
fi

echo "[cursor-hooks] stop: a executar comando configurado" >&2
set +e
eval "$STOP_CMD" >&2
RC=$?
set -e
exit "$RC"
