#!/bin/bash
# Bootstrap script para projeto Python

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto Python em $PROJECT_DIR"

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

# Logs
logs/
*.log
EOF
        echo "✅ .gitignore criado"
    fi
}

setup_env_local
echo ""

# Detectar gerenciador de pacotes
if [ -f "pyproject.toml" ] && grep -q "tool.poetry" pyproject.toml; then
    echo "📦 Detectado: Poetry"

    if ! command -v poetry &> /dev/null; then
        echo "❌ Poetry não encontrado. Instalando..."
        curl -sSL https://install.python-poetry.org | python3 -
        export PATH="$HOME/.local/bin:$PATH"
    fi

    poetry install

    echo "✅ Poetry OK"
    poetry --version

elif [ -f "requirements.txt" ] || [ -f "requirements-dev.txt" ]; then
    echo "📦 Detectado: pip + venv"

    # Criar venv se não existir
    if [ ! -d "venv" ]; then
        python3 -m venv venv
    fi

    source venv/bin/activate
    pip install --upgrade pip setuptools wheel

    if [ -f "requirements-dev.txt" ]; then
        pip install -r requirements-dev.txt
    fi

    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    fi

    echo "✅ Venv OK"
    python3 --version

else
    # Criar venv padrão
    echo "📦 Criando venv padrão"
    python3 -m venv venv
    source venv/bin/activate
    pip install --upgrade pip

    echo "✅ Venv criado em ./venv"
fi

# Instalar em modo editable (desenvolvimento)
if [ -f "pyproject.toml" ]; then
    echo "📚 Instalando projeto em modo development..."
    pip install -e ".[dev]" 2>/dev/null || pip install -e . 2>/dev/null || true
fi

# Verificar principais ferramentas
echo ""
echo "🔍 Verificando ferramentas..."

if command -v pytest &> /dev/null; then
    echo "✅ pytest instalado"
fi

if command -v mypy &> /dev/null; then
    echo "✅ mypy instalado"
fi

if command -v ruff &> /dev/null; then
    echo "✅ ruff instalado"
fi

echo ""
echo "✨ Ambiente Python configurado!"
echo ""
echo "Próximos passos:"
echo "  1. Editar progress.md com o status do projeto"
echo "  2. Editar CLAUDE.md com contexto específico"
echo "  3. Executar: pytest tests/ -v"
echo "  4. Registrar ideia no TaskLink"
