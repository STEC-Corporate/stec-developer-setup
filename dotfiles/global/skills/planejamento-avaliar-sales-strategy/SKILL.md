---
name: planejamento-avaliar-sales-strategy
description: Analisa estratégia comercial completa: funil de conversão, estratégia de vendas, prospecção, qualificação, métricas comerciais e otimização de conversão. Use ao analisar funil de conversão, otimizar vendas, projetar crescimento ou periodicamente.
---

# Avaliar Estratégia Comercial

## Quando Usar

- Ao analisar funil de conversão
- Ao otimizar vendas
- Ao projetar crescimento
- Periodicamente (mensal/trimestral) para acompanhamento
- Ao identificar gargalos no funil
- Ao analisar estratégia de prospecção
- Ao qualificar leads

## Funil de Conversão da SoundLink

### Funil de Aquisição (Topo do Funil)

**Etapas**:
1. **Visita** → Usuário acessa a plataforma
2. **Cadastro** → Usuário cria conta
3. **Perfil Completo** → Usuário completa perfil
4. **Primeira Ação** → Usuário realiza primeira ação (busca, criação de projeto, etc.)
5. **Primeira Contratação** → Usuário realiza primeira contratação

**Consultar**: `docs/gestao-ideias/00-governanca/ia/conversion-funnel.md`

### Funil de Conversão (Meio do Funil)

**Etapas**:
1. **Propostas Enviadas** → Contratante envia proposta
2. **Propostas Aceitas** → Músico aceita proposta
3. **Eventos Confirmados** → Evento confirmado por ambas as partes
4. **Eventos Realizados** → Músico comparece ao evento
5. **Eventos Pagos** → Pagamento realizado
6. **Eventos Avaliados** → Ambas as partes avaliam
7. **Eventos Positivos** → Avaliação ≥4 estrelas (North Star)

**Consultar**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

### Funil de Retenção (Fundo do Funil)

**Etapas**:
1. **Segunda Contratação** → Usuário realiza segunda contratação
2. **Contratações Regulares** → Usuário realiza contratações regulares
3. **Advocacy** → Usuário recomenda plataforma

---

## Mapeamento do Funil

### 1. Identificar Etapas do Funil

**Processo**:
1. Mapear todas as etapas do funil (aquisição, conversão, retenção)
2. Identificar métricas por etapa
3. Calcular taxa de conversão por etapa
4. Identificar gargalos (etapas com baixa conversão)

**Exemplo**:
```
Funil de Aquisição:
- Visita → Cadastro: 5% (1000 visitas → 50 cadastros)
- Cadastro → Perfil Completo: 60% (50 cadastros → 30 perfis)
- Perfil Completo → Primeira Ação: 80% (30 perfis → 24 ações)
- Primeira Ação → Primeira Contratação: 20% (24 ações → 5 contratações)

Gargalo identificado: Visita → Cadastro (apenas 5%)
```

### 2. Calcular Taxa de Conversão por Etapa

**Fórmula**:
```
Taxa de Conversão = (Usuários na etapa seguinte / Usuários na etapa atual) × 100
```

**Exemplo**:
```
Visita → Cadastro: (50 / 1000) × 100 = 5%
Cadastro → Perfil Completo: (30 / 50) × 100 = 60%
Perfil Completo → Primeira Ação: (24 / 30) × 100 = 80%
Primeira Ação → Primeira Contratação: (5 / 24) × 100 = 20.8%
```

### 3. Identificar Gargalos

**Critérios**:
- Taxa de conversão < 50%: Gargalo moderado
- Taxa de conversão < 30%: Gargalo crítico
- Taxa de conversão < 10%: Gargalo severo

**Ações**:
- Investigar causa raiz do gargalo
- Implementar otimizações
- Acompanhar métricas após otimização

---

## Estratégia de Vendas

### 1. Prospecção

**Objetivo**: Identificar e atrair novos usuários

**Canais de Prospecção**:
- Marketing orgânico (SEO, conteúdo)
- Marketing pago (se aplicável)
- Referências (usuários recomendam)
- Parcerias estratégicas
- Eventos e networking

**Segmentação**:
- **Músicos**: Foco em portfólio, oportunidades, networking
- **Contratantes**: Foco em encontrar talentos, facilidade, confiança
- **Outros perfis**: Foco em funcionalidades específicas

**Consultar**: `docs/gestao-ideias/00-governanca/ia/prospecting-strategy.md`

### 2. Qualificação

**Objetivo**: Identificar leads com maior potencial de conversão

**Critérios de Qualificação**:
- **Fit de Perfil**: Perfil adequado para a plataforma
- **Necessidade**: Necessidade real de usar a plataforma
- **Autoridade**: Capacidade de tomar decisão
- **Timing**: Momento adequado para usar a plataforma

**Processo de Qualificação**:
1. Analisar perfil do usuário
2. Identificar necessidade (busca, criação de projeto, etc.)
3. Avaliar engajamento (tempo na plataforma, ações realizadas)
4. Classificar lead (quente, morno, frio)

**Consultar**: `docs/gestao-ideias/00-governanca/ia/qualification-process.md`

### 3. Apresentação

**Objetivo**: Demonstrar valor da plataforma

**Estratégias**:
- Onboarding personalizado por perfil
- Demonstração de funcionalidades relevantes
- Casos de sucesso
- Testemunhos de usuários

### 4. Fechamento

**Objetivo**: Converter lead em usuário ativo

**Estratégias**:
- Reduzir fricção no cadastro
- Facilitar primeira ação
- Incentivar primeira contratação (primeiras 3 com taxa 5%)
- Suporte ativo durante onboarding

---

## Métricas Comerciais

### Métricas de Aquisição

- **Taxa de Visita → Cadastro**: % de visitantes que se cadastram
- **Taxa de Cadastro → Perfil Completo**: % de cadastros que completam perfil
- **Taxa de Perfil → Primeira Ação**: % de perfis que realizam primeira ação
- **Taxa de Primeira Ação → Primeira Contratação**: % de ações que resultam em contratação

### Métricas de Conversão

- **Taxa de Proposta → Aceite**: % de propostas aceitas
- **Taxa de Aceite → Confirmação**: % de aceites confirmados
- **Taxa de Confirmação → Realização**: % de confirmados realizados
- **Taxa de Realização → Pagamento**: % de realizados pagos
- **Taxa de Pagamento → Avaliação**: % de pagos avaliados
- **Taxa de Avaliação → Positiva**: % de avaliados com ≥4 estrelas (North Star)

### Métricas de Retenção

- **Taxa de Retenção Mensal**: % de usuários que retornam no mês seguinte
- **Taxa de Segunda Contratação**: % de usuários que realizam segunda contratação
- **Taxa de Contratações Regulares**: % de usuários com 3+ contratações
- **Churn Rate**: % de usuários que deixam a plataforma

### Métricas de Tempo

- **Tempo Médio no Funil**: Tempo médio de visita até primeira contratação
- **Tempo Médio de Conversão**: Tempo médio de proposta até pagamento
- **Tempo Médio de Retenção**: Tempo médio até segunda contratação

**Consultar**: `docs/gestao-ideias/00-governanca/ia/commercial-metrics.md`

---

## Otimização de Conversão

### 1. Identificar Oportunidades

**Processo**:
1. Analisar funil de conversão
2. Identificar gargalos
3. Priorizar gargalos por impacto
4. Implementar otimizações
5. Medir resultados

### 2. Experimentos de Otimização

**Tipos de Experimentos**:
- **A/B Testing**: Testar variações de interface
- **Onboarding**: Otimizar processo de onboarding
- **Comunicação**: Melhorar mensagens e notificações
- **Funcionalidades**: Adicionar/remover funcionalidades

**Consultar**: `docs/gestao-ideias/00-governanca/ia/conversion-optimization.md`

### 3. Melhores Práticas

**Identificadas**:
- Onboarding personalizado por perfil
- Reduzir fricção no cadastro
- Facilitar primeira ação
- Incentivar primeira contratação
- Suporte ativo durante onboarding

---

## Processo de Análise

### 1. Coletar Dados

- Métricas de aquisição (visitas, cadastros, perfis)
- Métricas de conversão (propostas, aceites, eventos)
- Métricas de retenção (retorno, segunda contratação)
- Métricas de tempo (tempo no funil, tempo de conversão)

### 2. Mapear Funil

- Identificar todas as etapas
- Calcular taxa de conversão por etapa
- Identificar gargalos

### 3. Analisar Estratégia

- Avaliar estratégia de prospecção
- Avaliar processo de qualificação
- Avaliar estratégia de apresentação
- Avaliar estratégia de fechamento

### 4. Identificar Oportunidades

- Gargalos no funil
- Oportunidades de otimização
- Melhores práticas identificadas

### 5. Documentar Análise

**Onde documentar**:
- `docs/gestao-ideias/00-governanca/ia/commercial-strategy-analysis.md` - Análise completa
- `docs/gestao-ideias/00-governanca/ia/conversion-funnel.md` - Funil de conversão mapeado
- `docs/gestao-ideias/00-governanca/ia/prospecting-strategy.md` - Estratégia de prospecção
- `docs/gestao-ideias/00-governanca/ia/qualification-process.md` - Processo de qualificação
- `docs/gestao-ideias/00-governanca/ia/commercial-metrics.md` - Métricas comerciais
- `docs/gestao-ideias/00-governanca/ia/conversion-optimization.md` - Otimizações implementadas

---

## Saída Esperada

### Relatório de Análise Comercial

```markdown
## Análise de Estratégia Comercial - [Data]

### Funil de Conversão

**Funil de Aquisição**:
- Visita → Cadastro: X% (X visitas → X cadastros)
- Cadastro → Perfil Completo: X% (X cadastros → X perfis)
- Perfil Completo → Primeira Ação: X% (X perfis → X ações)
- Primeira Ação → Primeira Contratação: X% (X ações → X contratações)

**Funil de Conversão**:
- Propostas Enviadas → Aceites: X% (X propostas → X aceites)
- Aceites → Confirmados: X% (X aceites → X confirmados)
- Confirmados → Realizados: X% (X confirmados → X realizados)
- Realizados → Pagos: X% (X realizados → X pagos)
- Pagos → Avaliados: X% (X pagos → X avaliados)
- Avaliados → Positivos: X% (X avaliados → X positivos)

**Gargalos Identificados**:
- [Lista de gargalos e causas]

### Estratégia de Vendas

**Prospecção**:
- Canais: [lista]
- Segmentação: [análise]
- Eficácia: [análise]

**Qualificação**:
- Critérios: [lista]
- Processo: [análise]
- Taxa de qualificação: X%

**Apresentação**:
- Estratégias: [lista]
- Eficácia: [análise]

**Fechamento**:
- Taxa de fechamento: X%
- Tempo médio: X dias

### Métricas Comerciais

- Taxa de conversão geral: X%
- Tempo médio no funil: X dias
- Taxa de retenção: X%
- Churn rate: X%

### Oportunidades de Otimização

- [Lista de oportunidades]
- [Priorização]
- [Ações recomendadas]
```

---

## Referências

- **North Star Metric**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **Funil de Conversão**: `docs/gestao-ideias/00-governanca/ia/conversion-funnel.md`
- **Estratégia de Prospecção**: `docs/gestao-ideias/00-governanca/ia/prospecting-strategy.md`
- **Processo de Qualificação**: `docs/gestao-ideias/00-governanca/ia/qualification-process.md`
- **Métricas Comerciais**: `docs/gestao-ideias/00-governanca/ia/commercial-metrics.md`
- **Otimização de Conversão**: `docs/gestao-ideias/00-governanca/ia/conversion-optimization.md`
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

