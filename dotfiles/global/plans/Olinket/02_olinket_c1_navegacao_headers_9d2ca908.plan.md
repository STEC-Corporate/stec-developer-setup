---
name: 02 olinket c1 navegacao headers
overview: Corte 1 — Reconstruir o header da Olinket em três camadas (público, contratante, profissional simples) espelhando o padrão SoundLink, com rótulos PT finais, paridade de margens e gates verdes.
status: completed
todos:
  - id: f1
    content: Fase 1 — HeaderWrapper + config de roteamento por rota/sessão
    status: completed
  - id: f2
    content: Fase 2 — PublicHeader com entrada de busca (submit → /discover?q=)
    status: completed
  - id: f3
    content: Fase 3 — ContratanteHeader com 8 items (Dashboard…Mensagens)
    status: completed
  - id: f4
    content: Fase 4 — ProfissionalHeader simples (Descobrir + Meu Workspace)
    status: completed
  - id: f5
    content: Fase 5 — docs/gestao-tarefas/03-especificacao-produto/ui-canonical/header-olinket.md + testes unit + smoke E2E
    status: completed
  - id: f6
    content: Fase 6 — Gates (typecheck/lint/test/test:e2e) verdes
    status: completed
isProject: false
---


# 02 — Corte 1: Navegação e headers em camadas

> **Patch pós-DoD (2026-04-23):** a barra de busca da Fase 2 foi **movida
> do `PublicHeader` para o body da home** (`src/components/home/home-search-input.tsx`,
> logo abaixo dos CTAs). O contrato (`router.push('/discover?q=…')`) e a
> decisão ADR-001 §3.4 (busca pública só na Olinket) permanecem. Ver
> [docs/gestao-tarefas/03-especificacao-produto/ui-canonical/header-olinket.md](../../../docs/gestao-tarefas/03-especificacao-produto/ui-canonical/header-olinket.md)
> (nota superior) e Fase 1 do Corte 2, que formaliza este novo ponto de
> entrada como `SearchInputHero`.
>
> **Posição na sequência:** 2 de 10. Depende do Corte 0 (terminologia e mocks).
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§5), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§3, §7), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md) (§3)
> **Referência UX:** [docs/planejamento/referencia-soundlink-template-frontend-ux.md](docs/planejamento/referencia-soundlink-template-frontend-ux.md) + repo `D:\SoundLink\Projetos\soundlink-template-frontend` (`HeaderWrapper`, `PublicHeader`, `ContractorIndividualHeader`, `MusicianHeader`)

## Objetivo

Refatorar [src/components/site-header.tsx](src/components/site-header.tsx) num `HeaderWrapper` que seleciona, por rota/sessão, entre três headers distintos (público / contratante / profissional simples) — alinhados à divisão que o SoundLink já usa.

## Não fazer

- Implementar o conteúdo das rotas `Dashboard` ou `Mensagens` (é Corte 4/5).
- Ligar o input de busca a dados reais — só capturar query e navegar para `/discover?q=...` (Corte 2 fará a página).
- Alterar/publicar o pacote `@stec/olinket-ui` (apenas consumir primitives já existentes).

## Fases

### Fase 1 — Estrutura e roteamento do `HeaderWrapper`

- Criar `src/components/headers/header-wrapper.tsx` que decide o header a renderizar a partir de:
  - Rota (`usePathname`): prefixos `/contractor-individual`, `/contractor-business`, `/events` → contratante; `/prestador*` → profissional; restantes → público.
  - Sessão (ler de `src/features/auth`): anon vs logado condiciona CTAs "Entrar" vs "Olá, …".
- Config em `src/components/headers/header-wrapper.config.ts` (mapa rota→tipo de header) — paridade conceptual com `HeaderWrapper` do SoundLink.

### Fase 2 — `PublicHeader`

- `src/components/headers/public-header.tsx`: logo Olinket + campo de busca com submit → `router.push('/discover?q=...')` + links institucionais mínimos.
- Usar primitives do [packages/olinket-ui/src/index.ts](packages/olinket-ui/src/index.ts).
- Margens `px-4 md:px-6 lg:px-8` (visão §7, paridade SoundLink).

### Fase 3 — `ContratanteHeader`

- `src/components/headers/contratante-header.tsx` com nav: **Dashboard, Meu Perfil, Criar Evento, Buscar, Eventos, Contratos, Pagamentos, Mensagens** (ordem da matriz §3, rótulos PT).
- Links inativos (Dashboard, Mensagens) apontam para `#` ou rota placeholder com aviso "em preparação" — não quebram testes.
- Avatar + dropdown (Sair).

### Fase 4 — `ProfissionalHeader` (simples)

- `src/components/headers/profissional-header.tsx`: **só** "Descobrir" + "O meu Workspace" (deep link configurável).
- Regra de ouro (decisão §5 + visão §5): **não** reconstruir back-office aqui; apenas encaminhar.

### Fase 5 — Especificação e testes

- Documento `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/header-olinket.md` com:
  - Tabela items × breakpoints (desktop / mobile).
  - Estados (anon / logado) por camada.
  - Mapa de rotas → header.
- Testes unit (`__tests__/`):
  - Cada header renderiza os links esperados por estado.
  - `HeaderWrapper` escolhe corretamente por rota.
- **Smoke E2E** em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts):
  - `/` → public header visível.
  - `/conta` (após login demo) → contratante header visível.
  - `/prestador` → profissional header visível.

### Fase 6 — Gates

- `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- `PublicHeader` submete `q` via URL — a página de destino será implementada no Corte 2.
- `ContratanteHeader` já aponta para `Dashboard`, `Contratos`, `Pagamentos`, `Mensagens` — conteúdo vem em Cortes 4 e 5.
- `ProfissionalHeader` usa URL configurável por env para o Workspace — ponto de extensão do Corte 9.

## Definição de pronto (DoD)

- Três headers renderizam corretamente em suas rotas; smoke E2E cobre os três.
- `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/header-olinket.md` mergeado.
- `SiteHeader` antigo ou deprecado (reexport do `HeaderWrapper`) ou removido sem quebrar imports.
- Gates verdes. Frontmatter deste plano em `status: completed`.
