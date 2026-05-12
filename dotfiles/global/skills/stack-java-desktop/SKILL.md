---
name: stack-java-desktop
description: Workflow Java desktop — JavaFX ou Swing, estrutura MVC/MVP e testes UI quando existirem. Usar em pacotes ui/, javafx/ ou swing/ conforme o repositório.
---

# Stack — Java desktop

## Passos

1. Identificar toolkit (JavaFX vs Swing) a partir de dependências Maven/Gradle.
2. Garantir que I/O e CPU pesados não correm na thread de UI.
3. Internacionalização: recursos `ResourceBundle` se o projeto já usar.
4. Testes: TestFX ou similar apenas se já configurado no CI.

## Ajuste de pastas

- Se o código desktop não estiver sob `**/ui/**`, atualizar o glob em [desktop-java.mdc](../../rules/desktop-java.mdc) ou no INDEX do repositório.
