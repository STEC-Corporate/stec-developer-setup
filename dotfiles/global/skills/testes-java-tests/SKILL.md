---
name: testes-java-tests
description: Como rodar e escrever testes em aplicações Java (unitários, integração, UI). Use ao falar em testes, cobertura ou CI.
---

# Testes em Java

## Executar testes

- **Todos**: `mvn test` ou `./scripts/test-all.sh`
- **Só unitários**: `./scripts/test-unit.sh` ou `mvn test -DexcludedTests='*UITest,*IntegrationTest'`
- **Só integração**: `./scripts/test-integration.sh` ou `mvn test -Dtest=*IntegrationTest`
- **Só UI**: `./scripts/test-ui.sh` ou `mvn test -Dtest=*UITest`
- **Headless (CI)**: `./scripts/test-headless.sh` ou `mvn test -Dheadless=true`

## Tipos de teste

- **Unitários**: JUnit 5, Mockito; sem `@SpringBootTest`; mocks para dependências.
- **Integração**: `@SpringBootTest`, `@ActiveProfiles("test")`; podem usar repositórios e serviços reais (Mongo em memória/test).
- **UI**: estender uma `BaseUITest` do projeto; implementar `initializeApplication()` e `cleanupAfterTest()`; usar `robot`, `clickOn()`, `lookup()`, `waitFor()`.

## Cobertura e qualidade

- Cobertura mínima requerida: **80%** (projeto atual ~87%).
- Não reduzir cobertura ao adicionar código novo; incluir testes para novas regras e controllers relevantes.
- Casos e estrutura detalhados em `casos-de-testes.md`.

## Referência

- Regras para código de teste: use as rules de teste do projeto, se existirem.

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
