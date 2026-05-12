---
name: framework-nestjs-swc-config
description: nest-cli.json com builder swc, typeCheck e .swcrc para build Nest — alinhado à receita oficial SWC.
---

# NestJS + SWC — configuração de build

Fonte: [NestJS — SWC](https://docs.nestjs.com/recipes/swc).

## Pré-requisito

- Dependências instaladas: [framework-nestjs-swc-install](../framework-nestjs-swc-install/SKILL.md).

## `nest-cli.json`

Define o builder **SWC** e, em geral, **verificação de tipos** em paralelo (o SWC transpila; o type-check com `tsc` em modo sem emit é o padrão recomendado na receita).

Exemplo mínimo (ajusta `sourceRoot` / `collection` ao teu repo; valida contra a doc atual):

```json
{
  "$schema": "https://json.schemastore.org/nest-cli",
  "collection": "@nestjs/schematics",
  "sourceRoot": "src",
  "compilerOptions": {
    "deleteOutDir": true,
    "builder": "swc",
    "typeCheck": true
  }
}
```

- `builder`: `"swc"` — ativa o compilador SWC.
- `typeCheck`: `true` — mantém checagem de tipos (via fluxo descrito na receita oficial); **não desativar** sem decisão explícita da equipe.

Comandos úteis (ver doc):

```bash
nest build
nest build --type-check
```

## `.swcrc` (opcional)

Se a receita ou o teu caso precisarem de opções SWC explícitas para **build**, coloca `.swcrc` na raiz do projeto conforme [documentação SWC](https://swc.rs/docs/configuration/swcrc) e exemplos da receita Nest.

## Validação

1. `nest build` (ou `npm run build`) conclui com sucesso.
2. Introduzir um erro de tipo de propósito e confirmar que o pipeline de type-check o deteta (comportamento esperado com `typeCheck` ativo).

## Seguinte

- Testes com Jest: [framework-nestjs-swc-jest](../framework-nestjs-swc-jest/SKILL.md).
- Índice: [framework-nestjs](../framework-nestjs/SKILL.md).
