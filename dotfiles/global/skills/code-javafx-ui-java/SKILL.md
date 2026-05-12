---
name: code-javafx-ui-java
description: Rodar a aplicação JavaFX e testes de UI em aplicações Java. Use ao desenvolver telas, depurar a interface ou executar testes TestFX.
---

# JavaFX – Execução e testes de UI

## Quando usar esta skill

- Rodar a aplicação desktop (Spring Boot + JavaFX).
- Executar testes de interface (TestFX).
- Diagnosticar erros de runtime JavaFX (ex.: "JavaFX runtime components are missing").

## Estrutura do projeto

- Entrada da aplicação: `src/main/java/<base-package>/Application.java` pode estender `javafx.application.Application`; o `main` chama `Application.launch(args)` quando necessário.
- FXML em `src/main/resources/fxml/`; controllers em `<base-package>.controller`.
- Testes de UI em `src/test/java/.../ui/` usando TestFX e uma `BaseUITest` do projeto.

## Scripts desta skill

Os scripts ficam em **`.cursor/skills/code-javafx-ui-java/scripts/`**. Executar a partir da **raiz do repositório** (o script faz `cd` para a raiz quando necessário).

| Script | Uso |
|--------|-----|
| **run-javafx.sh** | Sobe a aplicação com o plugin JavaFX (`mvn javafx:run`). Use este em vez de `mvn spring-boot:run` para evitar erro "JavaFX runtime components are missing". |
| **test-ui.sh** | Roda apenas os testes de UI (TestFX): `mvn test -Dtest='*UITest'`. |

### Como invocar

Na raiz do projeto:

```bash
# Rodar a aplicação
.cursor/skills/code-javafx-ui-java/scripts/run-javafx.sh

# Rodar testes de UI
.cursor/skills/code-javafx-ui-java/scripts/test-ui.sh
```

Ou, a partir da pasta da skill, indicar o caminho relativo à raiz do repo (os scripts já fazem `cd` para a raiz).

## Boas práticas

- **Rodar a app:** preferir sempre `run-javafx.sh` (ou `mvn javafx:run`) para garantir que o module-path do JavaFX esteja correto.
- **Testes UI:** manter `fx:id` estáveis nos FXML para os elementos que os testes acessam via `lookup("#id")`.
- **WSL/headless:** em ambiente sem display, use `mvn test -Dtest='*UITest' -Dheadless=true` conforme a `BaseUITest` e a configuração de CI do projeto.

## Referências

- Skill de padrões de UI: [java-ui-javafx](../code-java-ui-javafx/SKILL.md).
- Testes no projeto: [java-tests](../testes-java-tests/SKILL.md).

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
