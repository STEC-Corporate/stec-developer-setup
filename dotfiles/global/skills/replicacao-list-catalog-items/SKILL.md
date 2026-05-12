---
name: replicacao-list-catalog-items
description: Lista agents e documentos do Modelo organizados por categoria. Usada por replicacao-catalogo-modelo.
---

# Listar Catálogo do Modelo

## Quando Usar

- Quando replicacao-catalogo-modelo precisa apresentar o catálogo ao usuário
- Para projetos template escolherem o que trazer do Modelo

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`.

## Princípio Invariável

**Operação somente leitura.** Esta skill apenas LISTA. Não copia, não modifica.

## Processo

### 1. Ler estrutura do Modelo

- Path: `/home/jesus/Projetos/Holding-STEC-Template`
- Listar `.cursor/agents/`, `.cursor/skills/`, `docs/gestao-tarefas/03-especificacao-produto/`, `docs/gestao-ideias/00-governanca/ia/`, etc.

### 2. Organizar por categoria

| Categoria | Local no Modelo |
| --------- | --------------- |
| Agents | .cursor/agents/*.md |
| Skills | .cursor/skills/*/SKILL.md |
| **Modelos** | docs/**/_model/*.md, docs/**/_model/*.ts |
| Business Rules | docs/gestao-tarefas/03-especificacao-produto/business-rules/**/fe-*.md |
| User Flows | docs/gestao-tarefas/03-especificacao-produto/user-flows/**/*.md |
| API Specifications | docs/gestao-tarefas/03-especificacao-produto/api-specifications/**/* |
| Templates | docs/gestao-ideias/04-referencia-tecnica/_templates/*.md |
| Decisões | docs/gestao-ideias/00-governanca/decisoes/*.md |
| Planejamento | docs/gestao-ideias/02-execucao/planejamento/**/* |
| Guardrails | docs/gestao-ideias/00-governanca/ia/guardrails.md |

### 3. Gerar catálogo formatado

- Lista numerada ou por categoria
- Incluir path relativo de cada item
- Incluir descrição breve quando disponível (ex.: nome do agent)

### 4. Retornar saída

```json
{
  "success": true,
  "catalog": {
    "agents": ["agent1.md", "agent2.md"],
    "skills": ["skill1/SKILL.md", "skill2/SKILL.md"],
    "businessRules": ["path/to/fe-x.md"],
    ...
  },
  "modelPath": "/home/jesus/Projetos/Holding-STEC-Template"
}
```

## Exemplo

Listar todos os agents e skills do Modelo, agrupados por tipo, para o usuário escolher quais copiar.

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

