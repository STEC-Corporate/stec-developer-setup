# Métricas Comerciais - SoundLink

> **Documento Estratégico**: Métricas comerciais completas para acompanhamento e análise da performance comercial da plataforma SoundLink.

---

## 📊 Visão Geral

Este documento define todas as métricas comerciais essenciais para acompanhar a performance comercial da SoundLink, incluindo targets, acompanhamento mensal e análise de tendências.

**⚠️ Princípios Fundamentais**:
- **Projetos são a unidade de negociação**: Contratantes contratam projetos, não perfis
- **Profile não é vitrine**: Profile serve como currículo para busca interna (convites), não para contratação pública
- **Busca Externa gera receita**: Os **quatro** sistemas de busca pública (Find-Performances, Find-Professionals, Find-Connections, Find-Events) podem gerar contratos e pagamentos pela plataforma
- **Busca Interna é networking**: Busca interna serve para construção de projetos (não gera receita direta)

**Os 4 Finds e receita**:
- **Find-Performances** e **Find-Professionals**: Contratante busca e contrata → contrato e pagamento
- **Find-Connections**: Projeto expõe vaga (após busca interna ou por decisão); interessados se candidatam → contrato e pagamento
- **Find-Events**: Contratante/perfil expõe evento; interessados se candidatam → contrato e pagamento

**Consultar**: `docs/decisoes/adr-008-profile-as-inheritance-source.md` | `docs/decisoes/adr-016-four-search-systems.md`

---

## 🎯 Métricas de Aquisição

### Taxa de Visita → Cadastro

**Definição**: % de visitantes que se cadastram na plataforma

**Fórmula**:
```
Taxa = (Cadastros / Visitantes) × 100
```

**Targets**:
- Baseline: 5%
- Meta Beta: 8%
- Meta 6 meses: 10%
- Meta 1 ano: 12%

**Acompanhamento**: Mensal

---

### Taxa de Cadastro → Perfil Completo

**Definição**: % de cadastros que completam perfil principal

**Nota**: Profile serve como currículo e fonte de herança para projetos, não como vitrine pública.

**Fórmula**:
```
Taxa = (Perfis Completos / Cadastros) × 100
```

**Targets**:
- Baseline: 60%
- Meta Beta: 70%
- Meta 6 meses: 75%
- Meta 1 ano: 80%

**Acompanhamento**: Mensal

---

### Taxa de Perfil → Primeiro Projeto (Prestadores)

**Definição**: % de perfis de prestadores que criam primeiro projeto

**Contexto**: Prestadores (músicos, técnicos, visuais, etc.) precisam criar projetos para serem contratados. Músico solo também deve criar projeto para se divulgar.

**Fórmula**:
```
Taxa = (Prestadores com Primeiro Projeto / Prestadores com Perfil Completo) × 100
```

**Targets**:
- Baseline: 70%
- Meta Beta: 75%
- Meta 6 meses: 80%
- Meta 1 ano: 85%

**Acompanhamento**: Mensal

---

### Taxa de Perfil → Primeira Busca (Contratantes)

**Definição**: % de perfis de contratantes que realizam primeira busca em um dos 4 Finds (Find-Performances, Find-Professionals, Find-Connections ou Find-Events)

**Contexto**: Contratantes buscam projetos para contratar, não perfis individuais.

**Fórmula**:
```
Taxa = (Contratantes com Primeira Busca / Contratantes com Perfil Completo) × 100
```

**Targets**:
- Baseline: 80%
- Meta Beta: 85%
- Meta 6 meses: 90%
- Meta 1 ano: 95%

**Acompanhamento**: Mensal

---

### Taxa de Primeiro Projeto → Primeira Contratação (Prestadores)

**Definição**: % de projetos que recebem primeira contratação

**Contexto**: Prestadores são contratados através de seus projetos. Projeto é a unidade de negociação.

**Fórmula**:
```
Taxa = (Projetos com Primeira Contratação / Primeiros Projetos Criados) × 100
```

**Targets**:
- Baseline: 20%
- Meta Beta: 25%
- Meta 6 meses: 30%
- Meta 1 ano: 35%

**Acompanhamento**: Mensal

---

### Taxa de Primeira Busca → Primeira Contratação (Contratantes)

**Definição**: % de buscas que resultam em primeira contratação de projeto

**Contexto**: Contratantes contratam via qualquer um dos 4 Finds (todos podem gerar contrato e pagamento pela plataforma).

**Fórmula**:
```
Taxa = (Primeiras Contratações / Primeiras Buscas) × 100
```

**Targets**:
- Baseline: 15%
- Meta Beta: 20%
- Meta 6 meses: 25%
- Meta 1 ano: 30%

**Acompanhamento**: Mensal

---

## 🎯 Métricas de Conversão (Busca Externa)

**⚠️ Importante**: Estas métricas focam na **Busca Externa** (os 4 Finds: Find-Performances, Find-Professionals, Find-Connections, Find-Events), que gera receita para a plataforma. A **Busca Interna** (para convites) não gera receita direta e tem métricas separadas.

### Taxa de Busca → Visualização de Projeto

**Definição**: % de buscas que resultam em visualização de projeto

**Contexto**: Contratante busca e visualiza detalhes do projeto antes de enviar proposta.

**Fórmula**:
```
Taxa = (Visualizações de Projeto / Buscas Realizadas) × 100
```

**Targets**:
- Baseline: 40%
- Meta Beta: 45%
- Meta 6 meses: 50%
- Meta 1 ano: 55%

**Acompanhamento**: Mensal

---

### Taxa de Visualização → Proposta

**Definição**: % de visualizações que resultam em proposta enviada

**Fórmula**:
```
Taxa = (Propostas Enviadas / Visualizações de Projeto) × 100
```

**Targets**:
- Baseline: 30%
- Meta Beta: 35%
- Meta 6 meses: 40%
- Meta 1 ano: 45%

**Acompanhamento**: Mensal

---

### Taxa de Proposta → Aceite

**Definição**: % de propostas aceitas pelo projeto

**Contexto**: Projeto (não perfil) aceita ou rejeita proposta.

**Fórmula**:
```
Taxa = (Propostas Aceitas / Propostas Enviadas) × 100
```

**Targets**:
- Baseline: 20%
- Meta Beta: 25%
- Meta 6 meses: 30%
- Meta 1 ano: 35%

**Acompanhamento**: Mensal

---

### Taxa de Aceite → Confirmação

**Definição**: % de aceites confirmados

**Fórmula**:
```
Taxa = (Eventos Confirmados / Propostas Aceitas) × 100
```

**Targets**:
- Baseline: 95%
- Meta Beta: 97%
- Meta 6 meses: 98%
- Meta 1 ano: 99%

**Acompanhamento**: Mensal

---

### Taxa de Confirmação → Realização

**Definição**: % de confirmados realizados

**Fórmula**:
```
Taxa = (Eventos Realizados / Eventos Confirmados) × 100
```

**Targets**:
- Baseline: 95%
- Meta Beta: 97%
- Meta 6 meses: 98%
- Meta 1 ano: 99%

**Acompanhamento**: Mensal

---

### Taxa de Realização → Pagamento

**Definição**: % de realizados pagos

**Fórmula**:
```
Taxa = (Eventos Pagos / Eventos Realizados) × 100
```

**Targets**:
- Baseline: 97%
- Meta Beta: 98%
- Meta 6 meses: 99%
- Meta 1 ano: 99.5%

**Acompanhamento**: Mensal

---

### Taxa de Pagamento → Avaliação

**Definição**: % de pagos avaliados

**Fórmula**:
```
Taxa = (Eventos Avaliados / Eventos Pagos) × 100
```

**Targets**:
- Baseline: 97%
- Meta Beta: 98%
- Meta 6 meses: 99%
- Meta 1 ano: 99.5%

**Acompanhamento**: Mensal

---

### Taxa de Avaliação → Positiva (North Star)

**Definição**: % de avaliados com ≥4 estrelas (North Star Metric)

**Fórmula**:
```
Taxa = (Eventos Positivos / Eventos Avaliados) × 100
```

**Targets**:
- Baseline: 94%
- Meta Beta: 96%
- Meta 6 meses: 97%
- Meta 1 ano: 98%

**Acompanhamento**: Mensal

**Consultar**: `docs/planejamento/metrics/north-star.md`

---

## 🎯 Métricas de Retenção

### Taxa de Retenção Mensal

**Definição**: % de usuários que retornam no mês seguinte

**Fórmula**:
```
Taxa = (Usuários que Retornam / Usuários do Mês Anterior) × 100
```

**Targets**:
- Baseline: 60%
- Meta Beta: 65%
- Meta 6 meses: 70%
- Meta 1 ano: 75%

**Acompanhamento**: Mensal

---

### Taxa de Segunda Contratação

**Definição**: % de usuários que realizam segunda contratação

**Fórmula**:
```
Taxa = (Segundas Contratações / Primeiras Contratações) × 100
```

**Targets**:
- Baseline: 60%
- Meta Beta: 65%
- Meta 6 meses: 70%
- Meta 1 ano: 75%

**Acompanhamento**: Mensal

---

### Taxa de Contratações Regulares

**Definição**: % de usuários com 3+ contratações

**Fórmula**:
```
Taxa = (Usuários com 3+ Contratações / Total de Usuários) × 100
```

**Targets**:
- Baseline: 40%
- Meta Beta: 45%
- Meta 6 meses: 50%
- Meta 1 ano: 55%

**Acompanhamento**: Mensal

---

### Churn Rate

**Definição**: % de usuários que deixam a plataforma

**Fórmula**:
```
Churn = (Usuários que Saíram / Total de Usuários) × 100
```

**Targets**:
- Baseline: <10%
- Meta Beta: <8%
- Meta 6 meses: <5%
- Meta 1 ano: <3%

**Acompanhamento**: Mensal

---

## 🎯 Métricas de Tempo

### Tempo Médio no Funil

**Definição**: Tempo médio de visita até primeira contratação

**Fórmula**:
```
Tempo Médio = Soma dos Tempos / Número de Usuários
```

**Targets**:
- Baseline: 30 dias
- Meta Beta: 25 dias
- Meta 6 meses: 20 dias
- Meta 1 ano: 15 dias

**Acompanhamento**: Mensal

---

### Tempo Médio de Conversão

**Definição**: Tempo médio de proposta até pagamento

**Fórmula**:
```
Tempo Médio = Soma dos Tempos / Número de Propostas
```

**Targets**:
- Baseline: 14 dias
- Meta Beta: 12 dias
- Meta 6 meses: 10 dias
- Meta 1 ano: 7 dias

**Acompanhamento**: Mensal

---

### Tempo Médio de Retenção

**Definição**: Tempo médio até segunda contratação

**Fórmula**:
```
Tempo Médio = Soma dos Tempos / Número de Segundas Contratações
```

**Targets**:
- Baseline: 60 dias
- Meta Beta: 45 dias
- Meta 6 meses: 30 dias
- Meta 1 ano: 21 dias

**Acompanhamento**: Mensal

---

## 📊 Dashboard de Métricas

### Visão Geral Mensal

```
┌─────────────────────────────────────────┐
│  MÉTRICAS COMERCIAIS - [Mês]            │
├─────────────────────────────────────────┤
│  AQUISIÇÃO                              │
│  Visita → Cadastro: X% (Meta: Y%)      │
│  Cadastro → Perfil: X% (Meta: Y%)      │
│  Perfil → Primeiro Projeto (Prestadores): X% (Meta: Y%) │
│  Perfil → Primeira Busca (Contratantes): X% (Meta: Y%) │
│  Primeiro Projeto → Contratação: X% (Meta: Y%) │
│  Primeira Busca → Contratação: X% (Meta: Y%) │
├─────────────────────────────────────────┤
│  CONVERSÃO (BUSCA EXTERNA)              │
│  Busca → Visualização: X% (Meta: Y%)   │
│  Visualização → Proposta: X% (Meta: Y%)│
│  Proposta → Aceite: X% (Meta: Y%)      │
│  Aceite → Confirmação: X% (Meta: Y%)   │
│  Confirmação → Realização: X% (Meta: Y%)│
│  Realização → Pagamento: X% (Meta: Y%) │
│  Pagamento → Avaliação: X% (Meta: Y%)  │
│  Avaliação → Positiva: X% (Meta: Y%)   │
├─────────────────────────────────────────┤
│  RETENÇÃO                               │
│  Retenção Mensal: X% (Meta: Y%)        │
│  Segunda Contratação: X% (Meta: Y%)    │
│  Contratações Regulares: X% (Meta: Y%) │
│  Churn Rate: X% (Meta: <Y%)            │
└─────────────────────────────────────────┘
```

### Métricas de Busca Interna (Networking)

**Nota**: Busca interna não gera receita direta, mas é importante para crescimento da plataforma e formação de equipes.

- **Taxa de Busca Interna → Convite**: % de buscas internas que resultam em convite
- **Taxa de Convite → Aceite**: % de convites aceitos
- **Taxa de Convite → Primeiro Projeto**: % de convidados que criam primeiro projeto

---

## ⚠️ Alertas e Ações Corretivas

### Alertas Críticos

**Alerta Vermelho** (Ação Imediata):
- Taxa de conversão < 50% da meta por 2 meses consecutivos
- Churn > 15% mensal
- Tempo médio no funil > 2x da meta

**Ações**:
1. Investigar causa raiz
2. Implementar correções imediatas
3. Acompanhar métricas diariamente

---

### Alertas Moderados

**Alerta Amarelo** (Monitorar):
- Taxa de conversão < 80% da meta por 1 mês
- Churn > 10% mensal
- Tempo médio no funil > 1.5x da meta

**Ações**:
1. Investigar tendência
2. Implementar otimizações
3. Acompanhar métricas semanalmente

---

### Status Saudável

**Alerta Verde** (Tudo OK):
- Taxa de conversão ≥ meta
- Churn < meta
- Tempo médio no funil ≤ meta

**Ações**:
1. Manter estratégias atuais
2. Identificar oportunidades de melhoria
3. Acompanhar métricas mensalmente

---

## 🔄 Análise de Tendências

### Tendência de Conversão

**Aumentando**: ✅ Bom sinal
- Manter estratégias atuais
- Identificar o que está funcionando
- Replicar para outras áreas

**Estável**: ⚠️ Monitorar
- Investigar oportunidades de melhoria
- Testar otimizações
- Acompanhar de perto

**Diminuindo**: ❌ Ação necessária
- Investigar causa raiz imediatamente
- Implementar correções
- Acompanhar diariamente

---

## 🔄 Revisão e Atualização

Este documento deve ser revisado:
- **Mensalmente**: Atualizar com dados reais e comparar com targets
- **Trimestralmente**: Revisar targets e ajustar metas
- **Anualmente**: Revisão estratégica completa

**Próxima Revisão**: [Data]

---

## 📚 Referências

- **Funil de Conversão**: `.cursor/docs/ia/commercial/conversion-funnel.md`
- **North Star Metric**: `docs/planejamento/metrics/north-star.md`
- **Otimização de Conversão**: `.cursor/docs/ia/commercial/conversion-optimization.md`
- **Skill de Estratégia Comercial**: `.cursor/skills/evaluate-sales-strategy/SKILL.md`

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-02-02  
**Revisão**: Mensal (dados), Trimestral (targets)  
**Responsável**: Strategic Advisor

---

## 📝 Notas de Atualização

**2026-02-02**: Documento atualizado para refletir modelo real da SoundLink:
- ✅ Foco em **projetos** como unidade de negociação
- ✅ Diferenciação entre **prestadores** e **contratantes**
- ✅ Separação entre **busca interna** (networking) e **busca externa** (contratação)
- ✅ Remoção de referências a profile como vitrine pública
- ✅ Métricas específicas para criação de projetos e busca de projetos
