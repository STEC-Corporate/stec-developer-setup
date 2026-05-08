#!/bin/bash
# Harness Apply - Detecta stack e cria estrutura do harness em projetos

set -e

PROJECT_DIR="${1:-.}"

# Detectar templates com fallback: primeiro tenta path relativo (dentro do repo), depois ~/.claude/templates/
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -d "$SCRIPT_DIR/../../../templates" ]; then
    TEMPLATES_DIR="$(cd "$SCRIPT_DIR/../../../templates" && pwd)"
elif [ -d "$HOME/.claude/templates" ]; then
    TEMPLATES_DIR="$HOME/.claude/templates"
else
    echo "❌ Erro: templates não encontrados"
    echo "Execute: cd ~/Projetos/stec-developer-setup && bash install.sh"
    exit 1
fi

if [ ! -d "$PROJECT_DIR" ] || [ ! -d "$PROJECT_DIR/.git" ]; then
    echo "❌ Erro: $PROJECT_DIR não é um repositório Git válido"
    exit 1
fi

cd "$PROJECT_DIR"

# Detectar stack do projeto
detect_stack() {
    if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ] || [ -f "requirements-dev.txt" ]; then
        echo "python"
    elif [ -f "package.json" ]; then
        echo "node"
    elif [ -f "pom.xml" ] || [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
        echo "java"
    else
        echo "generic"
    fi
}

copy_file_if_missing() {
    local SOURCE=$1
    local DEST=$2
    local DESC=$3

    if [ -f "$DEST" ]; then
        echo "⏭️  $DESC já existe — pulando"
    else
        cp "$SOURCE" "$DEST"
        echo "✅ $DESC criado"
    fi
}

mkdir_if_missing() {
    local DIR=$1
    if [ ! -d "$DIR" ]; then
        mkdir -p "$DIR"
        echo "✅ Diretório $DIR criado"
    fi
}

# Detectar stack
STACK=$(detect_stack)
TEMPLATE_DIR="$TEMPLATES_DIR/$STACK"

echo "🔍 Detectado stack: $STACK"
echo "📂 Usando templates de: $TEMPLATE_DIR"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "❌ Templates para '$STACK' não encontrados"
    exit 1
fi

echo ""
echo "📝 Criando estrutura do harness..."

# Criar diretórios
mkdir_if_missing "scripts"
mkdir_if_missing "docs"

# Copiar arquivos do template
copy_file_if_missing "$TEMPLATE_DIR/CLAUDE.md" "CLAUDE.md" "CLAUDE.md"
copy_file_if_missing "$TEMPLATE_DIR/progress.md" "progress.md" "progress.md"
copy_file_if_missing "$TEMPLATE_DIR/init.sh" "scripts/init.sh" "scripts/init.sh"

# Criar placeholder de arquitetura
if [ ! -f "docs/arquitetura.md" ]; then
    cat > "docs/arquitetura.md" << 'EOF'
# Arquitetura — [Projeto]

## Visão Geral

[Descrever a arquitetura do projeto em alto nível]

## Componentes Principais

### [Componente 1]
[Descrição, responsabilidades, interfaces]

### [Componente 2]
[Descrição, responsabilidades, interfaces]

## Fluxos Principais

### [Fluxo 1]
[Sequência de eventos, decisões]

## Decisões Técnicas (ADRs)

### ADR-001: [Decisão]
**Context:** [Por que essa decisão foi necessária?]
**Decision:** [O que foi decidido?]
**Consequences:** [Quais são as implicações?]

## Dependências

- [Dependência externa 1]
- [Dependência externa 2]

## Mudanças Futuras

[Identificar áreas que podem evoluir ou precisam de refatoração]
EOF
    echo "✅ docs/arquitetura.md criado"
else
    echo "⏭️  docs/arquitetura.md já existe — pulando"
fi

# Fazer chmod +x no init.sh
chmod +x "scripts/init.sh"
echo "✅ scripts/init.sh agora é executável"

# Criar .claude/settings.json com hooks por stack
mkdir -p ".claude"
CLAUDE_SETTINGS=".claude/settings.json"

if [ ! -f "$CLAUDE_SETTINGS" ]; then
    case "$STACK" in
        node)
            cat > "$CLAUDE_SETTINGS" << 'SETTINGS_EOF'
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/scripts/typecheck-hook.sh",
            "asyncRewake": true,
            "statusMessage": "TypeScript verificando...",
            "timeout": 60
          }
        ]
      }
    ]
  }
}
SETTINGS_EOF
            echo "✅ .claude/settings.json criado (typecheck hook)"
            ;;
        python|java|generic)
            cat > "$CLAUDE_SETTINGS" << 'SETTINGS_EOF'
{
}
SETTINGS_EOF
            echo "✅ .claude/settings.json criado (placeholder extensível)"
            ;;
    esac
else
    echo "⏭️  .claude/settings.json já existe — pulando"
fi

# Fazer git add + commit dos arquivos criados
echo ""
echo "📦 Commitando mudanças..."

CREATED_FILES=""
[ -f "CLAUDE.md" ] && git status --short | grep -q "CLAUDE.md" && CREATED_FILES="$CREATED_FILES CLAUDE.md"
[ -f "progress.md" ] && git status --short | grep -q "progress.md" && CREATED_FILES="$CREATED_FILES progress.md"
[ -f "scripts/init.sh" ] && git status --short | grep -q "scripts/init.sh" && CREATED_FILES="$CREATED_FILES scripts/init.sh"
[ -f "docs/arquitetura.md" ] && git status --short | grep -q "docs/arquitetura.md" && CREATED_FILES="$CREATED_FILES docs/arquitetura.md"

if [ -n "$CREATED_FILES" ]; then
    git add $CREATED_FILES
    git commit -m "chore: apply harness structure ($STACK)" || true
    echo "✅ Mudanças commitadas"
else
    echo "ℹ️  Nenhum arquivo novo para commitar"
fi

echo ""
echo "✨ Harness aplicado com sucesso!"
echo ""
echo "📋 Próximos passos:"
echo "  1. bash scripts/init.sh    # Inicializar ambiente"
echo "  2. Editar CLAUDE.md com contexto específico"
echo "  3. Editar progress.md com status inicial"
echo "  4. Registrar ideia no TaskLink: tasklink idea create --title '...' ..."
