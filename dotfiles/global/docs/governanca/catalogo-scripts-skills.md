# Scripts de catálogo — localização nas skills (Cursor)

Os geradores do catálogo **não** ficam na raiz `scripts/` do repositório. Seguem o padrão Cursor: **pasta da skill** + subpasta **`scripts/`**.

## Mapa

| Catálogo | Skill | Script |
|----------|-------|--------|
| `framework-*` | [`skills/catalogo-frameworks-ia/`](../../skills/catalogo-frameworks-ia/) | `scripts/generate-framework-catalog.py` |
| `arch-*` | [`skills/catalogo-arch-agents-ia/`](../../skills/catalogo-arch-agents-ia/) | `scripts/generate-arch-agents-catalog.py` |
| `cloud-*` | [`skills/catalogo-cloud-providers-ia/`](../../skills/catalogo-cloud-providers-ia/) | `scripts/generate-cloud-agents-skills.py` |

## Execução (a partir da raiz do repo)

```bash
python3 skills/catalogo-frameworks-ia/scripts/generate-framework-catalog.py
python3 skills/catalogo-arch-agents-ia/scripts/generate-arch-agents-catalog.py
python3 skills/catalogo-cloud-providers-ia/scripts/generate-cloud-agents-skills.py
```

## Raiz do repositório no Python

Os scripts resolvem a raiz procurando o diretório que contém `agents/` (funciona independentemente da profundidade de `scripts/` dentro da skill).

## Documentação relacionada

- [catalogo-frameworks-ia.md](catalogo-frameworks-ia.md)
- [catalogo-arch-agents-ia.md](catalogo-arch-agents-ia.md)
