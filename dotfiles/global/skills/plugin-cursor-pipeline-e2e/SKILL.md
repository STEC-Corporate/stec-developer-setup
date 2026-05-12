---
name: plugin-cursor-pipeline-e2e
description: Orquestra pipeline completo de plugin Cursor (scaffold, review, seguranca, bundle de PR e acompanhamento).
---

# Skill: plugin-cursor-pipeline-e2e

## Quando usar

- Execucao ponta a ponta da automacao de criacao e publicacao.

## Modo de execucao

- `dry-run`: valida passos sem acao remota.
- `apply`: executa todas as etapas locais e gera artefatos para PR/submissao.

## Etapas

1. Scaffold.
2. Review de submissao.
3. Auditoria de seguranca.
4. Geracao de corpo de PR.
5. Acompanhamento de publicacao.

## Script de apoio

- `scripts/run_pipeline.py`
