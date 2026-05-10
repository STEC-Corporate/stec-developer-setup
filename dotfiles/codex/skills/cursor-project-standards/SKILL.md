---
name: cursor-project-standards
description: Detecta e aplica padroes definidos em projetos que possuem .cursor/agents, .cursor/skills e .cursor/rules. Use quando o repositorio tiver pasta .cursor, quando houver guardrails locais, padroes de arquitetura, ou quando o agente precisar reconhecer automaticamente convencoes do projeto antes de implementar.
---

# Cursor Project Standards

Use esta skill quando o projeto atual possuir uma pasta `.cursor/`.

## Objetivo

Transformar a pasta `.cursor/` em fonte ativa de padroes para o Codex, mesmo que ela nao seja consumida nativamente pelo runtime.

## Fluxo padrao

1. Verifique se existe `.cursor/README.md`.
2. Liste candidatos em:
   - `.cursor/agents/*.md`
   - `.cursor/skills/*/SKILL.md`
   - `.cursor/rules/*.mdc`
3. Identifique quais artefatos sao relevantes para a tarefa atual.
4. Leia apenas os arquivos necessarios.
5. Aplique os padroes encontrados durante a execucao.
6. Registre explicitamente no andamento e na resposta final o que foi usado.

## Prioridade de leitura

- Sempre comece por `.cursor/README.md`, se existir.
- Depois leia as rules mais aderentes ao stack e dominio.
- Consulte agents do dominio antes de tomar decisoes estruturais.
- Consulte skills quando houver processo padronizado a seguir.

## Heuristicas de roteamento

- Tarefa de arquitetura: priorize `.cursor/agents/arquitetura-*` e rules arquiteturais.
- Tarefa de codigo Python: priorize `.cursor/agents/python-*` e skills `python-*`.
- Tarefa de testes: priorize `.cursor/agents/testes-*` e skills `testes-*`.
- Tarefa de seguranca: priorize `.cursor/agents/seguranca-*` e skills `seguranca-*`.
- Tarefa de documentacao: priorize `.cursor/agents/docs-*` e skills `docs-*`.
- Tarefa ampla com multiplos dominios: consulte tambem `orquestracao-*`.

## Contrato de rastreabilidade

Sempre que esta skill for aplicada, registre no texto de acompanhamento:

```text
Padroes Cursor carregados:
- agents: <lista curta>
- skills: <lista curta>
- rules: <lista curta>
```

E na resposta final:

```text
Roteamento aplicado:
- Agentes consultados: <...>
- Skills consultadas: <...>
- Rules aplicadas: <...>
```

## Limitacoes

- Nao presuma que todo agent da `.cursor` deve ser seguido.
- Nao carregue a pasta inteira sem necessidade.
- Se houver conflito entre `.cursor` e instrucoes de sistema/desenvolvedor, siga a instrucao de prioridade mais alta e aponte o conflito.
