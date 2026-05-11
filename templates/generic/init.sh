#!/bin/bash
# Bootstrap script genérico para projetos

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto em $PROJECT_DIR"

# ============================================================================
# Setup .env.local (por developer)
# ============================================================================

setup_env_local() {
    # Detectar ambiente se script existir
    DETECT_SCRIPT="../../scripts/detect-env.sh"
    if [ -f "$DETECT_SCRIPT" ]; then
        source "$DETECT_SCRIPT"
        DETECTED_PLATFORM=$(detect_platform)
        resolve_paths "$DETECTED_PLATFORM"
    else
        # Fallback simples
        PLATFORM="unknown"
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
        cp ../../.env.example .env.example 2>/dev/null || cat > .env.example << 'EOF'
PLATFORM=auto
PROJECT_ROOT=.
USER_NAME=unknown
CLAUDE_CONFIG_DIR=
CURSOR_CONFIG_DIR=
CODEX_CONFIG_DIR=
WIN_USER=
EOF
        echo "✅ .env.example criado"
    fi

    # Criar .gitignore se não existir
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

# Build
dist/
build/
out/
target/

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

# Logs
logs/
*.log
EOF
        echo "✅ .gitignore criado"
    fi
}

setup_env_local
echo ""

# Criar diretórios básicos se não existirem
mkdir -p src docs tests scripts

echo "📁 Estrutura de diretórios verificada"

# Criar .env.example se não existir
if [ ! -f ".env.example" ]; then
    cat > .env.example << 'EOF'
# Variáveis de ambiente
# Copiar para .env e preencher com valores reais

APP_NAME=MyProject
DEBUG=false
EOF
    echo "✅ .env.example criado"
fi

# Criar .gitignore se não existir
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

# Build
dist/
build/
out/
target/

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

# Logs
logs/
*.log
EOF
    echo "✅ .gitignore criado"
fi

echo ""
echo "✨ Ambiente inicializado!"
echo ""
echo "Próximos passos:"
echo "  1. Editar progress.md com o status do projeto"
echo "  2. Editar CLAUDE.md com contexto específico"
echo "  3. Criar .env a partir de .env.example se necessário"
echo "  4. Registrar ideia no TaskLink"
