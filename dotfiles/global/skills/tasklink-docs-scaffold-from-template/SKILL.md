---
name: tasklink-docs-scaffold-from-template
description: >-
  Aplica o pacote neutro STEC (.cursor/docs/_stec-process-bootstrap/neutral-pack/docs) ao docs/
  do repo destino via rsync ou script apply. Proíbe cópia live do docs/ de outro produto.
---

# Scaffold neutro `gestao-*`

## Fonte única permitida

- `.cursor/docs/_stec-process-bootstrap/neutral-pack/docs/`

## Proibido

- `cp -r` desde `docs/` de outro repositório de produto (ex.: cópia integral do SoundLink template).
- Alterar `.cursor/`, `hooks.json` ou skills como parte deste scaffold.

## Método recomendado

Na raiz do **repo consumidor**:

```bash
chmod +x .cursor/docs/_stec-process-bootstrap/scripts/apply-stec-neutral-pack.sh
.cursor/docs/_stec-process-bootstrap/scripts/apply-stec-neutral-pack.sh "$(pwd)"
```

Dry-run:

```bash
.cursor/docs/_stec-process-bootstrap/scripts/apply-stec-neutral-pack.sh --dry-run "$(pwd)"
```

O script exige `.cursor/agents`, `.cursor/skills`, `.cursor/rules` (P0a mínimo).

## Depois

1. Invocar `tasklink-docs-validate-structure`.
2. Opcional: `docs-criar-doc-structure` com `profiles` do manifest.
