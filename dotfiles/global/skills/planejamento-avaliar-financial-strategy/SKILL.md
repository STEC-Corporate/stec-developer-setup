---
name: planejamento-avaliar-financial-strategy
description: Analisa modelo de receita, projeções financeiras, custos, ROI de features e validação de sustentabilidade financeira. Use ao avaliar modelo de receita, projetar crescimento, analisar ROI de features, ou tomar decisões financeiras.
---

# Avaliar Estratégia Financeira

## Quando Usar

- Ao avaliar modelo de receita
- Ao projetar crescimento financeiro
- Ao analisar ROI de features
- Ao tomar decisões financeiras estratégicas
- Periodicamente (mensal/trimestral) para acompanhamento
- Ao validar sustentabilidade financeira

## Modelo de Receita da SoundLink

### Princípios Fundamentais

**Consultar**: `docs/gestao-ideias/00-governanca/decisoes/adr-015-platform-100-percent-free.md`

- ✅ **Plataforma 100% gratuita** para todos os usuários
- ✅ **Zero mensalidade, zero assinatura**
- ✅ **Receita única**: Comissões sobre contratações bem-sucedidas
- ❌ **NUNCA** planos premium para músicos (guardrail)
- ✅ Contratantes PODEM ter planos pagos (não competem entre si)

### Fontes de Receita

#### 1. Comissões sobre Contratações (Principal)

**Modelo**: Taxa progressiva sobre valor da contratação

**Fórmula**:
```
Taxa = máximo(10% - (0,5% × piso(valor / 1.000)), 5%)
```

**Tabela de Taxas**:

| Valor da Contratação | Taxa Aplicada | Valor da Taxa |
|---------------------|---------------|----------------|
| R$ 500              | 10%           | R$ 50         |
| R$ 1.000            | 9,5%          | R$ 95         |
| R$ 2.000            | 9%            | R$ 180        |
| R$ 3.000            | 8,5%          | R$ 255        |
| R$ 4.000            | 8%            | R$ 320        |
| R$ 5.000            | 7,5%          | R$ 375        |
| R$ 7.000            | 6,5%          | R$ 455        |
| R$ 10.000           | 5%            | R$ 500        |
| R$ 15.000+          | 5% (mínimo)   | 5% do valor   |

**Divisão da Taxa**: 50% contratante + 50% prestador

**Incentivo Inicial**: Primeiras 3 contratações com taxa fixa de 5%

**Consultar**: `docs/gestao-ideias/04-referencia-tecnica/referencia/business/analise-custos-infraestrutura-2026.md`

#### 2. Planos Premium para Contratantes (Futuro)

**Status**: Potencial fonte futura (não implementada)

**Validação contra Guardrails**:
- ✅ Permitido para contratantes (não competem entre si)
- ❌ PROIBIDO para músicos (guardrail)

#### 3. Marketplace de Serviços (Futuro)

**Status**: Potencial fonte futura (não implementada)

**Validação**: Não pode violar guardrails de ranking e transparência

## Métricas Financeiras Essenciais

### 1. MRR (Monthly Recurring Revenue)

**Definição**: Receita recorrente mensal (comissões sobre contratações)

**Cálculo**:
```
MRR = Soma de todas as comissões recebidas no mês
```

**Exemplo**:
- 50 contratações/mês
- Ticket médio: R$ 1.500
- Taxa média: 9% = R$ 135 por contratação
- **MRR = 50 × R$ 135 = R$ 6.750/mês**

### 2. ARR (Annual Recurring Revenue)

**Definição**: Receita recorrente anual projetada

**Cálculo**:
```
ARR = MRR × 12
```

**Exemplo**:
- MRR = R$ 6.750/mês
- **ARR = R$ 6.750 × 12 = R$ 81.000/ano**

### 3. LTV (Lifetime Value)

**Definição**: Valor total que um usuário gera durante sua vida útil na plataforma

**Cálculo**:
```
LTV = (Ticket médio × Taxa média) × Número médio de contratações por usuário
```

**Exemplo**:
- Ticket médio: R$ 1.500
- Taxa média: 9% = R$ 135 por contratação
- Contratações médias por usuário: 8 contratações/ano × 3 anos = 24 contratações
- **LTV = R$ 135 × 24 = R$ 3.240**

### 4. CAC (Customer Acquisition Cost)

**Definição**: Custo para adquirir um novo usuário

**Cálculo**:
```
CAC = Custo total de marketing / Novos usuários adquiridos
```

**Exemplo**:
- Custo de marketing: R$ 1.000/mês
- Novos usuários: 50/mês
- **CAC = R$ 1.000 / 50 = R$ 20/usuário**

### 5. Churn Rate

**Definição**: Taxa de usuários que deixam a plataforma

**Cálculo**:
```
Churn Rate = (Usuários que saíram / Total de usuários no início) × 100
```

**Meta**: <5% mensal (plataforma gratuita tem churn naturalmente baixo)

### 6. LTV:CAC Ratio

**Definição**: Relação entre valor gerado e custo de aquisição

**Cálculo**:
```
LTV:CAC = LTV / CAC
```

**Meta**: >3:1 (saudável)

**Exemplo**:
- LTV = R$ 3.240
- CAC = R$ 20
- **LTV:CAC = 162:1** ✅ Excelente (plataforma gratuita)

## Análise de Custos

### Custos Fixos Mensais

**Consultar**: `docs/gestao-ideias/04-referencia-tecnica/referencia/business/analise-custos-infraestrutura-2026.md`

| Item | Valor Mensal |
|------|--------------|
| AWS (infraestrutura) | R$ 1.000 |
| Domínios / SaaS / E-mails | R$ 150 |
| Contabilidade / Jurídico básico | R$ 500 |
| Ferramentas (CRM, design, analytics) | R$ 300 |
| Marketing mínimo orgânico | R$ 1.000 |
| **Custo fixo mínimo total** | **R$ 2.950/mês** |

### Custos por Projeto (5 projetos da plataforma)

**Projetos**:
1. Template (soundlink-template-frontend)
2. Frontend Oficial (soundlink-frontend)
3. BFF (soundlink-bff)
4. APIs (soundlink-api)
5. Infrastructure (soundlink-infrastructure)

**Distribuição de Custos**:
- Infraestrutura compartilhada: R$ 1.000/mês
- Desenvolvimento: Proporcional ao uso de recursos
- Operação: Distribuído entre projetos

### Custo por Contratação (Infraestrutura)

| Cenário | Custo AWS | Contratações/mês | Custo/Contratação |
|---------|-----------|------------------|-------------------|
| Início | R$ 1.000 | 20 | **R$ 50,00** |
| Crescimento | R$ 3.500 | 150 | **R$ 23,33** |
| Escala | R$ 15.000 | 1.000 | **R$ 15,00** |

**Margem de infraestrutura**: 80-90% (receita média R$ 180-240 por contratação)

## Projeções Financeiras

### Break-Even Point

**Cálculo**:
```
Break-Even = Custo fixo total / Receita média por contratação
```

**Cenários**:

**Conservador (tickets baixos)**:
- Custo fixo: R$ 2.950/mês
- Ticket médio: R$ 500
- Taxa média: 10% = R$ 50 por contratação
- **Break-even: R$ 2.950 ÷ R$ 50 = 59 contratações/mês**

**Realista (tickets moderados)**:
- Custo fixo: R$ 2.950/mês
- Ticket médio: R$ 1.500
- Taxa média: 9% = R$ 135 por contratação
- **Break-even: R$ 2.950 ÷ R$ 135 = 22 contratações/mês**

**Otimista (tickets altos)**:
- Custo fixo: R$ 2.950/mês
- Ticket médio: R$ 3.000
- Taxa média: 8,5% = R$ 255 por contratação
- **Break-even: R$ 2.950 ÷ R$ 255 = 12 contratações/mês**

### Projeções de Receita (3, 6, 12 meses)

**Cenário Realista**:

| Período | Contratações/mês | Ticket Médio | Taxa Média | Receita Mensal | Receita Acumulada |
|---------|------------------|--------------|------------|----------------|-------------------|
| Mês 1-3 | 20 | R$ 1.200 | 9,5% | R$ 2.280 | R$ 6.840 |
| Mês 4-6 | 50 | R$ 1.500 | 9% | R$ 6.750 | R$ 27.090 |
| Mês 7-9 | 100 | R$ 1.800 | 8,5% | R$ 15.300 | R$ 72.990 |
| Mês 10-12 | 200 | R$ 2.000 | 8% | R$ 32.000 | R$ 168.990 |

### Projeções de Custos

| Período | Custo Fixo | Custo Variável (AWS) | Custo Total |
|---------|------------|---------------------|-------------|
| Mês 1-3 | R$ 2.950 | R$ 1.000 | R$ 3.950 |
| Mês 4-6 | R$ 2.950 | R$ 1.500 | R$ 4.450 |
| Mês 7-9 | R$ 2.950 | R$ 2.500 | R$ 5.450 |
| Mês 10-12 | R$ 2.950 | R$ 3.500 | R$ 6.450 |

### Roadmap para Sustentabilidade

**Fase 1 (Mês 1-3)**: Validação
- Meta: 20 contratações/mês
- Receita: R$ 2.280/mês
- Status: Pré-break-even (investimento inicial)

**Fase 2 (Mês 4-6)**: Break-Even
- Meta: 50 contratações/mês
- Receita: R$ 6.750/mês
- Status: Break-even alcançado ✅

**Fase 3 (Mês 7-9)**: Lucratividade
- Meta: 100 contratações/mês
- Receita: R$ 15.300/mês
- Status: Lucro operacional ✅

**Fase 4 (Mês 10-12)**: Crescimento
- Meta: 200 contratações/mês
- Receita: R$ 32.000/mês
- Status: Crescimento sustentável ✅

## Validação contra North Star Metric

### Relação Receita ↔ North Star

**Conexão**:
```
Mais contratações bem-sucedidas (≥4 estrelas) →
Mais eventos futuros →
Mais comissões →
Mais receita
```

**Análise**:
- North Star alto (≥80%) → Usuários satisfeitos → Retenção alta → Mais contratações → Mais receita
- North Star baixo (<60%) → Usuários insatisfeitos → Churn alto → Menos contratações → Menos receita

### Impacto de Features na Receita

**Features que aumentam receita**:
- ✅ Melhorias no matching (mais contratações bem-sucedidas)
- ✅ Sistema de avaliações (mais confiança, mais contratações)
- ✅ Melhorias no processo de contratação (menos fricção, mais conversão)
- ✅ Sistema de recomendações (mais matches, mais contratações)

**Features que não aumentam receita diretamente**:
- ⚠️ Dark mode (melhora UX, mas impacto marginal na receita)
- ⚠️ Exportação de dados (conveniência, mas não gera receita)
- ⚠️ Melhorias visuais menores (UX, mas impacto limitado)

## Processo de Análise

### 1. Coletar Dados Atuais

- Receita mensal atual (MRR)
- Número de contratações/mês
- Ticket médio
- Taxa média aplicada
- Custos fixos e variáveis
- Número de usuários ativos
- Churn rate

### 2. Calcular Métricas

- MRR, ARR
- LTV, CAC
- LTV:CAC ratio
- Churn rate
- Break-even point
- Margem de lucro

### 3. Analisar Tendências

- Receita crescente ou decrescente?
- Custos controlados?
- Break-even alcançado?
- Sustentabilidade financeira?

### 4. Projetar Cenários

- **Otimista**: Crescimento acima da média
- **Realista**: Crescimento esperado
- **Pessimista**: Crescimento abaixo da média

### 5. Identificar Riscos e Oportunidades

**Riscos**:
- Custos aumentando mais rápido que receita
- Churn alto
- Ticket médio diminuindo
- Break-even não alcançado no prazo

**Oportunidades**:
- Crescimento acelerado
- Ticket médio aumentando
- Churn baixo
- Novas fontes de receita (sem violar guardrails)

### 6. Validar contra Guardrails

**Verificar**:
- ❌ NUNCA sugerir planos premium para músicos
- ❌ NUNCA sugerir destaque pago
- ✅ SEMPRE validar que modelo de receita não viola guardrails
- ✅ SEMPRE alinhar com North Star Metric

### 7. Documentar Análise

**Onde documentar**:
- `docs/gestao-ideias/00-governanca/ia/financial-strategy-analysis.md` - Análise completa
- `docs/gestao-ideias/00-governanca/ia/revenue-model.md` - Modelo de receita detalhado
- `docs/gestao-ideias/00-governanca/ia/financial-projections.md` - Projeções financeiras
- `docs/gestao-ideias/00-governanca/ia/cost-analysis.md` - Análise de custos
- `docs/gestao-ideias/00-governanca/ia/financial-sustainability.md` - Validação de sustentabilidade

## Saída Esperada

### Relatório de Análise Financeira

```markdown
## Análise Financeira Estratégica - [Data]

### Métricas Atuais
- **MRR**: R$ X.XXX/mês
- **ARR**: R$ XX.XXX/ano
- **LTV**: R$ X.XXX
- **CAC**: R$ XX
- **LTV:CAC**: X:1
- **Churn Rate**: X%

### Custos
- **Custo Fixo**: R$ 2.950/mês
- **Custo Variável**: R$ X.XXX/mês
- **Custo Total**: R$ X.XXX/mês

### Break-Even
- **Break-Even**: XX contratações/mês
- **Status**: ✅ Alcançado / ⚠️ Não alcançado

### Projeções (3, 6, 12 meses)
- **3 meses**: R$ X.XXX/mês
- **6 meses**: R$ X.XXX/mês
- **12 meses**: R$ X.XXX/mês

### Validação contra North Star
- **North Star atual**: XX%
- **Impacto na receita**: [análise]

### Riscos Identificados
- [Lista de riscos]

### Oportunidades Identificadas
- [Lista de oportunidades]

### Recomendações
- [Ações recomendadas]
```

## Referências

- **Modelo de Receita**: `docs/gestao-ideias/04-referencia-tecnica/referencia/business/analise-custos-infraestrutura-2026.md`
- **ADR-015**: `docs/gestao-ideias/00-governanca/decisoes/adr-015-platform-100-percent-free.md`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **North Star Metric**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Métricas de produto**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`, `docs/gestao-ideias/02-execucao/planejamento/metrics/metric-dictionary.md`

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

