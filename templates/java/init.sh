#!/bin/bash
# Bootstrap script para projeto Java

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto Java em $PROJECT_DIR"

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

# Build & Deps
target/
.gradle/
build/
*.jar
*.war

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

# Detectar JDK
if ! command -v java &> /dev/null; then
    echo "❌ Java não encontrado. Por favor, instale JDK 17+ primeiro."
    exit 1
fi

JAVA_VERSION=$(java -version 2>&1 | grep -o 'version "[^"]*"' | cut -d'"' -f2 | cut -d'.' -f1)
echo "✅ Java instalado: Java $JAVA_VERSION ($(java -version 2>&1 | head -1))"

# Detectar build system
if [ -f "pom.xml" ]; then
    echo "📦 Detectado: Maven"

    if ! command -v mvn &> /dev/null; then
        echo "❌ Maven não encontrado. Por favor, instale Maven primeiro."
        exit 1
    fi

    echo "🔨 Compilando com Maven..."
    mvn clean install

    echo "✅ Build Maven OK"

elif [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
    echo "📦 Detectado: Gradle"

    if ! command -v gradle &> /dev/null && [ ! -f "gradlew" ]; then
        echo "❌ Gradle não encontrado. Por favor, instale Gradle primeiro."
        exit 1
    fi

    BUILD_CMD="./gradlew"
    if ! command -v gradle &> /dev/null; then
        BUILD_CMD="gradle"
    fi

    echo "🔨 Compilando com Gradle..."
    $BUILD_CMD build

    echo "✅ Build Gradle OK"

else
    echo "⚠️  Nenhum pom.xml ou build.gradle encontrado"
fi

echo ""
echo "✨ Ambiente Java configurado!"
echo ""
echo "Próximos passos:"
echo "  1. Editar progress.md com o status do projeto"
echo "  2. Editar CLAUDE.md com contexto específico"
echo "  3. Executar testes: mvn test (ou gradle test)"
echo "  4. Registrar ideia no TaskLink"
