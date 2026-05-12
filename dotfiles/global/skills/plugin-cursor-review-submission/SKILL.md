---
name: plugin-cursor-review-submission
description: Executa checklist de submissao para plugin Cursor com relatorio pass/fail por secao.
---

# Skill: plugin-cursor-review-submission

## Quando usar

- Antes de abrir PR para `cursor/plugins`.
- Como gate final apos scaffold e auditoria de seguranca.

## O que valida

1. Manifest (`.cursor-plugin/plugin.json`).
2. Descoberta de componentes (`skills`, `rules`, `agents`, `commands`, `hooks`, `mcp`).
3. Frontmatter minimo em artefatos relevantes.
4. Integracao com marketplace (`.cursor-plugin/marketplace.json`) quando aplicavel.
5. Documentacao minima de submissao.

## Saida

- Relatorio em JSON com:
  - status por secao
  - erros e warnings
  - recomendacao final de submissao

## Script de apoio

- `scripts/review_submission.py`
