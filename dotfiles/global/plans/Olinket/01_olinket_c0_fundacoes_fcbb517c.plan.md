---
name: 01 olinket c0 fundacoes
overview: Corte 0 (primeiro da sequencia) — criar o package de mocks compartilhados @stec/olinket-shared-mocks, consolidar a terminologia (Profissionais, Formação Artística, Projeto no novo sentido) e registrar ADRs que formalizam estas decisões. Desbloqueia todos os cortes seguintes.
todos:
  - id: f1
    content: Fase 1 — Package @stec/olinket-shared-mocks (estrutura, schemas, seeds, build, workspaces)
    status: completed
  - id: f2
    content: Fase 2 — Terminologia global (Profissionais, Formação Artística, Projeto) em src/, packages/olinket-ui/, docs/
    status: completed
  - id: f3
    content: Fase 3 — ADR-004, addendum ADR-001 e checklist §11 dos 8 docs afetados
    status: completed
  - id: f4
    content: Fase 4 — Testes unit dos mocks, atualizar jest.config.cjs, gates verdes
    status: completed
isProject: false
status: completed
---


# 01 — Corte 0: Fundações (mocks compartilhados + terminologia + ADRs)

> **Posição na sequência:** 1 de 10. Pré-requisito de todos os outros cortes.
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md)

## Objetivo

Criar a fundação comum a todos os cortes: (1) seeds/mocks consumíveis por Olinket e SoundLink; (2) terminologia final; (3) ADRs que formalizam as decisões.

## Não fazer

- Alterar componentes visuais ou rotas (isso começa no Corte 1/2).
- Fazer o SoundLink consumir o package agora (fica para quando o corte correspondente for executado no repo SoundLink).
- Refactor de features (`src/features/*`) além do necessário para trocar strings de terminologia.

## Fases

### Fase 1 — Package `@stec/olinket-shared-mocks`

- Criar `packages/olinket-shared-mocks/` com `package.json` (name `@stec/olinket-shared-mocks`, version `0.1.0`, `publishConfig` alinhado ao [ADR-003](docs/gestao-ideias/00-governanca/decisoes/adr-003-estrategia-pacotes-cross-repo.md)).
- Estrutura:
  - `src/schemas/` — zod schemas para evento, profissional, formacao-artistica, projeto-musico.
  - `src/seeds/eventos.ts`, `seeds/profissionais.ts`, `seeds/formacoes-artisticas.ts`, `seeds/projetos.ts`.
  - `src/index.ts` — exports públicos tipados.
- Adicionar ao `workspaces` de [package.json](package.json) e incluir em `transpilePackages` de [next.config.js](next.config.js).
- Build com `tsup` (mesmo padrão de [packages/olinket-ui/package.json](packages/olinket-ui/package.json)).

### Fase 2 — Terminologia global

- Audit de strings em `src/`, `packages/olinket-ui/src/`, `docs/` (excluir ADRs históricos e `.cursor/plans/*` antigos):
  - "Prestador" (copy de UI) → "Profissional" / "Profissionais".
  - "Projetos" (contexto vitrine / formação em rede) → "Formação Artística".
  - Reservar "Projeto" para o novo sentido (obra do músico: clipe, gravação de DVD).
- Atualizar schemas/types: criar `formacao-artistica.schema.ts` e renomear usos.
- Manter rota `/prestador` intacta (URL histórica) mas trocar copy e título.

### Fase 3 — ADRs e checklist §11

- **ADR-004** `docs/gestao-ideias/00-governanca/decisoes/adr-004-mocks-partilhados-cross-repo.md` — justificativa, estrutura do package, relação com ADR-003, política de evolução (local → GitHub Packages).
- **Addendum ao ADR-001** — seção nova "Terminologia final" (Profissionais, Formação Artística, Projeto-músico) + "Busca pública só na Olinket".
- Executar checklist §11 de [decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md):
  - [ ] `visao-olinket-soundlink-paridade-e-proximo-plano.md` (§2, §4, §10)
  - [ ] `matriz-ecras-soundlink-olinket.md`
  - [ ] `referencia-soundlink-template-frontend-ux.md`
  - [ ] `areas-contratante-workspaces-auth.md`
  - [ ] `glossario-olinket.md`
  - [ ] `jornada-contratante-mvp.md`
  - [ ] `plano-olinket-workspaces-e-contratante.md`
  - [ ] Marcar [.cursor/plans/Olinket/olinket_workspaces_contratante_build-ready_908b9e64.plan.md](.cursor/plans/Olinket/olinket_workspaces_contratante_build-ready_908b9e64.plan.md) como substituído por esta série.

### Fase 4 — Testes e gates

- Testes unit em `packages/olinket-shared-mocks/src/__tests__/` validando:
  - Schemas aceitam todos os seeds.
  - Relações cruzadas (todo profissional referido num evento existe em `profissionais`).
- Atualizar [jest.config.cjs](jest.config.cjs) incluindo o package novo.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- Exportar tipos `EventMock`, `ProfissionalMock` prontos para serem consumidos no Corte 2 (`/descobrir`) e Corte 4 (CRM).
- Deixar `src/features/busca/infrastructure/linket-search-seed.ts` apontando para os novos seeds (sem apagar seed antigo — só redirecionar).

## Definição de pronto (DoD)

- `import { eventos, profissionais } from "@stec/olinket-shared-mocks"` funciona nos dois lados (Olinket já; SoundLink validado por smoke manual no repo `D:\SoundLink\Projetos\soundlink-template-frontend`).
- ADR-004 aprovado e addendum ao ADR-001 mergeado.
- Checklist §11 100% marcada.
- Typecheck + lint + test + e2e verdes.
- Frontmatter deste plano atualizado para `status: completed`.
