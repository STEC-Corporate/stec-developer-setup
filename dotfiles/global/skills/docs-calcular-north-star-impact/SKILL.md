---
name: docs-calcular-north-star-impact
description: Calcula e classifica impacto de features na North Star Metric. Use durante Fase 0 de validação estratégica, ao priorizar features, ou ao analisar impacto de feature existente.
---

# Calcular Impacto na North Star

## Quando Usar

- Durante Fase 0 de validação estratégica
- Ao priorizar features no backlog
- Ao analisar impacto de feature existente
- Ao revisar métricas

## North Star Metric

**Métrica Principal**: "Contratações bem-sucedidas com avaliação ≥4 estrelas"

**Definição**: Contratações que resultaram em avaliação de 4 ou 5 estrelas, indicando satisfação alta.

**Consultar**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

## Classificação de Impacto

### 🟢 Alto (>10% impacto esperado)

**Características**:
- Impacta diretamente o processo de contratação
- Melhora qualidade das avaliações
- Aumenta taxa de sucesso de contratações
- Reduz fricção no processo de matching

**Exemplos**:
- Sistema de avaliações pós-evento
- Melhorias no sistema de busca e matching
- Sistema de recomendações inteligentes
- Melhorias no processo de contratação

**Prioridade**: ALTA - Implementar logo

### 🟡 Médio (5-10% impacto esperado)

**Características**:
- Impacta indiretamente o processo de contratação
- Melhora experiência que pode levar a melhores avaliações
- Otimiza processos relacionados
- Facilita comunicação entre partes

**Exemplos**:
- Melhorias na interface de perfil
- Sistema de notificações melhorado
- Dashboard de métricas para músicos
- Melhorias na busca (sem matching)

**Prioridade**: MÉDIA - Agendar para sprints futuras

### 🔴 Baixo (<5% impacto esperado)

**Características**:
- Impacto muito indireto ou marginal
- Melhora experiência mas não afeta avaliações diretamente
- Otimizações menores
- Features de conveniência

**Exemplos**:
- Dark mode
- Exportação de dados
- Melhorias visuais menores
- Features de organização pessoal

**Prioridade**: BAIXA - Backlog, implementar quando houver tempo

### ⚪ Nenhum (manutenção/refatoração)

**Características**:
- Não impacta métrica diretamente ou indiretamente
- Refatoração técnica
- Melhorias de performance internas
- Correções de bugs não críticos

**Exemplos**:
- Refatoração de código legado
- Otimização de queries
- Migração de bibliotecas
- Correções de typos

**Prioridade**: Reavaliar necessidade - pode ser rejeitada se não for essencial

## Processo de Cálculo

### 1. Identificar Cadeia de Causa-Efeito

Analisar como a feature impacta a métrica:

```
Feature → [Efeito 1] → [Efeito 2] → ... → North Star
```

**Exemplo**:
```
Sistema de avaliações → Melhor feedback → Músicos melhoram → 
Melhores contratações → Mais avaliações ≥4 → North Star ↑
```

### 2. Estimar Impacto Percentual

Considerar:
- **Direto**: Impacto imediato na métrica
- **Indireto**: Impacto através de outros fatores
- **Tempo**: Impacto imediato vs longo prazo

**Usar dados históricos** quando disponíveis para estimar.

### 3. Analisar Correlação com Outras Features

Verificar:
- **Features relacionadas**: Que outras features impactam o mesmo aspecto?
- **Sinergias**: Como esta feature se combina com outras?
- **Dependências**: Esta feature depende de outras para ter impacto?
- **Conflitos**: Esta feature pode reduzir impacto de outras?

**Consultar**: `docs/gestao-ideias/00-governanca/ia/north-star-impact-analysis.md` para histórico

### 4. Consultar Histórico de Impactos Similares

Analisar:
- **Features similares**: Que features similares já foram implementadas?
- **Impacto real**: Qual foi o impacto real dessas features?
- **Lições aprendidas**: O que aprendemos com implementações anteriores?
- **Padrões identificados**: Existem padrões de sucesso/falha?

**Consultar**: `docs/gestao-ideias/00-governanca/ia/north-star-impact-analysis.md` para histórico

### 5. Projetar Impacto a Longo Prazo

Considerar:
- **Impacto imediato**: O que acontece logo após implementação?
- **Impacto de médio prazo**: O que acontece em 3-6 meses?
- **Impacto de longo prazo**: O que acontece em 6-12 meses?
- **Sustentabilidade**: O impacto se mantém ou diminui com o tempo?

### 6. Definir Métricas de Validação Pós-Implementação

Estabelecer:
- **Métricas a acompanhar**: Quais métricas validarão o impacto?
- **Baseline**: Qual é o valor atual antes da implementação?
- **Target**: Qual é o valor esperado após implementação?
- **Timeline**: Quando validar (1 mês, 3 meses, 6 meses)?

### 7. Justificar Classificação

Documentar:
- **Como** a feature impacta a métrica
- **Por que** a classificação foi escolhida
- **Evidências** que suportam a estimativa (dados, pesquisas, similaridades)
- **Correlações** identificadas
- **Histórico** de features similares
- **Projeções** de longo prazo

## Saída Esperada

### Relatório de Impacto Completo

```markdown
## Impacto na North Star

**Classificação**: 🟢 Alto / 🟡 Médio / 🔴 Baixo / ⚪ Nenhum

**Justificativa**: 
[Explicação detalhada de como a feature impacta a métrica]

**Cadeia de Causa-Efeito**:
Feature → [efeito] → [efeito] → North Star

**Estimativa de Impacto**: X% (se possível quantificar)

**Correlação com Outras Features**:
- Features relacionadas: [lista]
- Sinergias: [análise]
- Dependências: [análise]

**Histórico de Features Similares**:
- Features similares: [lista]
- Impacto real observado: [análise]
- Lições aprendidas: [análise]

**Projeções de Longo Prazo**:
- Impacto imediato: [análise]
- Impacto médio prazo (3-6 meses): [análise]
- Impacto longo prazo (6-12 meses): [análise]
- Sustentabilidade: [análise]

**Métricas de Validação**:
- Métricas a acompanhar: [lista]
- Baseline atual: [valor]
- Target esperado: [valor]
- Timeline de validação: [quando validar]

**Prioridade Recomendada**: ALTA / MÉDIA / BAIXA / Reavaliar
```

## Exemplos

### Exemplo 1: Impacto Alto
```
Feature: Sistema de avaliações pós-evento

Classificação: 🟢 Alto (>10%)

Justificativa:
- Avaliações são core da métrica North Star
- Sistema de avaliações melhora qualidade do feedback
- Feedback melhor → músicos melhoram → melhores contratações
- Impacto direto e imediato na métrica

Cadeia: Avaliações → Feedback → Melhoria → Contratações ≥4 → North Star ↑

Prioridade: ALTA
```

### Exemplo 2: Impacto Médio
```
Feature: Dashboard de métricas para músicos

Classificação: 🟡 Médio (5-10%)

Justificativa:
- Músicos veem métricas → entendem o que funciona
- Melhor entendimento → melhorias no perfil
- Perfil melhor → mais contratações bem-sucedidas
- Impacto indireto e de médio prazo

Cadeia: Dashboard → Insights → Melhorias → Mais matches → North Star ↑

Prioridade: MÉDIA
```

### Exemplo 3: Impacto Baixo
```
Feature: Dark mode

Classificação: 🔴 Baixo (<5%)

Justificativa:
- Melhora experiência do usuário
- Pode aumentar tempo na plataforma
- Impacto muito indireto na métrica
- Não afeta diretamente qualidade de contratações

Cadeia: Dark mode → UX melhor → Mais uso → Impacto marginal → North Star

Prioridade: BAIXA
```

## Documentação de Resultados

Após calcular impacto, documentar em:
- `docs/gestao-ideias/00-governanca/ia/north-star-impact-analysis.md` - Histórico de análises
- `docs/gestao-ideias/00-governanca/ia/strategic-validation-dashboard.md` - Dashboard de validações

**Incluir**:
- Classificação de impacto
- Justificativa completa
- Métricas de validação definidas
- Projeções de longo prazo

## Validação Pós-Implementação

Após implementação da feature:
1. **Acompanhar métricas** definidas
2. **Comparar** resultado real vs estimativa
3. **Documentar** em `docs/gestao-ideias/00-governanca/ia/north-star-impact-analysis.md`
4. **Aprender** para melhorar próximas estimativas

## Referências

- **North Star Metric**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Metric Dictionary**: `docs/gestao-ideias/02-execucao/planejamento/metrics/metric-dictionary.md`
- **Playbook Priorização**: `docs/gestao-ideias/00-governanca/ia/playbooks/feature-prioritization.md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md` (Fase 0)
- **Histórico de Análises**: `docs/gestao-ideias/00-governanca/ia/north-star-impact-analysis.md`
- **Dashboard de Validações**: `docs/gestao-ideias/00-governanca/ia/strategic-validation-dashboard.md`

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

