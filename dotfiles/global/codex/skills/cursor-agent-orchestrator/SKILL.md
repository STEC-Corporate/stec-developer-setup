---
name: cursor-agent-orchestrator
description: Orquestra uso de multiplos agentes, paralelizacao e logging estruturado em projetos com padroes do Cursor. Use quando o usuario permitir delegacao, subagentes ou execucao paralela, e quando for importante registrar claramente quais agentes, skills e regras foram usados.
---

# Cursor Agent Orchestrator

Use esta skill quando houver permissao explicita do usuario para usar subagentes ou trabalho paralelo.

## Objetivo

Padronizar como o Codex delega tarefas relacionadas aos agents/skills/rules da `.cursor`, com rastreabilidade clara.

## Regras de orquestracao

1. So delegue quando o usuario permitir explicitamente subagentes, delegacao ou paralelizacao.
2. Delegue apenas subtarefas independentes e bem definidas.
3. Mantenha um write set separado por agente sempre que houver edicao.
4. Nao delegue o passo critico imediato se isso bloquear a proxima acao local.
5. Antes de delegar, registre o plano curto de execucao.

## Logging obrigatorio

Quando houver orquestracao, registre no andamento:

```text
Orquestracao ativa:
- modo: paralelo | sequencial
- objetivo: <...>
- agentes planejados: <...>
- skills de suporte: <...>
```

Quando um subagente for acionado, registre:

```text
Delegacao:
- agente: <nome ou papel>
- responsabilidade: <escopo>
- write_set: <arquivos ou modulo>
```

Na resposta final, inclua:

```text
Rastreabilidade de execucao:
- agentes usados: <...>
- paralelizacao: sim | nao
- skills usadas: <...>
- rules aplicadas: <...>
```

## Mapeamento sugerido Cursor -> Codex

- `.cursor/agents/arquitetura-*` -> explorador ou worker focado em arquitetura
- `.cursor/agents/testes-*` -> worker ou explorador de testes
- `.cursor/agents/seguranca-*` -> explorador de revisao de risco
- `.cursor/agents/docs-*` -> worker ou explorador documental
- `.cursor/agents/orquestracao-*` -> coordenacao do plano principal

## Limitacoes

- Esta skill nao transforma automaticamente agents da `.cursor` em subagentes nativos do Codex.
- Ela define o protocolo de decisao, paralelizacao e logging para que o comportamento fique previsivel.
