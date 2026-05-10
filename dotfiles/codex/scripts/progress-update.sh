#!/bin/bash
# Progress Update Hook para Codex CLI
# Atualiza o timestamp em progress.md de projetos com harness

set -e

PROJECT_DIR="${CODEX_PROJECT_DIR:-${PWD}}"

[ ! -d "$PROJECT_DIR/.git" ] && exit 0
[ ! -f "$PROJECT_DIR/progress.md" ] && exit 0

PROGRESS_FILE="$PROJECT_DIR/progress.md"
TODAY=$(date +%Y-%m-%d)

if grep -q "^\*\*Última atualização:\*\*" "$PROGRESS_FILE" 2>/dev/null; then
    sed -i.bak "s/^\*\*Última atualização:\*\*.*/\*\*Última atualização:\*\* $TODAY  /" "$PROGRESS_FILE"
    rm -f "${PROGRESS_FILE}.bak"
fi

mkdir -p ~/.codex/logs 2>/dev/null
printf "%s [PROGRESS-UPDATE] %s\n" "$(date +%Y-%m-%dT%H:%M:%S)" "$PROJECT_DIR" >> ~/.codex/logs/progress-updates.log 2>/dev/null || true

exit 0
