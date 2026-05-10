#!/bin/bash
# Harness Apply para Cursor IDE
# Cria estrutura específica de Cursor (.cursor/hooks.json, rules) em projetos

set -e

PROJECT_DIR="${1:-.}"

if [ ! -d "$PROJECT_DIR" ] || [ ! -d "$PROJECT_DIR/.git" ]; then
    echo "❌ Erro: $PROJECT_DIR não é um repositório Git válido"
    exit 1
fi

cd "$PROJECT_DIR"

echo "🎯 Aplicando harness Cursor em $PROJECT_DIR"

# Criar .cursor/ se não existir
mkdir -p .cursor/rules

# 1. .cursor/hooks.json (hooks específicos do projeto)
if [ ! -f ".cursor/hooks.json" ]; then
    cat > ".cursor/hooks.json" << 'HOOKS_EOF'
{
  "version": 1,
  "hooks": {
    "beforeShellExecution": [
      {
        "command": "bash ~/.cursor/scripts/guard-shell.sh",
        "timeout": 5000,
        "description": "Guard-shell global"
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

# 2. Regra de entrega remota
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

echo ""
echo "✨ Harness Cursor aplicado com sucesso em $PROJECT_DIR"
