---
name: docs-criar-doc-structure
description: Cria pastas business-rules, user-flows, api-specifications por perfil. Use ao inicializar estrutura de documentação no destino.
---

# Criar Estrutura de Documentação

## Quando Usar

- Ao replicar template e precisar criar pastas vazias de documentação
- Quando docs-inicializador agent executa

## Processo

### 1. Definir perfis/entidades

- Lista de perfis (ex.: musician, contractor, admin)

### 2. Criar estrutura de pastas

- docs/gestao-tarefas/03-especificacao-produto/business-rules/[perfil]/[feature]/
- docs/gestao-tarefas/03-especificacao-produto/user-flows/[perfil]/
- docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/[feature]/

### 3. Criar INDEX.md iniciais

- Em cada pasta de perfil/feature

### 4. Retornar saída

```json
{
  "success": true,
  "outputPath": "/path/to/destino/docs/gestao-tarefas/03-especificacao-produto/",
  "nextAgent": "docs-regras-negocio"
}
```

## Exemplo

**Inputs**: profiles=[admin, user], pathDest=Holding-STEC-Template  
**Resultado**: Pastas e INDEX.md criados.

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

