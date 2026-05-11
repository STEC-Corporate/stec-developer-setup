#!/bin/bash
# Helper para setup .env.local — sourced pelos templates

# Procura detect-env.sh em múltiplos paths
find_detect_env() {
    local paths=(
        "../../scripts/detect-env.sh"           # Caso normal: init.sh em scripts/
        "scripts/detect-env.sh"                  # init.sh na raiz
        "$HOME/.claude/scripts/detect-env.sh"   # Global harness
    )

    for path in "${paths[@]}"; do
        if [ -f "$path" ]; then
            echo "$path"
            return 0
        fi
    done

    return 1
}

# Setup .env.local com detecção automática de plataforma
setup_env_local() {
    # Encontrar detect-env.sh
    local detect_script=$(find_detect_env)

    if [ -f "$detect_script" ]; then
        source "$detect_script"
        DETECTED_PLATFORM=$(detect_platform)
        resolve_paths "$DETECTED_PLATFORM"
    else
        # Fallback simples
        DETECTED_PLATFORM="unknown"
        CLAUDE_CONFIG_DIR="$HOME/.claude"
        CURSOR_CONFIG_DIR="$HOME/.cursor"
        CODEX_CONFIG_DIR="$HOME/.codex"
        WIN_USER=""
    fi

    # Gerar .env.local se não existir
    if [ ! -f ".env.local" ]; then
        cat > .env.local << EOF
# Auto-gerado em $(date '+%Y-%m-%d %H:%M:%S')
# Customizar conforme necessário

PLATFORM=$DETECTED_PLATFORM
PROJECT_ROOT=$PROJECT_DIR
USER_NAME=$(whoami)
CLAUDE_CONFIG_DIR=$CLAUDE_CONFIG_DIR
CURSOR_CONFIG_DIR=$CURSOR_CONFIG_DIR
CODEX_CONFIG_DIR=$CODEX_CONFIG_DIR
$([ -n "$WIN_USER" ] && echo "WIN_USER=$WIN_USER")

# Customizações (descomentar conforme necessário)
# DEBUG=false
# LOG_LEVEL=info
EOF
        echo "✅ .env.local criado"
    else
        echo "ℹ️  .env.local já existe"
    fi

    # Criar .env.example se não existir
    if [ ! -f ".env.example" ]; then
        cat > .env.example << 'EOF'
# Ambiente — Configuração por Developer
# Copiar para .env.local (gerado automaticamente em scripts/init.sh)
# Não commitar — cada dev tem seu .env.local

# Detecção automática (gerada em init.sh)
PLATFORM=auto
PROJECT_ROOT=.
USER_NAME=unknown

# Paths de Configuração (gerados em init.sh se WSL2/Windows)
CLAUDE_CONFIG_DIR=
CURSOR_CONFIG_DIR=
CODEX_CONFIG_DIR=
WIN_USER=

# Customizações por Developer
# DEBUG=false
# LOG_LEVEL=info
EOF
        echo "✅ .env.example criado"
    fi

    # Criar .gitignore se não existir (com entradas padrão)
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << 'EOF'
# Ambiente
.env
.env.local
.env.*.local

# Dependências
node_modules/
venv/
.venv/
env/
__pycache__/
*.pyc

# Build
dist/
build/
out/
target/
*.egg-info/

# IDEs
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Testes
coverage/
.coverage
htmlcov/
.pytest_cache/
.nyc_output/

# Logs
logs/
*.log

# OS
.DS_Store
Thumbs.db
EOF
        echo "✅ .gitignore criado"
    fi
}
