# Perfil Músico como Template — Replicação de Features para Outros Perfis

> **Princípio de produto e desenvolvimento**: As features criadas para o perfil **músico** servem como **template/referência** para todos os outros perfis. Replicar com as adequações necessárias ao tipo de perfil (o que é relevante, o que não é, o que acrescentar).

---

## 1. Visão geral

- **Músico** = referência de features e padrões (fluxos, modais, listas, detalhes).
- **Outros perfis** = recebem as mesmas features quando fizer sentido, com **adequações**:
  - Analisar o que é **relevante** para aquele perfil.
  - Remover ou simplificar o que **não se aplica**.
  - **Acrescentar** o que for específico do perfil, quando for o caso.
- Objetivo: consistência de UX, menos retrabalho e um único padrão a seguir (o do músico).

---

## 2. Perfis atuais (referência para replicação)

Use **apenas** a lista abaixo ao replicar Profile, Dashboard ou Meus Projetos. Rotas e perfis antigos não devem ser referência.

- **Prestadores**: Visual Professional, Music Producer, Event Producer, Recording Studio, Booking Agent, Music Teacher, Technical Professional, Music Manager, Music School, Booking Agency, Store Owner, Equipment Manufacturer, Technical Services Company, Event Production Company.
- **Contratantes**: Individual Hirer (`contractor-individual`), Corporate Hirer (`corporate-hirer`), Contractor Business (`contractor-business`), Contractor Individual.
- **Empresas/outros**: Publisher, Distributor, Record Label, Sponsor, Press, Promoter.
- **Admin**: perfil administrativo.

---

## 3. Meus Projetos vs Meus Eventos

- **Perfis que podem criar projetos** (ex.: músico, gravadora, editora, distribuidor, produtor musical, estúdio, etc.): devem ter a feature **Meus Projetos**, seguindo o **padrão usado para o músico** (incluindo modais, listagem, detalhe).
- **Perfis que não criam projetos, apenas eventos** (ex.: contratante individual, produtor de evento, etc.): devem ter a feature **Meus Eventos**, com o mesmo rigor de padrão (cores, margens, modais).
- Em ambos os casos: **referência** é o que já existe para o músico (ou para o perfil mais completo no mesmo eixo); **adaptar** para o tipo de perfil.

---

## 4. Padrões obrigatórios ao replicar

Ao replicar qualquer feature (Meus Projetos, Meus Eventos, configurações, etc.) para outro perfil:

- **Cores**: Respeitar as regras de cor por perfil (ex.: `getProfileButtonClasses(profileType)`). Não misturar paleta de outro perfil.
- **Margens e layout**: Seguir o padrão de margens e responsividade (ex.: `w-full px-4 py-6 sm:px-6 lg:px-6` e guidelines de UI do projeto).
- **Tamanho e comportamento de modais**: Usar o mesmo padrão de modais do músico (tamanho, scroll, footer com botões). Não criar modais “diferentes” por perfil sem justificativa.
- **Fonte de dados**: Usar **canonical** (ou contrato de API) como fonte única para mocks; listas não devem iniciar vazias sem fonte definida quando houver canonical.
- **Documentação**: Manter alinhamento com guardrails, north star e fe-*.md / user-flows do perfil.

---

## 5. Fluxo recomendado para o Agent

Quando o usuário pedir para **implementar ou replicar** uma feature para um ou mais perfis:

1. **Recuperar contexto (RAG)**: Usar a ferramenta MCP `search_documentation` (ou `npm run rag:query`) com perguntas sobre:
   - a feature (ex.: "Meus Projetos", "Meus Eventos"),
   - o perfil de referência (músico),
   - padrões de UI (cores, margens, modais),
   - guardrails e regras de negócio.
2. **Identificar escopo**: Quais perfis recebem a feature? Eles criam projetos ou apenas eventos?
3. **Criar plano ou TODOs**: Para escopo grande → plano (ex.: .cursor/plans ou documento de plano); para tarefas menores → TODOs claros.
4. **Executar de forma completa**: Seguir o padrão do músico, aplicar adequações por perfil, respeitar cores/margens/modais e validar que a feature está completa (dados carregando, modais corretos, rotas e navegação).

---

## 6. Onde está a referência (músico)

- **Meus Projetos (músico)**: `src/app/musician/projects/`, `src/features/musician-projects/`, canonical em `src/lib/mocks/canonical/projects/` e `project-*.ts`. **Plano de verificação** (estrutura lista + detalhe + abas): `.cursor/plans/Musician/verificacao-meus-projetos-musico.plan.md`. **Plano mestre** (escopo por perfil, canonical, detalhe mínimo, matriz de abas): `.cursor/plans/Profiles/00-meus-projetos-master.plan.md`. Outros perfis: lista via `GenericProfileProjectsView` + `loadCanonicalProjectsForProfile`; detalhe em `/<perfil>/projects/[projectId]` com subset de abas conforme matriz do plano mestre.
- **Profile (músico)**: `src/app/musician/profile/page.tsx` → `MusicianProfileContent` em `src/components/musician-profile/musician-profile-content.tsx`, que usa **ProfilePageShell** (`src/components/profile/profile-page-shell/`) com config (título, descrição, 3 abas). Padrão canônico de layout em `.cursor/plans/Musician/verificacao-profile-musico.plan.md`; inventário de UI em `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/profile-musician.md`. **Para replicar Profile em outro perfil**: usar ProfilePageShell + config; checklist e template em `docs/referencia/architecture/profile-reuse-vs-duplication.md` (§ 8 e 9). Plano executado (músico preparado): `.cursor/plans/Musician/profile-musician-shell-reusable.plan.md`. Outros perfis devem migrar para o mesmo shell; podem usar `PersonalInfoSectionEnhanced` para a aba pessoal/empresa.
- **Dashboard (músico)**: `src/app/musician/dashboard/page.tsx`, config em `src/app/musician/dashboard/_components/dashboard-sections.config.tsx`, componentes `DashboardSection` e `DashboardCard` em `_components/`. Padrão canônico em `.cursor/plans/Musician/verificacao-dashboard-musico.plan.md`: título H1 "Dashboard do [Perfil]" + descrição no topo, seções com h2 + descrição + grid de cards; preferir config + componentes reutilizáveis. Layout compartilhado: `src/app/components/dashboard-layout.tsx`. Função genérica de seções: `src/app/components/dashboard/get-dashboard-sections.tsx` (basePath + opções por perfil).
- **Modais e UI**: Componentes em `src/features/musician-projects/` e `src/features/musician-profile/`; padrões em `.cursor/docs/ia/` e `.cursorrules`.
- **Perfis genéricos (Meus Projetos simplificado)**: `src/features/generic-profile-projects/`, páginas em `src/app/<perfil>/projects/page.tsx`.
- **Cores por perfil**: `getProfileButtonClasses(profileType)` em `src/lib/utils/profile-button-colors.ts`.

---

## 7. Resumo para o Agent

| Situação | Ação |
|----------|------|
| Replicar feature para perfil que cria projetos | Meus Projetos no padrão do músico (ou generic quando aplicável); cores e modais do perfil. |
| Replicar Meus Projetos para outro perfil | Garantir canonical + lista (`/<perfil>/projects`) + detalhe (`/<perfil>/projects/[projectId]`) sem 404; abas conforme matriz em `.cursor/plans/Profiles/00-meus-projetos-master.plan.md`. Ver `.cursor/plans/Musician/verificacao-meus-projetos-musico.plan.md`. |
| Replicar feature para perfil que só cria eventos | Meus Eventos no padrão equivalente; cores e modais do perfil. |
| Replicar Dashboard para outro perfil | Título H1 + descrição no topo; seções com h2 + descrição; preferir config + DashboardSection + DashboardCard; especificidades por perfil. Ver `.cursor/plans/Musician/verificacao-dashboard-musico.plan.md`. |
| Replicar Profile para outro perfil | Usar **ProfilePageShell** (`@/components/profile/profile-page-shell`) com config (título, descrição, tabs). Ler `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/profile-musician.md` e o checklist em `docs/referencia/architecture/profile-reuse-vs-duplication.md` (§ 8). Replicação em duas fases (plano + aprovação, depois aplicar). Template de config no mesmo doc (§ 9). |
| Antes de implementar | Chamar RAG (`search_documentation`) para guardrails, padrões de UI, referência da feature. |
| Escopo grande | Criar plano (ou documento de plano) e executar por etapas. |
| Escopo menor | Criar TODOs e executar até completar. |

---

**Relacionado**: `.cursor/rules/rag-docs-context.mdc`, `.cursor/rules/replication-musician-as-template.mdc`, `.cursor/docs/ia/guardrails.md`, `.cursor/docs/ia/rag-usage.md`.
