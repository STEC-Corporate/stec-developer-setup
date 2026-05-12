---
name: seguranca-validar-modulo-auth
description: Validar o módulo de autenticação do BFF contra .cursorrules, Clean Architecture e convenções do projeto.
---

## Objetivo

Validar o módulo de autenticação (`src/auth/`) do BFF SoundLink de forma padronizada e repetível.

## Passos

1. Verificar estrutura: controllers, services, DTOs, guards, strategies em `src/auth/`.
2. Verificar dependências entre camadas (domain não depende de framework; BFF não acopla detalhes das APIs em `/home/jesus/Projetos/soundlink-api`).
3. Verificar uso de DTOs com class-validator e tratamento de erros.
4. Verificar existência e localização de testes (unit em `*.spec.ts`, integration em `test/`).
5. Produzir relatório curto: conformidades e não conformidades com referência a arquivo/trecho.

## Contexto

- Monorepo de API: `/home/jesus/Projetos/soundlink-api` (auth-service em `apps/auth-service/`).
- Regras do projeto: `.cursorrules`.

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

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

