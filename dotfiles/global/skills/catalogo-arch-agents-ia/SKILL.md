---
name: catalogo-arch-agents-ia
description: Manter o catálogo de agents arch-* (geração de agents, skills e rules de arquitetura). Usar ao adicionar temas, alterar ondas ou regerar o catálogo.
---

# Catálogo de arquitetura (IA)

## Quando usar

- Inclusão ou alteração de entradas no catálogo `arch-*`.
- Regeneração em massa de `agents/`, `skills/arch-*/` e `rules/arch-*.mdc`.

## Script

O gerador vive em **`scripts/generate-arch-agents-catalog.py`** (nesta skill). Executar a partir da **raiz do repositório**:

```bash
python3 skills/catalogo-arch-agents-ia/scripts/generate-arch-agents-catalog.py
```

## Manutenção

- Editar a lista `ARCH` no script (slug, título, descrição, onda, estado, foco, âmbito).
- Atualizar [docs/governanca/catalogo-arch-agents-ia.md](../../../docs/governanca/catalogo-arch-agents-ia.md) e os `INDEX.md` do catálogo quando necessário.

## Referência

- [catalogo-scripts-skills.md](../../../docs/governanca/catalogo-scripts-skills.md) — convenção de paths.
