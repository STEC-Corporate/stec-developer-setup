# 📈 Playbook: Ajuste de Ranking

> **Script de decisão para ajustar algoritmo de ranking mantendo transparência e mérito real**

---

## 🎯 Quando Usar Este Playbook

Use este playbook quando considerar:
- ✅ Ajustar pesos de fatores do ranking
- ✅ Adicionar novo fator ao ranking
- ✅ Remover fator do ranking
- ✅ Corrigir distorção/gaming do sistema
- ✅ Validar se ranking está justo

---

## 🛡️ Guardrails de Ranking (INVIOLÁVEIS)

### ❌ NUNCA

```
NUNCA permitir:
- ❌ Ranking baseado em pagamento (boost pago)
- ❌ Manipulação manual por admin sem justificativa
- ❌ Algoritmo "caixa preta" (deve ser explicável)
- ❌ Dados falsos/artificiais afetarem ranking
- ❌ Favoritismo baseado em relações pessoais
```

### ✅ SEMPRE

```
SEMPRE garantir:
- ✅ Ranking baseado 100% em dados reais e verificáveis
- ✅ Transparência total (usuário entende por que está em X posição)
- ✅ Mérito real (quem faz melhor trabalho sobe)
- ✅ Impossível de manipular artificialmente
- ✅ Documentar TODA mudança em ADR
```

---

## 📊 Algoritmo de Ranking Atual (Baseline)

### Fatores e Pesos (v1.0)

```typescript
type RankingScore = {
  totalScore: number // 0-100
  breakdown: {
    performance: number      // 40% - Performance em eventos
    reliability: number      // 30% - Confiabilidade
    experience: number       // 20% - Experiência comprovada
    engagement: number       // 10% - Engajamento na plataforma
  }
}
```

#### 1. Performance (40%)

```
Baseado em:
- Média de avaliações recebidas (0-5 estrelas)
- Número de avaliações (mínimo 5 para validar)
- Taxa de avaliações ≥4 estrelas

Cálculo:
performance_score = (
  (avg_rating / 5) * 0.6 +
  (positive_rate) * 0.4
) * 40

Onde:
- avg_rating = média das avaliações
- positive_rate = % de avaliações ≥4 estrelas
```

**Por que 40%**: É o fator mais importante - mede QUALIDADE real do trabalho.

#### 2. Confiabilidade (30%)

```
Baseado em:
- Taxa de comparecimento (eventos confirmados vs cancelamentos)
- Taxa de aceitação de propostas
- Tempo médio de resposta a propostas

Cálculo:
reliability_score = (
  (attendance_rate) * 0.5 +
  (acceptance_rate) * 0.3 +
  (response_timeliness) * 0.2
) * 30

Onde:
- attendance_rate = eventos comparecidos / eventos confirmados
- acceptance_rate = propostas aceitas / propostas recebidas
- response_timeliness = 1 - (avg_response_hours / 48)
```

**Por que 30%**: Confiabilidade é crucial - contratante quer garantia.

#### 3. Experiência (20%)

```
Baseado em:
- Número de contratações completadas
- Tempo na plataforma
- Diversidade de tipos de evento

Cálculo:
experience_score = (
  log(completed_gigs + 1) / log(100) * 0.6 +
  (months_active / 24) * 0.2 +
  (event_types_count / 10) * 0.2
) * 20

Onde:
- completed_gigs = número de eventos finalizados
- months_active = meses desde cadastro
- event_types_count = tipos diferentes de eventos tocados
```

**Por que 20%**: Experiência importa, mas não deve ser tudo (senão novatos nunca sobem).

#### 4. Engajamento (10%)

```
Baseado em:
- Perfil completo (todos campos preenchidos)
- Portfólio atualizado (vídeos, fotos)
- Disponibilidade atualizada

Cálculo:
engagement_score = (
  (profile_completeness) * 0.5 +
  (portfolio_quality) * 0.3 +
  (availability_updated) * 0.2
) * 10

Onde:
- profile_completeness = % de campos preenchidos
- portfolio_quality = tem vídeos (1) ou não (0)
- availability_updated = atualizado nos últimos 30 dias (1) ou não (0)
```

**Por que 10%**: Usuário engajado geralmente é melhor, mas peso menor para não penalizar bons músicos que não são "digitais".

---

## 🔄 Processo de Ajuste de Ranking

### Passo 1: Identificar Problema

```markdown
**Problema identificado**: [descrição do problema]

**Evidências**:
- [ ] Músicos bons estão em posição baixa (casos específicos)
- [ ] Músicos ruins estão em posição alta (casos específicos)
- [ ] Há gaming do sistema (usuários manipulando)
- [ ] Dados mostram distorção (métricas)

**Dados**:
- [inserir dados quantitativos que provam o problema]
- [exemplos concretos de usuários afetados]
```

### Passo 2: Validar contra Guardrails

```
ANTES de qualquer ajuste, verificar:

- [ ] Ajuste mantém ranking baseado em dados reais?
- [ ] Ajuste NÃO permite manipulação paga?
- [ ] Ajuste mantém transparência (explicável)?
- [ ] Ajuste NÃO introduz viés injusto?

SE qualquer resposta for NÃO → RECUSAR ajuste
```

### Passo 3: Propor Mudança

```markdown
**Mudança proposta**: [descrição da mudança]

**Tipo de mudança**:
- [ ] Ajuste de peso de fator existente
- [ ] Novo fator adicionado
- [ ] Remoção de fator
- [ ] Mudança na fórmula de cálculo

**Novo algoritmo**:
```typescript
// Código com mudança proposta
```

**Justificativa**:
- Por que esta mudança resolve o problema?
- Por que os pesos/fatores são justos?
- Como evita gaming?
```

### Passo 4: Simular com Dados Reais

```
ANTES de aplicar em produção:

1. Pegar amostra de 100 usuários reais
2. Calcular ranking ATUAL
3. Calcular ranking NOVO
4. Comparar mudanças:
   - Quem subiu e por quê?
   - Quem caiu e por quê?
   - Mudanças fazem sentido?

5. Validar casos extremos:
   - Usuário novo (sem histórico)
   - Usuário experiente (muito histórico)
   - Usuário com avalições ruins
   - Usuário com poucas avaliações
```

### Passo 5: Validar com Usuários (A/B Test)

```
SE mudança é significativa (>10% de impacto):

ENTÃO fazer A/B test:
  - 80% dos usuários: Algoritmo ATUAL
  - 20% dos usuários: Algoritmo NOVO
  - Medir por 2 semanas:
    - Taxa de contratação de ambos os grupos
    - Satisfação de contratantes
    - Reclamações de usuários
  
  SE novo algoritmo é melhor:
    ENTÃO aplicar para 100%
  SENÃO:
    ENTÃO reverter e iterar
```

### Passo 6: Documentar em ADR

```markdown
Criar ADR (Architecture Decision Record):

# ADR-XXX: [Título da mudança no ranking]

## Contexto
[Por que mudança foi necessária]

## Decisão
[O que foi decidido]

## Alternativas Consideradas
[Outras opções que foram descartadas]

## Consequências
[Impacto esperado da mudança]

## Validação
[Como foi testado]

## Métricas de Sucesso
[Como medir se funcionou]
```

### Passo 7: Comunicar Transparência

```markdown
**Para usuários**:

Título: "Melhorias no Sistema de Ranking"

Conteúdo:
"Atualizamos o algoritmo de ranking para valorizar ainda mais [X].

O que mudou:
- [mudança 1]
- [mudança 2]

Por que mudamos:
- [motivo]

Como afeta você:
- Se você [faz X], seu ranking tende a melhorar
- Se você [não faz Y], não afeta negativamente

Perguntas? Responda este email."
```

---

## 🚨 Casos Especiais de Ajuste

### Caso 1: Gaming Detectado

```
SE usuários estão manipulando sistema:

Exemplos de gaming:
- Criar contas falsas para auto-avaliar
- Combinar com amigos para trocar avaliações
- Cancelar propostas para inflar taxa de aceitação
- Marcar presença falsa em eventos

ENTÃO:
  1. Identificar padrão de manipulação
  2. Ajustar algoritmo para detectar
  3. Penalizar comportamento suspeito
  4. Banir reincidentes
  5. Documentar em ADR

Exemplo de ajuste:
"SE usuário tem >50% de avaliações de mesmas pessoas
 ENTÃO reduzir peso dessas avaliações em 80%"
```

### Caso 2: Viés contra Novatos

```
SE novatos nunca sobem no ranking:

Problema:
- Usuários com histórico zero ficam invisíveis
- Impossível crescer sem primeiro evento
- Ciclo vicioso: sem evento → sem ranking → sem evento

ENTÃO ajustar para dar chance:
  - "Boost inicial" de 30 dias (ranking mínimo garantido)
  - Primeiras 5 avaliações têm peso 2x
  - Perfil completo + portfólio = ranking base de 40/100
  
Documentar em ADR: "Como garantir igualdade de oportunidade"
```

### Caso 3: Viés contra Estilos/Regiões Específicas

```
SE músicos de certo estilo/região têm ranking sistematicamente baixo:

Investigar:
- [ ] Há menos contratações nesse segmento?
- [ ] Avaliações são realmente piores ou há viés?
- [ ] Algoritmo penaliza algum fator específico do segmento?

ENTÃO criar fatores de normalização:
  - Ranking relativo DENTRO do estilo/região
  - Ranking global considerando mercado
  
Exemplo:
"Músico de jazz em Belém pode ser top 10 local
 mesmo não sendo top 100 nacional"
```

---

## 📊 Monitoramento Contínuo

### Métricas de Saúde do Ranking

```
Acompanhar semanalmente:

1. Distribuição de Scores
   - [ ] Curva normal (bell curve)?
   - [ ] Há concentração em algum ponto?
   - [ ] Outliers fazem sentido?

2. Mobilidade
   - [ ] % de usuários que mudaram ≥10 posições/semana
   - [ ] Novatos conseguem subir?
   - [ ] Tops mantêm posição (se merecem)?

3. Correlação com Sucesso
   - [ ] Ranking correlaciona com taxa de contratação?
   - [ ] Top 10% recebe mais propostas?
   - [ ] Bottom 10% recebe menos?

4. Feedback de Usuários
   - [ ] Reclamações sobre injustiça no ranking?
   - [ ] Contratantes confiam no ranking?
```

**Alerta de Problema**:
```
SE qualquer métrica está fora do normal:
  ENTÃO investigar imediatamente
  E considerar rollback se necessário
```

---

## 🔍 Transparência do Ranking

### O que Mostrar ao Usuário

```typescript
type RankingBreakdown = {
  overall_score: number // 0-100
  position: number // Ex: "Top 15% da sua região"
  breakdown: {
    performance: {
      score: number
      why: "Você tem média 4.8 de 15 avaliações" // Explicação
      how_to_improve: "Continue mantendo qualidade" // Ação
    },
    reliability: {
      score: number
      why: "Taxa de comparecimento 95%, resposta em 4h"
      how_to_improve: "Continue sendo pontual"
    },
    experience: {
      score: number
      why: "12 eventos completados em 8 tipos diferentes"
      how_to_improve: "Diversifique ainda mais seu repertório"
    },
    engagement: {
      score: number
      why: "Perfil 90% completo, portfólio com 3 vídeos"
      how_to_improve: "Adicione mais vídeos recentes"
    }
  }
}
```

**Princípio**: Usuário deve SEMPRE entender por que tem aquele score e COMO melhorar.

---

## 💡 Boas Práticas

### ✅ DO (Faça)

- ✅ Base ranking em DADOS verificáveis
- ✅ Documente TODA mudança em ADR
- ✅ Teste com dados reais ANTES de produção
- ✅ Comunique mudanças com transparência
- ✅ Monitore impacto APÓS mudança
- ✅ Reverta se não funcionou

### ❌ DON'T (Não faça)

- ❌ Mude ranking sem dados que justifiquem
- ❌ Crie fatores que usuário não controla
- ❌ Use "caixa preta" (algoritmo inexplicável)
- ❌ Favoreça perfis específicos manualmente
- ❌ Ignore feedback de usuários
- ❌ Mude com muita frequência (gera confusão)

---

## 📚 Recursos Relacionados

- [Guardrails](../guardrails.md) - Princípios de ranking justo
- [North Star Metric](../../planejamento/metrics/north-star.md) - Contratações bem-sucedidas
- [ADRs](../../decisions/) - Documentar mudanças importantes

---

**Criado em**: 20/01/2026  
**Versão**: 1.0  
**Revisão**: Trimestral (junto com OKRs)
