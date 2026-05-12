---
name: catalogo-cloud-providers-ia
description: Manter o catálogo de agents e skills cloud-* por provedor e família (AWS, GCP, Azure, OCI, etc.). Usar ao regenerar ou alargar o catálogo cloud.
---

# Catálogo cloud (provedores)

## Quando usar

- Regeneração idempotente de agents `cloud-<provedor>-<família>-guia` e skills correspondentes.
- Alargamento de famílias ou provedores no gerador.

## Script

O gerador está em **`scripts/generate-cloud-agents-skills.py`**. Executar a partir da **raiz do repositório**:

```bash
python3 skills/catalogo-cloud-providers-ia/scripts/generate-cloud-agents-skills.py
```

## Manutenção

- Editar listas `FAMILIES`, `EQ`, `PROVIDERS` no script conforme necessário.
- Documentação de governação: [docs/governanca/catalogo-cloud-ia.md](../../../docs/governanca/catalogo-cloud-ia.md) (se existir).

## Referência

- [catalogo-scripts-skills.md](../../../docs/governanca/catalogo-scripts-skills.md)
