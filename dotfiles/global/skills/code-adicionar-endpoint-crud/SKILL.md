---
name: code-adicionar-endpoint-crud
description: Adicionar endpoint CRUD (controller, service, DTOs, validacao) seguindo padrao dos servicos existentes.
---

# adicionar-endpoint-crud

## Quando usar

- Novo recurso CRUD em um microsservico existente.
- Alinhado ao CONSOLIDADO ou especificacao do Template/BFF.

## Documentos

- .cursorrules (controllers, services, DTOs, guards, Result Pattern).
- Docs/error-codes-reference.md (codigos de erro).
- Servicos existentes em apps/ como referencia.

## Passos

1. Definir recurso (entidade/schema) e operacoes (create, find, update, delete ou subset).
2. Criar ou reutilizar DTOs (CreateDto, UpdateDto) com class-validator e ApiProperty.
3. Adicionar metodos no service com retorno ServiceResult/IServiceResult; guard clauses e validacoes de negocio.
4. Adicionar rotas no controller (POST, GET, GET/:id, PUT/:id, DELETE/:id conforme necessidade); usar pipes de validacao.
5. Documentar Swagger (ApiOperation, ApiResponse) e tratar erros conforme error-codes-reference.
6. Garantir que camadas nao sejam violadas (controller -> service -> repository/interface).

## Saida

- Codigo do endpoint completo e integrado ao modulo existente.
- Testes sugeridos ou indicacao de onde adicionar (skill S6).

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.

