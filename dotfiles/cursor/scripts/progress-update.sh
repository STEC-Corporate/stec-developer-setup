#!/bin/bash
# Progress Update Hook para Cursor
# Atualiza o timestamp "Última atualização" em progress.md de projetos com harness

set -e

PROJECT_DIR="${CURSOR_PROJECT_DIR:-${PWD}}"

# Sair silenciosamente se não estiver em projeto com harness
[ ! -d "$PROJECT_DIR/.git" ] && exit 0
[ ! -f "$PROJECT_DIR/progress.md" ] && exit 0

PROGRESS_FILE="$PROJECT_DIR/progress.md"
TODAY=$(date +%Y-%m-%d)

# Atualizar a linha "Última atualização" se existir
if grep -q "^\*\*Última atualização:\*\*" "$PROGRESS_FILE" 2>/dev/null; then
    sed -i.bak "s/^\*\*Última atualização:\*\*.*/\*\*Última atualização:\*\* $TODAY  /" "$PROGRESS_FILE"
    rm -f "${PROGRESS_FILE}.bak"
fi

# Log silencioso para auditoria
mkdir -p ~/.cursor/logs 2>/dev/null
printf "%s [PROGRESS-UPDATE] %s\n" "$(date +%Y-%m-%dT%H:%M:%S)" "$PROJECT_DIR" >> ~/.cursor/logs/progress-updates.log 2>/dev/null || true

exit 0
