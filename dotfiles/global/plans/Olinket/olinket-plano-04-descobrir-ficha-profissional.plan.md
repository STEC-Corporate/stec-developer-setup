# Plano 4 — Descobrir + ficha Profissional (paridade Find-*)

> **Status:** ENTREGUE NO CÓDIGO — PRONTO PARA FECHO DE PRODUTO | **Última execução técnica:** 2026-05-03
>
> **Dependência:** executar **após Plano 1** (rotas canônicas contratante / identidade de conta). Coordenar com Planos 2/3 se alterarem headers ou links globais para não quebrar navegação durante transição.
>
> **Rotas no código:** descoberta pública **`/discover`**, detalhe **`/discover/[slug]`**, hub **`/profissional`** — não usar `/descobrir` como canônico (redirect apenas).

### Histórico de entregas técnicas (checkpoints)

| Data | Entrega |
|------|---------|
| 2026-05 | Redirects `prestador`, hub `/profissional`, headers, UI lista/ficha, E2E, docs ui-canonical. |
| 2026-05-03 | Grade tipo **SoundLink Find Professionals** (`DiscoverProfessionalCard` + `discover-professional-grid`), **`bioShort`** no item de busca, header público **Descobrir** (`PUBLIC_HEADER_NAV_LINKS`), lista navegável **sem login**; CTAs de contratar/orçamento com gate de sessão; `user-flows` home + `discover-listagem.md` atualizados. |

---

## 1. Objetivo

Redesenhar a **descoberta pública** (`/discover`) e o **detalhe do profissional** (`/discover/[slug]`) para **aproximar layout e blocos** das rotas **Find Professionals** (e, onde fizer sentido ao modelo contratante, **Find Performances** — informação, calendário, formulários) do clone **soundlink-template-frontend** (`main`).

**Canon de nomenclatura:** **Profissional** em paths novos e copy; **`prestador`** apenas **legado** + **redirect** 308/301 quando necessário. **`[PLANEJADO]`** onde faltar **BFF/API** real — manter **seed/mock** até contrato definido.

---

## 2. Referências obrigatórias (antes de codar)

| Fonte | Path / notas |
|-------|----------------|
| Matriz telas + linha ficha | `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/matriz-telas.md` (§2.5, §3.35, §3.3) |
| Detalhe / gate visitante | `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/detalhe-olinket-corte-3.md` |
| ADR copy / papéis | `docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md` (§3.4, §3.9) |
| UX SoundLink | `docs/gestao-ideias/04-referencia-tecnica/referencia/referencia-soundlink-template-frontend-ux.md` (§3 — Find-*) |
| Prompt mestre / contexto | `.cursor/plans/Olinket/olinket-soundlink-planos-prompts.md` — secção **Plano 4** |

**SoundLink (clone local):** `ProfessionalSearchView`, rotas `src/app/app/search/find-professionals`, componentes de busca pública listados na referência UX; comparar **slots** (filtros, cartões, hero da lista, empty states).

---

## 3. Estado atual no Olinket (inventário)

| Área | Ficheiros / rotas relevantes |
|------|------------------------------|
| Lista descoberta | `src/app/discover/page.tsx`, `discovery-busca-view.tsx`, `discover-professional-card.tsx`, `discovery-*-section.tsx`, `use-discovery-search`, filtros, `linket-search-seed.ts` |
| Detalhe profissional | `src/app/discover/[slug]/page.tsx`, `detalhe-profissional-view.tsx`, `profissional-lookup.ts`, templates em `presentation/templates/` |
| Hub profissional (workspace) | `src/app/profissional/page.tsx`, `profissional-workspace-cards.tsx` (`prestador` removido como app route; redirect legado) |
| Entrada home / CTAs | CTAs → `/discover`; hub profissional → `/profissional` |
| UI partilhada | `packages/olinket-ui` — `ProfessionalDetailsTabs`, `workspace-card`, etc. |
| SEO | `src/app/sitemap.ts` (`/discover`, `/profissional`) |

---

## 4. Decisões de rota (gate antes da Fase B)

**Decisão aplicada (execução 2026-05):** Opção A — hub **`/profissional`** (workspace picker); redirects **`/prestador` → `/profissional`** e **`/prestador/[slug]` → `/discover/[slug]`** em `next.config.js`; ficha pública canônica **`/discover/[slug]`**.

1. **Lista pública:** canônico **`/discover`**; PT legado **`/descobrir` → `/discover`** quando configurado.
2. **Legado `prestador`:** apenas redirects; copy e paths novos em **Profissional**.

**Critério:** minimizar links mortos; `sitemap`, E2E e `data-testid` alinhados.

---

## 5. Fases de execução

### Fase A — Paridade UX (análise + especificação)

- [x] Checklist de **blocos** Find Professionals vs lista — coberto em docs (`escopo-prestador-olinket.md`, `discover-listagem.md`, referência UX §4.x).
- [x] Checklist de **blocos** detalhe — `detalhe-olinket-corte-3.md` + `discover-ficha-profissional.md`; perfil duplicado `PrestadorPerfilView` removido (ficha canônica só em `/discover/[slug]`).
- [x] **Diferenças intencionais** em `matriz-telas.md` e docs relacionados.
- [x] **Glossário** atualizado (paths **Profissional**, hub `/profissional`).

**Gate:** revisão humana produto/UX — confirmar em PR/reunião se ainda pendente.

### Fase B — Rotas e redirects

- [x] Redirects legado em `next.config.js` (`/prestador`, `/prestador/:slug`, PT `/descobrir` quando aplicável).
- [x] `href` / headers / home / sitemap / `.env.example` alinhados a `/profissional` e `/discover`; **`PUBLIC_HEADER_NAV_LINKS`** inclui **Descobrir** para visitantes.

**Gate:** `npm run lint`, `npm run typecheck` — OK na validação final.

### Fase C — Componentização e UI

- [x] Blocos da lista extraídos (`discovery-summary-section`, `discovery-samples-section`, `discovery-social-proof-section`, helpers).
- [x] **Grade Find Professionals (SoundLink):** `DiscoverProfessionalCard` + `discover-professional-grid` (`grid-cols-1 … xl:grid-cols-4`); agrupamento por FA **retirado** da lista (helper `agruparPorFormacaoArtistica` mantido para uso futuro).
- [x] Detalhe: abas `ProfessionalDetailsTabs`, placeholder disponibilidade (`detalhe-disponibilidade-placeholder`), link workspace na aba Atendimento (`pdt-atendimento-workspace-link` + `workspaceHref`).
- [x] **PT-BR** e `data-testid` estáveis para E2E (`linket-detalhe-<linketId>` na lista).

**Gate:** verificar linhas nos `.tsx` tocados conforme regra do projeto (componentes ≤200 linhas) em próxima revisão de PR se necessário.

### Fase D — Dados (seed/mock)

- [x] Mantido seed/mock existente para layout atual; **`bioShort`** em `LinketSearchItem` + bridge em `linket-search-seed.ts`; campos adicionais quando BFF fechar contrato (**[PLANEJADO]** nos docs).
- [x] Avaliações/preço no cartão — **demo** até API (`DiscoverProfessionalCard`).
- [x] Lookup por slug e filtros cobertos por testes existentes (sem regressão na suite).

**Gate:** `npm run test` — 279 testes OK (2026-05-03).

### Fase E — Documentação produto

- [x] `ui-canonical/discover-listagem.md`, `discover-ficha-profissional.md` + atualizações em matriz, glossário, escopo.
- [x] `user-flows/_shared/publico/home.md` — secção `/discover` alinhada à grade SL + visitante sem login.
- [ ] `user-flows` — fluxo dedicado só para ficha/gate (opcional se produto quiser doc à parte da home).

**Gate:** cabeçalhos nos ficheiros tocados conforme `document-lifecycle.mdc`.

### Fase F — Qualidade

- [x] `npm run test` (279 OK; inclui typecheck clean no pretest) — **2026-05-03**.
- [x] `npm run lint` — OK (**não** existe `lint:headers` neste `package.json`).
- [x] E2E: `smoke-routes.spec.ts` + `descobrir-detalhe.spec.ts` — **26 passed** com `npm run dev` em `:3000` (2026-05-03). *Nota:* smoke CRM (`goto` cliente) pode falhar esporadicamente com `net::ERR_ABORTED`; repetir o teste isolado costuma passar (ambiente).
- [ ] Snapshots visuais — não aplicável.

### Encerramento / destino (ciclo de vida)

Quando o **gate produto** da Fase A estiver explícito no PR ou na reunião, mover este plano para `gestao-ideias/02-execucao/planejamento/plans-local-templates/executados/` conforme `document-lifecycle.mdc` (opcional — pode permanecer em `.cursor/plans/` como referência de série SoundLink).

---

## 6. Calendário na ficha (âmbito)

- **Agenda de tarefas** vs **calendário de eventos** contratados: comportamento durante negociação deve **documentar paridade SL** (fonte alvo: tabela em `matriz-telas.md` quando existir § Calendário de Eventos).
- Neste plano: slot UI + **[PLANEJADO]** dados reais; não bloquear entrega visual por API.

---

## 7. Riscos e coordenação

| Risco | Mitigação |
|-------|-----------|
| Plano 1 altera segmentos EN na área logada | Rebaser redirects e links após merge Plano 1 |
| Duplicação “hub profissional” vs “ficha pública” | Manter responsabilidades claras: hub = escolha workspace; ficha = vitrine contratante |
| SEO | Atualizar `generateMetadata`, `sitemap`, canonical se mudar path |

---

## 8. Critérios de aceite (resumo)

1. Lista e detalhe **visivelmente alinhados** aos blocos Find Professionals da referência SL, com **secção explícita** nas docs sobre divergências intencionais.
2. **Profissional** na copy e nos paths novos; **`prestador`** redirect/documentado como legado.
3. Testes + lint + typecheck verdes; E2E smoke atualizado para rotas finais.
4. Documentação em `03-especificacao-produto/` coerente com o código entregue.

---

*Plano gerado a partir de `olinket-soundlink-planos-prompts.md` (Plano 4).*

---

## Ligação ao Plano 5 ([`olinket_plano05_agenda_tarefas_calendario_eventos.plan.md`](./olinket_plano05_agenda_tarefas_calendario_eventos.plan.md))

O **Plano 5** não depende de código remanescente do Plano 4 no template (§ Dependências do Plano 5: *«nada crítico no código»*). O §6 **Calendário na ficha** do Plano 4 permanece **[PLANEJADO]** até BFF — o Plano 5 trata **agenda contratante** (`/contractor-*/agenda`) e separação **tarefas × eventos de negócio**, em paralelo conceptual ao slot de disponibilidade na ficha pública.

**Recomendação:** iniciar Plano 5 pela **Fase 0** (checkpoint somente leitura no `soundlink-template-frontend`) antes de fechar copy de estados na matriz.
