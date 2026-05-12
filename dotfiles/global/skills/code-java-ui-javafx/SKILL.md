---
name: code-java-ui-javafx
description: Padrões de UI JavaFX/FXML para aplicações Java. Use ao editar telas ou controllers de tela.
---

# UI JavaFX em aplicações Java

## Estrutura

- FXML em `src/main/resources/fxml/` (ex.: `main.fxml`).
- Controllers em `<base-package>.controller`; anotados com `@Controller` quando gerenciados pelo Spring.
- Carregamento: a classe principal da aplicação pode usar `FXMLLoader#setControllerFactory(...)` para integrar controllers ao container.

## Utilitários

- `src/main/java/<base-package>/util/FXMLLoaderUtil.java` — carregar FXML com controller injetado.
- `src/main/java/<base-package>/util/SpringContext.java` — acesso ao contexto Spring para obter beans fora do contexto web/FXML.
- `src/main/java/<base-package>/util/AlertUtils.java` — diálogos de alerta; usar em vez de instanciar `Alert` manualmente quando seguir o padrão do projeto.

## Boas práticas

- Manter controllers enxutos: binding e eventos na tela; lógica em services.
- Navegação entre telas via carregamento de FXML com `FXMLLoaderUtil` ou padrão já usado no `MainController`/main.fxml.
- Não usar paths absolutos para FXML; usar recursos de classpath (ex.: `/fxml/nome.fxml`).

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
