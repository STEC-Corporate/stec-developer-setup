#!/usr/bin/env bash
# Legado: lógica unificada em .cursor/hooks/cursor-hooks-dispatch.sh (ver hooks.json).
set -euo pipefail
_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
exec "$_ROOT/hooks/cursor-hooks-dispatch.sh" afterFileEdit
