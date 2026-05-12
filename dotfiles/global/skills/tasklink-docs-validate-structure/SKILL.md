---
name: tasklink-docs-validate-structure
description: >-
  Valida docs/gestao-* após scaffold: manifest neutral_pack_only, forbidden_globs sem matches,
  ausência de fe-*.md de produto em sítios proibidos. Use após tasklink-docs-scaffold-from-template.
---

# Validar estrutura pós-scaffold

## Pré-requisitos

- `gestao-docs.manifest.json` presente e validado (`tasklink-docs-manifest-schema`).
- Pacote aplicado apenas a partir de `.cursor/docs/_stec-process-bootstrap/neutral-pack/docs/`.

## Passos

1. Confirmar existência de `docs/gestao-tarefas/README.md` e `docs/gestao-ideias/README.md`.
2. Para cada glob em `forbidden_globs`, procurar arquivos correspondentes (ex.: `rg --files -g 'GLOB'` ou equivalente). Qualquer match → **falha** com lista de paths.
3. Heurística extra: sob `docs/gestao-tarefas/03-especificacao-produto/`, não deve haver `fe-*.md` nem `ui-canonical/**/*.md` com conteúdo além de stub, salvo política explícita do manifest.

## Saída

- `pass` + resumo, ou `fail` + lista de violações.

## Relação com P0

Validação **pós** cópia; P0 (`tasklink-docs-verify-submodule-cursor`) é **pré** cópia.
