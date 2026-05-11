#!/bin/bash
# Bootstrap script para projeto Node.js / TypeScript

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto Node.js em $PROJECT_DIR"

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
.nyc_output/

# Logs
logs/
*.log
EOF
        echo "✅ .gitignore criado"
    fi
}

setup_env_local
echo ""

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não encontrado. Por favor, instale Node.js 18+ primeiro."
    exit 1
fi

echo "✅ Node.js instalado: $(node --version)"
echo "✅ npm instalado: $(npm --version)"

# Detectar gerenciador de pacotes
if [ -f "package-lock.json" ]; then
    PACKAGE_MANAGER="npm"
elif [ -f "yarn.lock" ]; then
    PACKAGE_MANAGER="yarn"
elif [ -f "pnpm-lock.yaml" ]; then
    PACKAGE_MANAGER="pnpm"
else
    PACKAGE_MANAGER="npm"
fi

echo "📦 Usando: $PACKAGE_MANAGER"

# Instalar dependências
if [ "$PACKAGE_MANAGER" = "npm" ]; then
    npm install
elif [ "$PACKAGE_MANAGER" = "yarn" ]; then
    yarn install
elif [ "$PACKAGE_MANAGER" = "pnpm" ]; then
    pnpm install
fi

# Gerar tipos se houver Prisma
if [ -f "prisma/schema.prisma" ]; then
    echo "📊 Gerando tipos Prisma..."
    npm run prisma:generate || $PACKAGE_MANAGER run prisma:generate || true
fi

# Testar scripts principais
echo ""
echo "🔍 Verificando scripts..."

if npm run 2>&1 | grep -q "build"; then
    echo "✅ Script 'build' encontrado"
fi

if npm run 2>&1 | grep -q "test"; then
    echo "✅ Script 'test' encontrado"
fi

if npm run 2>&1 | grep -q "lint"; then
    echo "✅ Script 'lint' encontrado"
fi

if npm run 2>&1 | grep -q "typecheck"; then
    echo "✅ Script 'typecheck' encontrado"
fi

echo ""
echo "✨ Ambiente Node.js configurado!"
echo ""
echo "Próximos passos:"
echo "  1. Editar progress.md com o status do projeto"
echo "  2. Editar CLAUDE.md com contexto específico"
echo "  3. Executar: npm test"
echo "  4. Registrar ideia no TaskLink"
