---
name: code-java-spring-dev
description: Implementar e revisar código Java/Spring Boot em aplicações Java. Use ao desenvolver features, refators ou camadas controller/service/repository.
---

# Desenvolvedor Java/Spring

## Quando usar esta skill

- Implementar novas funcionalidades em Java/Spring Boot.
- Refatorar controllers, services ou repositórios.
- Revisar código para aderência a camadas e convenções.

## Convenções (complementar a java-conventions)

- **Camadas:** controller → service → repository → domain. Controllers não acessam repositórios diretamente; services não acessam classes de UI JavaFX.
- **Anotações:** `@Service`, `@Repository`, `@Controller`, `@ConfigurationProperties` de forma consistente.
- **Lógica de negócio:** apenas em services; controllers finos, delegando para services.
- **Tratamento de erros:** para APIs REST futuras, usar `@ControllerAdvice` / `@ExceptionHandler`; manter mensagens claras para o usuário em diálogos JavaFX (AlertUtils).

## Arquivos centrais

- `src/main/java/<base-package>/Application.java` — entrada Spring + JavaFX, quando a aplicação combinar os dois runtimes.
- Controllers em `<base-package>.controller`; services em `<base-package>.service`; repositórios em `<base-package>.repository`; modelos em `<base-package>.model`; config em `<base-package>.config`.

## Scripts desta skill

| Script | Uso |
|--------|-----|
| **dev-check.sh** | Compilação rápida sem rodar testes (`mvn -q -DskipTests compile`). Use para validar build após alterações. |

### Como invocar

Na raiz do projeto:

```bash
.cursor/skills/code-java-spring-dev/scripts/dev-check.sh
```

## Prática

Antes de sugerir commit, rodar testes (por exemplo `.cursor/skills/testes-java-tests-spring/scripts/test-all.sh` ou `mvn test`).

## Referências

- [java-conventions](../code-java-conventions/SKILL.md) — convenções de estilo e injeção.
- [java-domain-flow](../docs-java-domain-flow/SKILL.md) — fluxo de domínio e organização de services.

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
