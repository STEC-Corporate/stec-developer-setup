#!/bin/bash
# Guard-shell para Codex CLI: Bloqueia comandos destrutivos antes da execução

set -e

INPUT_CMD="${CODEX_COMMAND:-${1:-}}"

if [ -z "$INPUT_CMD" ] && ! [ -t 0 ]; then
    INPUT_DATA=$(cat 2>/dev/null || echo "")
    if command -v jq >/dev/null 2>&1; then
        INPUT_CMD=$(echo "$INPUT_DATA" | jq -r '.command // .tool_input.command // empty' 2>/dev/null || echo "")
    else
        INPUT_CMD="$INPUT_DATA"
    fi
fi

[ -z "$INPUT_CMD" ] && exit 0

DESTRUCTIVE_PATTERN='rm[[:space:]]+-rf[[:space:]]+/|git[[:space:]]+push[[:space:]].*(--force|-f[[:space:]])|git[[:space:]]+reset[[:space:]]+--hard|DROP[[:space:]]+(TABLE|DATABASE|SCHEMA)|mkfs\.'

if echo "$INPUT_CMD" | grep -qiE "$DESTRUCTIVE_PATTERN"; then
    echo "Guard-shell (Codex): comando destrutivo bloqueado: $(echo "$INPUT_CMD" | head -c 100)" >&2
    exit 1
fi

exit 0
