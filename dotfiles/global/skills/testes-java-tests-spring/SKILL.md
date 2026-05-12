---
name: testes-java-tests-spring
description: Rodar e escrever testes JUnit 5, Mockito e TestFX em aplicações Java. Use ao executar testes unitários, integração ou UI ou ao criar novos testes.
---

# Testes em Java/Spring

## Quando usar esta skill

- Rodar suites de teste (unitários, integração, UI, todos).
- Escrever ou ajustar testes JUnit 5, Mockito, TestFX.
- Garantir cobertura mínima (80%) e suporte headless para CI.

Complementa a skill [java-tests](../testes-java-tests/SKILL.md) com scripts dedicados dentro desta skill.

## Padrões de teste

- **Unitários:** JUnit 5, Mockito; sem `@SpringBootTest`; mocks para dependências.
- **Integração:** `@SpringBootTest`, `@ActiveProfiles("test")`; repositórios e serviços reais (Mongo test).
- **UI:** estender uma `BaseUITest` do projeto; usar `robot`, `clickOn()`, `lookup()`, `waitFor()`; manter `fx:id` estáveis no FXML.
- **Headless (CI):** `mvn test -Dheadless=true`.

## Scripts desta skill

| Script | Uso |
|--------|-----|
| **test-unit.sh** | Apenas testes unitários (exclui *UITest e *IntegrationTest). |
| **test-integration.sh** | Apenas testes de integração (*IntegrationTest). |
| **test-ui.sh** | Apenas testes de UI (*UITest). |
| **test-all.sh** | Todos os testes (`mvn test`). |

### Como invocar

Na raiz do projeto:

```bash
.cursor/skills/testes-java-tests-spring/scripts/test-unit.sh
.cursor/skills/testes-java-tests-spring/scripts/test-integration.sh
.cursor/skills/testes-java-tests-spring/scripts/test-ui.sh
.cursor/skills/testes-java-tests-spring/scripts/test-all.sh
```

## Referências

- [java-tests](../testes-java-tests/SKILL.md) — documentação detalhada de tipos de teste e BaseUITest.
- [javafx-ui-java](../code-javafx-ui-java/SKILL.md) — rodar app JavaFX e testes UI.

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
