---
name: tasklink-docs-manifest-schema
description: >-
  Define e valida o manifest gestao-docs (content_source neutral_pack_only, forbidden_globs,
  campos opcionais P0). Use antes de aplicar o pacote neutro STEC.
---

# Manifest `gestao-docs`

## Localização

- Arquivo: `gestao-docs.manifest.json` na **raiz do repo destino** ou em `docs/` (procurar na raiz primeiro).

## Campos obrigatórios

| Campo | Valor |
|-------|--------|
| `content_source` | Literal `neutral_pack_only` |
| `project_name` | String não vazia (placeholders permitidos no template de exemplo) |
| `forbidden_globs` | Array não vazio de globs para validação pós-scaffold |

## Campos opcionais (P0)

| Campo | Tipo | Default |
|-------|------|---------|
| `repo_url` | string | omitido |
| `profiles` | string[] | `[]` — para `docs-criar-doc-structure` após scaffold |
| `p0_require_tasklink_hook` | boolean | `false` |
| `tasklink_doc_lock_expected` | `"off"` \| `"soft"` \| `"strict"` \| `"any"` | `"any"` |
| `p0_env_source` | `"shell"` \| `"user_declared"` \| `"skip"` | `"user_declared"` |

## Schema canônico

Arquivo JSON Schema: `.cursor/docs/_stec-process-bootstrap/gestao-docs.manifest.schema.json`

## Exemplo

`.cursor/docs/_stec-process-bootstrap/gestao-docs.manifest.example.json`

## Validação

- Se `content_source` ≠ `neutral_pack_only`, falhar com mensagem explícita.
- Se `forbidden_globs` vazio, falhar.
