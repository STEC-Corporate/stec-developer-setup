#!/bin/bash
# Bootstrap script para projeto Java

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

echo "🚀 Inicializando projeto Java em $PROJECT_DIR"

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
