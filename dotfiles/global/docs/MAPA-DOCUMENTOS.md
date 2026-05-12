# Mapa de Documentos – Frontend Oficial (SoundLink)

Este repositório (Frontend Oficial) contém apenas **mapeamentos** e regras locais. O **planejamento** (sprints, user-flows, business-rules, guardrails) e as **regras de migração** ficam no **Template**; consultar via paths abaixo. Premissa: **Template → BFF → API**; este app consome o BFF e executa sprints conforme planejamento no Template.

## Acesso

Para agents e subagents usarem os paths do Template, BFF ou API, o **workspace deve incluir** esses repositórios (multi-root) **ou** o usuário deve fornecer contexto via **@** nos arquivos/pastas relevantes.

---

## 1. Template (planejamento – fonte única)

**Path base**: `/home/jesus/Projetos/soundlink-template-frontend`

| Path (relativo ao Template) | Propósito | Quando consultar |
|-----------------------------|-----------|------------------|
| `docs/planejamento/` | OKRs, sprints, scrum-planning, product-backlog | Ao executar uma sprint; priorizar; alinhar com roadmap |
| `docs/planejamento/scrum-planning/sprints/[perfil]/` | Sprint plans, tasks, user-stories, definition-of-done | Ao implementar sprint no Frontend Oficial |
| `docs/documentacao/user-flows/[perfil]/[feature]/` | User flows e mapeamentos (`fe-*-user-flow.md`, `fe-*-mapping.md`) | Ao implementar fluxo ou validar telas |
| `docs/documentacao/api-specifications/` | Endpoints, types, examples | Ao integrar com BFF; validar contratos |
| `docs/documentacao/business-rules/[perfil]/[feature]/` | Regras de negócio por perfil/feature | Ao implementar ou validar lógica de UI |
| `.cursor/plans/` | Planos de produto/feature (ratings, musical-project, etc.) | Ao implementar módulo com plano próprio |
| `.cursor/docs/ia/guardrails.md` | Princípios invioláveis | Antes de implementar features (ranking, monetização, etc.) |
| `docs/planejamento/metrics/north-star.md` | North Star Metric | Ao priorizar ou validar impacto |
| `docs/decisoes/` | ADRs, decisões | Ao alinhar com decisões já tomadas |
| `.cursor/docs/ia/playbooks/` | feature-prioritization, conflict-resolution | Ao priorizar ou seguir processos |
| `docs/README.md` | Índice "DOCUMENTOS CRÍTICOS" do Template | Visão geral |
| `src/` (features, pages) | Código de referência (telas, chamadas) | Quando necessário para entender fluxo; **não copiar docs de planejamento** |

### Regras de migração (premissa)

- **Path no Template:** `docs/referencia/migracao/premissa-migracao-template-oficial.md`
- **Conteúdo:** regras de rewrite de imports (baseline `@/* -> ./src/*`, quando reescrever, source of truth) e princípios allow/deny (não copiar docs de planejamento; não copiar fake/mock).
- **Quando usar:** ao executar migração Template → Oficial; ao aplicar fases de migração.

### Configuração das fases de migração

- **Path no Template:** `docs/referencia/migracao/config-migracao-template-oficial.json`
- **Conteúdo:** único documento com fases por escopo (sem numeração de sprint); cada fase tem `id`, `title`, `allowGlobs`, `allowList`, `notes`; `denyGlobs` compartilhado.
- **Quando usar:** ao executar migração Template → Oficial; escolher a fase pelo `id` (ex.: cadastro-informacoes-pessoais, informacoes-profissionais, informacoes-atendimento).

### Planejamento de migração (protocolo por sprint)

- **Path no Template:** `docs/referencia/dev/sprints/planning/planejamento-migracao-template-para-oficial.md`
- **Conteúdo:** objetivo da migração, premissas, protocolo, planejamento por sprint (o que migrar em cada uma).
- **Quando usar:** para contexto de origem/destino e decisões de baseline.

---

## 2. BFF (orquestrador – mapeamentos)

**Path base**: `/home/jesus/Projetos/soundlink-bff`

| Path | Propósito | Quando usar |
|------|-----------|-------------|
| `docs/mapa-documentos-template.md` | Índice de paths do Template para BFF/API | Consultar onde está cada tipo de doc no Template |
| `docs/agents-and-skills.md` | Premissa Template → BFF → API; subagents e skills do BFF | Entender fluxo e onde implementar no BFF |
| `docs/sprints-e-frontend.md` | Onde estão as sprints (Template) e onde rodá-las (Frontend Oficial); fluxo para executar sprint alinhada ao BFF/API | **Fluxo de desenvolvimento**: consultar Template → implementar no oficial → alinhar BFF quando necessário |

---

## 3. API (mapeamento)

**Path base**: `/home/jesus/Projetos/soundlink-api`

| Path | Propósito | Quando usar |
|------|-----------|-------------|
| `Docs/PREMISSA-TEMPLATE-BFF-API.md` | Premissa Template → BFF → API; onde consultar no Template | Alinhar implementações com a API |

---

## 4. Regras locais (Frontend Oficial)

Estas regras são **deste** repositório; regras de migração (import-rewrite, allow/deny) e **config de fases de migração** ficam no Template (ver seção 1).

| Path | Propósito | Quando usar |
|------|-----------|-------------|
| `docs/BFF-API-CONTRACTS.md` | Contratos BFF/API para o app | Referência de integração com o BFF |
| **Filtros de migração** | Não trazer: `*.fake.ts`, `*.mock.ts`, mocks (conforme premissa no Template) | Sempre ao migrar; deny-list no config de fases no Template |
| `docs/dev/` | Documentação técnica local (estrutura Next.js, arquitetura Frontend-BFF, base de erros) | Referência durante desenvolvimento |
| `.cursor/rules/guardrails.md` | Guardrails locais (validação) | Agent guardrails-checker; alinhamento com Template `.cursor/docs/ia/guardrails.md` |

---

## 5. Fluxo de desenvolvimento (resumo)

1. **Consultar no Template** a sprint ou feature: `docs/planejamento/scrum-planning/sprints/`, user-flows, business-rules; e **regras de migração**: `docs/referencia/migracao/premissa-migracao-template-oficial.md`.
2. **Implementar no Frontend Oficial** (este repo): código em `src/features/**`, rotas em `app/**`; sem mocks/fake.
3. **Alinhar BFF/API quando necessário**: usar doc e skill do BFF (`docs/sprints-e-frontend.md`, mapear-endpoint-bff-api) para novos endpoints ou contratos.

Com isso, o Frontend Oficial mantém apenas mapeamentos e config de execução; planejamento e regras de migração permanecem no Template.
