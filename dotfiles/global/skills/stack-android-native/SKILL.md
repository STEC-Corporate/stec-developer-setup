---
name: stack-android-native
description: Workflow Android nativo — Gradle, Kotlin/Java em android/, testes instrumentados. Usar ao editar módulo android ou código Kotlin/Java fora de React Native JS.
---

# Stack — Android nativo

## Passos

1. Localizar `build.gradle` (projeto e app) e versões SDK.
2. Alterações de permissão: justificar e alinhar ao Privacy Policy do app.
3. Testes: unitários JVM + Android instrumented se o CI exigir.
4. Integração com RN: seguir documentação de módulos nativos existente no repo.

## Anti-padrões

- Hardcoded strings em UI sem `strings.xml` se o projeto internacionaliza.
- Bloquear thread principal em I/O.
