---
name: stack-typescript-frontend
description: Workflow TypeScript para UI e BFF — React, Next.js, componentes, acessibilidade básica e alinhamento a contratos. Usar ao editar .tsx/.ts de frontend ou camadas Node expostas como API.
---

# Stack — TypeScript (frontend / Node)

## Pré-requisitos

- Fluxos de UI ou rotas documentados quando a alteração for visível ao usuário.

## Passos sugeridos

1. Identificar framework (React, Next, Nest, etc.) a partir de `package.json` e pastas.
2. **Componentes:** tamanho razoável, props tipadas, estado mínimo necessário.
3. **Dados:** alinhar tipos a OpenAPI ou contrato gerado, se existir.
4. **Testes:** smoke E2E ou unitários conforme padrão do repo.

## Anti-padrões

- Duplicar lógica de negócio no frontend que já existe no backend sem critério.
- Ignorar estados de carregamento e erro na UX.

## Mobile

- Para React Native, reutilizar princípios de componentização; pastas `android/` / `ios/` podem exigir agente mobile dedicado no futuro.
