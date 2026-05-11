#!/bin/bash
# Bootstrap script para projeto Python

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto Python em $PROJECT_DIR"
echo ""

# Source helper para setup .env.local
HELPER_SCRIPT="scripts/init-env-helper.sh"
if [ ! -f "$HELPER_SCRIPT" ]; then
    HELPER_SCRIPT="$HOME/.claude/scripts/init-env-helper.sh"
fi
if [ -f "$HELPER_SCRIPT" ]; then
    source "$HELPER_SCRIPT"
    setup_env_local
else
    echo "⚠️  Helper script não encontrado (init-env-helper.sh)"
fi

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
