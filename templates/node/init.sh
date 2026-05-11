#!/bin/bash
# Bootstrap script para projeto Node.js / TypeScript

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto Node.js em $PROJECT_DIR"
echo ""

# Source helper para setup .env.local
HELPER_SCRIPT="../../scripts/init-env-helper.sh"
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
