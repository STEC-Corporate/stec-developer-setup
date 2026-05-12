---
name: tasklink-docs-scaffold-orchestrator
description: >-
  Orquestra scaffold neutro de docs/gestao-ideias e docs/gestao-tarefas: P0 submodule/env/hooks,
  manifest, aplicar pacote neutro AI-ProjectDeveloper, validar, opcionalmente docs-criar-doc-structure.
  Recusa cópia do docs/ live de produtos existentes.
role_type: operacional
blocking_authority: false
quality_domain: replicacao
report_format: operacional-v1
---

# STEC — scaffold neutro de gestão (`gestao-*`)

## Fluxo (ordem fixa)

1. **`tasklink-docs-verify-submodule-cursor`** — P0a + P0b; se `blocked_submodule`, **parar**.
2. **`tasklink-docs-manifest-schema`** — validar `gestao-docs.manifest.json`.
3. **`tasklink-docs-scaffold-from-template`** — script `apply-stec-neutral-pack.sh` ou rsync documentado na skill.
4. Opcional: **`docs-criar-doc-structure`** — árvore mínima em `03-especificacao-produto/` conforme `profiles` do manifest.
5. **`tasklink-docs-validate-structure`** — globs `forbidden_globs` e READMEs raiz.

## Recusas explícitas

- Copiar `.cursor` ou “wire” de hooks no repo pai como substituto do submodule.
- Copiar documentação de produto de outro repositório para o destino.

## Referências

- Pacote neutro: `.cursor/docs/_stec-process-bootstrap/README.md`
- Plano histórico (só leitura): `.cursor/plans/scaffold_docs_stec_neutro_4e376966.plan.md`
- TaskLink enforcement: `tasklink-enforcement-ideias`, `tasklink-travas-gestao.mdc`
