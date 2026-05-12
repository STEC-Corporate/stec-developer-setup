# Documentos Importados e Referencias

Este diretorio guarda documentos de suporte consumidos por `agents/`, `skills/` e `rules/` do catalogo.

## Pacote neutro STEC (`gestao-ideias` / `gestao-tarefas`)

- **Pasta:** [`_stec-process-bootstrap/`](./_stec-process-bootstrap/README.md) — manifest JSON Schema, exemplo, `neutral-pack/docs/` (árvore stub + TaskLink neutro) e script `scripts/apply-stec-neutral-pack.sh`.
- **Agente:** `tasklink-docs-scaffold-orchestrator` — orquestra P0, manifest, aplicação do pacote e validação.
- **Regra:** `plan-mode-vs-execution.mdc` — distinguir iteração de plano de ordem explícita de implementação.

## Origem dos documentos importados

- `.cursor/docs/ia/template-replication-flow.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/template-replication-flow.md`
- `.cursor/docs/ia/guardrails.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/guardrails.md`
- `docs/referencia/migracao/premissa-migracao-template-oficial.md`
  - origem: `Holding-STEC-Template/docs/referencia/migracao/premissa-migracao-template-oficial.md`
- `docs/referencia/migracao/config-migracao-template-oficial.json`
  - origem: `Holding-STEC-Template/docs/referencia/migracao/config-migracao-template-oficial.json`
- `docs/referencia/migracao/projetos-plataforma-paths-jesus.md`
  - origem: `soundlink-template-frontend/docs/referencia/migracao/projetos-plataforma-paths-jesus.md`
- `docs/planejamento/metrics/north-star.md`
  - origem: `Holding-STEC-Template/docs/planejamento/metrics/north-star.md`
- `docs/planejamento/okrs-kpis-q1-2026.md`
  - origem: `soundlink-template-frontend/docs/planejamento/okrs-kpis-q1-2026.md`
- `docs/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md`
  - origem: `soundlink-template-frontend/docs/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md`
- `docs/planejamento/planejamento-tarefas/GUIA-FLUXO-SPRINT.md`
  - origem: `soundlink-template-frontend/docs/planejamento/planejamento-tarefas/GUIA-FLUXO-SPRINT.md`
- `docs/_templates/componentizacao-checklist.md`
  - origem: `Holding-STEC-Template/docs/_templates/componentizacao-checklist.md`
- `docs/_templates/feature-checklist.md`
  - origem: `Holding-STEC-Template/docs/_templates/feature-checklist.md`
- `docs/_templates/metric-dictionary-single-entry.md`
  - origem: `Holding-STEC-Template/docs/_templates/metric-dictionary-single-entry.md`
- `docs/_templates/metric-dictionary-template.md`
  - origem: `Holding-STEC-Template/docs/_templates/metric-dictionary-template.md`
- `docs/_templates/north-star-template.md`
  - origem: `Holding-STEC-Template/docs/_templates/north-star-template.md`
- `docs/_templates/sprint-plan-template.md`
  - origem: `Holding-STEC-Template/docs/_templates/sprint-plan-template.md`
- `docs/_templates/user-story-template.md`
  - origem: `Holding-STEC-Template/docs/_templates/user-story-template.md`
- `.cursor/docs/ia/README.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/README.md`
- `.cursor/docs/ia/subagents.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/subagents.md`
- `.cursor/docs/ia/skills-recomendadas.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/skills-recomendadas.md`
- `.cursor/docs/ia/prompts.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/prompts.md`
- `.cursor/docs/ia/playbooks/communication-guidelines.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/playbooks/communication-guidelines.md`
- `.cursor/docs/ia/playbooks/conflict-resolution.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/playbooks/conflict-resolution.md`
- `.cursor/docs/ia/playbooks/feature-prioritization.md`
  - origem: `Holding-STEC-Template/.cursor/docs/ia/playbooks/feature-prioritization.md`
- `docs/analise-automacao.md`
  - origem: `soundlink-infrastructure/docs/analise-automacao.md`
- `docs/manual-deploy-infraestrutura.md`
  - origem: `soundlink-infrastructure/docs/manual-deploy-infraestrutura.md`
- `docs/premissa-projetos-plataforma-aws.md`
  - origem: `soundlink-infrastructure/docs/premissa-projetos-plataforma-aws.md`
- `docs/GUIA_AMBIENTE_DEV.md`
  - origem: `soundlink-infrastructure/docs/GUIA_AMBIENTE_DEV.md`
- `docs/estimativa-custo-operacao.md`
  - origem: `soundlink-infrastructure/docs/estimativa-custo-operacao.md`
- `docs/microservices-implementation-plan.md`
  - origem: `soundlink-infrastructure/docs/microservices-implementation-plan.md`
- `docs/project-structure.md`
  - origem: `soundlink-infrastructure/docs/project-structure.md`
- `docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md`
  - origem: `soundlink-frontend/docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md`
- `docs/dev/BASE-CONHECIMENTO-ERROS.md`
  - origem: `soundlink-frontend/docs/dev/BASE-CONHECIMENTO-ERROS.md`
- `docs/quality-policy.md`
  - origem: `soundlink-frontend/.cursor/docs/quality-policy.md`
- `docs/correction-agent.md`
  - origem: `soundlink-frontend/.cursor/docs/correction-agent.md`
- `docs/fluxo-release.md`
  - origem: `soundlink-frontend/.cursor/docs/fluxo-release.md`

## Criterio de importacao

Foram trazidos apenas documentos que:

- eram referenciados pelo catalogo local;
- existiam de fato nos repositorios irmaos inspecionados;
- fazem sentido como contexto reutilizavel dentro deste submodulo.

## Observacao

Algumas referencias antigas dos agents continuam apontando para documentos que nao foram encontrados nem no `Holding-STEC-Template` nem no `soundlink-template-frontend`. Essas referencias devem ser revisadas ou removidas em uma limpeza posterior do catalogo.
