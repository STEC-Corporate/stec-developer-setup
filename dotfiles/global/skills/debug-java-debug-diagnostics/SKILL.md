---
name: debug-java-debug-diagnostics
description: Diagnosticar erros de build, runtime JavaFX e ambiente Java em aplicações Java. Use quando houver falha de compilação, "JavaFX runtime components missing" ou problemas de JDK/JAVA_HOME.
---

# Debug e diagnósticos em Java

## Quando usar esta skill

- Erro de build Maven (ex.: "release version 17 not supported").
- Erro "JavaFX runtime components are missing, and are required to run this application".
- Problemas de configuração Spring (perfis, `application.yml`, `@ConfigurationProperties`).
- Verificar ambiente (JDK, JAVA_HOME, Maven) antes ou depois de erros.

## Checklist de debug

1. **Build Maven / JDK:** Confirmar que `JAVA_HOME` aponta para JDK 17+ e que `javac -version` mostra 17 ou superior. Rodar `debug-env.sh` desta skill.
2. **JavaFX:** Usar `mvn javafx:run` (ou script da skill [javafx-ui-java](../code-javafx-ui-java/SKILL.md)) em vez de `mvn spring-boot:run` para garantir module-path JavaFX. Em WSL, verificar `DISPLAY` e suporte a GUI.
3. **Configuração:** Verificar `src/main/resources/application.yml` e perfis ativos; erros de bean ou propriedades costumam aparecer no stack trace do Spring.
4. **Dependências vulneráveis:** Usar `gh api repos/<owner>/<repo>/dependabot/alerts` (com `GH_TOKEN`) para listar alertas e atualizar versões no `pom.xml` conforme indicado.

## Scripts desta skill

| Script | Uso |
|--------|-----|
| **debug-env.sh** | Exibe `java -version`, `javac -version`, `JAVA_HOME`, `mvn -v` e (se existir) `DISPLAY`. Use para verificar ambiente antes de rodar a aplicação ou testes. |

### Como invocar

Na raiz do projeto:

```bash
.cursor/skills/debug-java-debug-diagnostics/scripts/debug-env.sh
```

## Referências

- [javafx-ui-java](../code-javafx-ui-java/SKILL.md) — rodar app com JavaFX.
- [java-spring-dev](../code-java-spring-dev/SKILL.md) — estrutura do projeto.

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
