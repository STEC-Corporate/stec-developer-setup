---
name: 07 olinket c6 criar evento comum
overview: "Corte 6 — Criar evento Parte 1: refinar o formulário com os campos comuns a todos os Workspaces, em wizard por passos, baseado na aba \"Preço e Disponibilidade\" do SoundLink. Inclui templates/presets (ex.: Casamento, Corporativo)."
status: completed
completedAt: "2026-04-23"
todos:
  - id: f1
    content: Fase 1 — Worksheet de campos comuns baseado na aba Preço e Disponibilidade do SoundLink
    status: completed
  - id: f2
    content: Fase 2 — Refactor de EventDraftSchema com seção common + verticalWorkspace discriminator
    status: completed
  - id: f3
    content: Fase 3 — Wizard por passos (Identificação, Localização/Data, Preço/Pacotes, Resumo) com auto-save
    status: completed
  - id: f4
    content: Fase 4 — Templates/presets (Casamento, Corporativo, Aniversário) com 'Começar de um modelo'
    status: completed
  - id: f5
    content: Fase 5 — Testes unit do schema e do wizard + E2E happy-path + gates verdes
    status: completed
isProject: false
---


# 07 — Corte 6: Criar evento, Parte 1 (campos comuns)

> **Posição na sequência:** 7 de 10. Depende do Corte 0 (mocks + terminologia). Pode correr em paralelo com Cortes 4/5.
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§8), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§8), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md) (§5)
> **Referência UX:** `PublicProjectDetailsTabsList` + `PublicAvailabilityTabContent` + `PublicTimeGridCalendar` em `D:\SoundLink\Projetos\soundlink-template-frontend`.

## Objetivo

Refatorar [src/app/eventos/novo/page.tsx](src/app/eventos/novo/page.tsx) num **wizard por passos**, com a **seção comum** do formulário (aplicável a qualquer vertical) baseada nos campos da aba "Preço e Disponibilidade" do projeto público SoundLink.

## Não fazer

- Implementar seções específicas por vertical (é Corte 7).
- Ligar a provedor de pagamento real.
- Mexer em `/eventos/[id]` (negociação) — já foi consolidado no Corte 5.

## Fases

### Fase 1 — Levantamento de campos SoundLink

- Worksheet `docs/planejamento/worksheet-criar-evento-campos-comuns.md`:
  - Extração de campos: faixa de preço, tipo de evento, itens adicionais, pacotes genéricos, opção "ocultar preço".
  - Comportamento do calendário (recorrência, bloqueios, preset ao escolher dia).
  - Tradução para linguagem de "evento de contratação" (Olinket) — ajustar onde a semântica muda.
- Nota: `sistema-precos-modal*.tsx` no SoundLink existe mas **não** é a fonte principal — usar `PublicAvailabilityTabContent`.

### Fase 2 — Refactor do `EventDraftSchema` com seção comum

- Evoluir [src/features/eventos/domain/schemas/event.schema.ts](src/features/eventos/domain/schemas/event.schema.ts):
  - Seção `common` com todos os campos genéricos (título, descrição, localização reutilizando `KernelLocationSchema`, datas, faixa de preço, tipo de evento básico, pacotes/itens genéricos, `hidePricing`).
  - Campo `verticalWorkspace` já presente (string discriminator para o Corte 7).
- Preservar retrocompatibilidade com rascunhos existentes em `localStorage` — migrar no load se necessário.

### Fase 3 — Wizard por passos

- Componentes em `src/features/eventos/presentation/components/`:
  - `event-form-wizard.tsx` orquestrando passos.
  - `step-identificacao.tsx`, `step-localizacao-data.tsx`, `step-preco-pacotes.tsx`, `step-resumo.tsx`.
- Validação por passo com `zodResolver`; impede avançar com erros.
- Barra de progresso + navegação "Anterior/Próximo/Guardar rascunho".
- Auto-save do rascunho em `localStorage` (padrão já usado no repo).

### Fase 4 — Templates/presets

- `src/features/eventos/application/services/event-templates.ts`:
  - `casamento` (vertical Música padrão; pode ser sobrescrito no Corte 7).
  - `corporativo`.
  - `aniversario`.
- Botão "Começar de um modelo" no passo 1 aplica o preset e permite edição.

### Fase 5 — Testes e gates

- Ampliar [src/features/eventos/__tests__/event.schema.test.ts](src/features/eventos/__tests__/event.schema.test.ts):
  - Valida `common` isoladamente (sem seção vertical).
  - Testa discriminador `verticalWorkspace` aceitando valores válidos.
- Testes unit do wizard (render por passo + navegação).
- **E2E** em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts):
  - `/eventos/novo` → aplicar template "Corporativo" → preencher todos os passos → submeter → rascunho salvo, redireciona para `/eventos/[id]`.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- Schema preparado para `discriminated union` em `verticalWorkspace` — Corte 7 apenas **estende** sem recriar.
- Templates/presets são map `verticalWorkspace → preset` — Corte 7 adiciona novos.

## Definição de pronto (DoD)

- Wizard com ≥ 4 passos e validação por passo.
- `EventDraftSchema` com seção `common` e `verticalWorkspace` como discriminator.
- Presets funcionam sem erros.
- Gates verdes; frontmatter `status: completed`.
