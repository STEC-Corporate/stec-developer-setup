---
name: NestJS SWC skill rule
overview: Alinhar ao guia oficial Nest (recipes/swc e âncora jest--swc); três skills operacionais (instalação, configuração de build, testes Jest) + índice na skill framework-nestjs + agent + rule; exemplos espelhando a doc; tsc continua default até opt-in SWC.
todos:
  - id: skill-nestjs-swc-overview
    content: framework-nestjs/SKILL.md — seção índice SWC com links às 3 skills filhas + URL oficial
    status: pending
  - id: skill-nestjs-swc-install
    content: Criar framework-nestjs-swc-install/SKILL.md (deps @swc/core @swc/cli, sem global como fonte de verdade)
    status: pending
  - id: skill-nestjs-swc-config
    content: Criar framework-nestjs-swc-config/SKILL.md (nest-cli.json builder swc, typeCheck, .swcrc build)
    status: pending
  - id: skill-nestjs-swc-jest
    content: Criar framework-nestjs-swc-jest/SKILL.md (seção Jest + SWC da doc, @swc/jest, jest.config, decorators)
    status: pending
  - id: agent-swc-pointer
    content: framework-nestjs-guia.md — remeter às skills SWC e à doc oficial
    status: pending
  - id: rule-swc-bullets
    content: framework-nestjs.mdc — política (deps, type-check, Jest alinhado à receita)
    status: pending
  - id: skills-index-swc
    content: skills/INDEX.md — entradas das novas pastas framework-nestjs-swc-*
    status: pending
historico:
  fonte_oficial: "https://docs.nestjs.com/recipes/swc#jest--swc"
  atualizado: "2026-04-07"
---

# Plano: SWC NestJS alinhado à documentação oficial

## Fonte de verdade

- Receita completa: [SWC (fast compiler) | NestJS](https://docs.nestjs.com/recipes/swc)
- Testes: [Jest + SWC](https://docs.nestjs.com/recipes/swc#jest--swc) (mesma página, âncora `#jest--swc`)

Toda a implementação nas skills deve **citar estes URLs** e **copiar a forma** da doc (nomes de opções, flags, ordem recomendada), adaptando apenas paths do monorepo quando necessário.

## Facto de produto

- O compilador **por defeito** do Nest continua a ser **`tsc`**. SWC é **opt-in** após configurar o projeto conforme a receita.

## Modelo de skills (três tarefas + índice)

| Skill (pasta sugerida) | Responsabilidade | Paralelo na doc |
|-------------------------|------------------|-----------------|
| [`framework-nestjs`](../../.cursor/skills/framework-nestjs/SKILL.md) | **Índice**: quando usar SWC; links para as três skills; aviso tsc vs SWC | Intro / visão geral |
| `framework-nestjs-swc-install` | Instalar `@swc/core` e `@swc/cli` como **devDependencies**; verificar `package.json`; **não** substituir por CLI global no CI | Instalação na receita |
| `framework-nestjs-swc-config` | `nest-cli.json` (`compilerOptions.builder: "swc"`), **type checking** (`typeCheck` / fluxo oficial em paralelo com `tsc` noEmit), `.swcrc` para build quando a doc o exigir | Configuração / type-check |
| `framework-nestjs-swc-jest` | Substituir / alinhar transform Jest com **`@swc/jest`**; configuração compatível com **decorators / metadata** do Nest; `testEnvironment: 'node'` quando aplicável; validar `npm run test` | [Jest + SWC](https://docs.nestjs.com/recipes/swc#jest--swc) |

**Exemplos:** cada skill deve incluir **blocos mínimos** (JSON `nest-cli.json`, excerto `jest.config`, excerto `.swcrc`) **fiéis à doc**, com comentário `// conforme docs.nestjs.com/recipes/swc`.

**Opcional:** seção “Monorepo / bibliotecas” na skill `framework-nestjs-swc-config` apenas se a receita oficial tiver subseção equivalente na mesma página (não inventar).

## Agent

Atualizar [`.cursor/agents/framework-nestjs-guia.md`](../../.cursor/agents/framework-nestjs-guia.md): âmbito **build e testes com SWC**; remeter às três skills e à URL oficial.

## Rule

Atualizar [`.cursor/rules/framework-nestjs.mdc`](../../.cursor/rules/framework-nestjs.mdc): bullets curtos — SWC só com deps no projeto + `nest-cli.json`; type-check conforme receita; testes com Jest alinhados a `#jest--swc`.

## Índice

[`.cursor/skills/INDEX.md`](../../.cursor/skills/INDEX.md): subseção sob NestJS ou “Toolchain Nest” com as três novas skills.

## Fora de âmbito

- Não fixar versões semelhantes de pacotes no texto (usar “alinhar à versão do `@nestjs/cli` do repo”).
- Não executar `npm i -g` automaticamente.

## Ordem de implementação sugerida

1. `framework-nestjs-swc-install` e `framework-nestjs-swc-config` (fluxo de build contínuo).
2. `framework-nestjs-swc-jest`.
3. Índice em `framework-nestjs/SKILL.md` + `skills/INDEX.md`.
4. Agent + rule.
