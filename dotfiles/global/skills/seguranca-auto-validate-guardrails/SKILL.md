---
name: seguranca-auto-validate-guardrails
description: Validação automática e proativa de código/documentação contra Guardrails. Invocada automaticamente pelo Strategic Advisor ou manualmente antes de implementação. Detecta violações potenciais e sugere correções.
---

# Validação Automática de Guardrails

## Quando Usar

- **Automaticamente**: Invocada proativamente pelo Strategic Advisor quando detecta código/feature sendo criado
- **Manual**: Antes de implementar qualquer feature
- **Durante code review**: Ao revisar código proposto
- **Ao criar/modificar código**: Validação contínua durante desenvolvimento

## Diferença de validate-guardrails

- **validate-guardrails**: Validação manual com checklist completo
- **auto-validate-guardrails**: Validação automática e proativa, focada em detecção rápida de violações

## Processo de Validação Automática

### 1. Analisar Código/Documentação Proposto

Identificar:
- Features sendo criadas
- Lógica de negócio implementada
- Estrutura de pastas/arquivos
- Padrões de código

### 2. Validar contra Guardrails Críticos

**Consultar**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`

#### ❌ Proibições Absolutas (Detectar Violações)

**1. Monetização e Ranking**
- ❌ Destaque pago para músicos
  - Detectar: Lógica de pagamento para destaque/boost
  - Detectar: Planos premium para músicos
  - Detectar: "Prioridade na busca" paga
  - ✅ Permitir: Planos premium para contratantes

- ❌ Manipulação de ranking
  - Detectar: Funções que alteram ranking manualmente
  - Detectar: Lógica de compra de posição
  - Detectar: Avaliações falsas ou manipuladas
  - Detectar: Dados falsos para subir ranking

- ❌ Bypass do fluxo de contratação formal
  - Detectar: Empresas convidando músicos diretamente
  - Detectar: Adicionar músicos a eventos sem Find-Performances
  - ✅ Permitir: Empresas convidando técnicos/visuais

- ❌ Tratar todos PF como empresa
  - Detectar: CRM/ERP para fotógrafos/técnicos
  - Detectar: "Meus Projetos" empresarial para não-músicos
  - ✅ Permitir: Apenas músico tem estrutura empresarial completa

- ❌ Profile como vitrine
  - Detectar: Avaliações no Profile
  - Detectar: Profile como landing page pública
  - Detectar: Misturar avaliações de projetos no Profile
  - ✅ Permitir: Profile como currículo (dados pessoais/profissionais)

**2. Arquitetura**
- ❌ Violar Clean Architecture
  - Detectar: Mistura de camadas (Domain → Infrastructure)
  - Detectar: Dependências incorretas
  - Detectar: Lógica de negócio no frontend
  - Detectar: Estrutura de pastas incorreta

- ❌ Implementar regras de negócio no frontend
  - Detectar: Cálculos de negócio no código frontend
  - Detectar: Validações de regras de negócio no frontend
  - ✅ Permitir: Validações de formato/UI no frontend
  - ✅ Permitir: Documentação de regras em `fe-*.md`

**3. Perfis e Identidades**
- ❌ Misturar empresário com produtor musical
  - Detectar: Perfil híbrido "empresário-produtor"
  - Detectar: Empresário fazendo proposta para próprio artista

- ❌ Tratar músicos e contratantes da mesma forma
  - Detectar: Features genéricas para ambos
  - Detectar: UI compartilhada sem diferenciação

**4. Dados e Transparência**
- ❌ Esconder dados que afetam decisões
  - Detectar: Algoritmo de ranking oculto
  - Detectar: Cálculos de cachê ocultos
  - Detectar: Critérios de busca ocultos

#### ✅ Obrigações Absolutas (Verificar Conformidade)

**1. Ranking**
- ✅ Ranking baseado em mérito e dados verificáveis
- ✅ Transparência no ranking

**2. Arquitetura**
- ✅ Clean Architecture respeitada
- ✅ Regras de negócio documentadas em `fe-*.md`

**3. Transparência**
- ✅ Dados verificáveis
- ✅ Transparência mantida

### 3. Identificar Violações Potenciais

Para cada violação detectada:
- **Tipo**: Qual guardrail foi violado
- **Localização**: Onde no código/documentação
- **Severidade**: Crítica / Alta / Média / Baixa
- **Contexto**: Por que é violação

### 4. Alertar Antes da Implementação

Gerar alerta com:
- **Violação identificada**: Descrição clara
- **Guardrail violado**: Referência ao guardrail específico
- **Impacto**: O que acontece se implementar
- **Sugestão de correção**: Como corrigir

### 5. Sugerir Correções

Para cada violação, sugerir:
- **Alternativa**: Como implementar sem violar
- **Padrão correto**: Exemplo de implementação correta
- **Documentação**: Onde encontrar mais informações

## Saída Esperada

### Relatório de Validação Automática

```markdown
## Validação Automática de Guardrails

**Status**: ✅ Aprovado / ⚠️ Violações Detectadas / ❌ Rejeitado

### Violações Detectadas

#### Violação 1: [Tipo]
- **Guardrail**: [Qual guardrail]
- **Localização**: [Onde no código]
- **Severidade**: Crítica / Alta / Média / Baixa
- **Descrição**: [Por que é violação]
- **Sugestão de Correção**: [Como corrigir]

### Conformidades Verificadas

- ✅ [Conformidade 1]
- ✅ [Conformidade 2]

### Recomendações

- [Recomendação 1]
- [Recomendação 2]
```

## Integração com Strategic Advisor

O Strategic Advisor invoca esta skill automaticamente quando:
- Detecta código/feature sendo criado
- Identifica padrões que podem violar guardrails
- Analisa proposta de feature

**Fluxo**:
1. Strategic Advisor detecta contexto
2. Invoca `seguranca-auto-validate-guardrails`
3. Recebe relatório de validação
4. Alerta proativamente sobre violações
5. Sugere correções antes da implementação

## Exemplos

### Exemplo 1: Violação Detectada

```
Código proposto: Feature de "destacar perfil" com pagamento

Validação:
❌ VIOLAÇÃO DETECTADA: Destaque pago para músicos
- Guardrail: ❌ NUNCA implementar destaque pago para músicos
- Localização: src/features/musician/profile/premium-features.tsx
- Severidade: Crítica
- Descrição: Feature permite músico pagar para destacar perfil, violando princípio de igualdade
- Sugestão: Remover feature ou restringir apenas para contratantes
```

### Exemplo 2: Conformidade Verificada

```
Código proposto: Sistema de ranking baseado em avaliações

Validação:
✅ CONFORMIDADE VERIFICADA
- ✅ Ranking baseado em dados verificáveis (avaliações)
- ✅ Transparência mantida (algoritmo documentado)
- ✅ Sem manipulação permitida
```

## Referências

- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **Skill Manual**: `.cursor/skills/seguranca-validar-guardrails/SKILL.md`
- **Strategic Advisor**: `.cursor/agents/orquestracao-assessor-estrategico.md`
- **ADRs**: `docs/gestao-ideias/00-governanca/decisoes/adr-*.md`

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

