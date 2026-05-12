#!/usr/bin/env bash
# Cursor Hook: afterFileEdit — opcionalmente corre testes rápidos (configurável).
# Documentação: README.md na mesma pasta e docs/governanca/fluxo-workflow-agent-hooks-ci.md
set -euo pipefail

# Consumir stdin (JSON do Cursor) para não bloquear pipes
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

RUN_CMD="${CURSOR_HOOK_TEST_CMD:-}"

if [[ -z "$RUN_CMD" ]]; then
  echo "[cursor-hooks] afterFileEdit: sem CURSOR_HOOK_TEST_CMD — no-op (ver hooks/README.md)" >&2
  exit 0
fi

echo "[cursor-hooks] afterFileEdit: a executar: $RUN_CMD" >&2
set +e
eval "$RUN_CMD" >&2
RC=$?
set -e

if [[ "$RC" -ne 0 ]]; then
  echo "[cursor-hooks] afterFileEdit: comando terminou com código $RC" >&2
  if [[ "${CURSOR_HOOK_FAIL_ON_ERROR:-0}" == "1" ]]; then
    exit "$RC"
  fi
fi

exit 0
