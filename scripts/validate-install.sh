#!/bin/bash
# Valida se ~/.claude/, ~/.cursor/ e ~/.codex/ têm todos os recursos do dotfiles/
# Fase 1: catálogo global (por contagem mínima), Fase 2: overlays (por arquivo)

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"

TOTAL_OK=0
TOTAL_MISSING=0

CLAUDE_CONFIG_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
CURSOR_CONFIG_DIR="${CURSOR_CONFIG_DIR:-$HOME/.cursor}"
CODEX_CONFIG_DIR="${CODEX_CONFIG_DIR:-$HOME/.codex}"
HOME_DIR="${HOME_DIR:-$HOME}"

echo "🔍 Validação de Instalação — stec-developer-setup"
echo "📍 Repositório: $REPO_DIR"
echo ""

# Verifica contagem de subdiretórios (para skills — cada skill é uma pasta)
check_subdirs() {
    local DIR="$1"
    local MIN="$2"
    local LABEL="$3"

    if [ ! -d "$DIR" ]; then
        echo "  ❌ $LABEL — diretório $DIR não existe"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
        return
    fi

    local COUNT
    COUNT=$(find "$DIR" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l)

    if [ "$COUNT" -ge "$MIN" ]; then
        echo "  ✅ $LABEL — $COUNT dirs (mínimo $MIN)"
        TOTAL_OK=$((TOTAL_OK + 1))
    else
        echo "  ❌ $LABEL — $COUNT dirs (esperado ≥$MIN)"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
    fi
}

# Verifica contagem de arquivos (para agents e rules — são arquivos planos)
check_files() {
    local DIR="$1"
    local MIN="$2"
    local LABEL="$3"

    if [ ! -d "$DIR" ]; then
        echo "  ❌ $LABEL — diretório $DIR não existe"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
        return
    fi

    local COUNT
    COUNT=$(find "$DIR" -maxdepth 1 -type f 2>/dev/null | wc -l)

    if [ "$COUNT" -ge "$MIN" ]; then
        echo "  ✅ $LABEL — $COUNT arquivos (mínimo $MIN)"
        TOTAL_OK=$((TOTAL_OK + 1))
    else
        echo "  ❌ $LABEL — $COUNT arquivos (esperado ≥$MIN)"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
    fi
}

# Verifica todos os arquivos de um overlay (Fase 2 — lista completa)
validate_overlay() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local TOOL_NAME=$3

    if [ ! -d "$SOURCE_DIR" ]; then
        echo "  ⚠️  Sem overlay para $TOOL_NAME"
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
            echo "  ❌ FALTANDO: $REL_PATH"
        fi
    done < <(find "$SOURCE_DIR" -type f -print0)

    if [ "$MISSING" -eq 0 ]; then
        echo "  ✅ Overlay: $OK arquivos presentes"
    else
        echo "  ⚠️  Overlay: $OK presentes, $MISSING faltando"
    fi

    TOTAL_OK=$((TOTAL_OK + OK))
    TOTAL_MISSING=$((TOTAL_MISSING + MISSING))
}

# ─── FASE 1: Catálogo global ───────────────────────────────────────────────────
echo "📋 FASE 1 — Catálogo global (dotfiles/global/ → ~/.*/)"
echo ""

echo "🔹 Claude Code (~/.claude/)"
check_subdirs "$CLAUDE_CONFIG_DIR/skills" 316  "skills (316 genéricas)"
check_files   "$CLAUDE_CONFIG_DIR/rules"  93   "rules (93 MDC)"
check_files   "$CLAUDE_CONFIG_DIR/docs/llm/by-domain" 25 "docs/llm (25 domínios)"
echo ""

echo "🔹 Cursor IDE (~/.cursor/)"
check_subdirs "$CURSOR_CONFIG_DIR/skills" 316  "skills (316 genéricas)"
check_files   "$CURSOR_CONFIG_DIR/agents" 230  "agents (230 + INDEX.md)"
check_files   "$CURSOR_CONFIG_DIR/rules"  93   "rules (93 MDC)"
check_files   "$CURSOR_CONFIG_DIR/docs/llm/by-domain" 25 "docs/llm (25 domínios)"
echo ""

echo "🔹 Codex CLI (~/.codex/)"
check_subdirs "$CODEX_CONFIG_DIR/skills"  320  "skills (316 genéricas + 4 Codex-específicas)"
check_files   "$CODEX_CONFIG_DIR/agents"  229  "agents"
check_files   "$CODEX_CONFIG_DIR/rules"   93   "rules (93 MDC)"
check_files   "$CODEX_CONFIG_DIR/docs/llm/by-domain" 25 "docs/llm (25 domínios)"
echo ""

# ─── FASE 2: Overlays IDE-específicos ─────────────────────────────────────────
echo "📋 FASE 2 — Overlays IDE-específicos (dotfiles/[ide]/ → ~/.*/)"
echo ""

echo "🔹 Claude Code — overlay"
validate_overlay "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Code"
echo ""

echo "🔹 Cursor IDE — overlay"
validate_overlay "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"
echo ""

echo "🔹 Codex CLI — overlay"
validate_overlay "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex CLI"
echo ""

# ─── Home Level ───────────────────────────────────────────────────────────────
echo "📋 Home Level"
if [ -f "$HOME_DIR/CLAUDE.md" ]; then
    echo "  ✅ ~/CLAUDE.md presente"
    TOTAL_OK=$((TOTAL_OK + 1))
else
    echo "  ❌ ~/CLAUDE.md FALTANDO"
    TOTAL_MISSING=$((TOTAL_MISSING + 1))
fi
echo ""

# ─── Resumo ───────────────────────────────────────────────────────────────────
echo "═══════════════════════════════════════════════"
echo "📊 RESUMO"
echo "═══════════════════════════════════════════════"
echo "   ✅ OK:       $TOTAL_OK verificações"
echo "   ❌ Faltando: $TOTAL_MISSING verificações"
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
