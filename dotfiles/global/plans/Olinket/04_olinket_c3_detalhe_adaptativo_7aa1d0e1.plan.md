---
name: 04 olinket c3 detalhe adaptativo
overview: Corte 3 — Tela de detalhe pós-filtros, com template adaptativo por Workspace/vertical, filtros avançados completos e padrão de 3 abas preparado (Pessoal/Profissional/Atendimento).
status: completed
todos:
  - id: f1
    content: Fase 1 — advanced-filters-sheet + extensão do search-query (chaves novas)
    status: completed
  - id: f2
    content: Fase 2 — /descobrir/[slug] + template-resolver + templates música e imagem (reconciliado com C2; ver docs/planejamento/detalhe-olinket-corte-3.md §1.1)
    status: completed
  - id: f3
    content: Fase 3 — ProfessionalDetailsTabs em @stec/olinket-ui (Pessoal, Profissional; Atendimento placeholder)
    status: completed
  - id: f4
    content: Fase 4 — Navegação /descobrir ↔ /descobrir/[slug] preservando filtros
    status: completed
  - id: f5
    content: Fase 5 — Testes unit (resolver, filtros, lookup) + E2E dois verticais + gates verdes
    status: completed
isProject: false
---


# 04 — Corte 3: Detalhe adaptativo por Workspace (pós-filtros)

> **Posição na sequência:** 4 de 10. Depende do Corte 2 (query na URL + `/descobrir`).
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§4, §6, §7), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§4, §7), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md) (§2, §4)
> **Referência UX:** `public-project-details.view.tsx` + `PublicProjectDetailsTabsList` (SoundLink) — padrão de 3 abas e margens.

## Objetivo

(1) Painel de filtros avançados que complementa a 1.ª vista do Corte 2. (2) Rota `/descobrir/[slug]` com **template adaptativo** por `verticalWorkspace`, preparando o padrão de 3 abas comum (Pessoal + Profissional; Atendimento fica "em preparação" para ciclos posteriores).

## Não fazer

- Construir back-office do profissional (visão §5, decisão §7; fica fora).
- Iniciar contratação a partir do detalhe (é Corte 5).
- Implementar a aba "Atendimento" ricamente (placeholder basta).

## Fases

### Fase 1 — Painel de filtros avançados

- Componente `src/features/busca/presentation/components/advanced-filters-sheet.tsx`:
  - Filtros: vertical/Workspace, localização (cidade/estado), faixa de preço, data, formações artísticas, ordenação.
  - Sheet / drawer abre do `/descobrir`.
- Estender `search-query.ts` (do Corte 2) com novas chaves — manter a assinatura estável (hook).
- Atualizar `/descobrir` para exibir chips removíveis de filtros ativos (já previstos no Corte 2).

### Fase 2 — Rota `/descobrir/[slug]` e resolver de template

- Criar `src/app/descobrir/[slug]/page.tsx`.
- `src/features/busca/presentation/templates/` com:
  - `template-resolver.tsx` — recebe `verticalWorkspace` e devolve o componente do template adequado.
  - `template-default.tsx` — slots comuns (header com foto/nome/localização, tabs, área de amostras, bloco de contato).
  - `template-musica.tsx`, `template-fotografia.tsx` — dois verticais iniciais (estender seguinte).
- Fonte de dados: `@stec/olinket-shared-mocks` (profissional por `slug`).

### Fase 3 — Padrão de 3 abas (Pessoal + Profissional; Atendimento placeholder)

- Componente `ProfessionalDetailsTabs` em `packages/olinket-ui/src/blocks/` (reutilizável).
- Abas:
  - **Pessoal:** nome, localização, mini-bio.
  - **Profissional:** formações artísticas, projetos (novo sentido do Corte 0), amostras.
  - **Atendimento:** placeholder "Disponível a partir da próxima versão" — gancho para evolução.
- Margens e spacing alinhados ao SoundLink: `w-full px-4 py-6 sm:px-6 lg:px-6`, conteúdo com `max-w-6xl` onde aplicável (visão §7).

### Fase 4 — Fluxo pós-filtros

- Ao clicar num `AmostraCard` do `/descobrir`, navegar para `/descobrir/[slug]` levando os filtros ativos na query (para o template eventualmente destacar "Disponível em cidade X" etc.).
- Botão "Voltar aos resultados" preserva `?q=&vertical=&...`.

### Fase 5 — Testes e gates

- Testes unit:
  - `template-resolver.test.tsx` escolhe o template certo por vertical; fallback para `template-default`.
  - `advanced-filters-sheet.test.tsx` aplica e remove filtros corretamente via `search-query`.
- **E2E** em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts):
  - `/descobrir?q=...&vertical=musica` → clicar em um card → chegar em `/descobrir/[slug]` com template de música.
  - Alterar para `vertical=fotografia` → template muda.
  - Voltar preserva filtros.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- `ProfessionalDetailsTabs` exposto em `@stec/olinket-ui` será reutilizado no Corte 9 (perfil resumido em `/prestador`).
- `template-resolver` tem ponto de extensão `registerTemplate(vertical, Component)` para novos verticais (Corte 7 pode adicionar templates específicos se fizer sentido).

## Definição de pronto (DoD)

- Filtros avançados funcionais no `/descobrir`.
- `/descobrir/[slug]` renderiza com template distinto para ≥ 2 verticais.
- Padrão de 3 abas disponível (Atendimento como placeholder explícito).
- Gates verdes; frontmatter `status: completed`.
