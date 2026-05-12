---
name: Olinket — Home, Descobrir, Linket público e fluxo contratar (build-ready)
overview: Implementar especificação docs/planejamento/especificacao-home-descobrir-linket-publico.md — quatro cartões verticais na home, CTAs «Criar evento e contratar» / «Ver Linket completo», linketHint no wizard, footer institucional, SEO; PointLink fora da home nesta fase.
todos:
  - id: fase-1-home-areas
    content: "Home secção Áreas: quatro CategoriaCards → /descobrir?vertical=… (musica, imagem, catering, obras); copy SoundLink, Visual Link, GastroLink, BuildLink."
    status: completed
  - id: fase-2-destaques-cards
    content: LinketSearchCard + HomeHighlightsExplore — «Ver Linket completo»; «Criar evento e contratar»; texto auxiliar sem convidar; fluxo login→/eventos/novo?linketHint=.
    status: completed
  - id: fase-3-descobrir-vertical
    content: Validar Descobrir lista com vertical= na URL e UI (discovery-busca-view / filtros).
    status: completed
  - id: fase-4-detalhe-linket
    content: detalhe-profissional-view + template-default (+ templates) — renomear perfil→Linket onde aplicável; metadata slug; CTA e links coerentes.
    status: completed
  - id: fase-5-linket-hint-auth
    content: EventFormWizard/eventos/novo ler searchParams linketHint; normalizar lk-* vs linketId; entrar + safe-redirect-path para preservar hint.
    status: completed
  - id: fase-6-footer-legais
    content: FooterShell — remover GitHub/template STEC; links suporte, termos, privacidade (+ criar páginas placeholder).
    status: completed
  - id: fase-7-seo
    content: layout.tsx e páginas públicas — title/description com keywords multisetoriais.
    status: completed
  - id: fase-8-testes-qualidade
    content: E2E smoke + unitários query string; npm run test/lint/typecheck nos ficheiros tocados; PT-BR (remover PT-PT residual).
    status: completed
isProject: true
---

> **Status:** PRONTO PARA EXECUÇÃO | **Origem:** [docs/planejamento/especificacao-home-descobrir-linket-publico.md](../../docs/planejamento/especificacao-home-descobrir-linket-publico.md) | **Data:** 2026-04-28

# Build-ready — Home, Descobrir, página pública Linket e contratar

## Objetivo

Fechar o delta entre o código atual e a **especificação** alinhada ao produto: mesma narrativa **50/50** contratante/prestador no tom E+B+C; **sucesso da home** centrado em **Procurar**; cadastro e evento como passos seguintes.

## Fonte da verdade

- [especificacao-home-descobrir-linket-publico.md](../../docs/planejamento/especificacao-home-descobrir-linket-publico.md) (secções 3–7 e checklist técnico §4).

## Fora de escopo (esta entrega)

- **Cartão PointLink** na home (`vertical=ponto` pode permanecer disponível na Descobrir quando aplicável; ver [referencia-pointlink-template-frontend.md](../../docs/planejamento/referencia-pointlink-template-frontend.md)).
- Fluxo **Convidar** para colaboradores (**Contratante empresarial**) — produto futuro.
- Motor de dados real no BFF — manter seed/local conforme padrão atual.

---

## Fases e critérios de aceite

### Fase 1 — Áreas de contratação (`olinket-public-home.tsx`)

- Substituir CTAs que levam só a `/conta` por links para **`/descobrir?vertical=<slug>`** conforme tabela:

| Cartão | `vertical=` |
|--------|-------------|
| SoundLink (ou subtítulo músico) | `musica` |
| Visual Link | `imagem` |
| GastroLink | `catering` |
| BuildLink | `obras` |

- Grid **2×2** ou equivalente responsivo; **quatro** cartões apenas.
- **Aceite:** cada cartão abre Descobrir já filtrado pelo vertical; copy PT-BR com nomes de marca acordados.

### Fase 2 — Destaques e cards (`home-highlights-explore.tsx`, `linket-search-card.tsx`)

- Link secundário: texto **«Ver Linket completo»** (seta opcional).
- Botão principal: **«Criar evento e contratar»** (minúsculo em *contratar*).
- Garantir que utilizador **não autenticado** que pretende contratar seja enviado para **login** com retorno a `/eventos/novo?…` preservando `linketHint` (ver Fase 5).
- **Aceite:** testes E2E ou manuais cobrem strings novas e fluxo do href.

### Fase 3 — Descobrir (`discovery-busca-view`, filtros)

- Com `vertical` na URL, listagem e filtros refletem o ecossistema (já suportado por `parseSearchQuery`).
- **Aceite:** navegar Home → Descobrir por cartão mostra apenas profissionais daquele vertical no seed atual.

### Fase 4 — Detalhe público (`/descobrir/[slug]`)

- `generateMetadata` e cópias: «Perfil não encontrado» → formato **Linket** onde fizer sentido.
- `TemplateDefault` / `DetalheProfissionalView`: loading e CTAs alinhados à especificação; **«Criar evento e contratar»**.
- Corrigir **PT-PT** residual nos ficheiros tocados (ex.: «registada» → PT-BR).
- **Aceite:** não há «convidar» no CTA de contratação por evento; mensagens de gate login coerentes.

### Fase 5 — `linketHint` e auth

- **Lacuna §5.1:** `EventFormWizard` (ou wrapper de `/eventos/novo`) lê **`linketHint`** da query e pré-seleciona / pré-preenche o fluxo conforme modelo de dados existente.
- **Lacuna §5.2:** um único contrato de ID entre `lk-${profissional.id}`, `item.linketId` e mocks.
- **`/entrar`:** query `next` ou equivalente compatível com `safe-redirect-path` incluindo query string do novo evento.
- **Aceite:** link desde cartão → login (se anónimo) → novo evento com hint aplicado (teste E2E ou unitário do parser).

### Fase 6 — Footer (`FooterShell` em `olinket-public-home.tsx`)

- Remover link ao repositório GitHub / «template STEC» como destaque ao utilizador final.
- Incluir **Suporte** (`/suporte`), **Termos**, **Privacidade** — criar `app/termos/page.tsx` e `app/privacidade/page.tsx` no padrão de `/suporte` se ainda não existirem.
- **Aceite:** links não quebram; copy institucional mínima PT-BR.

### Fase 7 — SEO (`src/app/layout.tsx` + páginas tocadas)

- `metadata` global com keywords **multisetoriais** (eventos, música, imagem, gastronomia, obras — propor conjunto e validar leitura humana).
- **Aceite:** `title`/`description` não contradizem a especificação nem o glossário Olinket.

### Fase 8 — Qualidade

- `npm run test` (unitários afetados).
- E2E relevantes: home, descobrir, `eventos/novo` com hint (ajustar `tests/e2e/` existentes).
- `npm run lint` / `npm run typecheck` conforme política do repo.
- Checklist pós-implementação do projeto (tamanho de ficheiros, sem `console.log` acidental).

---

## Riscos e dependências

- **Hook LGPD + localização:** qualquer deteção automática de local **só** com opt-in explícito quando implementado (fora do MVP deste plano salvo já existir componente).
- **Paridade com PBR-04:** este plano **aprofunda** o tema já presente no índice [olinket-paridade-indice-planos-build-ready.plan.md](./olinket-paridade-indice-planos-build-ready.plan.md); evitar regressões nas rotas já cobertas por E2E.

---

## Após executar

- Atualizar referência cruzada na especificação (opcional): marcar «implementado» ou link para PR.
- Se alterar UI/rota/jornada visível: seguir fluxo em `docs/gestao-ideias/00-governanca/fluxo-documentacao-docs.md` (camada certa ou follow-up).
