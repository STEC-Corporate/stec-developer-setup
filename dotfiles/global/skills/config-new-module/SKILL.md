---
name: config-new-module
description: Criar um novo modulo fullstack (package compartilhado + endpoints backend + rota/tela frontend) com geracao por script idempotente. Use quando o pedido envolver \"novo modulo\", \"criar feature\", \"scaffold modulo\", ou quando for necessario padronizar criacao de pacote+backend+frontend
---

# config-new-module

## Quando usar
- Criar um novo módulo/feature com footprint padrão no monorepo.
- Criar package compartilhado e integrar em backend/web.

## Passos
1. Rodar `scripts/create-module.mjs --name <modulo> --scope <scope> [--dry-run]` no projeto pai.
2. Revisar arquivos criados e adaptar ao domínio (entidades, use cases, controllers, forms).
3. Registrar o módulo em menus/rotas conforme padrão do projeto pai.

## Scripts
- `scripts/create-module.mjs`

## References
- `references/pattern.md`
- `references/examples.md`

