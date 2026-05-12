# Análise de Custos - SoundLink

> **Documento Estratégico**: Análise detalhada de custos da plataforma SoundLink, incluindo infraestrutura, desenvolvimento, operação e otimizações.

---

## 📊 Visão Geral

Este documento detalha todos os custos da plataforma SoundLink, organizados por:
- Custos fixos mensais
- Custos variáveis (escalam com uso)
- Custos por projeto (5 projetos da plataforma)
- Custos por contratação
- Otimizações identificadas

---

## 💰 Custos Fixos Mensais

### Infraestrutura Cloud (AWS)

**Consultar**: `docs/referencia/business/analise-custos-infraestrutura-2026.md`

| Serviço | Especificação | Custo Mensal (BRL) |
|---------|---------------|-------------------|
| **Frontend (Vercel)** | Next.js, CDN global | R$ 0 - R$ 100 |
| **CloudFront** | CDN + cache | R$ 30 - R$ 100 |
| **WAF** | Proteção contra ataques | R$ 25 - R$ 50 |
| **API Gateway** | Porta de entrada | R$ 25 - R$ 75 |
| **ECS Fargate** | Backend containerizado | R$ 150 - R$ 400 |
| **RDS PostgreSQL** | db.t3.medium, Single-AZ | R$ 250 - R$ 300 |
| **S3** | Mídias, contratos, backups | R$ 25 - R$ 60 |
| **Cognito** | Autenticação (até 50k usuários) | R$ 0 |
| **CloudWatch** | Logs e monitoramento | R$ 50 - R$ 100 |
| **Athena + Analytics** | Dados e métricas | R$ 25 - R$ 50 |
| **Transferência de dados** | ~200GB/mês | R$ 100 - R$ 200 |
| **Total AWS** | | **R$ 680 - R$ 1.435/mês** |

**Custo médio realista**: **~R$ 1.000/mês** (início)

### Outros Custos Fixos

| Item | Valor Mensal | Descrição |
|------|--------------|-----------|
| **Domínios / SaaS / E-mails** | R$ 150 | Domínios, serviços SaaS, e-mails corporativos |
| **Contabilidade** | R$ 250–400 | Contabilidade online (ME/EPP Simples) |
| **Jurídico** | R$ 800–1.500 | Com IA até lançamento (ver ADR-020); tradicional: R$ 2.000–4.000 |
| **Ferramentas (CRM, design, analytics)** | R$ 300 | CRM, ferramentas de design, analytics |
| **Marketing mínimo orgânico** | R$ 1.000 | Marketing orgânico, conteúdo, SEO |
| **Seguro/compliance** | R$ 200–500 | D&O, responsabilidade civil, KYC |
| **Gateway de pagamento (fixo)** | R$ 0 | Pay-as-you-go; custo variável ~2% sobre GMV |

### Total de Custos Fixos

| Categoria | Valor Mensal |
|-----------|--------------|
| AWS (infraestrutura) | R$ 1.000 |
| Domínios / SaaS / E-mails | R$ 150 |
| Contabilidade | R$ 250–400 |
| Jurídico (com IA) | R$ 800–1.500 |
| Ferramentas (CRM, design, analytics) | R$ 300 |
| Marketing mínimo orgânico | R$ 1.000 |
| Seguro/compliance | R$ 200–500 |
| **Custo fixo mínimo total** | **R$ 3.700–4.850/mês** |

**Planejamento conservador:** ~R$ 4.500/mês  
*(Sem pró-labore ainda — startup bootstrap real)*  
*Detalhes em: `docs/decisoes/adr-020-operational-costs-sustainability.md`*

---

## 📈 Custos Variáveis (AWS)

### Escala Natural com Cloud

Os custos de infraestrutura escalam proporcionalmente ao número de usuários e contratações:

| Cenário | Usuários Ativos | Custo AWS/mês | Custo por Usuário |
|---------|----------------|---------------|-------------------|
| **Início** | 100 | R$ 1.000 | R$ 10,00 |
| **1.000 usuários** | 1.000 | R$ 1.200 | R$ 1,20 |
| **10.000 usuários** | 10.000 | R$ 3.500 | R$ 0,35 |
| **100.000 usuários** | 100.000 | R$ 15.000 | R$ 0,15 |
| **1.000.000 usuários** | 1.000.000 | R$ 80.000 | R$ 0,08 |

**Observação**: O custo marginal por usuário **diminui** conforme você cresce.

### Ajustes por Escala

**1.000 usuários ativos**:
- Custo: ~R$ 1.200/mês
- Ajustes: Nenhum (infraestrutura inicial suficiente)

**10.000 usuários ativos**:
- Custo: ~R$ 3.500/mês
- Ajustes: Multi-AZ no RDS, mais containers ECS

**100.000 usuários ativos**:
- Custo: ~R$ 15.000/mês
- Ajustes: Auto Scaling, ElastiCache (Redis), CDN avançado

**1.000.000 usuários ativos**:
- Custo: ~R$ 80.000/mês
- Ajustes: Data Lake, SageMaker (IA), arquitetura distribuída

---

## 🏗️ Custos por Projeto (5 Projetos da Plataforma)

### Projetos da Plataforma

1. **Template** (soundlink-template-frontend) - Referência
2. **Frontend Oficial** (soundlink-frontend) - Produção
3. **BFF** (soundlink-bff) - Orquestração
4. **APIs** (soundlink-api) - Domínio
5. **Infrastructure** (soundlink-infrastructure) - Infraestrutura

### Distribuição de Custos

**Infraestrutura Compartilhada**: R$ 1.000/mês
- Todos os projetos compartilham a mesma infraestrutura AWS
- Custos distribuídos proporcionalmente ao uso

**Desenvolvimento**: Proporcional ao uso de recursos
- Template: Baixo (referência, não produção)
- Frontend Oficial: Alto (produção, alto tráfego)
- BFF: Médio (orquestração, processamento)
- APIs: Alto (domínio, lógica de negócio)
- Infrastructure: Baixo (configuração, manutenção)

**Operação**: Distribuído entre projetos
- Monitoramento: Todos os projetos
- Logs: Todos os projetos
- Backup: Todos os projetos

### Estimativa de Custos por Projeto

| Projeto | Infraestrutura | Desenvolvimento | Operação | Total Estimado |
|---------|---------------|-----------------|----------|----------------|
| Template | R$ 50 | R$ 0 | R$ 20 | R$ 70/mês |
| Frontend Oficial | R$ 300 | R$ 0 | R$ 50 | R$ 350/mês |
| BFF | R$ 200 | R$ 0 | R$ 30 | R$ 230/mês |
| APIs | R$ 400 | R$ 0 | R$ 50 | R$ 450/mês |
| Infrastructure | R$ 50 | R$ 0 | R$ 20 | R$ 70/mês |
| **Total** | **R$ 1.000** | **R$ 0** | **R$ 170** | **R$ 1.170/mês** |

*(Nota: Custos de desenvolvimento são variáveis e não incluídos aqui)*

---

## 💼 Custo por Contratação (Infraestrutura)

### Análise de Custo por Transação

O modelo de comissões torna mais relevante analisar **custo por contratação** do que custo por usuário.

| Cenário | Custo AWS | Contratações/mês | Custo/Contratação |
|---------|-----------|------------------|-------------------|
| **Início** | R$ 1.000 | 20 | **R$ 50,00** |
| **Crescimento** | R$ 3.500 | 150 | **R$ 23,33** |
| **Escala** | R$ 15.000 | 1.000 | **R$ 15,00** |

### Comparação com Receita

**Receita média por contratação**: R$ 180-240 (taxa de 9-10% sobre ticket médio)

**Margem de infraestrutura**:
- Início: (R$ 180 - R$ 50) / R$ 180 = **72% de margem**
- Crescimento: (R$ 180 - R$ 23,33) / R$ 180 = **87% de margem**
- Escala: (R$ 180 - R$ 15) / R$ 180 = **92% de margem**

**Conclusão**: Infraestrutura representa apenas 8-28% da receita por contratação. A maior parte da receita é puro lucro operacional.

---

## 🔍 Otimizações Identificadas

### 1. Otimização de Infraestrutura

**Oportunidade**: Reduzir custos AWS através de:
- Reserved Instances (desconto de 30-40% para compromisso de 1-3 anos)
- Spot Instances (para workloads não críticos)
- Auto Scaling (escalar apenas quando necessário)

**Economia estimada**: 20-30% dos custos AWS

**Quando implementar**: Após validar padrão de uso (6-12 meses)

---

### 2. Otimização de Custos Fixos

**Oportunidade**: Revisar custos fixos periodicamente:
- Negociar contratos de contabilidade/jurídico
- Consolidar ferramentas (reduzir duplicação)
- Otimizar marketing (focar em canais mais eficientes)

**Economia estimada**: 10-15% dos custos fixos

**Quando implementar**: Trimestralmente

---

### 3. Otimização de Custos Variáveis

**Oportunidade**: Otimizar uso de recursos:
- Cache mais agressivo (reduz chamadas a APIs)
- Compressão de dados (reduz transferência)
- Otimização de queries (reduz uso de banco)

**Economia estimada**: 15-25% dos custos variáveis

**Quando implementar**: Continuamente (como parte do desenvolvimento)

---

## 📊 Projeções de Custos

### Cenário Realista (12 meses)

| Período | Custo Fixo | Custo Variável (AWS) | Custo Total |
|---------|------------|---------------------|-------------|
| Mês 1-3 | R$ 2.950 | R$ 1.000 | R$ 3.950 |
| Mês 4-6 | R$ 2.950 | R$ 1.500 | R$ 4.450 |
| Mês 7-9 | R$ 2.950 | R$ 2.500 | R$ 5.450 |
| Mês 10-12 | R$ 2.950 | R$ 3.500 | R$ 6.450 |

### Cenário Otimista (12 meses)

| Período | Custo Fixo | Custo Variável (AWS) | Custo Total |
|---------|------------|---------------------|-------------|
| Mês 1-3 | R$ 2.950 | R$ 1.200 | R$ 4.150 |
| Mês 4-6 | R$ 2.950 | R$ 2.000 | R$ 4.950 |
| Mês 7-9 | R$ 2.950 | R$ 3.000 | R$ 5.950 |
| Mês 10-12 | R$ 2.950 | R$ 4.500 | R$ 7.450 |

### Cenário Pessimista (12 meses)

| Período | Custo Fixo | Custo Variável (AWS) | Custo Total |
|---------|------------|---------------------|-------------|
| Mês 1-3 | R$ 2.950 | R$ 800 | R$ 3.750 |
| Mês 4-6 | R$ 2.950 | R$ 1.000 | R$ 3.950 |
| Mês 7-9 | R$ 2.950 | R$ 1.500 | R$ 4.450 |
| Mês 10-12 | R$ 2.950 | R$ 2.000 | R$ 4.950 |

---

## 🎯 Métricas de Acompanhamento

### KPIs Mensais

- **Custo fixo total**: R$ 2.950/mês
- **Custo variável (AWS)**: Varia conforme uso
- **Custo total**: Fixo + Variável
- **Custo por contratação**: Custo total / Contratações
- **Margem de infraestrutura**: (Receita - Custo infra) / Receita

### KPIs Trimestrais

- **Tendência de custos**: Aumentando, estável ou diminuindo
- **Eficiência de custos**: Custo por contratação diminuindo
- **Otimizações implementadas**: Economia gerada

---

## 🔄 Revisão e Atualização

Este documento deve ser revisado:
- **Mensalmente**: Atualizar com custos reais
- **Trimestralmente**: Revisar otimizações e projeções
- **Anualmente**: Revisão estratégica completa

**Próxima Revisão**: [Data]

---

## 📚 Referências

- **ADR-020**: Custos operacionais e sustentabilidade (jurídico, contábil, pagamentos)
- **operational-requirements-analysis.md**: Análise detalhada de pagamentos, D&O, KYC, suporte
- **Análise de Custos Infraestrutura**: `docs/referencia/business/analise-custos-infraestrutura-2026.md`
- **Projeções Financeiras**: `.cursor/docs/ia/financial/financial-projections.md`
- **Sustentabilidade Financeira**: `.cursor/docs/ia/financial/financial-sustainability.md`
- **Skill de Análise Financeira**: `.cursor/skills/evaluate-financial-strategy/SKILL.md`

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-01-21  
**Revisão**: Mensal (custos), Trimestral (otimizações)  
**Responsável**: Strategic Advisor
