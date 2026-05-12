#!/bin/bash
# Instalador Harness — Linux / macOS / WSL2 / Git Bash
# Duas fases: Fase 1 (dotfiles/global) + Fase 2 (dotfiles/[ide] overlays com sobrescrita)
# Distribui 779+ artefatos (skills, agents, rules, hooks, mcp, plans) para ~/.claude/, ~/.cursor/, ~/.codex/

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"

echo "🚀 Instalando Harness completo — Fase 1 (global) + Fase 2 (overlays)"
echo "📍 Repositório: $REPO_DIR"
echo ""

# Source detecção de ambiente
source "$REPO_DIR/scripts/detect-env.sh"
print_detection
echo ""

# Função de cópia recursiva com opção de sobrescrita
copy_tree() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local TOOL_NAME=$3
    local OVERWRITE=${4:-0}  # 0 = skip existentes, 1 = sobrescrever

    if [ ! -d "$SOURCE_DIR" ]; then
        return
    fi

    mkdir -p "$DEST_DIR"

    local COPIED=0
    local SKIPPED=0

    # Encontrar todos os arquivos e replicar estrutura
    while IFS= read -r -d '' file; do
        local REL_PATH="${file#$SOURCE_DIR/}"
        local DEST_FILE="$DEST_DIR/$REL_PATH"
        local DEST_PARENT=$(dirname "$DEST_FILE")

        mkdir -p "$DEST_PARENT"

        if [ -f "$DEST_FILE" ] && [ "$OVERWRITE" -eq 0 ]; then
            SKIPPED=$((SKIPPED + 1))
        else
            cp "$file" "$DEST_FILE" 2>/dev/null || true
            COPIED=$((COPIED + 1))
        fi
    done < <(find "$SOURCE_DIR" -type f -print0)

    # chmod +x em scripts/ e hooks/
    find "$DEST_DIR" -path "*/scripts/*.sh" -type f -exec chmod +x {} \; 2>/dev/null || true
    find "$DEST_DIR" -path "*/hooks/*.sh" -type f -exec chmod +x {} \; 2>/dev/null || true

    if [ "$OVERWRITE" -eq 0 ]; then
        echo "  📊 $COPIED novo(s), $SKIPPED preservado(s)"
    else
        echo "  ✅ Overlay aplicado ($COPIED arquivos)"
    fi
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

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# FASE 1: Distribuir dotfiles/global/ para 3 IDEs (base + genéricas)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if [[ "$INSTALL_WSL" == "1" ]]; then
    echo "📋 FASE 1: Distribuindo catálogo corporativo (dotfiles/global/)"
    echo ""

    # Claude Code — skills + rules + mcp + scripts + docs/llm (NÃO agents — ignorado por Claude)
    echo "🔹 Claude Code (skills, rules, mcp, scripts, docs/llm)"
    copy_tree "$DOTFILES_DIR/global/skills" "$CLAUDE_CONFIG_DIR/skills" "Claude skills" 0
    copy_tree "$DOTFILES_DIR/global/rules" "$CLAUDE_CONFIG_DIR/rules" "Claude rules" 0
    copy_tree "$DOTFILES_DIR/global/mcp" "$CLAUDE_CONFIG_DIR/mcp" "Claude mcp" 0
    copy_tree "$DOTFILES_DIR/global/scripts" "$CLAUDE_CONFIG_DIR/scripts" "Claude scripts" 0
    copy_tree "$DOTFILES_DIR/global/docs/llm" "$CLAUDE_CONFIG_DIR/docs/llm" "Claude docs/llm" 0
    echo ""

    # Cursor IDE — skills + rules + agents + hooks + scripts + docs/llm
    echo "🔹 Cursor IDE (skills, rules, agents, hooks, scripts, docs/llm)"
    copy_tree "$DOTFILES_DIR/global/skills" "$CURSOR_CONFIG_DIR/skills" "Cursor skills" 0
    copy_tree "$DOTFILES_DIR/global/rules" "$CURSOR_CONFIG_DIR/rules" "Cursor rules" 0
    copy_tree "$DOTFILES_DIR/global/agents" "$CURSOR_CONFIG_DIR/agents" "Cursor agents" 0
    copy_tree "$DOTFILES_DIR/global/hooks" "$CURSOR_CONFIG_DIR/hooks" "Cursor hooks" 0
    copy_tree "$DOTFILES_DIR/global/scripts" "$CURSOR_CONFIG_DIR/scripts" "Cursor scripts" 0
    copy_tree "$DOTFILES_DIR/global/docs/llm" "$CURSOR_CONFIG_DIR/docs/llm" "Cursor docs/llm" 0
    echo ""

    # Codex CLI — skills (genéricas + específicas), rules, agents, scripts + docs/llm
    echo "🔹 Codex CLI (skills genéricas → skills Codex-específicas, rules, agents, scripts, docs/llm)"
    copy_tree "$DOTFILES_DIR/global/skills" "$CODEX_CONFIG_DIR/skills" "Codex skills" 0
    # Codex-specific skills (sobrescreve genéricas se conflito)
    if [ -d "$DOTFILES_DIR/global/codex/skills" ]; then
        copy_tree "$DOTFILES_DIR/global/codex/skills" "$CODEX_CONFIG_DIR/skills" "Codex skills (específicas)" 1
    fi
    copy_tree "$DOTFILES_DIR/global/rules" "$CODEX_CONFIG_DIR/rules" "Codex rules" 0
    copy_tree "$DOTFILES_DIR/global/agents" "$CODEX_CONFIG_DIR/agents" "Codex agents" 0
    copy_tree "$DOTFILES_DIR/global/scripts" "$CODEX_CONFIG_DIR/scripts" "Codex scripts" 0
    copy_tree "$DOTFILES_DIR/global/docs/llm" "$CODEX_CONFIG_DIR/docs/llm" "Codex docs/llm" 0
    echo ""

    echo "✅ Fase 1 concluída"
    echo ""
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# FASE 2: Aplicar overlays IDE-específicos (sobrescreve Fase 1 se conflito)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

if [[ "$INSTALL_WSL" == "1" ]]; then
    echo "📋 FASE 2: Aplicando customizações IDE-específicas (overlays)"
    echo ""

    # Claude — settings, harness scripts, templates
    echo "🔹 Claude — customizações IDE-específicas"
    copy_tree "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude overlay" 1
    if [ -d "$REPO_DIR/templates" ]; then
        mkdir -p "$CLAUDE_CONFIG_DIR/templates"
        cp -r "$REPO_DIR/templates"/* "$CLAUDE_CONFIG_DIR/templates/" 2>/dev/null || true
        echo "  ✅ templates/ copiados"
    fi
    echo ""

    # Cursor — agents customizados, hooks.json, scripts IDE-específicos
    echo "🔹 Cursor — customizações IDE-específicas"
    copy_tree "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor overlay" 1
    echo ""

    # Codex — skills específicas, rules, scripts IDE-específicos
    echo "🔹 Codex — customizações IDE-específicas"
    copy_tree "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex overlay" 1
    echo ""

    echo "✅ Fase 2 concluída"
    echo ""
fi

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# INSTALAÇÃO: ~/CLAUDE.md (home-level, sempre — único arquivo fora do dotfiles)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo "📋 Instalando ~/CLAUDE.md (home-level)"
if [ ! -f "$HOME_DIR/CLAUDE.md" ]; then
    cp "$DOTFILES_DIR/home/CLAUDE.md" "$HOME_DIR/CLAUDE.md"
    echo "  ✅ ~/CLAUDE.md instalado"
else
    echo "  ⏭️  ~/CLAUDE.md já existe — pulando"
fi
echo ""

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# RESUMO FINAL
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo "✨ Instalação concluída!"
echo ""
echo "📋 Resumo: 779+ artefatos corporativos distribuídos"
echo "  FASE 1: dotfiles/global/ → ~/.claude/ + ~/.cursor/ + ~/.codex/"
echo "  FASE 2: dotfiles/[ide]/* → ~/.*/  (overlays customizados)"
echo ""
echo "📦 Instalado em cada IDE:"
echo "  • ~/.claude/             — Claude Code: skills + rules + mcp + scripts"
echo "  • ~/.cursor/             — Cursor IDE: skills + rules + agents + hooks + scripts (+ customizações)"
echo "  • ~/.codex/              — Codex CLI: skills + rules + agents + scripts (+ customizações)"
echo "  • ~/CLAUDE.md            — Instrução imperativa (lido automaticamente)"
echo ""
echo "🔍 Validar instalação:"
echo "  bash $REPO_DIR/scripts/validate-install.sh"
echo ""
echo "📝 Próximos passos:"
echo "  1. Abrir uma nova sessão ou terminal"
echo "  2. Ir para um projeto: cd ~/Projetos/seu-projeto"
echo "  3. Aplicar harness: bash ~/.claude/scripts/harness-apply.sh"
echo ""
echo "📚 Documentação:"
echo "  • Versão: git log -1 --oneline install.sh"
echo "  • Atualizar: cd $REPO_DIR && git pull && bash install.sh"
