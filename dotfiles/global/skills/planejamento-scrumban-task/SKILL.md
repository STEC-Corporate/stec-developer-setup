---
name: planejamento-scrumban-task
description: Gera ou preenche itens de trabalho Scrumban (quadro, DoR, DoD, WIP) a partir do guia e do template do repositório SoundLink. Use ao decompor trabalho, criar entradas em sprint-plan.md ou quando o usuário pedir tarefa/item Scrumban.
---

## Skills relacionadas (ciclo Scrumban)

- [planejamento-criar-sprint-plan](../planejamento-criar-sprint-plan/SKILL.md) — Scrumban plan em `sprint-plan.md`
- [planejamento-atualizar-sprint-progress](../planejamento-atualizar-sprint-progress/SKILL.md) — plano e relatório do ciclo
- [planejamento-criar-retrospective](../planejamento-criar-retrospective/SKILL.md) — `retrospective.md`
- Agente orquestrador: `.cursor/agents/planejamento-scrumban.md`

# Planejamento — item de trabalho Scrumban

## Quando usar

- Criar ou detalhar uma **US/TASK** para o quadro Scrumban.
- Inserir novos itens na seção de trabalho de um `sprint-plan.md` sob `docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/**`.
- O usuário pedir explicitamente "tarefa Scrumban", "item do quadro" ou equivalente.

## Fontes obrigatórias (ler antes de escrever)

1. [docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md](../../../docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/SCRUMBAN-GUIDE.md) — colunas, WIP, DoR, DoD, métricas.
2. [docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/_templates/scrumban-task-item-template.md](../../../docs/gestao-ideias/02-execucao/planejamento/planejamento-tarefas/tarefas/_templates/scrumban-task-item-template.md) — estrutura de saída.

Para trabalho de produto no SoundLink, consulte também:

- [docs/gestao-ideias/00-governanca/ia/guardrails.md](../../../docs/gestao-ideias/00-governanca/ia/guardrails.md)
- [docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md](../../../docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md)

## Regras

- **Fonte de verdade**: todo item deve ter link para US/TASK em `user-stories.md`, `tasks.md` ou issue; não inventar escopo sem referência.
- **WIP**: respeitar limites do guia (por padrão `InProgress` ≤ 2 e `Review` ≤ 2). Se o usuário já tiver mais itens nessas colunas, avisar e não sugerir estourar WIP sem justificativa.
- **Colunas válidas**: `Backlog`, `Ready`, `InProgress`, `Review`, `Done`, `Blocked`.
- **Saída**: um único bloco Markdown copiável, seguindo o template (títulos e tabelas do template), em português.

## Passos

1. Identificar título, ID opcional, link da fonte de verdade e coluna sugerida (ou `Ready` se ainda não estiver pronto para puxar).
2. Preencher checklist **DoR** apenas com itens aplicáveis; marcar o que falta se informação não foi dada (não supor).
3. Preencher **DoD** como lista de verificação para quando o item for concluído.
4. Se `Blocked`, preencher tabela de bloqueio com motivo e próxima ação.
5. Opcional: datas na tabela de cycle time se o usuário fornecer.

## Checklist de saída

- Bloco alinhado ao `scrumban-task-item-template.md`.
- Referência ao guia implícita na estrutura (não é necessário colar o guia inteiro).
- Nenhuma violação óbvia de guardrails na descrição do item (se aplicável ao escopo).
