---
name: code-sincronizar-especificacao-apis
description: Sincroniza API Specifications com código. Use após mudanças em endpoints/types, ao atualizar documentação, ou ao garantir que specs estão atualizadas.
---

# Sincronizar API Specifications

## Quando Usar

- Após mudanças em endpoints/types
- Ao atualizar documentação de API
- Ao garantir que specs estão atualizadas
- Ao analisar se specs estão sincronizadas com código

## Processo de Sincronização

### 1. Identificar Mudanças no Código

Analisar código em:
- `src/features/[feature]/application/services/` - API Services
- `src/features/[feature]/infrastructure/config/` - Endpoints config
- `src/features/[feature]/domain/types/` - Types

**Identificar**:
- Novos endpoints adicionados
- Endpoints modificados
- Endpoints removidos
- Types alterados
- Novos types adicionados

### 2. Atualizar endpoints.md

**Localização**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/[feature]/endpoints.md`

**Ações**:
- Adicionar novos endpoints documentados
- Atualizar endpoints modificados
- Remover endpoints obsoletos
- Validar que todos endpoints do código estão documentados

### 3. Atualizar types.ts

**Localização**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/[feature]/types.ts`

**Ações**:
- Extrair types atualizados do domain
- Adicionar novos types
- Remover types obsoletos
- Validar que types correspondem ao domain

**Importante**: Types devem refletir exatamente o que está em `src/features/[feature]/domain/types/`

### 4. Atualizar examples.md

**Localização**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/[feature]/examples.md`

**Ações**:
- Atualizar exemplos para novos endpoints
- Atualizar exemplos para endpoints modificados
- Remover exemplos de endpoints obsoletos
- Validar que exemplos são consistentes com código

### 5. Validar Consistência

**Verificar**:
- [ ] Todos endpoints do código estão em `endpoints.md`
- [ ] Types em `types.ts` correspondem ao domain
- [ ] Exemplos em `examples.md` são válidos
- [ ] Nomenclatura segue padrões do projeto

## Checklist de Sincronização

- [ ] Mudanças no código identificadas
- [ ] `endpoints.md` atualizado
- [ ] `types.ts` atualizado
- [ ] `examples.md` atualizado
- [ ] Consistência validada
- [ ] Documentação completa

## Referências

- **API Specs README**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/README.md`
- **Workflow Colaborativo**: `docs/gestao-ideias/00-governanca/WORKFLOW-COLABORATIVO.md`
- **Exemplo Completo**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/musician/profile/`

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

