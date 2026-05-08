#!/bin/bash
# Hook: portável para rodar typecheck em projetos Node.js/TypeScript
# Sobe a árvore procurando por package.json e executa npm run typecheck lá
# exit 2 com asyncRewake=true acorda o modelo se typecheck falhar

input=$(cat)
file=$(echo "$input" | jq -r '.tool_input.file_path // empty')

if echo "$file" | grep -qE '\.(ts|tsx)$'; then
  dir=$(dirname "$file")
  while [ "$dir" != "/" ]; do
    if [ -f "$dir/package.json" ]; then
      # Procura por script typecheck neste diretório
      if cd "$dir" && npm run typecheck >/dev/null 2>&1; then
        # Tem typecheck aqui, roda normalmente
        cd "$dir" && npm run typecheck 2>&1 | tail -5 || exit 2
        exit 0
      else
        # Se falhar, sobe para diretório pai (pode ser workspace root)
        dir=$(dirname "$dir")
        continue
      fi
    fi
    dir=$(dirname "$dir")
  done
fi
