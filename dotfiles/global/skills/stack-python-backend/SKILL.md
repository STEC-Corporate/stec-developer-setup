---
name: stack-python-backend
description: Workflow de backend Python — FastAPI/Flask, estrutura de pacotes, testes e OpenAPI. Usar ao criar ou alterar serviços .py ou dependências Python.
---

# Stack — Backend Python

## Pré-requisitos

- Spec ou história em `docs/produto/fluxo/` para mudanças de comportamento.

## Passos

1. Identificar gestor de dependências (`pyproject.toml`, `requirements.txt`, Poetry).
2. Separar camadas (rotas vs domínio vs infra) se o repo adotar Clean Architecture.
3. Validar entrada com esquemas tipados; documentar endpoints (OpenAPI nativo FastAPI ou extensões Flask).
4. Testes: pytest com fixtures alinhadas ao padrão existente.

## Anti-padrões

- Lógica de negócio massiva dentro de handlers sem serviços.
- Tipos `Any` em massa sem justificação.

## Relação com outros guias

- Contratos compartilhados: skill [stack-openapi-contracts](../stack-openapi-contracts/SKILL.md).
