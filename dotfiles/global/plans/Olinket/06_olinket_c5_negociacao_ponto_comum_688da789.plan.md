---
name: 06 olinket c5 negociacao ponto comum
overview: Corte 5 — Ponto comum de negociação entre contratante e prestador, evoluindo propostas/contratos/pagamentos/mensagens, com copy e estados alinhados a "Gestão de evento" e "Relacionamento com Clientes" do SoundLink.
status: completed
todos:
  - id: f1
    content: Fase 1 — docs/planejamento/negociacao-olinket.md com tabela estado produto × técnico × UI
    status: completed
  - id: f2
    content: Fase 2 — Refactor dos serviços de domínio (proposta-state, criar-contrato, pagamentos, mensagens) + testes
    status: completed
  - id: f3
    content: Fase 3 — Hub /eventos/[id] com 5 tabs e painel 'Próxima ação'
    status: completed
  - id: f4
    content: Fase 4 — Simulação bilateral via ?lado=contratante|prestador
    status: completed
  - id: f5
    content: Fase 5 — Mensagens contextuais por evento com citação de propostas/contratos
    status: completed
  - id: f6
    content: Fase 6 — E2E happy-path (proposta → contrato → pagamento) + gates verdes
    status: completed
isProject: false
---


# 06 — Corte 5: Negociação (Propostas + Contratos + Pagamentos + Mensagens)

> **Posição na sequência:** 6 de 10. Depende do Corte 4 (eventos listados) e do Corte 1 (header contratante).
> **Plano mestre:** [.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md](.cursor/plans/Olinket/olinket_adequacao_cortes_8aac32b9.plan.md)
> **Docs P0 obrigatórios:** [docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md](docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md) (§9), [docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md](docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) (§7, §9), [docs/planejamento/matriz-ecras-soundlink-olinket.md](docs/planejamento/matriz-ecras-soundlink-olinket.md) (§3)
> **Referência UX:** "Relacionamento com Clientes", "Gestão de evento" e página individual do evento (músico) em `D:\SoundLink\Projetos\soundlink-template-frontend`.

## Objetivo

Alinhar contratante e prestador num **mesmo ponto** de negociação por evento, consolidando estados/UI das features existentes [src/features/propostas](src/features/propostas/), [src/features/contratos](src/features/contratos/), [src/features/pagamentos](src/features/pagamentos/), [src/features/mensagens](src/features/mensagens/).

## Não fazer

- Integrar provedor real de pagamento (escrow/pass-through fica para fase de backend).
- Alterar terminologia (foi feito no Corte 0).
- Criar rotas totalmente novas fora do hub do evento — evoluir as existentes (`/eventos/[id]/*`).

## Fases

### Fase 1 — Tabela produto × técnico × UI

- Documento `docs/planejamento/negociacao-olinket.md`:
  - Estados de proposta (rascunho, enviada, aceite, recusada, contra-proposta, expirada) ↔ enum técnico.
  - Estados de contrato (pendente assinatura, assinado, em execução, concluído, cancelado).
  - Estados de pagamento (aguarda, processando, liquidado, reembolsado, falhado).
  - Regras de UI: que botões/badges ficam ativos por estado; transições permitidas; mensagens contextuais.
- Referência explícita aos arquivos SoundLink consultados.

### Fase 2 — Refactor dos serviços de domínio

- Reforçar [src/features/propostas/domain/proposta-state.service.ts](src/features/propostas/domain/proposta-state.service.ts) com guardas de transição conforme tabela.
- Reforçar [src/features/contratos/application/services/criar-contrato-de-proposta.service.ts](src/features/contratos/application/services/criar-contrato-de-proposta.service.ts) e serviços pares em `pagamentos`, `mensagens`.
- Expandir testes existentes ([src/features/propostas/__tests__/proposta-state.service.test.ts](src/features/propostas/__tests__/proposta-state.service.test.ts), [src/features/contratos/__tests__/criar-contrato-de-proposta.service.test.ts](src/features/contratos/__tests__/criar-contrato-de-proposta.service.test.ts)) para cobrir todas as transições.

### Fase 3 — Hub do evento como ponto comum

- Evoluir [src/app/eventos/[id]/page.tsx](src/app/eventos/[id]/page.tsx) como painel central:
  - Tabs: **Resumo**, **Propostas**, **Contratos**, **Pagamentos**, **Mensagens** (query `?tab=`).
  - Badge do `EventStatus` no topo.
  - Painel lateral "Próxima ação" com base nos estados (decisão §9: mesmo ponto para ambos os lados).
- Rotas filhas [src/app/eventos/[id]/propostas/[propostaId]/page.tsx](src/app/eventos/[id]/propostas/[propostaId]/page.tsx), [/contratos/[contratoId]/page.tsx](src/app/eventos/[id]/contratos/[contratoId]/page.tsx), [/pagamentos/[pagamentoId]/page.tsx](src/app/eventos/[id]/pagamentos/[pagamentoId]/page.tsx) herdam o badge e a próxima ação.

### Fase 4 — Simulação bilateral (contratante + prestador no mesmo mock)

- Toggle/flag no mock (ou prefixo `?lado=contratante|prestador`) que permite ver o mesmo evento sob ambas as óticas, sem duplicar código — chave para validar o "ponto comum".
- Copy distinto por lado (contratante vê "Enviar proposta ao profissional"; prestador vê "Aceitar convite"), mas na **mesma tela** com mesmo ciclo.

### Fase 5 — Mensagens contextuais

- [src/features/mensagens](src/features/mensagens/) alinhada ao canal por evento (ver `olinket-kernel-composite.repository.ts` como padrão).
- Thread dentro da tab Mensagens; citação de propostas/contratos via IDs.

### Fase 6 — Testes e gates

- Testes unit expandidos por feature (transições, guardas, composição de mensagens).
- **E2E** happy-path em [tests/e2e/smoke-routes.spec.ts](tests/e2e/smoke-routes.spec.ts):
  - `/eventos/[id]?tab=propostas` → criar proposta → aceitar → contrato gerado → pagamento simulado concluído.
  - `?lado=prestador` mostra a mesma evolução com copy do outro lado.
- Gates: `npm run typecheck && npm run lint && npm run test && npm run test:e2e` verdes.

## Hooks para cortes seguintes

- A tabela estado×UI será **promovida** ao doc canônico do Corte 8 (Lifecycle).
- `src/features/pagamentos/domain/interfaces/payment-provider.ts` fica com o stub atual — troca real por provedor virá fora desta série.

## Definição de pronto (DoD)

- `/eventos/[id]` consolida as 5 tabs; próxima ação coerente com os estados.
- `?lado=` mostra contratante e prestador no mesmo ponto (simulação demo).
- `docs/planejamento/negociacao-olinket.md` mergeado.
- Gates verdes; frontmatter `status: completed`.
