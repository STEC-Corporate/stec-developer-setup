#!/bin/bash
# Progress Update Hook para Claude Code
# Atualiza o timestamp em progress.md de projetos com harness após Edit/Write

set -e

# Tenta capturar o diretório do projeto a partir do input do hook
INPUT_DATA=""
if ! [ -t 0 ]; then
    INPUT_DATA=$(cat 2>/dev/null || echo "")
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-${PWD}}"

# Tenta extrair file_path do input
if [ -n "$INPUT_DATA" ] && command -v jq >/dev/null 2>&1; then
    FILE_PATH=$(echo "$INPUT_DATA" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null || echo "")
    if [ -n "$FILE_PATH" ]; then
        # Sobe diretórios até achar .git
        DIR=$(dirname "$FILE_PATH")
        while [ "$DIR" != "/" ] && [ "$DIR" != "." ]; do
            if [ -d "$DIR/.git" ]; then
                PROJECT_DIR="$DIR"
                break
            fi
            DIR=$(dirname "$DIR")
        done
    fi
fi

[ ! -d "$PROJECT_DIR/.git" ] && exit 0
[ ! -f "$PROJECT_DIR/progress.md" ] && exit 0

PROGRESS_FILE="$PROJECT_DIR/progress.md"
TODAY=$(date +%Y-%m-%d)

if grep -q "^\*\*Última atualização:\*\*" "$PROGRESS_FILE" 2>/dev/null; then
    sed -i.bak "s/^\*\*Última atualização:\*\*.*/\*\*Última atualização:\*\* $TODAY  /" "$PROGRESS_FILE"
    rm -f "${PROGRESS_FILE}.bak"
fi

mkdir -p ~/.claude/logs 2>/dev/null
printf "%s [PROGRESS-UPDATE] %s\n" "$(date +%Y-%m-%dT%H:%M:%S)" "$PROJECT_DIR" >> ~/.claude/logs/progress-updates.log 2>/dev/null || true

exit 0
