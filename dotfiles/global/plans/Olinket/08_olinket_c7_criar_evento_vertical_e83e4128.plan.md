---
name: 08 olinket c7 criar evento vertical
overview: "Corte 7 — Criar evento Parte 2: seções específicas por vertical (Música, Fotografia, Gastronomia, Construção) via discriminated union, estendendo o wizard do Corte 6 sem quebrar o schema comum."
status: completed
completedAt: "2026-04-23"
todos:
  - id: f1
    content: Fase 1 — EventVerticalSchema (discriminated union) com música, fotografia, gastronomia, construção
    status: completed
  - id: f2
    content: Fase 2 — Forms verticais carregados dinamicamente em event-form-vertical/
    status: completed
  - id: f3
    content: Fase 3 — Passo 'Especificidades' no wizard entre localização e preço
    status: completed
  - id: f4
    content: Fase 4 — Presets por vertical estendendo event-templates.ts
    status: completed
  - id: f5
    content: Fase 5 — Testes de schema por vertical + E2E cobrindo 2 verticais + gates verdes
    status: completed
isProject: false
---


# 08 — Corte 7: Criar evento, Parte 2 (seções por vertical)

> **Posição na sequência:** 8 de 10. Depende do Corte 6 (wizard + schema comum).
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§8), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§8), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md) (§5)

## Objetivo

Estender o `EventDraftSchema` com uma **discriminated union** por `verticalWorkspace`, e adicionar passos/formulários por vertical carregados dinamicamente no wizard do Corte 6.

## Não fazer

- Refazer a seção comum do schema (já foi feita no Corte 6).
- Adicionar verticais sem mock correspondente (pedir ao Corte 0 se faltar).
- Mexer na navegação do wizard além do necessário para incluir o passo vertical.

## Fases

### Fase 1 — Schema por vertical

- Em [src/features/eventos/domain/schemas/event.schema.ts](src/features/eventos/domain/schemas/event.schema.ts):
  - `EventVerticalSchema = z.discriminatedUnion("verticalWorkspace", [musicaSchema, fotografiaSchema, gastronomiaSchema, construcaoSchema])`.
  - Cada schema vertical com campos específicos:
    - **Música:** repertório esperado, estilos, duração, necessidade de palco/PA, referências.
    - **Fotografia:** horas de cobertura, entregáveis (álbum/digital), equipe extra.
    - **Gastronomia:** nº de convidados, menu/opções, restrições alimentares, serviço (buffet/empratado).
    - **Construção:** tipo de obra, prazo, medidas/metragem, permissões.
- `EventDraftSchema = commonSchema.and(EventVerticalSchema)`.

### Fase 2 — Formulários verticais

- `src/features/eventos/presentation/components/event-form-vertical/`:
  - `musica.tsx`, `fotografia.tsx`, `gastronomia.tsx`, `construcao.tsx`.
- Carregamento dinâmico a partir do passo correspondente do wizard (usar `React.lazy` ou mapa estático de imports — escolher conforme bundle).
- Reusa primitives de [packages/olinket-ui](packages/olinket-ui/src/index.ts).

### Fase 3 — Passo "Especificidades" no wizard

- Inserir passo entre `step-localizacao-data` e `step-preco-pacotes`:
  - `step-especificidades.tsx` seleciona `verticalWorkspace` (se não veio de um preset) e monta o form vertical.
- Navegação adapta-se: o conteúdo muda sem recarregar o wizard.

### Fase 4 — Presets por vertical

- Estender `event-templates.ts` (Corte 6) com presets por vertical:
  - `musica:casamento`, `musica:corporativo`, `fotografia:casamento`, etc.
- Seeds do Corte 0 alimentam sugestões (ex.: lista de repertórios comuns).

### Fase 5 — Testes e gates

- Ampliar testes de schema:
  - Cada vertical valida seus campos obrigatórios.
  - União rejeita combinações inválidas.
- **E2E** em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts):
  - `/eventos/novo` com preset `musica:casamento` → passo especificidades já preenchido → submeter.
  - `/eventos/novo` mudando para `fotografia` → formulário troca dinamicamente → submeter.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- `verticalWorkspace` como discriminator usado também no `template-resolver` do Corte 3 — preservar a lista sincronizada (constante compartilhada em `src/features/eventos/domain/types/vertical-workspace.ts`).

## Definição de pronto (DoD)

- Criar evento funciona para **≥ 2 verticais distintos** com seção específica validada.
- Presets vertical-específicos funcionam.
- Gates verdes; frontmatter `status: completed`.
