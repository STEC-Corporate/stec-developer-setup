---
name: tasklink-docs-inventory
description: >-
  Classifica paths de docs/gestao-* em structure_only, template_ok ou forbidden_soundlink_instance.
  Use em auditorias antes de migrar ou replicar pastas entre repositórios.
---

# Inventário de paths (gestão STEC)

## Classes

| Classe | Critério |
|--------|----------|
| `structure_only` | README stub, pastas vazias, sem conteúdo de produto |
| `template_ok` | Sob `**/_templates/**` ou arquivos do pacote neutro em `.cursor/docs/_stec-process-bootstrap/neutral-pack/` |
| `forbidden_soundlink_instance` | `fe-*.md` fora de `_templates`, `ui-canonical` com corpo de produto, `plans-local-templates/**/*.plan.md` preenchidos como instância, BR/UF de produto em massa |

## Processo

1. Receber raiz a inspecionar (ex.: `docs/gestao-tarefas`).
2. Listar arquivos `.md` e `.json` relevantes.
3. Aplicar heurísticas acima; cruzar com `forbidden_globs` do manifest quando existir.
4. Emitir tabela Markdown: path → classe → nota.

## Uso

- Antes de `tasklink-docs-scaffold-from-template` no **repo origem** (nunca copiar `forbidden_soundlink_instance` para o destino).
- Após scaffold, opcionalmente para dupla verificação com `tasklink-docs-validate-structure`.
