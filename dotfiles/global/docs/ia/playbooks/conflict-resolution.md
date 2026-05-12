# ⚖️ Playbook: Resolução de Conflitos

> **Script de decisão para resolver conflitos entre usuários e situações de disputa**

---

## 🎯 Quando Usar Este Playbook

Use este playbook quando houver:
- ✅ Conflito entre músico e contratante (proposta, pagamento, comparecimento)
- ✅ Disputa sobre avaliação
- ✅ Dados inconsistentes ou contraditórios
- ✅ Denúncia de comportamento inadequado
- ✅ Conflito entre membros de equipe/projeto

---

## 🛡️ Princípios Fundamentais

### 1. Transparência e Neutralidade
- ✅ SEMPRE ouvir ambos os lados
- ✅ SEMPRE basear decisão em dados verificáveis
- ✅ NUNCA favorecer um lado sem evidências
- ❌ NUNCA tomar decisão baseado em "achismo"

### 2. Proteção dos Usuários
- ✅ SEMPRE proteger contra abuso/fraude
- ✅ SEMPRE validar dados antes de acusar alguém
- ❌ NUNCA expor dados privados de nenhuma das partes

### 3. Escalabilidade
- ✅ Resolver 80% dos conflitos automaticamente
- ✅ Mediação humana apenas para casos complexos
- ✅ Criar precedentes (documentar em decision-log.md)

---

## 📊 Matriz de Decisão

### Nível 1: Resolução Automática (Sistema)

```
SE:
  - Conflito é sobre valor < R$ 200
  E há evidências claras (contrato, screenshots, logs)
  E não há denúncia de fraude/abuso
  
ENTÃO:
  - Resolver automaticamente baseado em dados
  - Notificar ambas as partes da decisão
  - Permitir contestação em 3 dias úteis
```

**Exemplos de Resolução Automática**:
- Músico não compareceu → Dados de GPS provam
- Contratante não pagou → Não há registro de pagamento
- Proposta expirou → Passou do prazo sem resposta

---

### Nível 2: Mediação Automatizada (Chatbot/IA)

```
SE:
  - Conflito é sobre valor R$ 200 - R$ 1.000
  E NÃO há evidências claras de ambos os lados
  E não há denúncia de fraude/abuso
  
ENTÃO:
  - Sugerir negociação direta entre as partes
  - Oferecer templates de acordo
  - Acompanhar por 7 dias
  - Se não resolver → Escalar para Nível 3
```

**Exemplos de Mediação**:
- Músico chegou atrasado mas tocou completo
- Contratante mudou local do evento sem aviso
- Discordância sobre qualidade da apresentação

---

### Nível 3: Mediação Humana (Equipe Modelo)

```
SE:
  - Conflito é sobre valor > R$ 1.000
  OU
  - Há denúncia de fraude/abuso
  OU
  - Mediação automatizada falhou
  OU
  - Uma das partes tem histórico de problemas
  
ENTÃO:
  - Escalar para equipe de suporte
  - Coletar TODAS as evidências
  - Ouvir ambas as partes
  - Decisão em até 5 dias úteis
  - Documentar em decision-log.md
```

**Exemplos de Escalação**:
- Acusação de fraude
- Conflito recorrente do mesmo usuário
- Valor alto em disputa
- Possível violação de termos de uso

---

### Nível 4: Jurídico/Arbitragem (Raro)

```
SE:
  - Conflito envolve questões legais sérias
  OU
  - Valor > R$ 10.000
  OU
  - Ambas as partes não aceitam decisão da Modelo
  OU
  - Possível processo judicial
  
ENTÃO:
  - Envolver departamento jurídico
  - Sugerir arbitragem externa
  - Documentar TUDO formalmente
  - Suspender ambas as contas até resolução (se necessário)
```

---

## 🔍 Processo de Investigação

### Passo 1: Coletar Dados

```markdown
**Informações Básicas**:
- [ ] ID do evento/proposta/contrato
- [ ] IDs dos usuários envolvidos
- [ ] Data e hora do ocorrido
- [ ] Valor envolvido
- [ ] Descrição do conflito (versão de cada lado)

**Evidências Técnicas**:
- [ ] Logs do sistema
- [ ] Histórico de mensagens
- [ ] Registros de pagamento
- [ ] Dados de GPS/localização (se aplicável)
- [ ] Screenshots/fotos (se fornecidos)

**Histórico**:
- [ ] Histórico de avaliações de cada usuário
- [ ] Conflitos anteriores?
- [ ] Contas verificadas?
- [ ] Tempo na plataforma
```

### Passo 2: Validar Evidências

```
PARA CADA evidência:
  - É verificável? (não é só "ele disse/ela disse")
  - É objetiva? (dados técnicos > depoimentos)
  - É consistente com outras evidências?
  - Foi adulterada? (verificar timestamps, metadados)
```

**Hierarquia de Evidências** (do mais confiável ao menos):
1. 🟢 Logs do sistema (timestamps, IPs, ações)
2. 🟢 Dados de GPS/localização
3. 🟢 Registros de pagamento bancário
4. 🟡 Screenshots (podem ser editados)
5. 🟡 Depoimentos de terceiros
6. 🔴 Depoimentos das partes envolvidas

### Passo 3: Identificar Tipo de Conflito

#### Tipo A: Não Comparecimento

```
**Músico não compareceu**:
SE:
  - Contratante tem comprovante de local/data
  E músico não tem GPS no local na hora do evento
  E músico não avisou cancelamento com antecedência
  
ENTÃO:
  - Músico está em falta
  - Reembolso total para contratante
  - Avaliação negativa automática para músico
  - Se recorrente (3+ vezes) → Suspensão temporária

**Contratante não apareceu**:
SE:
  - Músico tem GPS no local na hora
  E contratante não compareceu
  E contratante não cancelou com antecedência
  
ENTÃO:
  - Contratante está em falta
  - Músico recebe cachê integral (multa contratual)
  - Avaliação negativa automática para contratante
```

#### Tipo B: Não Pagamento

```
SE:
  - Evento aconteceu (ambos confirmam)
  E músico compareceu (evidências de GPS)
  E não há registro de pagamento após 7 dias
  
ENTÃO:
  - Contratante está em falta
  - Cobrança automática no cartão (se cadastrado)
  - Se não pagar em 3 dias → Conta suspensa
  - Se não pagar em 15 dias → Enviar para cobrança
```

#### Tipo C: Desacordo sobre Qualidade

```
SE:
  - Contratante reclama da qualidade da apresentação
  E músico diz que fez conforme combinado
  E não há evidências objetivas (vídeos, áudio)
  
ENTÃO:
  - É palavra contra palavra
  - DECISÃO: Manter contrato original
  - Contratante pode dar avaliação baixa (com justificativa)
  - Músico pode contestar avaliação (se abusiva)
  - Se recorrente do músico → Investigar mais a fundo
```

#### Tipo D: Mudança de Condições

```
SE:
  - Contratante mudou local/horário sem aviso prévio
  E músico não conseguiu adaptar
  
ENTÃO:
  - Culpa é do contratante
  - Músico pode cancelar sem penalidade
  - Músico recebe 50% do cachê (multa por cancelamento de última hora)

SE:
  - Músico mudou repertório sem avisar
  E contratante não aprovou
  
ENTÃO:
  - Culpa é do músico
  - Contratante pode recusar pagamento de 20% (ajuste)
  - Avaliação negativa justificada
```

#### Tipo E: Comportamento Inadequado

```
SE:
  - Denúncia de assédio, discriminação ou violência
  
ENTÃO:
  - PRIORIDADE MÁXIMA
  - Suspensão imediata de quem foi denunciado (cautelar)
  - Investigação completa em 24h
  - Se comprovado → Banimento permanente
  - Se não comprovado → Reativar conta + advertência ao denunciante
  - Envolver jurídico se necessário
```

---

## ⚖️ Critérios de Decisão

### Decisão a Favor do Músico

```
SE:
  - Músico tem evidências sólidas
  E contratante não tem contraevidências
  E histórico do músico é positivo
  E histórico do contratante tem problemas
  
ENTÃO:
  - Decisão a favor do músico
  - Contratante recebe avaliação negativa
  - Contratante paga multa (se aplicável)
```

### Decisão a Favor do Contratante

```
SE:
  - Contratante tem evidências sólidas
  E músico não tem contraevidências
  E histórico do contratante é positivo
  E histórico do músico tem problemas
  
ENTÃO:
  - Decisão a favor do contratante
  - Músico recebe avaliação negativa
  - Músico devolve pagamento (se aplicável)
```

### Decisão Dividida (50/50)

```
SE:
  - Ambos têm evidências razoáveis
  OU
  - Não há evidências claras de nenhum lado
  E ambos têm histórico positivo
  
ENTÃO:
  - Decisão salomônica: dividir custo/benefício
  - Músico recebe 50% do cachê
  - Contratante paga 50% do cachê
  - Sem avaliações negativas (conflito justificado)
```

### Decisão Inconclusa → Sugere Acordo

```
SE:
  - Situação muito complexa
  OU
  - Ambos têm parte da razão
  E valor < R$ 1.000
  
ENTÃO:
  - Sugerir acordo amigável
  - Oferecer desconto de 10% para próxima contratação
  - Documentar como "acordo entre partes"
  - Sem avaliações negativas
```

---

## 🚨 Casos Especiais

### Fraude Comprovada

```
SE há fraude comprovada (perfil falso, documentos falsos, etc.):
  
ENTÃO:
  - Banimento PERMANENTE do fraudador
  - Reembolso total da vítima
  - Denúncia às autoridades (se valor > R$ 5.000)
  - Alertar outros usuários (sem expor identidade)
  - Documentar em ADR (decisão importante)
```

### Reincidência

```
SE usuário tem 3+ conflitos em 6 meses:

ENTÃO:
  - Investigar padrão de comportamento
  - Se padrão é claro (sempre culpado) → Suspensão
  - Se padrão é misto → Advertência oficial
  - Exigir mediação obrigatória em próximos eventos
```

### Conflito entre Membros de Projeto

```
SE músicos de um projeto entram em conflito:

ENTÃO:
  - Mediação pelo líder do projeto (se houver)
  - Se não resolver → Equipe Modelo medeia
  - Foco em resolver para bem do projeto
  - Opção de remover membro do projeto (decisão do líder)
```

---

## 💬 Comunicação da Decisão

### Template de Notificação

```markdown
**Assunto**: Resolução de Conflito - Evento #[ID]

Olá [Nome],

Analisamos o conflito referente ao evento #[ID] e chegamos à seguinte decisão:

**Decisão**: [a favor de X / dividida / acordo sugerido]

**Motivo**: [explicação baseada em evidências]

**Ações**:
- [ação 1]
- [ação 2]

**Próximos Passos**:
- [o que cada parte deve fazer]

**Contestação**:
Você pode contestar esta decisão em até 3 dias úteis respondendo a este email com:
- Novas evidências que não foram consideradas
- Erro fatual na análise

**Importante**: Decisões baseadas em dados técnicos verificados raramente são revertidas.

Atenciosamente,
Equipe Modelo
```

---

## 📊 Métricas e Monitoramento

### KPIs de Conflitos

```
Acompanhar semanalmente:
- Taxa de conflitos (conflitos / eventos totais)
- Tempo médio de resolução
- % de decisões contestadas
- % de acordos bem-sucedidos
- % de banimentos por fraude
```

**Metas**:
- Taxa de conflitos < 5%
- Tempo médio de resolução ≤ 3 dias
- % de decisões contestadas < 10%
- % de acordos bem-sucedidos > 70%

---

## 🔄 Melhoria Contínua

### Aprender com Conflitos

```
APÓS cada resolução:
  - Documentar em decision-log.md
  - Identificar root cause
  - Atualizar sistema para PREVENIR recorrência
  - Melhorar validações/controles
```

**Exemplos de Melhorias**:
- Muito conflito de "não comparecimento" → Implementar GPS obrigatório
- Muito conflito de "qualidade" → Exigir vídeo de portfólio
- Muito conflito de "pagamento" → Escrow obrigatório

---

## 📚 Recursos Relacionados

- [Guardrails](../guardrails.md) - Princípios de transparência
- [North Star Metric](../../planejamento/metrics/north-star.md) - Contratações bem-sucedidas
- [Decision Log](../../decisions/decision-log.md) - Documentar resoluções

---

**Criado em**: 20/01/2026  
**Versão**: 1.0  
**Revisão**: Mensal (baseado em novos tipos de conflitos)
