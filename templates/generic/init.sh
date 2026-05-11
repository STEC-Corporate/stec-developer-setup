#!/bin/bash
# Bootstrap script genérico para projetos

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto em $PROJECT_DIR"
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
