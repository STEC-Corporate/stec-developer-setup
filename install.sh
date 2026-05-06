#!/bin/bash
# Instalador Harness — Linux / macOS / WSL2 / Git Bash
# Copia configurações globais de harness para ~/.claude/, ~/.cursor/, ~/.codex/

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")..." && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"

echo "🚀 Instalando Harness"
echo "📍 Repositório: $REPO_DIR"
echo ""

# Source detecção de ambiente
source "$REPO_DIR/scripts/detect-env.sh"
print_detection

echo ""

# Função helper para copiar arquivos
copy_dotfiles() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local TOOL_NAME=$3

    echo "📦 Instalando para $TOOL_NAME..."

    if [ ! -d "$SOURCE_DIR" ]; then
        echo "  ⚠️  Fonte não encontrada: $SOURCE_DIR"
        return
    fi

    # Criar diretório destino se não existir
    mkdir -p "$DEST_DIR"

    # Copiar arquivos (sem sobrescrever)
    for file in "$SOURCE_DIR"/*; do
        if [ -f "$file" ]; then
            FILENAME=$(basename "$file")
            DEST_FILE="$DEST_DIR/$FILENAME"

            if [ -f "$DEST_FILE" ]; then
                echo "  ⏭️  $FILENAME já existe — pulando"
            else
                cp "$file" "$DEST_FILE"
                echo "  ✅ $FILENAME"
            fi
        fi
    done

    # Recursivamente copiar diretórios (ex: scripts/, agents/)
    for dir in "$SOURCE_DIR"/*; do
        if [ -d "$dir" ] && [ -L "$dir" -eq 0 ]; then
            DIRNAME=$(basename "$dir")
            DEST_SUBDIR="$DEST_DIR/$DIRNAME"

            if [ "$DIRNAME" != ".git" ]; then
                mkdir -p "$DEST_SUBDIR"

                for file in "$dir"/*; do
                    if [ -f "$file" ]; then
                        FILENAME=$(basename "$file")
                        DEST_FILE="$DEST_SUBDIR/$FILENAME"

                        if [ -f "$DEST_FILE" ]; then
                            echo "  ⏭️  $DIRNAME/$FILENAME já existe — pulando"
                        else
                            cp "$file" "$DEST_FILE"
                            echo "  ✅ $DIRNAME/$FILENAME"
                        fi
                    fi
                done

                # chmod +x em scripts .sh
                if [ "$DIRNAME" = "scripts" ]; then
                    for file in "$DEST_SUBDIR"/*.sh; do
                        [ -f "$file" ] && chmod +x "$file"
                    done
                fi
            fi
        fi
    done

    echo "  ✅ $TOOL_NAME OK"
    echo ""
}

# Detectar WSL2 e perguntar sobre ferramentas no Windows
if [ "$PLATFORM" = "wsl2" ] && [ -d "/mnt/c/Users" ]; then
    echo "🖥️  Detectado WSL2 com Windows disponível em /mnt/c"
    echo ""
    echo "Onde estão suas ferramentas? (Claude, Cursor, Codex)"
    echo "1) Linux (WSL2 — padrão)"
    echo "2) Windows (via /mnt/c/Users/...)"
    echo "3) Ambos (instalar nos dois)"
    echo ""
    read -p "Escolha [1-3]: " INSTALL_TARGET

    case "$INSTALL_TARGET" in
        2)
            INSTALL_WSL=0
            INSTALL_WIN=1
            ;;
        3)
            INSTALL_WSL=1
            INSTALL_WIN=1
            ;;
        *)
            INSTALL_WSL=1
            INSTALL_WIN=0
            ;;
    esac
else
    INSTALL_WSL=1
    INSTALL_WIN=0
fi

# Instalar Claude Code
if [ $INSTALL_WSL -eq 1 ]; then
    copy_dotfiles "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Code (WSL/Linux)"
fi

# Instalar Cursor
if [ $INSTALL_WSL -eq 1 ]; then
    copy_dotfiles "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor (WSL/Linux)"
fi

# Instalar Codex
if [ $INSTALL_WSL -eq 1 ]; then
    copy_dotfiles "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex (WSL/Linux)"
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
echo "📋 Resumo:"
echo "  • ~/CLAUDE.md — Instrução imperativa (lido automaticamente)"
echo "  • ~/.claude/ — Claude Code harness"
echo "  • ~/.cursor/ — Cursor harness"
echo "  • ~/.codex/ — Codex CLI harness"
echo ""
echo "📝 Próximos passos:"
echo "  1. Abrir uma nova sessão ou terminal"
echo "  2. Ir para um projeto com `.git`: cd ~/Projetos/seu-projeto"
echo "  3. Claude/Cursor/Codex deve aplicar harness automaticamente"
echo "  4. Executar: bash scripts/init.sh"
echo ""
echo "📚 Referência:"
echo "  • Harness: @~/.claude/HARNESS.md (ou ~/.cursor/HARNESS.md)"
echo "  • Atualizar: git pull && bash install.sh"
