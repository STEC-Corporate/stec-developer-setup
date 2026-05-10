#!/bin/bash
# Harness Apply para Codex CLI
# Cria estrutura específica de Codex em projetos

set -e

PROJECT_DIR="${1:-.}"

if [ ! -d "$PROJECT_DIR" ] || [ ! -d "$PROJECT_DIR/.git" ]; then
    echo "❌ Erro: $PROJECT_DIR não é um repositório Git válido"
    exit 1
fi

cd "$PROJECT_DIR"

echo "🎯 Aplicando harness Codex em $PROJECT_DIR"

# Criar .codex/ no projeto se não existir
mkdir -p .codex

# Rules locais
if [ ! -f ".codex/rules" ]; then
    cat > ".codex/rules" << 'RULES_EOF'
# Codex Project Rules

- Sempre validar mudanças antes de commitar (testes/lint).
- Atualizar progress.md ao concluir tarefas significativas.
- Fazer git push após commits para não deixar trabalho local.
- Não incluir artefatos gerados (caches, builds) em commits.
RULES_EOF
    echo "✅ .codex/rules criado"
else
    echo "⏭️  .codex/rules já existe — pulando"
fi

echo ""
echo "✨ Harness Codex aplicado em $PROJECT_DIR"
