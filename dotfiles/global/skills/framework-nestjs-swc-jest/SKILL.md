---
name: framework-nestjs-swc-jest
description: Jest com @swc/jest em projetos Nest — seção Jest + SWC da doc oficial, decorators e ambiente node.
---

# NestJS + SWC — Jest

Fonte: [Jest + SWC](https://docs.nestjs.com/recipes/swc#jest--swc) (receita [SWC | NestJS](https://docs.nestjs.com/recipes/swc)).

## Quando usar

- O build já usa SWC (`nest-cli.json`) e queres que **`npm run test`** transpile com SWC em vez de `ts-jest` (ou equivalente), alinhado à receita oficial.

## Pré-requisitos

- [framework-nestjs-swc-install](../framework-nestjs-swc-install/SKILL.md)
- [framework-nestjs-swc-config](../framework-nestjs-swc-config/SKILL.md)

## Dependência

```bash
npm install --save-dev @swc/jest
```

## `jest.config` (exemplo base)

Ajusta `rootDir`, `testRegex` e `moduleNameMapper` ao teu repo. O transform deve apontar para **`@swc/jest`** conforme a doc na âncora **Jest + SWC**:

```javascript
module.exports = {
  moduleFileExtensions: ['js', 'json', 'ts'],
  rootDir: 'src',
  testRegex: '.*\\.spec\\.ts$',
  transform: {
    '^.+\\.(t|j)s$': '@swc/jest',
  },
  collectCoverageFrom: ['**/*.(t|j)s'],
  coverageDirectory: '../coverage',
  testEnvironment: 'node',
};
```

Para aplicações **backend** Nest, `testEnvironment: 'node'` é em geral o adequado.

## Decorators / metadata (Nest)

O Nest depende de decoradores e metadata de reflexão. Garante que a configuração SWC usada pelo Jest inclui as opções que a **receita oficial** indica para **legacyDecorator** e **decoratorMetadata** (via `.swcrc` ou configuração inline — segue o exemplo da doc na seção Jest + SWC, que pode evoluir com a versão do Nest).

Exemplo ilustrativo de `.swcrc` (validar sempre com a doc atual):

```json
{
  "$schema": "https://swc.rs/schema.json",
  "sourceMaps": true,
  "jsc": {
    "parser": {
      "syntax": "typescript",
      "decorators": true,
      "dynamicImport": true
    },
    "transform": {
      "legacyDecorator": true,
      "decoratorMetadata": true
    },
    "baseUrl": "./"
  },
  "minify": false
}
```

## Validação

- `npm run test` (ou o script do projeto) passa após a migração.
- Cobrir pelo menos um spec que use injeção Nest (`@Injectable()`, etc.) para confirmar metadata.

## Índice

- [framework-nestjs](../framework-nestjs/SKILL.md)
