---
name: code-avaliar-quality-performance
description: Analisa qualidade e performance: avalia qualidade de código, identifica problemas de performance, sugere otimizações, valida contra padrões e monitora métricas. Use durante code review, ao analisar qualidade, ao otimizar performance ou periodicamente.
---

# Avaliar Qualidade e Performance

## Quando Usar

- Durante code review
- Ao analisar qualidade de código
- Ao otimizar performance
- Periodicamente (semanal/mensal) para monitoramento
- Ao identificar problemas de performance
- Ao validar conformidade com padrões

## Processo de Análise

### 1. Analisar Qualidade de Código

**Objetivo**: Avaliar qualidade geral do código

#### 1.1 Conformidade com Clean Architecture

**Aspectos a Avaliar**:
- Separação de camadas
- Dependências corretas
- Organização por features
- Violações de arquitetura

**Consultar**: `.cursorrules`

**Critérios**:
- ✅ Domain Layer não depende de camadas externas
- ✅ Application Layer orquestra corretamente
- ✅ Infrastructure Layer implementa interfaces
- ✅ Presentation Layer consome Application Layer

---

#### 1.2 Conformidade com TypeScript Strict

**Aspectos a Avaliar**:
- Uso de `any` (proibido)
- Type safety
- Validação com Zod
- Type inference

**Consultar**: `tsconfig.json`

**Critérios**:
- ✅ Zero uso de `any`
- ✅ Type safety completo
- ✅ Validação com Zod
- ✅ Type inference correto

---

#### 1.3 Conformidade com Padrões de Código

**Aspectos a Avaliar**:
- Nomenclatura (auxiliary verbs, PascalCase, etc.)
- Estrutura de arquivos
- Imports organizados
- Error handling

**Consultar**: `.cursorrules`

**Critérios**:
- ✅ Nomenclatura consistente
- ✅ Estrutura de arquivos correta
- ✅ Imports organizados
- ✅ Error handling adequado

---

#### 1.4 Cobertura de Testes

**Aspectos a Avaliar**:
- Cobertura por tipo de teste
- Cobertura por camada
- Cobertura por projeto

**Consultar**: `docs/gestao-ideias/00-governanca/ia/testing-strategy-complete.md`

**Critérios**:
- ✅ Unit tests: 80%+ cobertura
- ✅ Integration tests: 70%+ cobertura
- ✅ E2E tests: 60%+ cobertura
- ✅ Overall: 75%+ cobertura

---

### 2. Identificar Problemas de Performance

**Objetivo**: Identificar gargalos e problemas de performance

#### 2.1 Web Vitals

**Métricas a Avaliar**:
- **LCP (Largest Contentful Paint)**: < 2.5s
- **CLS (Cumulative Layout Shift)**: < 0.1
- **FID (First Input Delay)**: < 100ms
- **FCP (First Contentful Paint)**: < 1.8s

**Consultar**: `docs/gestao-ideias/00-governanca/ia/performance-validation-strategy.md`

**Critérios**:
- ✅ LCP < 2.5s
- ✅ CLS < 0.1
- ✅ FID < 100ms
- ✅ FCP < 1.8s

---

#### 2.2 Performance por Projeto

**Aspectos a Avaliar**:
- Tempo de resposta
- Throughput
- Uptime
- Escalabilidade

**Projetos**:
- Template (soundlink-template-frontend)
- Frontend Oficial (soundlink-frontend)
- BFF (soundlink-bff)
- APIs (soundlink-api)
- Infrastructure (soundlink-infrastructure)

**Consultar**: `docs/gestao-ideias/00-governanca/ia/performance-validation-strategy.md`

---

#### 2.3 Gargalos Identificados

**Tipos de Gargalos**:
- Queries lentas
- Renderização lenta
- Bundle size grande
- Imagens não otimizadas
- Falta de cache

**Ações**:
- Identificar gargalos
- Priorizar por impacto
- Sugerir otimizações

---

### 3. Sugerir Otimizações

**Objetivo**: Recomendar otimizações baseadas em análise

#### 3.1 Otimizações de Código

**Tipos**:
- Refatorações
- Melhorias de estrutura
- Redução de complexidade
- Melhorias de type safety

**Priorização**:
- Impacto vs esforço
- Urgência
- Dependências

---

#### 3.2 Otimizações de Performance

**Tipos**:
- Otimização de queries
- Otimização de renderização
- Redução de bundle size
- Otimização de imagens
- Implementação de cache

**Priorização**:
- Impacto na performance
- Esforço de implementação
- ROI esperado

---

#### 3.3 Otimizações de Testes

**Tipos**:
- Aumentar cobertura
- Melhorar qualidade de testes
- Otimizar execução
- Adicionar testes faltantes

**Priorização**:
- Gaps críticos
- ROI de testes
- Dependências

---

### 4. Validar contra Padrões

**Consultar**: `.cursorrules`, `docs/gestao-ideias/00-governanca/ia/guardrails.md`

#### Verificações Obrigatórias

1. **Conformidade com Clean Architecture**:
   - ✅ Separação de camadas correta
   - ✅ Dependências corretas
   - ✅ Organização por features

2. **Conformidade com TypeScript Strict**:
   - ✅ Zero uso de `any`
   - ✅ Type safety completo
   - ✅ Validação com Zod

3. **Conformidade com Padrões de Código**:
   - ✅ Nomenclatura consistente
   - ✅ Estrutura de arquivos correta
   - ✅ Error handling adequado

4. **Conformidade com Guardrails**:
   - ✅ Não viola princípios
   - ✅ Alinhado com valores
   - ✅ Transparência mantida

---

### 5. Monitorar Métricas

**Objetivo**: Acompanhar métricas de qualidade e performance

#### 5.1 Métricas de Qualidade

**Métricas**:
- Cobertura de testes
- Conformidade com padrões
- Complexidade de código
- Dívida técnica

**Acompanhamento**: Mensal

**Consultar**: `docs/gestao-ideias/00-governanca/ia/quality-metrics.md`

---

#### 5.2 Métricas de Performance

**Métricas**:
- Web Vitals
- Tempo de resposta
- Throughput
- Uptime

**Acompanhamento**: Semanal

**Consultar**: `docs/gestao-ideias/00-governanca/ia/performance-validation-strategy.md`

---

#### 5.3 Métricas de Negócio

**Métricas**:
- North Star Metric
- Taxa de conversão
- Taxa de retenção
- Satisfação do usuário

**Acompanhamento**: Mensal

**Consultar**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

---

### 6. Documentar Resultados

**Onde documentar**: `docs/gestao-ideias/00-governanca/ia/quality-performance-analysis.md`

**Conteúdo**:
- Análise de qualidade
- Problemas identificados
- Otimizações sugeridas
- Métricas monitoradas
- Validação contra padrões

---

## Saída Esperada

### Relatório de Qualidade e Performance

```markdown
## Análise de Qualidade e Performance - [Data]

### Qualidade de Código
- Conformidade com Clean Architecture: [Avaliação]
- Conformidade com TypeScript Strict: [Avaliação]
- Conformidade com Padrões: [Avaliação]
- Cobertura de Testes: [Percentual]

### Performance
- Web Vitals: [Métricas]
- Performance por Projeto: [Análise]
- Gargalos Identificados: [Lista]

### Otimizações Sugeridas
- Código: [Lista]
- Performance: [Lista]
- Testes: [Lista]

### Métricas
- Qualidade: [Métricas]
- Performance: [Métricas]
- Negócio: [Métricas]
```

---

## Referências

- **Clean Architecture**: `.cursorrules`
- **TypeScript Strict**: `tsconfig.json`
- **Estratégia de Testes**: `docs/gestao-ideias/00-governanca/ia/testing-strategy-complete.md`
- **Validação de Performance**: `docs/gestao-ideias/00-governanca/ia/performance-validation-strategy.md`
- **Otimização Contínua**: `docs/gestao-ideias/00-governanca/ia/continuous-optimization.md`
- **Monitoramento**: `docs/gestao-ideias/00-governanca/ia/monitoring-observability-strategy.md`
- **Métricas de Qualidade**: `docs/gestao-ideias/00-governanca/ia/quality-metrics.md`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **North Star Metric**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-01-21  
**Revisão**: Semanal (performance), Mensal (qualidade)  
**Responsável**: Strategic Advisor

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

