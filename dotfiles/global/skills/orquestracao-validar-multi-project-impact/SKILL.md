---
name: orquestracao-validar-multi-project-impact
description: Analisa impacto de decisões nos 5 projetos da plataforma SoundLink. Use ao tomar decisão arquitetural, criar/modificar feature, atualizar stack, ou criar novo agent/skill.
---

# Validar Impacto Multi-Projeto

## Quando Usar

- Ao tomar decisão arquitetural que pode afetar múltiplos projetos
- Ao criar/modificar feature que precisa ser replicada
- Ao atualizar stack tecnológico
- Ao criar novo agent/skill
- Ao modificar padrões de código
- Ao alterar estrutura de pastas/documentação

## Contexto dos 5 Projetos

### 1. Template (soundlink-template-frontend)
- **Papel**: Referência de fluxos, telas, specs de API
- **Função**: Direciona o Frontend Oficial (migração por sprint)
- **Localização**: Este repositório

### 2. Frontend Oficial (soundlink-frontend)
- **Papel**: App em produção
- **Função**: Recebe código do Template por sprint
- **Migração**: Template → Frontend Oficial

### 3. BFF (soundlink-bff)
- **Papel**: Orquestração e adaptação para o frontend
- **Função**: Mapeamento BFF ↔ API
- **Dependência**: Recebe especificações do Template

### 4. APIs (soundlink-api)
- **Papel**: Domínio e regras de negócio
- **Função**: Contratos consumidos pelo BFF
- **Dependência**: Recebe especificações do Template via BFF

### 5. Infrastructure (soundlink-infrastructure)
- **Papel**: Infraestrutura e DevOps
- **Função**: CI/CD, ambientes, deploy, monitoramento
- **Dependência**: Suporta todos os projetos

## Fluxo de Referência

```
Template → Frontend Oficial → BFF → API
         ↓
    Infrastructure (suporta todos)
```

**Regra**: Template direciona os demais projetos. Cada sprint gera nova referência.

## Processo de Análise

### 1. Identificar Projeto Afetado

Determinar qual projeto está sendo modificado:
- **Template**: Mudanças aqui afetam todos os outros
- **Frontend Oficial**: Pode precisar atualizar Template
- **BFF**: Pode precisar atualizar Template e APIs
- **APIs**: Pode precisar atualizar BFF e Template
- **Infrastructure**: Afeta todos os projetos

### 2. Mapear Dependências

Identificar dependências entre projetos:

**Template → Frontend Oficial**:
- Código migrado por sprint
- Especificações de API
- User flows e business rules

**Template → BFF**:
- Especificações de API
- Fluxos de orquestração
- Mapeamento de endpoints

**BFF → API**:
- Contratos de API
- Regras de negócio
- Estrutura de dados

**Infrastructure → Todos**:
- CI/CD pipelines
- Ambientes (dev, staging, prod)
- Monitoramento e observabilidade

### 3. Analisar Impacto no Fluxo de Migração

Verificar se a decisão afeta:
- **Migração Template → Frontend**: Código, estrutura, padrões
- **Especificações Template → BFF**: APIs, contratos, mapeamentos
- **Contratos BFF → API**: Endpoints, tipos, validações

### 4. Identificar Projetos que Precisam Atualizar

Listar todos os projetos afetados:
- Projetos que precisam de mudanças imediatas
- Projetos que precisam de mudanças futuras
- Projetos que não são afetados

### 5. Sugerir Estratégia de Replicação

Definir ordem e método de replicação:

**Ordem Recomendada**:
1. Template (se mudança começa aqui)
2. Frontend Oficial (se mudança vem do Template)
3. BFF (se mudança afeta orquestração)
4. API (se mudança afeta contratos)
5. Infrastructure (se mudança afeta infra)

**Métodos de Replicação**:
- **Migração por Sprint**: Template → Frontend Oficial
- **Especificações**: Template → BFF → API
- **Agents/Skills**: Copiar e adaptar
- **Documentação**: Atualizar em todos os projetos

### 6. Documentar Decisão

Registrar em `docs/gestao-ideias/00-governanca/ia/multi-project-impact-analysis.md`:
- Decisão tomada
- Projetos afetados
- Estratégia de replicação
- Timeline estimado
- Lições aprendidas

## Saída Esperada

### Relatório de Impacto Multi-Projeto

```markdown
## Análise de Impacto Multi-Projeto

**Decisão**: [Descrição da decisão]

**Projetos Afetados**:
- ✅ Template: [Impacto]
- ✅ Frontend Oficial: [Impacto]
- ✅ BFF: [Impacto]
- ✅ API: [Impacto]
- ✅ Infrastructure: [Impacto]

**Dependências Identificadas**:
- [Lista de dependências]

**Estratégia de Replicação**:
1. [Passo 1]
2. [Passo 2]
3. [Passo 3]

**Timeline Estimado**: [Tempo estimado]

**Riscos Identificados**: [Lista de riscos]
```

## Exemplos

### Exemplo 1: Nova Feature no Template

```
Decisão: Adicionar feature de avaliações no Template

Projetos Afetados:
- ✅ Template: Implementar feature completa
- ✅ Frontend Oficial: Migrar na próxima sprint
- ✅ BFF: Criar endpoints de orquestração
- ✅ API: Criar endpoints de domínio
- ✅ Infrastructure: Nenhum impacto

Estratégia:
1. Implementar no Template
2. Documentar especificações de API
3. Migrar para Frontend Oficial na sprint seguinte
4. Implementar no BFF (orquestração)
5. Implementar na API (domínio)
```

### Exemplo 2: Atualização de Stack

```
Decisão: Atualizar Next.js 14 → 15

Projetos Afetados:
- ✅ Template: Atualizar primeiro
- ✅ Frontend Oficial: Atualizar após validação no Template
- ✅ BFF: Nenhum impacto (NestJS)
- ✅ API: Nenhum impacto (NestJS)
- ✅ Infrastructure: Atualizar CI/CD se necessário

Estratégia:
1. Atualizar no Template
2. Testar e validar
3. Atualizar no Frontend Oficial
4. Atualizar CI/CD se necessário
```

### Exemplo 3: Novo Agent/Skill

```
Decisão: Criar novo agent de validação

Projetos Afetados:
- ✅ Template: Criar agent
- ✅ Frontend Oficial: Copiar e adaptar
- ✅ BFF: Avaliar necessidade
- ✅ API: Avaliar necessidade
- ✅ Infrastructure: Avaliar necessidade

Estratégia:
1. Criar no Template
2. Documentar uso
3. Copiar para projetos que precisam
4. Adaptar conforme necessário
```

## Referências

- **Estrutura de Projetos**: `docs/gestao-ideias/00-governanca/ia/README.md`
- **Fluxo de Migração**: `.cursorrules` (seção "Cadeia: Template → Frontend Oficial → BFF → API")
- **Agents por Projeto**: `docs/gestao-ideias/00-governanca/ia/subagents.md`
- **Skills por Projeto**: `docs/gestao-ideias/00-governanca/ia/skills-recomendadas.md`

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

