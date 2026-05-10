#!/bin/bash
# Harness Apply Universal - Detecta stack e cria estrutura completa do harness
# Aplica harness para Claude Code + Cursor IDE + Codex CLI em um único comando

set -e

PROJECT_DIR="${1:-.}"

# Detectar templates com fallback: primeiro tenta path relativo, depois ~/.claude/templates/
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
echo "📂 Templates de: $TEMPLATE_DIR"

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "❌ Templates para '$STACK' não encontrados"
    exit 1
fi

echo ""
echo "📝 Criando estrutura do harness universal..."

# === Estrutura básica do projeto ===
mkdir_if_missing "scripts"
mkdir_if_missing "docs"

copy_file_if_missing "$TEMPLATE_DIR/CLAUDE.md" "CLAUDE.md" "CLAUDE.md"
copy_file_if_missing "$TEMPLATE_DIR/progress.md" "progress.md" "progress.md"
copy_file_if_missing "$TEMPLATE_DIR/init.sh" "scripts/init.sh" "scripts/init.sh"

if [ ! -f "docs/arquitetura.md" ]; then
    cat > "docs/arquitetura.md" << 'EOF'
# Arquitetura — [Projeto]

## Visão Geral
[Descrever a arquitetura do projeto em alto nível]

## Componentes Principais
### [Componente 1]
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
EOF
    echo "✅ docs/arquitetura.md criado"
else
    echo "⏭️  docs/arquitetura.md já existe — pulando"
fi

chmod +x "scripts/init.sh"

# === CLAUDE CODE: .claude/settings.json ===
echo ""
echo "🎯 Aplicando harness Claude Code..."
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
            echo "✅ .claude/settings.json (typecheck hook)"
            ;;
        python|java|generic)
            cat > "$CLAUDE_SETTINGS" << 'SETTINGS_EOF'
{
}
SETTINGS_EOF
            echo "✅ .claude/settings.json (placeholder)"
            ;;
    esac
else
    echo "⏭️  .claude/settings.json já existe — pulando"
fi

# === CURSOR IDE: .cursor/hooks.json + rules ===
echo ""
echo "🎯 Aplicando harness Cursor IDE..."
mkdir -p ".cursor/rules"

if [ ! -f ".cursor/hooks.json" ]; then
    cat > ".cursor/hooks.json" << 'HOOKS_EOF'
{
  "version": 1,
  "hooks": {
    "beforeShellExecution": [
      {
        "command": "bash ~/.cursor/scripts/guard-shell.sh",
        "timeout": 5000
      }
    ],
    "afterFileEdit": [
      {
        "command": "bash ~/.cursor/scripts/progress-update.sh",
        "async": true
      }
    ]
  }
}
HOOKS_EOF
    echo "✅ .cursor/hooks.json criado"
else
    echo "⏭️  .cursor/hooks.json já existe — pulando"
fi

if [ ! -f ".cursor/rules/task-completion-remote.mdc" ]; then
    cat > ".cursor/rules/task-completion-remote.mdc" << 'RULE_EOF'
---
description: Exige commit e push ao finalizar tarefas com alterações
alwaysApply: true
---

# Entrega de Tarefas

Ao finalizar qualquer tarefa que altere arquivos neste projeto:

- Execute validações proporcionais à mudança (testes, lint, type-check).
- Faça commit apenas dos arquivos relevantes da tarefa.
- Envie o commit para o repositório remoto com `git push`.
- Não deixe trabalho concluído apenas no estado local.
- Não inclua artefatos gerados ou caches.

Se não for possível validar, commitar ou enviar ao remoto, registre claramente o motivo no encerramento da tarefa.
RULE_EOF
    echo "✅ .cursor/rules/task-completion-remote.mdc criado"
else
    echo "⏭️  .cursor/rules/task-completion-remote.mdc já existe — pulando"
fi

# === CODEX CLI: .codex/rules ===
echo ""
echo "🎯 Aplicando harness Codex CLI..."
mkdir -p ".codex"

if [ ! -f ".codex/rules" ]; then
    cat > ".codex/rules" << 'CODEX_RULES_EOF'
# Codex Project Rules

- Sempre validar mudanças antes de commitar (testes/lint).
- Atualizar progress.md ao concluir tarefas significativas.
- Fazer git push após commits para não deixar trabalho local.
- Não incluir artefatos gerados (caches, builds) em commits.
CODEX_RULES_EOF
    echo "✅ .codex/rules criado"
else
    echo "⏭️  .codex/rules já existe — pulando"
fi

# === Commit inicial ===
echo ""
echo "📦 Commitando mudanças do harness..."

CREATED_FILES=""
for f in CLAUDE.md progress.md scripts/init.sh docs/arquitetura.md \
         .claude/settings.json .cursor/hooks.json \
         .cursor/rules/task-completion-remote.mdc .codex/rules; do
    [ -f "$f" ] && git status --short 2>/dev/null | grep -q "$f" && CREATED_FILES="$CREATED_FILES $f"
done

if [ -n "$CREATED_FILES" ]; then
    git add $CREATED_FILES
    git commit -m "chore: apply harness universal (Claude+Cursor+Codex) for $STACK" || true
    echo "✅ Mudanças commitadas"
else
    echo "ℹ️  Nenhum arquivo novo para commitar"
fi

echo ""
echo "✨ Harness UNIVERSAL aplicado com sucesso!"
echo ""
echo "📋 Estrutura criada:"
echo "  • CLAUDE.md, progress.md, scripts/init.sh, docs/arquitetura.md"
echo "  • .claude/settings.json (Claude Code)"
echo "  • .cursor/hooks.json + .cursor/rules/ (Cursor IDE)"
echo "  • .codex/rules (Codex CLI)"
echo ""
echo "📝 Próximos passos:"
echo "  1. bash scripts/init.sh    # Inicializar ambiente"
echo "  2. Editar CLAUDE.md com contexto específico"
echo "  3. Editar progress.md com status inicial"
