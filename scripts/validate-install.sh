#!/bin/bash
# Valida se ~/.claude/, ~/.cursor/ e ~/.codex/ tem todos os recursos do dotfiles/
# Imprime relatório de paridade entre o repo e as IDEs instaladas

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"

TOTAL_OK=0
TOTAL_MISSING=0
MISSING_FILES=""

echo "🔍 Validação de Instalação — stec-developer-setup"
echo "📍 Repositório: $REPO_DIR"
echo ""

validate_tree() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local TOOL_NAME=$3

    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🛠  $TOOL_NAME"
    echo "   Repo:    $SOURCE_DIR"
    echo "   Instalado: $DEST_DIR"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [ ! -d "$SOURCE_DIR" ]; then
        echo "  ⚠️  Repositório não tem dotfiles para esta IDE"
        return
    fi

    if [ ! -d "$DEST_DIR" ]; then
        echo "  ❌ IDE não está instalada (diretório $DEST_DIR não existe)"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
        return
    fi

    local OK=0
    local MISSING=0

    while IFS= read -r -d '' file; do
        local REL_PATH="${file#$SOURCE_DIR/}"
        local DEST_FILE="$DEST_DIR/$REL_PATH"

        if [ -f "$DEST_FILE" ]; then
            OK=$((OK + 1))
        else
            MISSING=$((MISSING + 1))
            MISSING_FILES="$MISSING_FILES\n  - $TOOL_NAME: $REL_PATH"
            echo "  ❌ FALTANDO: $REL_PATH"
        fi
    done < <(find "$SOURCE_DIR" -type f -print0)

    if [ "$MISSING" -eq 0 ]; then
        echo "  ✅ Todos os $OK arquivos presentes"
    else
        echo "  ⚠️  $OK presente(s), $MISSING faltando"
    fi

    TOTAL_OK=$((TOTAL_OK + OK))
    TOTAL_MISSING=$((TOTAL_MISSING + MISSING))
    echo ""
}

# Definir destinos por IDE (com fallbacks típicos)
CLAUDE_CONFIG_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
CURSOR_CONFIG_DIR="${CURSOR_CONFIG_DIR:-$HOME/.cursor}"
CODEX_CONFIG_DIR="${CODEX_CONFIG_DIR:-$HOME/.codex}"

validate_tree "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Code"
validate_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"
validate_tree "$DOTFILES_DIR/codex"  "$CODEX_CONFIG_DIR"  "Codex CLI"

# Verificar ~/CLAUDE.md
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🛠  Home Level"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "$HOME/CLAUDE.md" ]; then
    echo "  ✅ ~/CLAUDE.md presente"
    TOTAL_OK=$((TOTAL_OK + 1))
else
    echo "  ❌ ~/CLAUDE.md FALTANDO"
    TOTAL_MISSING=$((TOTAL_MISSING + 1))
fi
echo ""

# Resumo final
echo "═══════════════════════════════════════════════"
echo "📊 RESUMO"
echo "═══════════════════════════════════════════════"
echo "  ✅ Presentes:  $TOTAL_OK"
echo "  ❌ Faltando:   $TOTAL_MISSING"
echo ""

if [ "$TOTAL_MISSING" -gt 0 ]; then
    echo "🔧 Para corrigir, execute:"
    echo "  cd $REPO_DIR && bash install.sh"
    echo ""
    exit 1
else
    echo "🎉 Instalação completa! Todas as IDEs estão sincronizadas com o repositório."
    exit 0
fi
