# Codex Cursor Bridge

Este documento define como este projeto passa a usar os artefatos da `.cursor/` tambem no Codex.

## Objetivo

Permitir que o Codex:

- detecte automaticamente a existencia de `.cursor/`
- consulte agents, skills e rules do projeto como fonte de padrao
- registre rastreabilidade de quais artefatos foram usados
- suporte paralelizacao com multiplos agentes quando houver permissao do usuario

## Componentes implementados

### 1. Skills globais do Codex

As skills abaixo sao instaladas em `~/.codex/skills`:

- `cursor-project-standards`
- `cursor-agent-orchestrator`
- `mcp-fleet-routing` — roteamento da fleet MCP (RAG + Inspectors); ver [docs/mcp-fleet-contract.md](../../docs/mcp-fleet-contract.md)

Elas ensinam o Codex a interpretar a `.cursor/` como fonte ativa de regras de trabalho e, quando aplicavel, a ordem dos servidores MCP.

### 2. Script de instalacao

Use:

```bash
./scripts/install_codex_cursor_bridge.sh
```

O script copia as skills versionadas neste repositrio para `~/.codex/skills`.

### 3. AGENTS.md local

O arquivo [AGENTS.md](/home/jesus/Projetos/RAG-Memories/AGENTS.md) define:

- protocolo de leitura da `.cursor/`
- contrato de rastreabilidade
- politica de paralelizacao
- precedencia entre `.cursor/` e instrucoes superiores

## Fluxo recomendado

1. O Codex detecta `.cursor/` no projeto.
2. Carrega `cursor-project-standards`.
3. Seleciona os agents, skills e rules relevantes.
4. Se o usuario permitir delegacao, aplica `cursor-agent-orchestrator`.
5. Se a tarefa envolver ferramentas MCP (RAG, Inspectors), alinhe a `mcp-fleet-routing` ao contrato em `docs/mcp-fleet-contract.md`.
6. Registra no andamento e no fechamento o roteamento utilizado.

## Limites atuais

- Agents da `.cursor/` nao viram subagentes nativos automaticamente.
- O que passa a existir e um protocolo estavel para leitura, roteamento e logging.
- A paralelizacao continua dependente de permissao explicita do usuario para uso de subagentes.
