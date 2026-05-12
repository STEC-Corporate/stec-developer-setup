---
name: code-gerar-especificacoes-api
description: Gera endpoints.md, types.ts, examples.md base. Use ao criar estrutura inicial de api-specifications no destino.
---

# Gerar API Specifications

## Quando Usar

- Ao replicar template e popular api-specifications
- Usado por docs-especificacoes-api agent
- Para criar estrutura inicial de documentação de API

## Processo

### 1. Definir escopo

- Perfis e features mapeados
- Baseado em business-rules e user-flows já gerados

### 2. Criar estrutura por feature

Para cada feature em api-specifications/[perfil]/[feature]/:

- **endpoints.md**: Lista de endpoints com método, path, descrição (placeholders)
- **types.ts**: Interfaces TypeScript base (ex.: Request, Response)
- **examples.md**: Exemplos de payload (opcional, pode ser esqueleto)

### 3. Usar referência do Template

- **Modelos**: Consultar `docs/gestao-tarefas/03-especificacao-produto/api-specifications/_model/` (modelo-endpoints.md, modelo-types.ts, modelo-examples.md)
- Consultar [create-api-specification](../../docs-criar-especificacao-api/SKILL.md) para formato
- Extrair estrutura de api-specifications da origem se existir
- Adaptar ao domínio do destino (usar placeholders [perfil], [feature])

### 4. Validar

- Arquivos criados
- Formato consistente (Markdown + TypeScript)

### 5. Retornar saída

```json
{
  "success": true,
  "outputPath": "/path/to/destino/docs/gestao-tarefas/03-especificacao-produto/api-specifications/",
  "specsCreated": ["admin/core/endpoints.md", "admin/core/types.ts"],
  "nextAgent": "planejamento-config-ia"
}
```

## Exemplo

**Inputs**: `{ "profiles": ["admin"], "features": ["core"], "pathDest": "/path/Holding-STEC-Template" }`

**Resultado**: api-specifications/admin/core/ com endpoints.md, types.ts, examples.md iniciais.

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

