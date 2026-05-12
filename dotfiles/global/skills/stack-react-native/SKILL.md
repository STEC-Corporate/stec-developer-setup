---
name: stack-react-native
description: Workflow React Native — estrutura de pastas, Metro, testes e builds. Usar em projetos com app.json, metro.config ou pastas ios/android.
---

# Stack — React Native

## Passos

1. Confirmar versão RN e React do `package.json`.
2. Alterações que toquem nativo: documentar impacto em ambas as plataformas.
3. Estilos e layout: preferir padrões do Design System do app, se existir.
4. Testes: Jest/RNTL conforme padrão do repositório.

## Anti-padrões

- Assumir APIs só disponíveis no browser.
- Ignorar safe area e teclado em formulários móveis.
