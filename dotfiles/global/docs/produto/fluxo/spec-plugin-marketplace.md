# Spec Tecnica - Pipeline de Plugins Cursor

## Objetivo tecnico

Automatizar criacao, validacao e submissao de plugins Cursor com foco em seguranca, consistencia de metadados e rastreabilidade operacional.

## Escopo da V1

- Criacao de scaffold de plugin.
- Review de submissao com checklist oficial.
- Auditoria de seguranca local.
- Geracao de corpo de PR.
- Acompanhamento de status de publicacao.
- Modo `dry-run` para validacao sem acoes remotas.

## Componentes implementados

- Agents:
  - `plugin-cursor-arquiteto-guia`
  - `plugin-cursor-seguranca-guia`
  - `plugin-cursor-publicacao-guia`
  - `plugin-cursor-orquestrador-guia`
- Skills:
  - `plugin-cursor-scaffold`
  - `plugin-cursor-review-submission`
  - `plugin-cursor-security-audit`
  - `plugin-cursor-prepare-pr`
  - `plugin-cursor-track-publication`
  - `plugin-cursor-pipeline-e2e`
- Rule:
  - `plugin-cursor-quality-gates.mdc`
- MCP docs/config:
  - `mcp/plugin-cursor/*`

## Contratos de entrada e saida

### Entrada minima

- Nome do plugin
- Objetivo do plugin
- Diretorio alvo
- Estilo de repositorio (`single` ou `multi`)

### Saidas

- Estrutura de plugin criada.
- Relatorio JSON de review.
- Relatorio JSON de seguranca.
- Corpo markdown de PR.
- Relatorio consolidado de acompanhamento de publicacao.

## Nao objetivos da V1

- Publicar automaticamente sem confirmacao humana.
- Gerenciar segredos dentro do repositorio.
- Substituir governanca humana de produto e arquitetura.
