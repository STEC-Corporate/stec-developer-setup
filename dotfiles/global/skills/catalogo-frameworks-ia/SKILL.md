---
name: catalogo-frameworks-ia
description: Manter o catálogo de agents framework-* (geração de agents, skills e rules). Usar ao adicionar frameworks, alterar globs ou regerar arquivos do catálogo.
---

# Catálogo de frameworks (IA)

## Quando usar

- Inclusão ou alteração de entradas no catálogo `framework-*`.
- Regeneração em massa de `agents/`, `skills/framework-*/` e `rules/framework-*.mdc`.

## Script

O gerador vive em **`scripts/generate-framework-catalog.py`** (nesta skill). Executar a partir da **raiz do repositório**:

```bash
python3 skills/catalogo-frameworks-ia/scripts/generate-framework-catalog.py
```

## Manutenção

- Editar a lista `FRAMEWORKS` no script (slug, descrição, stack pai, estado, glob, foco da skill).
- Atualizar [docs/governanca/catalogo-frameworks-ia.md](../../../docs/governanca/catalogo-frameworks-ia.md) e [`agents/INDEX.md`](../../agents/INDEX.md) / [skills INDEX](../../skills/INDEX.md) / [rules INDEX](../../rules/INDEX.md) quando o catálogo mudar de forma visível.

## Referência

- [catalogo-scripts-skills.md](../../../docs/governanca/catalogo-scripts-skills.md) — convenção de paths.
