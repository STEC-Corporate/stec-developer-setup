---
name: planejamento-validar-feature-strategy
description: Valida features contra Guardrails e North Star antes da implementação. Use quando criar nova feature, validar proposta de feature, analisar feature existente, ou quando validar decisão arquitetural importante.
---

# Validar Estratégia de Feature

## Quando Usar

- Antes de implementar qualquer feature nova
- Antes de tomar decisão arquitetural importante
- Quando IA sugerir feature e você tiver dúvida
- Ao analisar se feature existente está alinhada com princípios
- Ao revisar proposta de feature de terceiros

## Processo de Validação

### 1. Ler Guardrails

Ler completamente `docs/gestao-ideias/00-governanca/ia/guardrails.md` e validar:

**Proibições ❌ NUNCA**:
- ❌ NÃO implementa destaque pago para músicos
- ❌ NÃO permite manipulação de ranking
- ❌ NÃO permite boost de visibilidade por pagamento
- ❌ NÃO viola Clean Architecture
- ❌ NÃO quebra transparência no sistema
- ❌ NÃO mistura perfis (ex: empresário com produtor musical)

**Obrigações ✅ SEMPRE** (quando aplicável):
- ✅ Ranking baseado em mérito e dados verificáveis
- ✅ Transparência mantida
- ✅ Clean Architecture respeitada
- ✅ Dados verificáveis

### 2. Calcular Impacto na North Star

Ler `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md` e analisar:

**Métrica**: "Contratações bem-sucedidas com avaliação ≥4 estrelas"

**Classificar impacto**:
- 🟢 **Alto** (>10% impacto) → Prioridade ALTA
- 🟡 **Médio** (5-10% impacto) → Prioridade MÉDIA
- 🔴 **Baixo** (<5% impacto) → Prioridade BAIXA
- ⚪ **Nenhum** (manutenção/refatoração) → Reavaliar necessidade

**Justificar**: Como a feature impacta diretamente ou indiretamente na métrica.

### 3. Consultar Decisões Anteriores

Ler `docs/gestao-ideias/00-governanca/decisoes/decision-log.md` e verificar:
- Se há decisão similar que deve ser seguida
- Se há decisão conflitante que impede a feature
- Se há ADRs relevantes que devem ser consultados

**ADRs importantes**:
- `docs/gestao-ideias/00-governanca/decisoes/adr-001-no-premium-plan-musicians.md`
- `docs/gestao-ideias/00-governanca/decisoes/adr-002-merit-based-ranking-only.md`
- `docs/gestao-ideias/00-governanca/decisoes/adr-004-clean-architecture-frontend.md`

### 4. Usar Playbook de Priorização

Consultar `docs/gestao-ideias/00-governanca/ia/playbooks/feature-prioritization.md` e calcular score considerando:
- Impacto na North Star
- Alinhamento com North Star Metric
- Complexidade técnica
- Riscos identificados

**Score mínimo**: ≥ 1.0 para aprovar implementação

## Saída Esperada

### ✅ Feature APROVADA

**Condições**:
- Não viola nenhum Guardrail ❌ NUNCA
- Cumpre todos Guardrails ✅ SEMPRE aplicáveis
- Tem impacto Médio/Alto na North Star OU é essencial
- Não conflita com decisões anteriores
- Score de priorização ≥ 1.0

**Ação**: Prosseguir para Fase 1 (Documentação)

**Documentar**: Criar entry em `docs/gestao-ideias/00-governanca/decisoes/decision-log.md`

### ❌ Feature REJEITADA

**Condições**:
- Viola qualquer Guardrail ❌ NUNCA
- Conflita com decisão anterior importante
- Impacto Nenhum na North Star E não é essencial

**Ação**: Parar implementação

**Documentar**: Criar entry em `docs/gestao-ideias/00-governanca/decisoes/decision-log.md` com motivo da rejeição

### ⚠️ Feature REQUER AJUSTES

**Condições**:
- Viola Guardrail mas pode ser ajustada
- Impacto Baixo mas ainda é necessária
- Conflita parcialmente com decisão anterior

**Ação**: Listar ajustes necessários e revalidar após ajustes

**Documentar**: Criar entry em `docs/gestao-ideias/00-governanca/decisoes/decision-log.md` com ajustes necessários

## Exemplos

### Exemplo 1: Feature Aprovada
```
Feature: Sistema de avaliações pós-evento
- ✅ Não viola guardrails
- 🟢 Impacto Alto na North Star (avaliações são core)
- ✅ Não conflita com decisões anteriores
- Score: 2.5
→ APROVADA
```

### Exemplo 2: Feature Rejeitada
```
Feature: Destaque pago para músicos
- ❌ Viola guardrail: "NUNCA implementar destaque pago para músicos"
→ REJEITADA
```

### Exemplo 3: Feature Requer Ajustes
```
Feature: Sistema de ranking com boost opcional
- ⚠️ Viola guardrail: "NUNCA permitir manipulação de ranking"
- Ajuste necessário: Remover boost, manter apenas mérito
→ REQUER AJUSTES
```

## Referências

- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md` - **LEIA PRIMEIRO**
- **North Star**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Decision Log**: `docs/gestao-ideias/00-governanca/decisoes/decision-log.md`
- **ADRs**: `docs/gestao-ideias/00-governanca/decisoes/adr-*.md`
- **Playbook Priorização**: `docs/gestao-ideias/00-governanca/ia/playbooks/feature-prioritization.md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md` (Fase 0)

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

