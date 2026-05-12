---
name: code-verificar-file-sizes
description: Verifica tamanho de arquivos (componentes, hooks, services) contra limites do projeto. Use ao analisar feature, antes de code review, ou ao validar conformidade com limites de tamanho.
---

# Verificar Tamanho de Arquivos

## Quando Usar

- Ao analisar feature completa
- Antes de code review
- Ao validar conformidade com limites de tamanho
- Ao identificar componentes/hooks que precisam refatoração
- Como parte de `code-revisar-code-soundlink` ou `code-extrair-component`

## Limites Obrigatórios

### Componentes React
- **Máximo**: 200 linhas por componente
- **Localização**: `src/**/presentation/components/**/*.tsx`
- **Violação**: 🔴 Crítico - Requer refatoração imediata

### Custom Hooks
- **Máximo**: 150 linhas por hook
- **Localização**: `src/**/application/hooks/**/*.ts`
- **Violação**: 🔴 Crítico - Requer refatoração imediata

### API Services
- **Máximo**: 300 linhas por service
- **Localização**: `src/**/application/services/**/*.ts`
- **Violação**: 🟡 Suggestion - Considerar refatoração

## Processo de Verificação

### 1. Identificar Arquivos a Verificar

**Para análise de feature**:
- Todos componentes em `presentation/components/`
- Todos hooks em `application/hooks/`
- Todos services em `application/services/`

**Para análise específica**:
- Arquivos mencionados pelo usuário
- Arquivos modificados recentemente
- Arquivos suspeitos de serem grandes

### 2. Contar Linhas de Cada Arquivo

**Método 1: Usar grep**
```bash
grep -c "^" arquivo.tsx
```

**Método 2: Ler arquivo e contar**
- Ler arquivo completo
- Contar linhas totais
- Excluir linhas vazias se necessário

**Método 3: Usar ferramenta de contagem**
- Usar comando apropriado do sistema
- Verificar tamanho real do arquivo

### 3. Classificar por Violação

**Componentes**:
- 🔴 **Crítico**: >200 linhas
- 🟡 **Atenção**: 150-200 linhas (próximo do limite)
- ✅ **OK**: <150 linhas

**Hooks**:
- 🔴 **Crítico**: >150 linhas
- 🟡 **Atenção**: 120-150 linhas (próximo do limite)
- ✅ **OK**: <120 linhas

**Services**:
- 🟡 **Atenção**: >300 linhas
- ✅ **OK**: ≤300 linhas

### 4. Gerar Relatório

**Formato obrigatório**:

```markdown
## Verificação de Tamanho de Arquivos

### Componentes React

| Arquivo | Linhas | Status | Ação |
|---------|--------|--------|------|
| equipment-list-v2.tsx | 1053 | 🔴 Crítico | Refatorar para <200 linhas |
| payment-methods-v2.tsx | 591 | 🔴 Crítico | Refatorar para <200 linhas |
| component-small.tsx | 150 | ✅ OK | - |

**Total**: 3 componentes verificados
**Violações**: 2 componentes acima de 200 linhas

### Custom Hooks

| Arquivo | Linhas | Status | Ação |
|---------|--------|--------|------|
| use-musician-profile.ts | 180 | 🔴 Crítico | Refatorar para <150 linhas |
| use-auth.ts | 120 | ✅ OK | - |

**Total**: 2 hooks verificados
**Violações**: 1 hook acima de 150 linhas

### API Services

| Arquivo | Linhas | Status | Ação |
|---------|--------|--------|------|
| musician-profile.service.ts | 250 | ✅ OK | - |

**Total**: 1 service verificado
**Violações**: 0
```

## Saída Esperada

### ✅ Conforme

**Condições**:
- Todos componentes ≤200 linhas
- Todos hooks ≤150 linhas
- Todos services ≤300 linhas

**Ação**: Prosseguir

### ❌ Não Conforme

**Condições**:
- Qualquer componente >200 linhas
- Qualquer hook >150 linhas

**Ação**: 
- Listar TODOS os arquivos violando limites
- Classificar como 🔴 Crítico
- Sugerir refatoração imediata
- Se aplicável, usar Skill `code-extrair-component` para guiar refatoração

## Integração com Outras Skills

### Com `code-revisar-code-soundlink`
Esta verificação DEVE ser parte obrigatória de `code-revisar-code-soundlink`.

### Com `code-extrair-component`
Quando identificar componentes grandes, aplicar `code-extrair-component` para guiar refatoração.

## Exemplos

### Exemplo 1: Feature Completa
```
Verificando: src/features/musician-profile/

Componentes:
- equipment-list-v2.tsx: 1053 linhas 🔴 CRÍTICO
- payment-methods-v2.tsx: 591 linhas 🔴 CRÍTICO
- skills-competencies-v2.tsx: 553 linhas 🔴 CRÍTICO

Hooks:
- use-musician-profile.ts: 180 linhas 🔴 CRÍTICO

→ 4 violações críticas encontradas
→ Aplicar Skill extract-component para refatoração
```

### Exemplo 2: Arquivo Específico
```
Verificando: equipment-list-v2.tsx
Tamanho: 1053 linhas
Limite: 200 linhas
Violação: +853 linhas acima do limite
Status: 🔴 CRÍTICO
Ação: Refatorar em sub-componentes
```

## Referências

- **Padrões**: `.cursor/rules/frontend-clean-architecture.mdc` (seção Limites de Tamanho)
- **Componentização**: `docs/gestao-ideias/04-referencia-tecnica/_templates/componentizacao-checklist.md`
- **Review Code**: `.cursor/skills/code-revisar-code-soundlink/SKILL.md`

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

