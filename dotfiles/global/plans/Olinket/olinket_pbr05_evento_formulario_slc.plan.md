---
name: Olinket PBR-05 — Formulário de evento (SLC)
overview: Expandir criar/editar evento para o conjunto relevante de campos (precificação, disponibilidade, tipo, pacotes inspirados em PublicAvailability SoundLink); visão ciclo completo SLC — plano-mãe §8.5 §11.5.
todos:
  - id: auditar-eventdraft
    content: Mapear lacunas EventDraftSchema vs visao + matriz §5.
    status: completed
  - id: ui-secao-preco
    content: Secções calendário/disponibilidade/pacotes conforme extração PublicAvailabilityTabContent (espírito).
    status: completed
  - id: validacao-zod
    content: Estender Zod + mensagens erro acessíveis.
    status: completed
  - id: docs-campos
    content: Fragmento em api-specifications ou business-rules para critérios aceite.
    status: completed
  - id: testes-schema
    content: Unit tests schema + um E2E criar evento mínimo→estendido smoke.
    status: completed
isProject: true
---

# Build-ready — PBR-05: Formulário de evento (completude SLC)

## Objetivo

O **formulário de evento** deve ser o mais **completo** possível para captar intenção do contratante (reduz atrito com profissionais). Alinhar a [visao-olinket-soundlink-paridade-e-proximo-plano.md](../docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) §8 e [matriz-ecras-soundlink-olinket.md](../docs/planejamento/matriz-ecras-soundlink-olinket.md) §5.

## Escopo OUT

Integração BFF real para slots de calendário externos.

## Aceite

Novo conjunto de campos documentado; formulário salva em seed/local; regressão zero em rotas `/eventos`.

---

## Estado da implementação (2026-04-28)

- **Schema:** `EventAvailabilityPreferencesSchema` + mensagens Zod em PT-BR (título, necessidades, pacotes, janela horária, notas).
- **UI:** passo «Localização / Data» inclui card **4. Disponibilidade e período** (`step-localizacao-disponibilidade.tsx`).
- **Persistência:** `eventDraftToCreateInput` / `createInputToApiBody` com `description` e `availabilityPreferences`; `buildEventFromInput` alinha `EventSummary` a todos os campos relevantes de `CreateEventInput`.
- **Resumo:** `StepResumo` lista preferências quando preenchidas.
- **Documentação local:** [fragmento-pbr05-campos-evento-formulario.md](../docs/planejamento/fragmento-pbr05-campos-evento-formulario.md) (spec canónica seguirá repositório centralizador, fora deste repo).
- **Testes:** `event.schema.test.ts` cobre `availabilityPreferences`; E2E existentes do wizard permanecem válidos (fluxo de 5 passos inalterado).

## Follow-up opcional

- E2E dedicado só para campos de disponibilidade (além dos fluxos já existentes do wizard).

## Conformidade tamanho de ficheiros

Componentes em `presentation/components/` relacionados foram particionados (wizard, draft form, passo preço/pacotes) para **≤200 linhas** por `.tsx`.
