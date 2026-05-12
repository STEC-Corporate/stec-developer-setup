---
name: 03 olinket c2 home busca primeira vista
status: completed
overview: Corte 2 — Home com hero mínimo (só barra de pesquisa) e `/descobrir` como 1.ª vista de resultados (resumo + amostras + prova social), alimentada pelos mocks do Corte 0.
todos:
  - id: f1
    content: Fase 1 — Hero mínimo em olinket-public-home.tsx + SearchInputHero submete para /descobrir?q=
    status: completed
  - id: f2
    content: Fase 2 — search-query.ts + refactor de linket-search-filters para a query unificada
    status: completed
  - id: f3
    content: Fase 3 — /descobrir com resumo + amostras agrupadas por Formação Artística + prova social
    status: completed
  - id: f4
    content: Fase 4 — Promover blocos reutilizáveis a packages/olinket-ui/src/blocks/
    status: completed
  - id: f5
    content: Fase 5 — Testes unit + E2E cobrindo hero e 1.ª vista + gates verdes
    status: completed
isProject: false
---


# 03 — Corte 2: Home + 1.ª vista de resultados

> **Nota de entrada (2026-04-23):** após patch pós-DoD do C1, a barra de busca
> já vive no **body da home** (`src/components/home/home-search-input.tsx`),
> logo abaixo dos CTAs do hero, e submete para `/descobrir?q=…`. O C2 **não
> cria** essa barra do zero: **refactora e promove** esse componente a
> `SearchInputHero` em `packages/olinket-ui/src/blocks/` (Fase 4), liga-o à
> query unificada da Fase 2, e reduz o resto do hero conforme Fase 1. O
> `PublicHeader` deixou de hospedar o campo de busca e assim continuará.
>
> **Posição na sequência:** 3 de 10. Depende do Corte 0 (mocks) e do Corte 1 (headers em camadas; busca no body da home).
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§4, §6), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§2, §4), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md) (§0, §1)
> **Referência UX:** `PublicProjectSearchView`, `EventSearchView`, `ProfessionalSearchView` em `D:\SoundLink\Projetos\soundlink-template-frontend` (inspiração de layout e densidade — **não** cópia).

## Objetivo

(1) Reduzir o hero da home a **apenas** a barra de pesquisa (decisão §4). (2) Implementar `/descobrir` como a **1.ª camada** de resultados: resumo da query, amostras agrupadas por Formação Artística / portfólio, prova social.

## Não fazer

- Implementar filtros avançados completos ou sheet/drawer de filtros (é Corte 3).
- Criar tela de detalhe adaptativo por vertical (é Corte 3).
- Listar rostos no hero (violaria decisão §4).
- Tratar "Linket" como único centro da busca; amostras vivem em **Formação Artística** e portfólios (decisão §4).

## Fases

### Fase 1 — Hero mínimo na home

- **Ponto de partida (pós-C1):** já existe `HomeSearchInput` em
  `src/components/home/home-search-input.tsx`, colado no hero logo abaixo dos
  três CTAs; o `PublicHeader` não tem busca. A Fase 1 **reduz o hero** e
  **renomeia/adapta** esse componente, não o cria.
- Refatorar [src/components/home/olinket-public-home.tsx](src/components/home/olinket-public-home.tsx):
  - Remover listagens / rostos no hero (já não há rostos; garantir).
  - Hero: headline curto + `SearchInputHero` (evolução de `HomeSearchInput`) +
    2 CTAs secundários (`Criar evento`, `Descobrir profissionais`) — reduzir os
    3 actuais.
  - Blocos abaixo do hero (Como funciona, Categorias, Duas vias, CTA final) podem permanecer enxutos — prova social e amostras movem-se para a 1.ª vista de resultados.
- `SearchInputHero` submete → `router.push('/descobrir?q=<termo>')` (mantém o
  contrato já em uso).
- **Não** reintroduzir busca no `PublicHeader`.

### Fase 2 — Estrutura de query na URL

- Definir `src/features/busca/application/services/search-query.ts` com parse/stringify de `?q=&vertical=&localizacao=` (fonte única).
- Refactor de [src/features/busca/application/services/linket-search-filters.ts](src/features/busca/application/services/linket-search-filters.ts) para aceitar essa query.

### Fase 3 — `/descobrir` como 1.ª vista

- Evoluir [src/app/descobrir/page.tsx](src/app/descobrir/page.tsx):
  - **Cabeçalho de resumo:** "N resultados para `<q>`" + chips com filtros ativos (ainda sem painel avançado).
  - **Amostras:** grid de cards agrupados por **Formação Artística** (label do Corte 0) e portfólio; cada card mostra foto, nome, vertical/Workspace e 1 linha de prova.
  - **Prova social:** bloco com depoimentos / destaques a partir dos mocks.
- Ler de `@stec/olinket-shared-mocks` (consumir seeds `profissionais`, `formacoesArtisticas`, `eventos` conforme fizer sentido).
- Repositório local em `src/features/busca/infrastructure/` passa a ler do package em vez dos seeds locais (manter `linket-search-seed.ts` como bridge — ver hook do Corte 0).

### Fase 4 — Blocos reutilizáveis em `@stec/olinket-ui`

- Promover `SearchInputHero` (antigo `HomeSearchInput` do patch pós-C1) para
  `packages/olinket-ui/src/blocks/search-input-hero.tsx`; a versão em
  `src/components/home/home-search-input.tsx` passa a **re-exportar** ou é
  removida (preferir remoção quando o import site for único).
- Avaliar `ResumoResultados`, `AmostraCard` para promoção (sem novo release
  ainda — versão local basta; release próprio se o Corte 3 consolidar).

### Fase 5 — Testes e gates

- Testes unit:
  - `search-query.test.ts` (parse/stringify roundtrip).
  - `linket-search-filters.test.ts` atualizado para a nova query.
  - Render teste de `OlinketPublicHome` validando **ausência** de listagem de rostos no hero e presença de `SearchInputHero`.
- **E2E** em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts):
  - `/` → digitar no campo → submeter → chegar em `/descobrir?q=...` com resumo e amostras visíveis.
  - `/descobrir?q=teste` → cards com foto/nome e bloco de prova social renderizam.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- `search-query.ts` já prevê chaves para filtros avançados (`vertical`, `localizacao`, etc.) — Corte 3 apenas estende.
- Cada `AmostraCard` deve expor `href` para a rota do detalhe adaptativo (`/descobrir/[slug]`) — placeholder 404 por enquanto, conteúdo no Corte 3.

## Definição de pronto (DoD)

- Hero contém **apenas** a barra de pesquisa (visualmente e em testes).
- `/descobrir?q=<termo>` mostra as três camadas (resumo, amostras, prova social).
- Dados provenientes de `@stec/olinket-shared-mocks`.
- Gates verdes; frontmatter `status: completed`.
