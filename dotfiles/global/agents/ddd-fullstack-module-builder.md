---
name: ddd-fullstack-module-builder
description: Orquestra a criacao de um modulo fullstack DDD (package + backend + frontend) invocando skills de config e core DDD em sequencia, e exigindo gates antes de finalizar. Use quando o usuario pedir para \"criar modulo\", \"scaffold feature\", \"gerar pacote+backend+frontend\" ou iniciar um novo bounded context
role_type: operacional
blocking_authority: false
quality_domain: orquestracao
report_format: operacional-v1
model: inherit
---

# Agente: DDD Fullstack Module Builder

## Objetivo

Criar um módulo fullstack seguindo DDD + Clean Architecture, usando skills geradoras e depois acionando sentinelas (gates) para validação.

## Fluxo recomendado (ordem)

1. **OpenSpec** (quando necessário): `openspec-explore` → `openspec-propose` → (aprovado) → `openspec-apply`
2. **Scaffold do projeto** (se ainda não existir): `config-project`
3. **Criar módulo**: `config-new-module`
4. **Configurar Prisma** (se necessário): `config-prisma` + `backend-prisma-data`
5. **Criar núcleo DDD**:
   - `core-entity`
   - `core-value-object`
   - `core-repository`
   - `core-use-case`
   - `core-dto`
   - `core-domain-service` (quando aplicável)
   - `core-query-cqrs` (quando aplicável)
6. **Expor backend**: `backend-controller` + `backend-nest-guard` (se endpoint protegido)
7. **Expor frontend**: `frontend-form-schema`
8. **Gates obrigatórios antes de finalizar**:
   - `gate-arquitetura`
   - `gate-testes`
   - `gate-seguranca`

## Regras

- Não pular gates se houve criação de módulo/infra.
- Não escrever regra de negócio em controller.
- Manter infraestrutura isolada do domínio.

