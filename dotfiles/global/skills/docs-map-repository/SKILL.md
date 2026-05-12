---
name: docs-map-repository
description: Mapa operacional do repositório SoundLink para agents — onde ler docs/, gestao-tarefas, gestao-ideias, .cursor/docs/ia e migração template→oficial. Use ao navegar documentação, alinhar PRs ao MAPA ou orientar leitura sem duplicar Markdown canônico.
---

# Mapa da documentação no repositório

## Fonte canônica

- **Navegação por paths e política de pastas:** `docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md`
- **Git é a fonte da verdade** (Markdown no repo). Obsidian é opcional; ver `docs/gestao-ideias/01-exploracao/implementacoes-futuras-ideias/obsidian-vault-docs-fluxo-leitura-e-fonte-da-verdade.md`

Esta skill **não substitui** o MAPA nem copia texto longo — indica **o que abrir** e **para quê**.

## Entrada rápida (arquivos críticos)

| Tema | Path |
|------|------|
| DNA da plataforma (artes performáticas) | `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md` |
| Guardrails | `.cursor/docs/ia/guardrails.md` |
| North Star | `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md` |
| Dicionário de métricas | `docs/gestao-ideias/02-execucao/planejamento/metrics/metric-dictionary.md` |
| Priorização de features | `.cursor/docs/ia/playbooks/feature-prioritization.md` |
| ADRs e decisões | `docs/gestao-ideias/00-governanca/decisoes/` |
| API specifications (por perfil) | `docs/gestao-tarefas/03-especificacao-produto/api-specifications/` |
| Regras de negócio | `docs/gestao-tarefas/03-especificacao-produto/business-rules/` |
| User flows | `docs/gestao-tarefas/03-especificacao-produto/user-flows/` |
| Premissa migração template → oficial | `docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/premissa-migracao-template-oficial.md` |
| Config JSON de fases de migração | `docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/config-migracao-template-oficial.json` |

## Pastas de primeiro nível em `docs/` (resumo)

| Pasta | Nota |
|-------|------|
| `docs/gestao-ideias/04-referencia-tecnica/_templates/` | Modelos para gerar documentação |
| `docs/gestao-ideias/04-referencia-tecnica/arquivo/` | Histórico, reorganizações, testing archive, legacy |
| `docs/gestao-ideias/05-audits/` | Auditorias (componentes, tamanhos, plano de lotes) |
| `docs/gestao-ideias/00-governanca/compliance/` | Conformidade e políticas |
| `docs/gestao-ideias/00-governanca/decisoes/` | ADRs, decision log, fronteira de produto |
| `docs/gestao-ideias/03-produto/design-system/` | Piloto DS / referência visual |
| `docs/gestao-tarefas/03-especificacao-produto/` | Core de produto: business-rules, user-flows, api-specifications |
| `.cursor/docs/ia/` | Guardrails, playbooks, qualidade, tutorial agents/skills |
| `docs/gestao-ideias/03-produto/integrations/` | Integrações externas |
| `docs/gestao-ideias/02-execucao/planejamento/` | OKRs, sprints, plans locais, métricas, tarefas |
| `docs/gestao-ideias/01-exploracao/implementacoes-futuras-ideias/` | Ideias e visão sem compromisso imediato de build |
| `docs/gestao-ideias/04-referencia-tecnica/referencia/` | Dev, status, migração, UI canônica, known-issues |
| `docs/gestao-ideias/04-referencia-tecnica/verificacao/` | Checklists de consistência |

## Leitura narrativa (README)

- **`docs/README.md`** — Contexto e fluxo de trabalho com a documentação; o MAPA prevalece em navegação por path.
- **`docs/gestao-ideias/01-exploracao/implementacoes-futuras-ideias/README.md`** — Índice da pasta de ideias / estratégia sem compromisso imediato.

## Núcleo `docs/gestao-tarefas/03-especificacao-produto/`

| Path | Uso |
|------|-----|
| `business-rules/` | Regras fe-* por perfil; usar INDEX.md dentro de cada pasta |
| `user-flows/` | User flows por perfil + _shared; entrada comum em `user-flows/INDEX.md` |
| `api-specifications/` | Especificações alinhadas a contratos BFF/API; INDEX em _shared e por perfil |

## IA (extra do MAPA)

| Path | Uso |
|------|-----|
| `.cursor/docs/ia/ralph-loop-componentizacao-lotes.md` | Ralph Loop — prompts por iteração (componentização em lotes) |
| `.cursor/docs/ia/` (tutoriais / onboarding) | Procurar tutorial-*.md, subagents*.md, skills-recomendadas.md |

### Entradas IA frequentes

| Path | Uso |
|------|-----|
| `.cursor/docs/ia/guardrails.md` | Obrigatório antes de features sensíveis |
| `.cursor/docs/ia/README.md` | Índice da área IA |
| `.cursor/docs/ia/playbooks/` | Playbooks (ex.: priorização) |
| `.cursor/docs/ia/quality/` | Estratégia de qualidade / testes |

## Migração template → oficial (MAPA sec. 6)

- Fonte de verdade das regras: premissa + `config-migracao-template-oficial.json`
- Tipicamente **excluídos** da cópia mecânica: planejamento amplo em `02-execucao/planejamento/`, exploração em `01-exploracao/`, docs só do template, fake/mock — skill `migracao-aplicar-filtro-migracao`
- Tipicamente **relevantes** para contrato e produto: `03-especificacao-produto/`, partes de `04-referencia-tecnica/referencia/`, `00-governanca/decisoes/`, `.cursor/docs/ia/guardrails.md`
- Ajustar sempre o filtro à fase ativa no JSON de migração

## Planejamento (pastas)

| Path | Uso |
|------|-----|
| `docs/gestao-ideias/02-execucao/planejamento/metrics/` | North Star, dicionário de métricas |
| `.../scrum-planning/` | Eventos, sprints por feature |
| `.../planejamento-tarefas/` | Kanban, guias, tarefas por área |
| `.../plans-local-templates/` | Planos .plan.md (inclui executados/) |
| `docs/gestao-ideias/01-exploracao/implementacoes-futuras-ideias/` | Ideias sem compromisso; ver README nesta pasta |
| `.../planejamento/_model/` | Modelos de planejamento |
| `.../planejamento/analises/` | Análises pontuais |

## Referência técnica

| Path | Uso |
|------|-----|
| `docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/` | Premissa e config de migração |
| `.../referencia/dev/` | Testes, sprints, notas de desenvolvimento |
| `.../referencia/status/` | Referência vs código |
| `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/` | Inventário / telas canônicas entre perfis |
| `.../known-issues/` | Issues conhecidos |
| `.../corporate/` | Documentos corporativos |
| `.../architecture/` | Arquitetura (quando presente) |

## O que permanece só em Markdown (não duplicar na app)

- Texto integral de North Star, business rules (fe-*.md), user flows e API specs
- Planos longos (.plan.md) em `plans-local-templates/` e análises em `planejamento/analises/`
- Histórico em `arquivo/`; relatórios extensos em audits
- Novo “livro” de produto: resumo pode ir à skill `north-star-product-alignment` ou a esta skill; **detalhe** no `.md` canônico

## Skills relacionadas

- `docs-calcular-north-star-impact` — impacto de features na North Star
- `docs-gerar-doc-north-star` — gerar documento north-star no destino
- `planejamento-validar-feature-strategy` — validar feature vs guardrails e North Star
- `seguranca-validar-guardrails` — guardrails
- `migracao-aplicar-filtro-migracao` — filtro de migração

## Checklist para o agent

1. Precisa do mapa completo? Abrir `MAPA-DOCUMENTOS.md` primeiro.
2. Feature de produto? `03-especificacao-produto/` + ADRs em `decisoes/`.
3. IA / Cursor? `.cursor/docs/ia/` e guardrails.
4. Não inventar paths; quando em dúvida, grep no repo ou ler o MAPA.
