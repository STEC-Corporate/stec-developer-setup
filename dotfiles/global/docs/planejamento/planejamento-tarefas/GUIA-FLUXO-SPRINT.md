# Guia Completo: Fluxo de Trabalho Scrumban

> **Como usar os documentos de ciclo: sprint-plan, KPI, sprint-report e retrospective no modelo Scrumban com IA**

---

## Visão Geral

O projeto usa **Scrumban**: cadência de revisão (como Scrum) com operação por **fluxo pull** e **WIP limit** (como Kanban). O trabalho é organizado em **ciclos** (não sprints fixas de 2 semanas), e as tarefas são **puxadas** pelo estado do quadro, não empurradas por commitment rígido.

### Por que Scrumban com IA?

| Aspecto | Scrum puro | Scrumban (adotado) |
|---------|-----------|-------------------|
| Planejamento | Commitment de sprint | Refinamento contínuo + puxada |
| Progresso | Story points / velocity | Throughput + cycle time |
| Controle | Reuniões fixas | WIP limit + DoR/DoD |
| Papéis | PO, SM, Dev | Humano + IA (colaborativo) |
| Duração de ciclo | 2 semanas fixas | 1–2 semanas (flexível) |

### Quadro Scrumban

```
Backlog → Ready → InProgress → Review → Done
                                          ↑
                              Blocked (desvio)
```

- **WIP InProgress**: máximo 2 itens simultâneos
- **WIP Review**: máximo 2 itens simultâneos
- Um item só entra em `InProgress` quando atende o **DoR**
- Um item só vai para `Done` quando atende o **DoD**

---

## Documentos do Ciclo

Cada ciclo possui **3 documentos principais** usados em momentos específicos:

| Documento | Quando usar | Quem preenche | Estado inicial |
|-----------|-------------|---------------|----------------|
| **sprint-plan.md** | Início do ciclo (planning) | IA + humano | Completo (objetivo, quadro, tasks) |
| **sprint-report.md** | Final do ciclo (review) | Humano + IA | Template vazio |
| **retrospective.md** | Final do ciclo (melhoria) | Humano + IA | Template vazio |

> **OKR e KPI** existem como documentos de contexto e alinhamento estratégico — não são documentos operacionais de acompanhamento diário no Scrumban. O acompanhamento diário é feito pelo **quadro** (coluna de cada task) e pelas métricas de fluxo.

---

## Fluxo Completo do Ciclo

```
┌──────────────────────────────────────────────────────────┐
│ FASE 1: INÍCIO DO CICLO (Planning)                      │
├──────────────────────────────────────────────────────────┤
│                                                          │
│ IA + Humano criam:                                       │
│                                                          │
│ 1. sprint-plan.md                            COMPLETO    │
│    - Objetivo do ciclo                                   │
│    - User Stories selecionadas (com link US/TASK)        │
│    - Tasks com: escopo, saída esperada, deps             │
│    - Quadro Scrumban inicial (snapshot)                  │
│    - DoR e DoD do ciclo                                  │
│    - Riscos e bloqueios conhecidos                       │
│    └─ IA e humano leem para saber o que executar        │
│                                                          │
│ 2. Quadro KANBAN.md atualizado               ATUALIZADO  │
│    - Tasks novas adicionadas em Backlog ou Ready         │
│    - Itens sem dependências movidos para Ready           │
│    └─ Fonte de verdade do estado atual                  │
│                                                          │
└──────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│ FASE 2: DURANTE O CICLO (Execução por fluxo pull)       │
├──────────────────────────────────────────────────────────┤
│                                                          │
│ Regra principal: puxar itens de Ready → InProgress      │
│ apenas quando há capacidade (WIP < limite).             │
│                                                          │
│ 1. Verificar quadro (KANBAN.md)                          │
│    └─ Qual item em Ready tem DoR atendido?              │
│                                                          │
│ 2. Puxar item para InProgress                            │
│    - Atualizar KANBAN.md (coluna do item)               │
│    - Executar a task conforme escopo do sprint-plan      │
│                                                          │
│ 3. Ao concluir, mover para Review                        │
│    - Atualizar KANBAN.md                                │
│    - Registrar evidências (arquivo/print/link)           │
│    - Verificar DoD                                       │
│                                                          │
│ 4. Após revisão humana, mover para Done                  │
│    - Atualizar KANBAN.md                                │
│                                                          │
│ 5. Se bloqueado, mover para Blocked                      │
│    - Registrar motivo e tempo em Blocked                 │
│    - Resolver bloqueio antes de reentrar no fluxo        │
│                                                          │
│ Métricas a acompanhar (não diário, por item concluído): │
│    - Throughput: itens chegando em Done por período      │
│    - Cycle time: tempo de Ready → Done por item          │
│    - WIP atual: nunca ultrapassar limite                 │
│    - Bloqueios: quantidade e tempo em Blocked            │
│                                                          │
└──────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│ FASE 3: FINAL DO CICLO (Review)                         │
├──────────────────────────────────────────────────────────┤
│                                                          │
│ Humano + IA preenchem sprint-report.md:                  │
│                                                          │
│ 1. Throughput do ciclo                                   │
│    - Quantos itens chegaram em Done                      │
│    - Quais ficaram em Backlog/InProgress (carry-over)    │
│                                                          │
│ 2. Cycle time médio                                      │
│    - Tempo médio de Ready → Done                         │
│    - P95 se possível                                     │
│                                                          │
│ 3. WIP (pico observado)                                  │
│    - Maior WIP simultâneo em InProgress e Review         │
│                                                          │
│ 4. Bloqueios                                             │
│    - Quantidade de itens bloqueados                      │
│    - Principais motivos e tempo total em Blocked         │
│                                                          │
│ 5. Evidências mínimas por item (DoD)                     │
│    - Arquivo/print/link do resultado                     │
│    - Qualidade mínima: lint/ts/tests quando aplicável    │
│                                                          │
│ 6. Documentação criada/atualizada                        │
│                                                          │
└──────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│ FASE 4: RETROSPECTIVA (Melhoria contínua)               │
├──────────────────────────────────────────────────────────┤
│                                                          │
│ Humano + IA preenchem retrospective.md:                  │
│                                                          │
│ Foco Scrumban: estabilizar DoR/DoD e reduzir retrabalho │
│                                                          │
│ - O que reduziu WIP ou cycle time?                       │
│   └─ Manter e ampliar                                   │
│                                                          │
│ - O que gerou bloqueios ou retrabalho?                   │
│   └─ Ajustar DoR/DoD para prevenir na próxima vez       │
│                                                          │
│ - O WIP limit está calibrado?                            │
│   └─ Ajustar se review acumulou ou InProgress parou     │
│                                                          │
│ - Ações concretas para o próximo ciclo:                  │
│   └─ Focar em 1–2 ações, não em lista longa             │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

---

## Definition of Ready (DoR)

Um item só entra em `InProgress` quando tem:

```
[ ] Link para a US/TASK (fonte de verdade)
[ ] Critério(s) de aceite objetivo(s)
[ ] Escopo claro: o que entra e o que NÃO entra
[ ] Saída esperada definida: arquivos, componentes, docs
[ ] Dependências mapeadas e como tratar backend ausente (mock/real)
```

> Se algum item faltar, o item fica em `Ready` e o bloqueio é resolvido antes de puxar.

---

## Definition of Done (DoD)

Um item só vai para `Done` quando:

```
[ ] Evidência do resultado: arquivo, print ou link
[ ] Sem violações conhecidas de guardrails / clean architecture
[ ] Padrões .cursorrules respeitados quando aplicável
[ ] Documentação atualizada quando aplicável
[ ] Qualidade mínima verificada: lint/ts/tests quando aplicável
```

> O Review é o momento de verificar o DoD. Humano aprova antes de mover para Done.

---

## Regras do Fluxo

### Não fazer

1. **Não empurrar tarefas** para InProgress sem verificar WIP limit e DoR
2. **Não pular Review** — todo item passa por revisão antes de Done
3. **Não misturar métricas Scrum** (velocity, story points) com Scrumban — use throughput e cycle time
4. **Não acumular itens em Review** — se Review estiver cheio, parar InProgress e revisar primeiro
5. **Não preencher sprint-report durante o ciclo** — é um documento de fechamento

### Fazer

1. **Manter KANBAN.md atualizado** a cada mudança de estado de uma task
2. **Puxar apenas quando há capacidade** (WIP < limite)
3. **Registrar bloqueios imediatamente** — mover para Blocked e anotar motivo
4. **Resolver bloqueios antes** de puxar novos itens
5. **Fechar o ciclo com sprint-report** mesmo que incompleto — registrar o que ficou em carry-over

---

## Checklist por fase

### Início do ciclo
```
[ ] Revisar KANBAN.md e atualizar colunas
[ ] Ler sprint-plan.md do ciclo atual
[ ] Confirmar DoR dos itens em Ready
[ ] Verificar WIP limit antes de puxar o primeiro item
```

### Durante o ciclo (por item)
```
[ ] Verificar DoR antes de puxar para InProgress
[ ] Atualizar KANBAN.md ao mudar de coluna
[ ] Registrar evidência ao mover para Review
[ ] Verificar DoD antes de aprovar como Done
[ ] Registrar motivo e data ao mover para Blocked
```

### Fechamento do ciclo (nesta ordem)
```
[ ] 1. Atualizar KANBAN.md com estado final de todos os itens
[ ] 2. Preencher sprint-report.md
      [ ] Throughput (itens em Done)
      [ ] Cycle time médio
      [ ] WIP pico
      [ ] Bloqueios: quantidade e motivos
      [ ] Evidências por item (DoD)
      [ ] Carry-over: itens não concluídos
[ ] 3. Preencher retrospective.md
      [ ] O que reduziu cycle time / WIP?
      [ ] O que gerou bloqueios ou retrabalho?
      [ ] Ajustes em DoR/DoD para o próximo ciclo
      [ ] 1–2 ações concretas
```

---

## Exemplo Prático

### Ciclo 01 — Musician Profile (Cadastro e Info Pessoais)

#### Dia 0 — Planning
```
sprint-plan.md criado:
  Objetivo: implementar base do perfil com info pessoais
  Tasks em Ready: TASK-000 (sem deps), TASK-001 (sem deps), TASK-020 (sem deps)
  Tasks em Backlog: TASK-002 a TASK-019 (aguardam deps)

KANBAN.md atualizado:
  Ready: [TASK-000, TASK-001, TASK-020]
  Backlog: [TASK-002 ... TASK-019]
```

#### Dia 1 — Execução
```
Humano/IA verificam DoR de TASK-001:
  [x] Link para US000, US001
  [x] Critérios de aceite: estrutura src/features/musician-profile/ criada
  [x] Saída esperada: arquivos base com exports vazios
  [x] Deps: nenhuma

TASK-001 puxada para InProgress.
KANBAN.md atualizado.
```

#### Dia 2 — Review
```
TASK-001 concluída.
Evidência: estrutura de pastas criada (screenshot/link)
DoD verificado: [x] lint ok, [x] sem violações
TASK-001 → Review → Done.
KANBAN.md atualizado.

TASK-002 (deps: TASK-001) move de Backlog para Ready.
TASK-002 puxada para InProgress.
```

#### Final do ciclo — Review e Retro
```
sprint-report.md preenchido:
  Throughput: 18 itens em Done
  Cycle time médio: 1,5 dia
  WIP pico: 2 (dentro do limite)
  Bloqueios: 1 (TASK-007A aguardou definição de API — 2 dias)
  Carry-over: TASK-017, TASK-018, TASK-019 (testes — puxar no próximo ciclo)

retrospective.md preenchido:
  Funcionou: DoR evitou retrabalho em tasks de UI
  Melhorar: DoR para tasks de integração precisa incluir contrato de API mockado
  Ação: adicionar "contrato mock definido" ao DoR das tasks de integração
```

---

## Alinhamento entre documentos

```
sprint-plan.md define ESCOPO e QUADRO INICIAL
       ↓
KANBAN.md reflete ESTADO ATUAL (atualizado por item)
       ↓
sprint-report.md documenta RESULTADO (fechamento do ciclo)
       ↓
retrospective.md melhora PROCESSO (ajusta DoR/DoD)
       ↓
sprint-plan.md do próximo ciclo incorpora ajustes
```

> OKRs estratégicos ficam em `okrs-musician-profile.md` e são consultados para validar se o ciclo contribui para os objetivos — não são preenchidos diariamente.

---

## Perguntas frequentes

### P1: Qual a diferença de ciclo para sprint?
**R**: Ciclo é a cadência de revisão do Scrumban. A duração é flexível (1–2 semanas), sem commitment rígido de escopo. O que entra no ciclo é puxado pelo estado do quadro, não comprometido em planning.

### P2: Não preciso mais atualizar KPI diariamente?
**R**: Não como antes. O acompanhamento de progresso é feito pelo **KANBAN.md** (estado de cada task). O KPI e OKR são documentos de alinhamento estratégico, não de tracking operacional diário.

### P3: Story points ainda fazem sentido?
**R**: No Scrumban, as métricas principais são **throughput** (itens em Done por período) e **cycle time** (tempo de Ready → Done). Story points podem existir nos sprint-plans como estimativa de esforço, mas não são usados para velocity ou commitment.

### P4: O que é carry-over?
**R**: Itens que não chegaram a Done no ciclo atual. Eles permanecem no quadro com suas colunas atuais e são avaliados no início do próximo ciclo — podem ser repriorizados, ajustados ou continuar.

### P5: Quem aprova um item para Done?
**R**: O humano revisa e aprova após o DoD ser verificado. A IA pode concluir a execução e mover para Review, mas a transição Review → Done é validação humana.

### P6: Posso ter mais de um item em InProgress?
**R**: Sim, até o WIP limit (padrão: 2). Se Review estiver acumulando, reduza InProgress antes de aumentar WIP.

### P7: Quando crio um novo sprint-plan?
**R**: No início de cada ciclo. O sprint-plan do ciclo anterior permanece como registro histórico — não é sobrescrito.

---

## Documentos de referência

- [SCRUMBAN-GUIDE.md](./tarefas/SCRUMBAN-GUIDE.md) — guia rápido operacional
- [KANBAN.md](./KANBAN.md) — quadro global de tasks e EPICs
- [product-backlog.md](./product-backlog.md) — backlog global da plataforma

---

**Documento atualizado em**: 2026-03-25
**Versão**: 2.0 — migrado de Scrum para Scrumban
**Status**: Guia Completo
