#!/bin/bash
# Guard-shell para Cursor: Bloqueia comandos destrutivos antes da execução
# Lê comando do stdin (formato JSON Cursor) ou da variável CURSOR_COMMAND

set -e

# Tenta ler o comando de diferentes fontes
INPUT_CMD="${CURSOR_COMMAND:-}"
if [ -z "$INPUT_CMD" ] && [ -t 0 ]; then
    exit 0
fi

if [ -z "$INPUT_CMD" ]; then
    INPUT_DATA=$(cat 2>/dev/null || echo "")
    if command -v jq >/dev/null 2>&1; then
        INPUT_CMD=$(echo "$INPUT_DATA" | jq -r '.command // .tool_input.command // empty' 2>/dev/null || echo "")
    fi
fi

[ -z "$INPUT_CMD" ] && exit 0

DESTRUCTIVE_PATTERN='rm[[:space:]]+-rf[[:space:]]+/|git[[:space:]]+push[[:space:]].*(--force|-f[[:space:]])|git[[:space:]]+reset[[:space:]]+--hard|DROP[[:space:]]+(TABLE|DATABASE|SCHEMA)|mkfs\.'

if echo "$INPUT_CMD" | grep -qiE "$DESTRUCTIVE_PATTERN"; then
    cat << EOF
{
  "decision": "deny",
  "reason": "Guard-shell (Cursor): comando destrutivo detectado. Revise manualmente antes de executar.",
  "command_blocked": "$(echo "$INPUT_CMD" | head -c 100)"
}
EOF
    exit 1
fi

exit 0
