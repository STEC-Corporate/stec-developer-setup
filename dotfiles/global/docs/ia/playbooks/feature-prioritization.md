# 📊 Playbook: Priorização de Features

> **Script de decisão para priorizar features de forma consistente e alinhada com OKRs**

---

## 🎯 Quando Usar Este Playbook

Use este playbook quando precisar decidir:
- ✅ Qual feature implementar primeiro
- ✅ O que entra ou não no próximo sprint
- ✅ Como alocar recursos limitados
- ✅ Se vale a pena fazer uma feature agora ou depois

---

## 📐 Framework de Priorização

### Fórmula Geral

```
Prioridade = (Impacto × Alinhamento) / (Complexidade × Risco)
```

**Onde**:
- **Impacto**: Quanto afeta North Star Metric
- **Alinhamento**: Quanto alinha com OKRs do trimestre
- **Complexidade**: Esforço necessário (tempo/recursos)
- **Risco**: Chance de dar errado ou ter impacto negativo

---

## 🔴 Prioridade CRÍTICA (Fazer AGORA)

### Critérios (TODOS devem ser atendidos)

```
SE:
  - É pré-requisito para o Beta (bloqueia lançamento)
  OU
  - Bloqueia desenvolvimento de TODAS as outras features
  OU
  - Bug crítico que impede uso da plataforma
  OU
  - Violação de LGPD/segurança que pode causar processo

ENTÃO:
  - Prioridade: CRÍTICA
  - Sprint: ATUAL (interromper outras tasks se necessário)
  - Recursos: Alocar desenvolvedor mais experiente
  - Comunicação: Avisar TODA a equipe imediatamente
```

**Exemplos Reais (Modelo)**:
- ✅ Sistema de autenticação (sem isso, nada funciona)
- ✅ Vazamento de dados de usuário (LGPD)
- ✅ Bug que impede músico de aceitar proposta
- ✅ Sistema de pagamento quebrado

**Não é CRÍTICO**:
- ❌ Feature nova que seria "legal ter"
- ❌ Melhoria de UX
- ❌ Bug visual que não impede uso

---

## 🔴 Prioridade ALTA (Fazer no Sprint Atual)

### Critérios (PELO MENOS 2 devem ser atendidos)

```
SE:
  - Impacta North Star Metric > 10% (estimativa)
  OU
  - É Key Result de OKR do trimestre
  OU
  - Bloqueia 2+ outras features importantes
  OU
  - Reduz tempo de fluxo crítico > 30%
  OU
  - Foi solicitado por 10+ usuários ativos

E:
  - Complexidade: Baixa-Média (≤5 dias)
  - Risco: Baixo (não pode quebrar features existentes)
  - Alinhamento: Forte com pelo menos 1 OKR

ENTÃO:
  - Prioridade: ALTA
  - Sprint: ATUAL
  - Recursos: Alocar no sprint planning
  - Comunicação: Incluir em daily standups
```

**Exemplos Reais (Modelo)**:
- ✅ Sistema de busca de músicos (core do produto)
- ✅ Sistema de propostas (impacta North Star diretamente)
- ✅ Perfil completo do músico (KR do Q1)
- ✅ Sistema de avaliações (impacta North Star)

**Fase Template (sem dados reais)**:
```
SE:
  - É parte do MVP definido
  E está no caminho crítico do roadmap
  E complexidade ≤5 dias
  
ENTÃO: Prioridade ALTA
```

---

## 🟡 Prioridade MÉDIA (Próximo Sprint ou Sprint+1)

### Critérios

```
SE:
  - Impacta North Star Metric 5-10%
  OU
  - Contribui para OKR mas não é Key Result
  OU
  - Melhoria significativa de UX
  OU
  - Reduz carga no suporte ao cliente
  OU
  - Foi solicitado por 3-10 usuários

E:
  - Complexidade: Média (3-7 dias)
  - Não bloqueia features de prioridade ALTA/CRÍTICA
  - Risco: Baixo-Médio

ENTÃO:
  - Prioridade: MÉDIA
  - Sprint: PRÓXIMO ou SPRINT+1
  - Recursos: Incluir no product backlog ordenado
  - Comunicação: Sprint planning
```

**Exemplos Reais (Modelo)**:
- ✅ Sistema de notificações avançadas
- ✅ Filtros avançados de busca
- ✅ Dashboard com analytics
- ✅ Exportação de relatórios

**Fase Template**:
```
SE:
  - Nice to have mas não bloqueia MVP
  E melhora experiência significativamente
  E complexidade ≤7 dias
  
ENTÃO: Prioridade MÉDIA
```

---

## 🟢 Prioridade BAIXA (Backlog / Futuro)

### Critérios

```
SE:
  - Impacto na North Star < 5%
  OU
  - Não alinha com OKRs do trimestre
  OU
  - Complexidade ALTA (>7 dias)
  OU
  - Risco ALTO (pode quebrar features existentes)
  OU
  - Foi solicitado por <3 usuários

ENTÃO:
  - Prioridade: BAIXA
  - Sprint: BACKLOG (sem data definida)
  - Recursos: Não alocar agora
  - Comunicação: Documentar para revisão futura
```

**Exemplos Reais (Modelo)**:
- ✅ Integração com Spotify (legal mas não essencial)
- ✅ Dark mode (nice to have)
- ✅ Gamificação (não alinha com OKRs atuais)
- ✅ Features muito específicas de nicho

**Fase Template**:
```
SE:
  - Não faz parte do MVP
  OU complexidade >7 dias
  OU não tem clareza de requisitos
  
ENTÃO: Prioridade BAIXA (backlog)
```

---

## ❌ NÃO FAZER (Recusar/Cancelar)

### Critérios (QUALQUER um é suficiente para recusar)

```
SE:
  - Viola algum Guardrail
  OU
  - Impacto NEGATIVO na North Star
  OU
  - Desalinha com visão do produto
  OU
  - Requer recursos que não temos
  OU
  - Cria débito técnico significativo
  OU
  - Beneficia <1% dos usuários

ENTÃO:
  - Prioridade: NÃO FAZER
  - Ação: RECUSAR educadamente
  - Documentação: Criar entry em decision-log.md explicando por quê
  - Comunicação: Se foi pedido por usuário, explicar motivo
```

**Exemplos Reais (Modelo)**:
- ❌ Destaque pago para músicos (viola Guardrail)
- ❌ Manipulação de ranking (viola Guardrail)
- ❌ Feature que só beneficia 1-2 usuários específicos
- ❌ Integração com sistema descontinuado

---

## 🔄 Processo de Decisão

### Passo 1: Definir a Feature

```markdown
**Feature**: [nome claro e descritivo]
**Descrição**: [1-2 frases do que faz]
**Usuário alvo**: [músico/contratante/ambos/admin]
**Objetivo**: [por que estamos considerando isso]
```

### Passo 2: Avaliar Guardrails

```markdown
**Validação de Guardrails**:
- [ ] Não viola nenhum ❌ NUNCA?
- [ ] Cumpre todos ✅ SEMPRE aplicáveis?

SE viola Guardrail → NÃO FAZER (fim)
SE não viola → Continuar para Passo 3
```

### Passo 3: Avaliar Impacto

#### Fase Pós-Beta (com dados)

```markdown
**Impacto na North Star**:
- [ ] Alto (>10%): +3 pontos
- [ ] Médio (5-10%): +2 pontos
- [ ] Baixo (<5%): +1 ponto
- [ ] Neutro/Negativo: 0 pontos

**Impacto medido como**:
- Aumenta contratações bem-sucedidas?
- Aumenta avaliações positivas?
- Reduz conflitos/problemas?
```

#### Fase Template (sem dados)

```markdown
**Impacto no MVP**:
- [ ] Crítico para lançamento: +3 pontos
- [ ] Importante mas não bloqueia: +2 pontos
- [ ] Nice to have: +1 ponto
- [ ] Não faz parte do MVP: 0 pontos
```

### Passo 4: Avaliar Alinhamento com OKRs

```markdown
**Alinhamento com OKRs Q1 2026**:
- [ ] É Key Result direto: +3 pontos
- [ ] Contribui para Key Result: +2 pontos
- [ ] Alinha com Objetivo: +1 ponto
- [ ] Não alinha: 0 pontos

**Qual OKR**:
- Objetivo 1: Finalizar template do perfil do músico
- Objetivo 2: Finalizar template de projects core
- Objetivo 3: Design system consistente
- Objetivo 4: Garantir qualidade e facilitar backend
```

### Passo 5: Avaliar Complexidade

```markdown
**Estimativa de Esforço**:
- [ ] Trivial (1-2 dias): +1 ponto
- [ ] Simples (3-5 dias): +2 pontos
- [ ] Médio (5-7 dias): +3 pontos
- [ ] Complexo (>7 dias): +5 pontos

**IMPORTANTE**: Quanto MAIOR a complexidade, MENOR a prioridade
(Complexidade é divisor na fórmula)
```

### Passo 6: Avaliar Risco

```markdown
**Risco Técnico**:
- [ ] Baixo (não afeta features existentes): +1 ponto
- [ ] Médio (pode afetar algumas features): +2 pontos
- [ ] Alto (pode quebrar muito): +3 pontos

**Risco de Negócio**:
- [ ] Usuários podem não gostar? +1 ponto
- [ ] Pode desalinhar com visão futura? +2 pontos

**IMPORTANTE**: Quanto MAIOR o risco, MENOR a prioridade
(Risco é divisor na fórmula)
```

### Passo 7: Calcular Score

```
Score = (Impacto + Alinhamento) / (Complexidade + Risco)

Exemplo:
Impacto: 3 (alto)
Alinhamento: 3 (Key Result)
Complexidade: 2 (simples)
Risco: 1 (baixo)

Score = (3 + 3) / (2 + 1) = 6 / 3 = 2.0
```

**Interpretação do Score**:
- **≥ 2.0**: Prioridade ALTA
- **1.0 - 1.9**: Prioridade MÉDIA
- **0.5 - 0.9**: Prioridade BAIXA
- **< 0.5**: NÃO FAZER (pelo menos não agora)

### Passo 8: Validar com Equipe

```markdown
**Validação Final**:
- [ ] Sócio técnico concorda com estimativa de complexidade?
- [ ] Usuários-alvo validaram que resolv problema deles?
- [ ] Time de produto concorda com alinhamento OKR?
- [ ] Decisão está documentada em decision-log.md?
```

---

## 📊 Exemplos Práticos

### Exemplo 1: Sistema de Busca de Músicos

```markdown
**Feature**: Sistema de busca de músicos por região, instrumento, gênero

**Passo 2 - Guardrails**: ✅ Não viola nenhum
**Passo 3 - Impacto**: 3 (crítico para MVP)
**Passo 4 - Alinhamento**: 3 (é Key Result de OKR 1)
**Passo 5 - Complexidade**: 3 (5-7 dias)
**Passo 6 - Risco**: 1 (baixo)

**Score**: (3 + 3) / (3 + 1) = 6 / 4 = 1.5

**Resultado**: Prioridade MÉDIA → Próximo Sprint

**Porém**: É Key Result direto → **AJUSTAR para ALTA**

**Decisão Final**: PRIORIDADE ALTA - Sprint Atual
```

### Exemplo 2: Destaque Pago

```markdown
**Feature**: Botão "Destacar meu perfil" por R$ 50/mês

**Passo 2 - Guardrails**: ❌ VIOLA Guardrail "NUNCA destaque pago para músicos"

**Resultado**: NÃO FAZER

**Decisão Final**: RECUSAR
**Documentar em**: decision-log.md
**Comunicar**: Se pedido por usuário, explicar princípio de mérito real
```

### Exemplo 3: Dark Mode

```markdown
**Feature**: Tema escuro para toda a plataforma

**Passo 2 - Guardrails**: ✅ Não viola
**Passo 3 - Impacto**: 1 (baixo, não afeta North Star)
**Passo 4 - Alinhamento**: 0 (não alinha com OKRs Q1)
**Passo 5 - Complexidade**: 3 (5-7 dias, precisa revisar TODAS as telas)
**Passo 6 - Risco**: 2 (médio, pode quebrar contraste/acessibilidade)

**Score**: (1 + 0) / (3 + 2) = 1 / 5 = 0.2

**Resultado**: Prioridade BAIXA (< 0.5)

**Decisão Final**: BACKLOG - Avaliar no futuro
```

### Exemplo 4: Sistema de Avaliações

```markdown
**Feature**: Músicos e contratantes se avaliam mutuamente após evento

**Passo 2 - Guardrails**: ✅ Não viola (avaliações reais = dados reais)
**Passo 3 - Impacto**: 3 (alto, impacta DIRETAMENTE North Star)
**Passo 4 - Alinhamento**: 2 (contribui para OKR 1)
**Passo 5 - Complexidade**: 3 (5-7 dias)
**Passo 6 - Risco**: 2 (médio, precisa evitar gaming do sistema)

**Score**: (3 + 2) / (3 + 2) = 5 / 5 = 1.0

**Resultado**: Prioridade MÉDIA

**Porém**: Impacta DIRETAMENTE North Star → **AJUSTAR para ALTA**

**Decisão Final**: PRIORIDADE ALTA - Sprint Atual ou Próximo
```

---

## 🔄 Revisão e Ajustes

### Quando Reavaliar Prioridades

- ✅ **Semanalmente**: Durante sprint planning
- ✅ **Mensalmente**: Retrospectiva de OKRs
- ✅ **Trimestralmente**: Revisão completa de OKRs

### Quando Mudar Prioridade de Feature

```
SE:
  - Dados reais mostraram impacto diferente do esperado
  OU
  - OKRs mudaram (raro mas possível)
  OU
  - Surgiu bloqueio/dependência nova
  OU
  - Complexidade revelou-se muito maior/menor

ENTÃO:
  - Reavaliar usando este playbook
  - Atualizar sprint planning se necessário
  - Documentar mudança em retrospective.md
```

---

## 💡 Dicas Importantes

### ✅ DO (Faça)

- ✅ Use dados reais quando disponível (pós-Beta)
- ✅ Valide sempre contra Guardrails PRIMEIRO
- ✅ Considere North Star em TODA decisão
- ✅ Documente decisões em decision-log.md
- ✅ Comunique mudanças de prioridade para equipe
- ✅ Revise prioridades regularmente

### ❌ DON'T (Não faça)

- ❌ Não pule a validação de Guardrails
- ❌ Não priorize por "achismo" ou opinião pessoal
- ❌ Não mude prioridades sem justificativa
- ❌ Não ignore OKRs do trimestre
- ❌ Não adicione features sem calcular impacto
- ❌ Não priorize complexidade alta sem ROI claro

---

## 📚 Recursos Relacionados

- [Guardrails](../guardrails.md) - Validação obrigatória
- [North Star Metric](../../planejamento/metrics/north-star.md) - Métrica guia
- [OKRs Q1 2026](../../planejamento/okrs-kpis-q1-2026.md) - Objetivos do trimestre
- [Decision Log](../../decisions/decision-log.md) - Onde documentar decisões

---

**Criado em**: 20/01/2026  
**Última atualização**: 20/01/2026  
**Versão**: 1.0  
**Mantenedor**: Frontend Template Creator  
**Revisão**: Trimestral

---

## ✅ Checklist de Uso Rápido

Ao priorizar feature, verificar:

- [ ] Valida Guardrails?
- [ ] Impacto na North Star calculado?
- [ ] Alinhamento com OKRs verificado?
- [ ] Complexidade estimada?
- [ ] Risco avaliado?
- [ ] Score calculado?
- [ ] Decisão documentada?
- [ ] Equipe comunicada?
