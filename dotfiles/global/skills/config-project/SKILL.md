---
name: config-project
description: Inicializar ou reconciliar estrutura base de monorepo (apps/backend + apps/web + packages/*) com scripts idempotentes e modo dry-run. Use quando criar um novo projeto da holding STEC ou padronizar um repositorio existente para o template fullstack
---

# config-project

## Quando usar
- Bootstrap de um repositório fullstack (turbo/monorepo).
- Padronizar estrutura e scripts mínimos no projeto pai.

## Passos
1. Rodar `scripts/project-init.mjs` no root do projeto pai.
2. Revisar estrutura criada (apps/, packages/, turbo scripts).
3. Ajustar nomes (scope, nomes de apps) conforme o projeto pai.

## Scripts
- `scripts/project-init.mjs` (modo `--dry-run`)

## References
- `references/pattern.md`
- `references/examples.md`

