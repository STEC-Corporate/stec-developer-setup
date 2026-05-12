# Cursor Catalog Lint Spec

## Objetivo

Definir um lint estrutural para o catálogo `.cursor/` que detecte drift, referências quebradas e inconsistências de governança antes que elas se espalhem pelo submodule e pelos projetos consumidores.

Este documento especifica:

- entradas
- regras de validação
- severidade
- formato de saída
- ordem recomendada de execução

Ele ainda não implementa o lint.

## Escopo do lint

O lint deve analisar:

- `.cursor/agents/*.md`
- `.cursor/skills/*/SKILL.md`
- `.cursor/skills/*/README.md`
- `.cursor/rules/*.mdc`
- documentos auxiliares de governança em `.cursor/docs/codex/` quando usados como fonte de verdade:
  - `cursor-portability-inventory.md`
  - `cursor-routing-index.md`
  - `cursor-decoupling-strategy.md`

## Objetos e contratos esperados

### Agents

Cada agent deve ter:

- frontmatter YAML válido
- `name`
- `description`
- `role_type`
- `blocking_authority`
- `quality_domain`
- `report_format`

### Skills

Cada skill deve ter:

- pasta própria
- `SKILL.md`
- `README.md`
- frontmatter válido em `SKILL.md`
- `name`
- `description`

### Rules

Cada rule deve ter:

- frontmatter válido
- `description`
- `alwaysApply` ou `globs`
- corpo não vazio

## Classes de validação

### L1. Estrutura de arquivo

Objetivo:
- detectar ausência de arquivos obrigatórios

Validações:
- agent fora de `.md`
- skill sem `SKILL.md`
- skill sem `README.md`
- rule fora de `.mdc`
- arquivo vazio

Severidade:
- `error`

### L2. Frontmatter obrigatório

Objetivo:
- garantir contrato mínimo de cada tipo

Validações:
- YAML inválido
- campo obrigatório ausente
- campo obrigatório com tipo incorreto

Exemplos:
- `blocking_authority` não booleano
- `alwaysApply` não booleano
- `name` vazio

Severidade:
- `error`

### L3. Coerência de contrato operacional

Objetivo:
- garantir consistência entre metadados e corpo dos agents

Validações:
- `report_format: operacional-v1` sem `## Saida operacional`
- `report_format: operacional-v1` ainda contendo `Formato de saida padrao (sentinela)`
- `report_format: gate-v1` sem estrutura de gate compatível
- `role_type: sentinela-estrito` com `blocking_authority: false`
- `role_type: operacional` com corpo claramente de gate formal

Severidade:
- `error` para inconsistência estrutural
- `warning` para indício sem quebra objetiva

### L4. Integridade de referências a skills

Objetivo:
- detectar aliases quebrados e nomes canônicos incorretos

Validações:
- agent cita skill inexistente
- referência a pasta de skill que não existe
- link relativo para `SKILL.md` inválido

Escopo:
- procurar padrões como `Use a skill`, `Usar skill`, `ver .../SKILL.md`

Severidade:
- `error`

### L5. Integridade de referências a rules e docs

Objetivo:
- detectar caminhos quebrados para `rules`, `plans` e documentação

Validações:
- referência a `.cursor/rules/*.mdc` inexistente
- referência a `docs/...` inexistente
- referência a `.cursor/plans/...` inexistente quando declarada como base obrigatória

Severidade:
- `warning` quando opcional
- `error` quando a própria instrução chama o artefato de obrigatório

### L6. Coerência de portabilidade

Objetivo:
- alinhar catálogo com o inventário de portabilidade

Fonte de verdade:
- `.cursor/docs/codex/cursor-portability-inventory.md`

Validações:
- agent ausente no inventário
- skill ausente no inventário
- item classificado em mais de uma classe
- item presente no inventário, mas não existe mais no catálogo

Severidade:
- `error`

### L7. Coerência de roteamento

Objetivo:
- alinhar famílias e conexões com o índice central

Fonte de verdade:
- `.cursor/docs/codex/cursor-routing-index.md`

Validações:
- família listada no índice sem nenhum item real
- skill citada no índice inexistente
- rule citada no índice inexistente
- referência a family wildcard que não corresponde a nenhum item do catálogo

Severidade:
- `warning` para lacuna parcial
- `error` para referência quebrada

### L8. Coerência de desacoplamento

Objetivo:
- impedir que pacote global receba itens sabidamente de holding ou projeto

Fonte de verdade:
- `.cursor/docs/codex/cursor-decoupling-strategy.md`

Validações:
- rule classificada como global no lint mas marcada como projeto na estratégia
- agent/skill candidata a pacote global ainda contendo dependências explícitas de `SoundLink`, `Modelo`, `BFF`, `Template`, `Java legado`, `BeachLink`

Severidade:
- `warning`

### L9. Higiene de nomenclatura

Objetivo:
- manter previsibilidade de roteamento

Validações:
- `name` divergente do nome do arquivo ou pasta
- nome fora de kebab-case
- prefixo inconsistente com família declarada

Severidade:
- `warning`
- `error` quando quebra lookup automático

## Ordem recomendada de execução

1. `L1` estrutura de arquivo
2. `L2` frontmatter obrigatório
3. `L9` nomenclatura
4. `L3` coerência de contrato operacional
5. `L4` integridade de referências a skills
6. `L5` integridade de referências a rules e docs
7. `L6` coerência de portabilidade
8. `L7` coerência de roteamento
9. `L8` coerência de desacoplamento

Motivo:
- validar primeiro o básico local
- só depois cruzar documentos de governança

## Formato de saída esperado

Formato sugerido:

```text
[severity] [rule_id] [target]
message: ...
evidence: ...
suggestion: ...
```

Exemplo:

```text
[error] L4 .cursor/agents/docs-inicializador.md
message: agent referencia skill inexistente `generate-fe-docs`
evidence: texto encontrado na seção "Quando invocado"
suggestion: substituir por `docs-gerar-fe-docs`
```

## Critério de falha

O lint deve falhar a execução quando houver pelo menos um:

- `error`

O lint pode concluir com sucesso, mas emitir relatório, quando houver apenas:

- `warning`

## Modo de operação sugerido

### Modo rápido

Valida:
- `L1`
- `L2`
- `L3`
- `L4`

Uso:
- antes de commit local

### Modo completo

Valida:
- todas as classes `L1` a `L9`

Uso:
- CI do submodule
- revisão de release do catálogo

## Implementação futura sugerida

Forma recomendada:

- script único em Python ou Node
- leitura estruturada de YAML
- parser simples de markdown para detectar headings e referências

Arquivos candidatos:

- `scripts/lint_cursor_catalog.py`
ou
- `scripts/lint-cursor-catalog.mjs`

## Resultado esperado

Quando implementado, este lint deve impedir regressões como:

- volta de aliases antigos
- mistura entre `operacional-v1` e `gate-v1`
- referências a skills removidas
- drift entre catálogo real e documentos de governança
- extração incorreta de itens globais, holding ou projeto
