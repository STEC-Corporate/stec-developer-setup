---
name: Olinket Descobrir — cartões mistos SL + paridade de campos
overview: Unificar na lista /discover os dois mundos do SoundLink (find-professionals + find-performances), com filtro por workspace/tipo, mocks enriquecidos e mesma riqueza de campos nos cartões e nas fichas — sem duas rotas obrigatórias como no SL músico.
todos:
  - id: fase-0-inventario
    content: Fase 0 — Inventário SoundLink (campos card + detalhe, mocks, providers) e mapa gap vs Olinket atual
    status: completed
  - id: fase-1-dominio
    content: Fase 1 — Modelo de domínio (union profissional vs performance/projeto), LinketSearchQuery (filtro tipo/workspace), compat URL
    status: completed
  - id: fase-2-mocks
    content: Fase 2 — Seeds @stec/olinket-shared-mocks + bridge linket-search-seed; paridade de campos documentada
    status: completed
  - id: fase-3-repo
    content: Fase 3 — Repositório/filtros/paginação em memória; chips e AdvancedFilters alinhados
    status: completed
  - id: fase-4-ui-lista
    content: Fase 4 — UI lista — DiscoverMixedCard ou ramos; grelha única; filtro workspace/tipo
    status: completed
  - id: fase-5-ui-detalhe
    content: Fase 5 — Fichas completas por tipo (slug profissional + rota/detalle projeto); CTAs existentes
    status: completed
  - id: fase-6-docs-testes
    content: Fase 6 — ui-canonical, user-flows, E2E smoke/descoberta, checklist pós-implementação
    status: completed
isProject: false
---

# Plano detalhado — Descobrir unificado (SL Find Professionals + Find Performances)

> **Status:** PLANEJADO | **Criado:** 2026-05-04 | **Origem:** pedido produto — lista única Olinket + filtro; paridade de riqueza de campos com SoundLink.

## 1. Por que um plano é necessário

- Cruza **várias camadas**: pacote `shared-mocks`, tipos de domínio da feature `busca`, `search-query` / URL, componentes de lista e **duas famílias de ficha** (profissional já existente; projeto/performance a definir).
- Sem plano, arriscamos **tipos anémicos**, duplicação de cartões ou **filtros inconsistentes** com a URL (fonte única já documentada no C2/C3).
- O SoundLink mantém **duas apps de lista** por decisão de produto antiga; a Olinket **explicitamente não** — logo o desenho do **discriminated union** e do **filtro** precisa ser acordado antes de codar.

## 2. Objetivo e princípios

| Objetivo | Detalhe |
|----------|---------|
| Lista única | `/discover` mostra **profissionais (Linkets)** e **projetos/performances** inspirados nos cards do SL, na **mesma grelha** (ou secção única com ordenação única). |
| Filtro | Utilizador pode **restringir por workspace** (`marketLink` / `vertical` já existentes) e, se necessário, por **tipo de resultado** (`professional` \| `performance` / projeto) — sem obrigar duas páginas. |
| Paridade de riqueza | **Mesmos tipos de informação** que SL expõe nos cards e no detalhe (preço, local, categorias, ratings demo, resumos, metadados de projeto, etc.), mapeados para o modelo Olinket; onde o conceito não existir, **documentar lacuna** em vez de omitir silenciosamente. |
| Contratação | Mantém decisões já fechadas: **contratar na ficha**, não no cartão da lista. |

## 3. Fase 0 — Inventário (somente leitura, SoundLink)

**Entrada:** `D:\SoundLink\Projetos\soundlink-template-frontend`.

| Área | O que extrair |
|------|----------------|
| Find Professionals | `ProfessionalSearchView`, `professional-card.component.tsx`, hooks/providers, lista de campos visíveis e condicionais (badge, rating, preço, …). |
| Find Performances | `PublicProjectSearchView`, cartão de projeto (`project-card` ou equivalente), `objectiveToDisplay`, campos do card e do detalhe `find-performances/[id]`. |
| Mocks | Localização dos arrays/seeds (canonical mocks, adapters), quantidade de itens e variantes (vazio, erro). |

**Saída obrigatória:** tabela **campo SL → campo Olinket → fonte mock** + lista de **gaps** (campos SL sem homólogo no pacote atual).

**Critério de saída:** documento anexo curto (pode ser secção deste plano ou `docs/.../referencia/` — a equipa escolhe; mínimo: markdown no PR).

## 4. Fase 1 — Modelo de domínio e URL

1. **Union de item de descoberta** (nome exemplificativo):
   - `DiscoverItemProfessional` — prolonga ou substitui mentalmente `LinketSearchItem` atual.
   - `DiscoverItemPerformance` (ou `PublicProject`) — `projectId`, título, workspace, faixa, local, categorias, imagem, trecho de descrição, links para ficha.
2. **`LinketSearchResult.items`:** passa a `DiscoverItem[]` (union) **ou** mantém nome estável `LinketSearchItem` expandido com `kind: 'linket' | 'project'` — decisão na Fase 0 com impacto em testes.
3. **`LinketSearchQuery`:** adicionar chave opcional:
   - `resultKind?: 'all' | 'professionals' | 'performances'` (nomes afináveis), serializada em `search-query.ts` com defaults para URL limpa.
4. **Compat:** `marketLink` / `vertical` existentes continuam a filtrar ambos os tipos quando aplicável; documentar combinações (ex.: `vertical=imagem` + só projetos).

**Critério de saída:** `parseSearchQuery` ⇄ `searchQueryToString` com testes unitários novos cobrindo `resultKind` + regressão C2.

## 5. Fase 2 — Mocks (`@stec/olinket-shared-mocks`)

1. Definir schema **ProjetoPerformanceMock** (ou reutilizar nome do SL se copiarmos estrutura) com **todos** os campos necessários para paridade de card + metadados para detalhe.
2. Popular **N** projetos (mínimo = cobrir variantes de card SL: diferentes workspaces onde fizer sentido, categorias, faixas de preço).
3. **Bridge** em `linket-search-seed.ts` (ou sucessor): merge de `profissionais` derivados + `projetosPerformance` → lista unificada para o repositório.
4. Atualizar **ADR-004** / nota de versão do pacote se o schema público mudar.

**Critério de saída:** teste de schema (já existe padrão em `seeds-schema.test.ts`) + lista total de IDs estáveis para E2E.

## 6. Fase 3 — Repositório e filtros

1. `filterAndPageLinkets` → generalizar para **filtrar por kind** e por **workspace**, preservando `sort` e `q`.
2. Atualizar `useDiscoverySearch` / chips ativos para mostrar **“Só profissionais”** / **“Só performances”** quando `resultKind !== all`.
3. `AdvancedFiltersSheet`: avaliar se `resultKind` entra no sheet ou só na barra de resumo (preferência UX: **menos fricção** — chip rápido + sheet para o resto).

**Critério de saída:** mesma contagem `total` coerente com filtros; testes em `linket-search-filters.test.ts`.

## 7. Fase 4 — UI lista (`/discover`)

1. Novo componente ou evolução de `DiscoverProfessionalCard`:
   - **Variante profissional** — paridade com SL ProfessionalCard (campos em falta: acrescentar).
   - **Variante projeto/performance** — paridade com SL project card (layout pode partilhar shell: imagem, título, meta, preço, CTA **Ver …**).
2. **Test ids:** `professional-discovery-card` pode tornar-se genérico `discover-grid-card` + `data-kind=` — definir para não quebrar E2E (migrar smoke com grep).
3. **Home Destaques:** decidir se inclui **só Linkets** ou também 1 linha de projetos — recomendação: **só profissionais** na home para não misturar mensagem “Destaques”; documentar.

**Critério de saída:** screenshot mental = grelha com ≥2 tipos visíveis; filtro `resultKind` testado manualmente e em E2E.

## 8. Fase 5 — Fichas completas

1. **Profissional:** já existe `/discover/[slug]` — completar **campos em falta** no `TemplateDefault` / abas conforme inventário SL (sem regressão de “contratar no final”).
2. **Projeto/performance:** definir rota canónica:
   - Opção A — `/discover/p/[slug]` ou `/discover/project/[slug]` (recomendado para não colidir com slug de profissional).
   - Opção B — prefixo no mesmo segmento `[slug]` com **resolver** que distingue profissional vs projeto (maior risco de colisão de nomes).
3. Reutilizar padrões de detalhe SL (`public-project-details` / equivalente) adaptados ao **Template** Olinket.

**Critério de saída:** visitante vê ficha projeto **sem login**; CTA contratação alinhado ao fluxo evento + `linketHint` ou equivalente para projeto (definir na Fase 0 se projeto implica outro hint).

## 9. Fase 6 — Documentação e testes

| Artefacto | Atualizar |
|-----------|-----------|
| `ui-canonical/discover-listagem.md` | Tipos de cartão, filtros, testids. |
| `ui-canonical/discover-ficha-profissional.md` + novo doc ficha projeto | Campos e estados. |
| `user-flows/.../descoberta.md` | Lista mista + URL `resultKind`. |
| `matriz-telas.md` | Linha Descobrir / ficha projeto. |
| E2E | `smoke-routes` / `descobrir-detalhe` + novo spec navegação projeto. |

**Critério de saída:** checklist pós-implementação do repo (lint, test, typecheck, tamanho de ficheiros).

## 10. Riscos e decisões em aberto

| Risco | Mitigação |
|-------|-----------|
| Colisão slug profissional vs projeto | Rotas separadas ou prefixo (`/discover/project/...`). |
| Pacote shared-mocks inchado | Manter seeds em subpastas por tipo; documentar exports públicos. |
| Performance da lista com muitos mocks | Paginação já existe; validar `pageSize` default. |
| Paridade literal impossível (ex.: integração SoundLink workspace) | Campo `[PLANEJADO]` na UI + doc gap. |

## 11. Ordem de execução recomendada

```
Fase 0 → Fase 1 → Fase 2 → Fase 3 → Fase 4 → Fase 5 → Fase 6
```

**Não** pular Fase 0: é barata em tempo e evita retrabalho nos mocks.

## 12. Quando **não** faria este plano inteiro

- Se o produto voltasse atrás e quisesse **duas rotas** `/discover/professionals` e `/discover/performances` — aí o plano mudaria (menos union, mais rotas).
- Se a API BFF já estivesse disponível — substituiríamos Fase 2–3 por contrato OpenAPI e adapter; o resto mantém-se.

---

*Este ficheiro é o plano mestre; execução deve ser pedida explicitamente (Agent mode / “executar o plano”), alinhado à regra `plan-mode-vs-execution.mdc`.*
