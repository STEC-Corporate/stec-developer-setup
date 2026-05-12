---
name: docs-criar-especificacao-api
description: Cria documentação completa de API Specifications extraindo endpoints, types e exemplos do código frontend. Use ao documentar endpoints de uma feature, sincronizar specs com código, ou ao analisar APIs existentes.
---

# Criar API Specification

## Quando Usar

- Ao documentar endpoints de uma feature
- Ao sincronizar specs com código após mudanças
- Ao analisar APIs existentes para documentação
- Ao preparar documentação para backend implementar

## Estrutura de API Specifications

Criar pasta: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/[perfil]/[feature]/`

**Modelos de referência**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/_model/` (modelo-endpoints.md, modelo-types.ts, modelo-examples.md)

**Arquivos obrigatórios**:
- `endpoints.md` - Documentação de todos endpoints
- `types.ts` - Types TypeScript extraídos do domain
- `examples.md` - Exemplos de request/response

**Arquivo opcional**:
- `CONCLUIDO.md` - Resumo quando feature está completa

## Processo

### 1. Extrair Endpoints do Código

Analisar código em:
- `src/features/[feature]/application/services/` - API Services
- `src/features/[feature]/infrastructure/config/` - Endpoints config
- `src/features/[feature]/infrastructure/clients/` - HTTP Clients

**Identificar**:
- Método HTTP (GET, POST, PUT, DELETE, PATCH)
- Path do endpoint
- Parâmetros (path, query, body)
- Headers necessários
- Autenticação requerida

### 2. Criar endpoints.md

**Formato**:

```markdown
# Endpoints - [Feature Name]

## [Nome do Endpoint]

**Método**: `GET /api/[path]`

**Descrição**: [O que o endpoint faz]

**Autenticação**: [Requerida/Opcional]

**Parâmetros**:
- `param1` (path, obrigatório): [descrição]
- `param2` (query, opcional): [descrição]

**Request Body** (se aplicável):
```json
{
  "field1": "value",
  "field2": 123
}
```

**Response 200**:
```json
{
  "success": true,
  "data": {
    // estrutura de resposta
  }
}
```

**Response 400/404/500**:
```json
{
  "success": false,
  "error": "Mensagem de erro"
}
```

**Validação de Guardrails**: [Se aplicável, mencionar validações]
```

### 3. Extrair Types do Domain

Analisar: `src/features/[feature]/domain/types/`

**Extrair**:
- Types de request
- Types de response
- Types de entidades
- Types de DTOs

**Criar `types.ts`**:

```typescript
// Types extraídos de src/features/[feature]/domain/types/

export interface FeatureRequest {
  // estrutura
}

export interface FeatureResponse {
  // estrutura
}

// ... outros types
```

**Importante**: Types devem refletir exatamente o que está no domain layer.

### 4. Criar examples.md

**Baseado em**:
- Mocks do código
- Testes existentes
- Casos de uso documentados

**Formato**:

```markdown
# Exemplos - [Feature Name]

## POST /api/[endpoint]

### Request
```json
{
  "field1": "exemplo",
  "field2": 123
}
```

### Response 200
```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "field1": "exemplo",
    "field2": 123
  }
}
```

### Response 400
```json
{
  "success": false,
  "error": "Campo obrigatório ausente"
}
```
```

### 5. Validar Consistência

**Verificar**:
- Endpoints em `endpoints.md` correspondem ao código
- Types em `types.ts` correspondem ao domain
- Exemplos em `examples.md` são válidos
- Nomenclatura segue padrões do projeto

## Padrões de Nomenclatura

- **Arquivos**: `endpoints.md`, `types.ts`, `examples.md`
- **Endpoints**: Usar RESTful conventions
- **Types**: PascalCase (ex: `MusicianProfile`, `ApiResponse`)
- **Paths**: kebab-case (ex: `/api/musicians/profile`)

## Validação de Guardrails

Se endpoint envolve ranking, monetização, ou perfis:
- Adicionar seção "Validação de Guardrails" em `endpoints.md`
- Verificar que não viola `docs/gestao-ideias/00-governanca/ia/guardrails.md`

## Exemplo Completo

Ver: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/musician/profile/`

Estrutura:
```
musician/profile/
├── endpoints.md      # 8 endpoints documentados
├── types.ts          # Types do domain
├── examples.md       # Exemplos baseados em mocks
└── CONCLUIDO.md      # Resumo quando completo
```

## Referências

- **API Specs README**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/README.md`
- **Workflow Colaborativo**: `docs/gestao-ideias/00-governanca/WORKFLOW-COLABORATIVO.md`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
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

