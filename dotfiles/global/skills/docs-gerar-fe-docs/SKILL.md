---
name: docs-gerar-fe-docs
description: Gera fe-*.md seguindo padrões (business-rules, user-flows). Use ao criar documentação inicial por perfil/feature no destino.
---

# Gerar Documentação FE (fe-*.md)

## Quando Usar

- Ao replicar template e popular business-rules e user-flows
- Usado por docs-regras-negocio e docs-user-flows

## Processo

### Para business-rules (fe-*.md)

1. Usar template de create-business-rules-doc
2. Criar fe-[feature-name].md em business-rules/[perfil]/[feature]/
3. Estrutura: Descrição, User Stories, Regras de Negócio, Dependências

### Para user-flows (fe-*-user-flow.md)

1. Usar template de create-user-flow-doc
2. Criar fe-[perfil]-[feature]-user-flow.md em user-flows/[perfil]/

### Retornar saída

```json
{
  "success": true,
  "outputPath": "/path/to/destino/docs/gestao-tarefas/03-especificacao-produto/",
  "nextAgent": "docs-user-flows ou docs-especificacoes-api"
}
```

## Exemplo

**docs-regras-negocio**: Cria fe-core-profile.md  
**docs-user-flows**: Cria fe-admin-core-user-flow.md

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

