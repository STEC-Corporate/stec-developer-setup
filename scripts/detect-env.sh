#!/bin/bash
# Detecção de plataforma e resolução de paths para harness

detect_platform() {
    if [[ -n "$WSL_DISTRO_NAME" ]] || [[ -n "$WSLENV" ]]; then
        echo "wsl2"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        echo "git-bash"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu" ]]; then
        echo "linux"
    else
        echo "unknown"
    fi
}

resolve_paths() {
    local PLATFORM=$1

    case "$PLATFORM" in
        linux|macos|git-bash)
            export PLATFORM
            export HOME_DIR="$HOME"
            export CLAUDE_CONFIG_DIR="$HOME/.claude"
            export CURSOR_CONFIG_DIR="$HOME/.cursor"
            export CODEX_CONFIG_DIR="$HOME/.codex"
            export WIN_USER=""
            ;;

        wsl2)
            export PLATFORM="wsl2"
            export HOME_DIR="$HOME"
            export CLAUDE_CONFIG_DIR="$HOME/.claude"
            export CURSOR_CONFIG_DIR="$HOME/.cursor"
            export CODEX_CONFIG_DIR="$HOME/.codex"

            # Detectar se ferramentas estão no Windows
            if [[ -d "/mnt/c/Users" ]]; then
                # Tenta determinar o usuário Windows
                WIN_USER=$(ls /mnt/c/Users | grep -v "^Public$" | head -1)
                export WIN_USER
                export CLAUDE_WIN="$APPDATA/Claude"
                export CURSOR_WIN="/mnt/c/Users/$WIN_USER/.cursor"
            fi
            ;;

        unknown)
            export PLATFORM="unknown"
            export HOME_DIR="$HOME"
            export CLAUDE_CONFIG_DIR="$HOME/.claude"
            export CURSOR_CONFIG_DIR="$HOME/.cursor"
            export CODEX_CONFIG_DIR="$HOME/.codex"
            export WIN_USER=""
            ;;
    esac
}

print_detection() {
    echo "🔍 Detecção de ambiente:"
    echo "   Plataforma: $PLATFORM"
    echo "   HOME: $HOME_DIR"
    echo "   CLAUDE: $CLAUDE_CONFIG_DIR"
    echo "   CURSOR: $CURSOR_CONFIG_DIR"
    echo "   CODEX: $CODEX_CONFIG_DIR"

    if [[ -n "$WIN_USER" ]]; then
        echo "   Windows User: $WIN_USER"
        if [[ -n "$CLAUDE_WIN" ]]; then
            echo "   CLAUDE (Windows): $CLAUDE_WIN"
        fi
        if [[ -n "$CURSOR_WIN" ]]; then
            echo "   CURSOR (Windows): $CURSOR_WIN"
        fi
    fi
}

# Main execution
DETECTED_PLATFORM=$(detect_platform)
resolve_paths "$DETECTED_PLATFORM"
