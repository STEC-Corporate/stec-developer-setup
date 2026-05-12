---
name: framework-nestjs-swc-install
description: Instalar @swc/core e @swc/cli como devDependencies num projeto Nest (receita oficial SWC). Usar antes de nest-cli.json com builder swc.
---

# NestJS + SWC — instalação de dependências

Fonte: [NestJS — SWC](https://docs.nestjs.com/recipes/swc).

## Quando usar

- O projeto vai passar a usar **SWC** como builder (`nest-cli.json`); ainda não tens `@swc/core` / `@swc/cli` no `package.json`.

## Passos

1. Na raiz do projeto Nest, instalar como **desenvolvimento** (exemplo npm):

```bash
npm install --save-dev @swc/cli @swc/core
```

2. Equivalentes: `pnpm add -D @swc/cli @swc/core` · `yarn add -D @swc/cli @swc/core`.

3. Confirmar em `package.json` que ambos aparecem em **`devDependencies`** (não em `dependencies`).

## Política

- **CI e restantes developers** dependem do `package.json`. Não uses apenas `npm install -g @swc/cli` como substituto no pipeline.
- **Versões:** alinha `@swc/*` com a versão do `@nestjs/cli` e do Node do projeto; em caso de dúvida, segue a tabela ou notas da receita oficial na data em que lês a doc.

## Seguinte

- Configurar build: [framework-nestjs-swc-config](../framework-nestjs-swc-config/SKILL.md).
- Índice geral: [framework-nestjs](../framework-nestjs/SKILL.md).
