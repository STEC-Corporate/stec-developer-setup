---
name: code-avaliar-competitive-advantage
description: Analisa moats competitivos: identifica moats atuais, avalia força, identifica ameaças, desenvolve estratégia de defesa, analisa network effects e lock-in operacional. Use ao analisar vantagem competitiva, desenvolver estratégia de defesa, identificar oportunidades ou periodicamente (trimestral).
---

# Avaliar Vantagem Competitiva (Moats)

## Quando Usar

- Ao analisar vantagem competitiva sustentável
- Ao desenvolver estratégia de defesa
- Ao identificar oportunidades de fortalecimento
- Periodicamente (trimestral) para acompanhamento
- Ao avaliar ameaças competitivas
- Ao planejar criação de novos moats

## Processo de Análise

### 1. Analisar Moats Atuais

**Objetivo**: Identificar e avaliar moats competitivos existentes

**Moats a Analisar**:

#### 1.1 Sistema de Ranking por Mérito (Guardrail)

**Moat**: Ranking baseado em dados verificáveis, não em pagamento

**Força**: 🟢 Forte

**Facilidade de Cópia**: 🟡 Média (requer mudança de modelo de negócio)

**Durabilidade**: 🟢 Alta (alinhado com valores)

**Valor para Usuários**: 🟢 Alto (transparência e justiça)

**Consultar**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`

---

#### 1.2 Transparência Total (Guardrail)

**Moat**: Transparência em todas as operações e decisões

**Força**: 🟢 Forte

**Facilidade de Cópia**: 🟡 Média (requer mudança cultural)

**Durabilidade**: 🟢 Alta (alinhado com valores)

**Valor para Usuários**: 🟢 Alto (confiança)

**Consultar**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`

---

#### 1.3 Clean Architecture (Técnico)

**Moat**: Arquitetura limpa e bem estruturada

**Força**: 🟡 Média

**Facilidade de Cópia**: 🟢 Baixa (pode ser replicado)

**Durabilidade**: 🟡 Média (requer manutenção)

**Valor para Usuários**: 🟡 Médio (indireto - qualidade)

**Consultar**: `.cursorrules`

---

#### 1.4 Fluxo de Migração Estruturado (Operacional)

**Moat**: Processo estruturado de migração Template → Frontend → BFF → API

**Força**: 🟡 Média

**Facilidade de Cópia**: 🟢 Baixa (pode ser replicado)

**Durabilidade**: 🟡 Média (requer manutenção)

**Valor para Usuários**: 🟡 Médio (indireto - qualidade)

**Consultar**: `.cursorrules`

---

#### 1.5 North Star Metric Bem Definida (Estratégico)

**Moat**: Métrica principal clara e bem definida

**Força**: 🟢 Forte

**Facilidade de Cópia**: 🟢 Baixa (pode ser replicado)

**Durabilidade**: 🟢 Alta (estratégico)

**Valor para Usuários**: 🟢 Alto (foco claro)

**Consultar**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

---

#### 1.6 Fronteira Clara (Artes Performáticas)

**Moat**: Posicionamento único em artes performáticas

**Força**: 🟢 Forte

**Facilidade de Cópia**: 🔴 Alta (requer mudança estratégica)

**Durabilidade**: 🟢 Alta (estratégico)

**Valor para Usuários**: 🟢 Alto (identidade clara)

**Consultar**: `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md`

---

#### 1.7 Network Effect Natural

**Moat**: Artistas colaboram naturalmente entre si

**Força**: 🟢 Forte

**Facilidade de Cópia**: 🔴 Alta (requer mudança de posicionamento)

**Durabilidade**: 🟢 Alta (cresce com usuários)

**Valor para Usuários**: 🟢 Alto (valor cresce com rede)

**Consultar**: `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md`

---

#### 1.8 Modelo 100% Gratuito

**Moat**: Zero mensalidade, zero assinatura, zero taxa de permanência

**Força**: 🟡 Média

**Facilidade de Cópia**: 🟡 Média (concorrentes podem copiar, mas perderiam receita)

**Durabilidade**: 🟡 Média (requer sustentabilidade financeira)

**Valor para Usuários**: 🟢 Alto (zero barreira de entrada)

**Consultar**: `docs/gestao-ideias/00-governanca/decisoes/adr-015-platform-100-percent-free.md`

---

### 2. Avaliar Força de Cada Moat

**Objetivo**: Determinar força relativa de cada moat

**Critérios de Avaliação**:

#### Facilidade de Cópia

- 🔴 Alta: Fácil de copiar
- 🟡 Média: Moderadamente difícil de copiar
- 🟢 Baixa: Muito difícil de copiar

#### Durabilidade

- 🔴 Baixa: Pode ser superado rapidamente
- 🟡 Média: Pode durar alguns anos
- 🟢 Alta: Pode durar muitos anos

#### Valor para Usuários

- 🔴 Baixo: Pouco valor percebido
- 🟡 Médio: Valor moderado
- 🟢 Alto: Alto valor percebido

**Consultar**: `docs/gestao-ideias/00-governanca/ia/current-competitive-moats.md`

---

### 3. Identificar Ameaças

**Objetivo**: Identificar ameaças aos moats existentes

#### 3.1 Concorrentes que Podem Copiar

**Ameaças Identificadas**:
- Grandes players podem entrar no mercado
- Concorrentes podem copiar modelo 100% gratuito
- Concorrentes podem copiar posicionamento

**Probabilidade**: 🟡 Média

**Impacto**: 🔴 Alto

**Mitigação**: Fortalecer network effect e dados

**Consultar**: `docs/gestao-ideias/00-governanca/ia/competitive-threats.md`

---

#### 3.2 Tecnologias que Reduzem Barreiras

**Ameaças Identificadas**:
- Novas tecnologias podem reduzir barreiras de entrada
- IA pode automatizar processos complexos
- Ferramentas podem facilitar cópia

**Probabilidade**: 🟡 Média

**Impacto**: 🟡 Médio

**Mitigação**: Continuar inovando e fortalecendo moats

**Consultar**: `docs/gestao-ideias/00-governanca/ia/competitive-threats.md`

---

#### 3.3 Mudanças de Mercado

**Ameaças Identificadas**:
- Mudanças comportamentais podem afetar demanda
- Regulamentação pode afetar modelo de negócio
- Crises econômicas podem afetar mercado

**Probabilidade**: 🟡 Baixa

**Impacto**: 🟡 Médio

**Mitigação**: Manter flexibilidade e adaptabilidade

**Consultar**: `docs/gestao-ideias/00-governanca/ia/competitive-threats.md`

---

### 4. Desenvolver Estratégia de Defesa

**Objetivo**: Criar estratégia para proteger e fortalecer moats

#### 4.1 Fortalecer Moats Existentes

**Estratégias**:
- Comunicar diferenciação consistentemente
- Melhorar qualidade continuamente
- Expandir network effect
- Fortalecer dados e reputação

**Priorização**: 🟢 Alta

**Timeline**: Contínuo

**Consultar**: `docs/gestao-ideias/00-governanca/ia/competitive-defense-strategy.md`

---

#### 4.2 Criar Novos Moats

**Estratégias**:
- Desenvolver integrações exclusivas
- Criar dados exclusivos
- Otimizar processos
- Construir comunidade forte

**Priorização**: 🟡 Média

**Timeline**: Médio prazo

**Consultar**: `docs/gestao-ideias/00-governanca/ia/new-competitive-moats.md`

---

#### 4.3 Proteger contra Ameaças

**Estratégias**:
- Monitorar concorrentes regularmente
- Adaptar estratégia conforme necessário
- Manter flexibilidade
- Fortalecer moats críticos

**Priorização**: 🟢 Alta

**Timeline**: Contínuo

**Consultar**: `docs/gestao-ideias/00-governanca/ia/competitive-defense-strategy.md`

---

### 5. Analisar Network Effects

**Objetivo**: Identificar e fortalecer network effects

#### 5.1 Network Effects Identificados

**Network Effect Principal**: Artistas colaboram naturalmente entre si

**Como Funciona**:
- Mais artistas = mais oportunidades de colaboração
- Mais projetos = mais valor para todos
- Mais avaliações = mais confiança
- Ciclo virtuoso auto-reforçador

**Força**: 🟢 Forte

**Consultar**: `docs/gestao-ideias/00-governanca/ia/network-effects-strategy.md`

---

#### 5.2 Como Fortalecer

**Estratégias**:
- Facilitar colaboração entre artistas
- Criar features que incentivem network effect
- Expandir para todas as artes performáticas
- Comunicar valor do network effect

**Priorização**: 🟢 Alta

**Timeline**: Contínuo

**Consultar**: `docs/gestao-ideias/00-governanca/ia/network-effects-strategy.md`

---

### 6. Identificar Lock-in Operacional

**Objetivo**: Identificar e fortalecer lock-in operacional

#### 6.1 Dados Exclusivos

**Dados Identificados**:
- Histórico de avaliações verificáveis
- Histórico de projetos
- Reputação construída ao longo do tempo
- Dados valiosos para matching

**Força**: 🟡 Média (cresce com tempo)

**Como Fortalecer**:
- Incentivar avaliações
- Facilitar histórico de projetos
- Usar dados para melhorar matching

**Consultar**: `docs/gestao-ideias/00-governanca/ia/operational-lock-in-strategy.md`

---

#### 6.2 Processos Otimizados

**Processos Identificados**:
- Fluxo de migração estruturado
- Validações automáticas
- Análises estratégicas automatizadas

**Força**: 🟡 Média

**Como Fortalecer**:
- Continuar otimizando processos
- Adicionar automações
- Melhorar eficiência

**Consultar**: `docs/gestao-ideias/00-governanca/ia/operational-lock-in-strategy.md`

---

#### 6.3 Integrações Específicas

**Integrações Identificadas**:
- Integrações com calendários externos
- Integrações com plataformas de pagamento
- Integrações futuras planejadas

**Força**: 🟡 Média

**Como Fortalecer**:
- Desenvolver integrações exclusivas
- Melhorar integrações existentes
- Criar valor através de integrações

**Consultar**: `docs/gestao-ideias/00-governanca/ia/operational-lock-in-strategy.md`

---

### 7. Validar contra Guardrails

**Objetivo**: Assegurar que moats não violam princípios

**Consultar**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`

#### Verificações Obrigatórias

1. **Moats não violam princípios**:
   - ✅ Moats baseados em mérito (não destaque pago)
   - ✅ Moats baseados em transparência
   - ✅ Moats alinhados com valores

2. **Estratégia alinhada com valores**:
   - ✅ Transparência total
   - ✅ Igualdade de oportunidades
   - ✅ Foco no artista

3. **Lock-in ético**:
   - ✅ Lock-in baseado em valor, não em coerção
   - ✅ Usuários podem sair quando quiserem
   - ✅ Dados são do usuário

---

### 8. Documentar Análise

**Onde documentar**: `docs/gestao-ideias/00-governanca/ia/competitive-moats-strategy.md`

**Conteúdo**:
- Moats atuais analisados
- Força de cada moat avaliada
- Ameaças identificadas
- Estratégia de defesa desenvolvida
- Network effects analisados
- Lock-in operacional identificado
- Validação contra guardrails

---

## Saída Esperada

### Relatório de Análise de Moats

```markdown
## Análise de Moats Competitivos - [Data]

### Moats Atuais
1. [Moat 1]
   - Força: [Alta/Média/Baixa]
   - Facilidade de Cópia: [Alta/Média/Baixa]
   - Durabilidade: [Alta/Média/Baixa]
   - Valor para Usuários: [Alto/Médio/Baixo]

### Ameaças Identificadas
1. [Ameaça 1]
   - Probabilidade: [Alta/Média/Baixa]
   - Impacto: [Alto/Médio/Baixo]
   - Mitigação: [Estratégia]

### Estratégia de Defesa
- Fortalecer moats: [Estratégias]
- Criar novos moats: [Estratégias]
- Proteger contra ameaças: [Estratégias]

### Network Effects
- Network effects identificados: [Lista]
- Como fortalecer: [Estratégias]

### Lock-in Operacional
- Dados exclusivos: [Lista]
- Processos otimizados: [Lista]
- Integrações específicas: [Lista]
```

---

## Referências

- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **North Star Metric**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Fronteira**: `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md`
- **Diferenciação Competitiva**: `docs/gestao-ideias/00-governanca/ia/competitive-differentiation.md`
- **Análise Competitiva**: `docs/gestao-ideias/00-governanca/ia/competitive-positioning.md`
- **Moats Atuais**: `docs/gestao-ideias/00-governanca/ia/current-competitive-moats.md`
- **Ameaças**: `docs/gestao-ideias/00-governanca/ia/competitive-threats.md`
- **Estratégia de Defesa**: `docs/gestao-ideias/00-governanca/ia/competitive-defense-strategy.md`
- **Novos Moats**: `docs/gestao-ideias/00-governanca/ia/new-competitive-moats.md`
- **Network Effects**: `docs/gestao-ideias/00-governanca/ia/network-effects-strategy.md`
- **Lock-in Operacional**: `docs/gestao-ideias/00-governanca/ia/operational-lock-in-strategy.md`

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-01-21  
**Revisão**: Trimestral  
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

