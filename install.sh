#!/bin/bash
# Instalador Harness — Linux / macOS / WSL2 / Git Bash
# Distribui hooks, agents, skills, scripts e rules para ~/.claude/, ~/.cursor/, ~/.codex/
# Suporta cópia recursiva de subdiretórios (skills/, agents/, scripts/, rules/)

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"

echo "🚀 Instalando Harness completo (Claude + Cursor + Codex)"
echo "📍 Repositório: $REPO_DIR"
echo ""

# Source detecção de ambiente
source "$REPO_DIR/scripts/detect-env.sh"
print_detection
echo ""

# Função de cópia recursiva preservando estrutura completa
copy_recursive_tree() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local TOOL_NAME=$3

    echo "📦 Instalando para $TOOL_NAME..."

    if [ ! -d "$SOURCE_DIR" ]; then
        echo "  ⚠️  Fonte não encontrada: $SOURCE_DIR"
        return
    fi

    mkdir -p "$DEST_DIR"

    local COPIED=0
    local SKIPPED=0

    # Encontrar todos os arquivos (qualquer profundidade) e replicar estrutura
    while IFS= read -r -d '' file; do
        local REL_PATH="${file#$SOURCE_DIR/}"
        local DEST_FILE="$DEST_DIR/$REL_PATH"
        local DEST_PARENT=$(dirname "$DEST_FILE")

        mkdir -p "$DEST_PARENT"

        if [ -f "$DEST_FILE" ]; then
            SKIPPED=$((SKIPPED + 1))
        else
            cp "$file" "$DEST_FILE"
            COPIED=$((COPIED + 1))
            echo "  ✅ $REL_PATH"
        fi
    done < <(find "$SOURCE_DIR" -type f -print0)

    # chmod +x em todos os .sh dentro de scripts/
    find "$DEST_DIR" -path "*/scripts/*.sh" -type f -exec chmod +x {} \; 2>/dev/null || true

    echo "  📊 $COPIED novo(s), $SKIPPED já existente(s) preservado(s)"
    echo "  ✅ $TOOL_NAME OK"
    echo ""
}

# Detectar WSL2 e perguntar sobre ferramentas no Windows
if [[ "$PLATFORM" == "wsl2" ]] && [ -d "/mnt/c/Users" ]; then
    echo "🖥️  Detectado WSL2 com Windows disponível em /mnt/c"
    echo ""
    echo "Onde estão suas ferramentas? (Claude, Cursor, Codex)"
    echo "1) Linux (WSL2 — padrão)"
    echo "2) Windows (via /mnt/c/Users/...)"
    echo "3) Ambos (instalar nos dois)"
    echo ""
    read -p "Escolha [1-3]: " INSTALL_TARGET

    case "$INSTALL_TARGET" in
        2) INSTALL_WSL=0; INSTALL_WIN=1 ;;
        3) INSTALL_WSL=1; INSTALL_WIN=1 ;;
        *) INSTALL_WSL=1; INSTALL_WIN=0 ;;
    esac
else
    INSTALL_WSL=1
    INSTALL_WIN=0
fi

# Instalar Claude Code (recursivo)
if [[ "$INSTALL_WSL" == "1" ]]; then
    copy_recursive_tree "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Code"

    # Templates (necessário para harness-apply.sh)
    if [ -d "$REPO_DIR/templates" ]; then
        echo "📦 Instalando templates Claude..."
        mkdir -p "$CLAUDE_CONFIG_DIR/templates"
        cp -rn "$REPO_DIR/templates"/* "$CLAUDE_CONFIG_DIR/templates/" 2>/dev/null || true
        echo "  ✅ templates/ copiados (sem sobrescrever)"
        echo ""
    fi
fi

# Instalar Cursor (recursivo: agents/ + skills/ + scripts/ + hooks.json)
if [[ "$INSTALL_WSL" == "1" ]]; then
    copy_recursive_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"
fi

# Instalar Codex (recursivo: skills/ + rules/ + scripts/)
if [[ "$INSTALL_WSL" == "1" ]]; then
    copy_recursive_tree "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex CLI"
fi

# Instalar ~/CLAUDE.md (home-level, sempre)
if [ ! -f "$HOME_DIR/CLAUDE.md" ]; then
    cp "$DOTFILES_DIR/home/CLAUDE.md" "$HOME_DIR/CLAUDE.md"
    echo "✅ ~/CLAUDE.md instalado"
else
    echo "⏭️  ~/CLAUDE.md já existe — pulando"
fi

echo ""
echo "✨ Instalação concluída!"
echo ""
echo "📋 Resumo do que foi instalado:"
echo "  • ~/CLAUDE.md            — Instrução imperativa (lido automaticamente)"
echo "  • ~/.claude/             — Claude Code: settings.json + scripts + templates"
echo "  • ~/.cursor/             — Cursor IDE: hooks.json + agents + skills + scripts"
echo "  • ~/.codex/              — Codex CLI: rules + skills + scripts"
echo ""
echo "🔍 Validar instalação:"
echo "  bash $REPO_DIR/scripts/validate-install.sh"
echo ""
echo "📝 Próximos passos:"
echo "  1. Abrir uma nova sessão ou terminal"
echo "  2. Ir para um projeto: cd ~/Projetos/seu-projeto"
echo "  3. Aplicar harness no projeto: bash ~/.claude/scripts/harness-apply.sh"
echo ""
echo "📚 Referência:"
echo "  • Harness: @~/.claude/HARNESS.md (ou ~/.cursor/HARNESS.md, ~/.codex/HARNESS.md)"
echo "  • Atualizar: cd $REPO_DIR && git pull && bash install.sh"
