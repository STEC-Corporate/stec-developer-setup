# 🔍 Processo de Validação de Guardrails - SoundLink

> **Guia completo sobre como validar código/documentação contra Guardrails do SoundLink**

---

## 🎯 Objetivo

Garantir que todo código, documentação e decisões estejam em conformidade com os Guardrails do SoundLink, prevenindo violações antes da implementação.

---

## 🛠️ Skills Disponíveis

### 1. `auto-validate-guardrails` (Automática e Proativa)

**Quando usar**: Validação automática e proativa
- Invocada automaticamente pelo Strategic Advisor
- Detecção rápida de violações
- Alertas antes da implementação

**Localização**: `.cursor/skills/auto-validate-guardrails/SKILL.md`

**Uso**:
```bash
# Invocado automaticamente pelo Strategic Advisor
# Ou manualmente:
/strategic-advisor validar guardrails deste código
```

### 2. `validate-guardrails` (Manual e Completa)

**Quando usar**: Validação manual com checklist completo
- Antes de commit
- Code review detalhado
- Validação completa de feature

**Localização**: `.cursor/skills/validate-guardrails/SKILL.md`

**Uso**:
```bash
/guardrails-checker validate this feature proposal
```

---

## 📋 Quando Validar

### ✅ OBRIGATÓRIO Validar

1. **Antes de implementar qualquer feature nova**
   - Usar `auto-validate-guardrails` automaticamente
   - Usar `validate-guardrails` para validação completa

2. **Antes de tomar decisão arquitetural importante**
   - Decisões que afetam múltiplos projetos
   - Mudanças em estrutura de pastas
   - Alterações em padrões de código

3. **Durante code review**
   - Validar código proposto
   - Verificar conformidade com guardrails

4. **Ao criar/modificar código**
   - Validação contínua durante desenvolvimento
   - Detecção proativa de violações

### ⚠️ RECOMENDADO Validar

1. **Ao documentar features**
   - Verificar se documentação não sugere violações
   - Validar user stories contra guardrails

2. **Ao revisar propostas de terceiros**
   - Validar antes de aprovar
   - Identificar violações potenciais

---

## 🔄 Processo de Validação

### Passo 1: Validação Automática (Proativa)

**Quem**: Strategic Advisor (automaticamente)

**Quando**: Detecta código/feature sendo criado

**Como**:
1. Strategic Advisor detecta contexto
2. Invoca `auto-validate-guardrails` automaticamente
3. Analisa código/documentação proposto
4. Identifica violações potenciais
5. Alerta proativamente sobre violações
6. Sugere correções

**Resultado**: Alerta rápido sobre violações antes da implementação

### Passo 2: Validação Manual (Completa)

**Quem**: Desenvolvedor ou revisor

**Quando**: Antes de commit ou code review

**Como**:
1. Invocar `validate-guardrails` manualmente
2. Seguir checklist completo
3. Verificar todas as proibições e obrigações
4. Documentar resultado

**Resultado**: Validação completa e documentada

### Passo 3: Correção de Violações

**Se violação detectada**:
1. **Parar implementação** até correção
2. **Analisar violação**: Entender por que é violação
3. **Consultar guardrail**: Ler `.cursor/docs/ia/guardrails.md`
4. **Aplicar correção**: Seguir sugestão da skill
5. **Revalidar**: Validar novamente após correção

**Se conformidade verificada**:
1. **Continuar implementação**
2. **Documentar validação**: Registrar em dashboard
3. **Manter conformidade**: Continuar seguindo guardrails

---

## 📊 Interpretação de Resultados

### ✅ Aprovado

**Significado**: Código/documentação está em conformidade com guardrails

**Ação**: Pode prosseguir com implementação

**Exemplo**:
```
Status: ✅ Aprovado
Conformidades: Ranking baseado em dados, Clean Architecture respeitada
```

### ⚠️ Violações Detectadas

**Significado**: Violações identificadas que precisam correção

**Ação**: Corrigir violações antes de prosseguir

**Exemplo**:
```
Status: ⚠️ Violações Detectadas

Violação 1: Destaque pago para músicos
- Guardrail: ❌ NUNCA implementar destaque pago para músicos
- Severidade: Crítica
- Sugestão: Remover feature ou restringir para contratantes
```

### ❌ Rejeitado

**Significado**: Violações críticas que impedem implementação

**Ação**: Revisar completamente a proposta

**Exemplo**:
```
Status: ❌ Rejeitado
Motivo: Múltiplas violações críticas de guardrails
Ação: Revisar proposta completamente
```

---

## 🔧 Processo de Correção

### 1. Entender a Violação

- Ler guardrail específico em `.cursor/docs/ia/guardrails.md`
- Entender por que é violação
- Consultar ADR relacionada (se houver)

### 2. Aplicar Correção

- Seguir sugestão da skill
- Implementar alternativa que não viola
- Manter funcionalidade desejada (se possível)

### 3. Revalidar

- Validar novamente após correção
- Confirmar que violação foi resolvida
- Verificar que não criou novas violações

### 4. Documentar

- Registrar correção no dashboard
- Documentar lições aprendidas
- Atualizar padrões se necessário

---

## 🔗 Integração com Strategic Advisor

O Strategic Advisor integra validação automática:

**Fluxo Automático**:
1. Strategic Advisor detecta contexto
2. Invoca `auto-validate-guardrails` automaticamente
3. Recebe relatório de validação
4. Alerta proativamente sobre violações
5. Sugere correções antes da implementação

**Exemplo de Alerta Proativo**:
```
"Detectei código que pode violar guardrail de destaque pago. 
Validei automaticamente e encontrei violação. 
Sugestão: Remover lógica de pagamento ou restringir para contratantes."
```

---

## 📈 Dashboard de Validações

**Localização**: `.cursor/docs/ia/strategic/strategic-validation-dashboard.md`

**Conteúdo**:
- Histórico de validações
- Taxa de aprovação/rejeição
- Features que violaram guardrails
- Padrões de violações identificados

**Atualização**: Sempre que validação é realizada

---

## 📚 Referências

- **Guardrails**: `.cursor/docs/ia/guardrails.md`
- **Skill Automática**: `.cursor/skills/auto-validate-guardrails/SKILL.md`
- **Skill Manual**: `.cursor/skills/validate-guardrails/SKILL.md`
- **Strategic Advisor**: `.cursor/agents/strategic-advisor.md`
- **Dashboard**: `.cursor/docs/ia/strategic/strategic-validation-dashboard.md`

---

## ❓ FAQ

### Quando usar auto vs manual?

- **Auto**: Validação rápida e proativa durante desenvolvimento
- **Manual**: Validação completa antes de commit ou code review

### E se a validação automática não detectar violação?

A validação automática é rápida mas pode não ser completa. Sempre fazer validação manual antes de commit importante.

### Posso ignorar violação se for "pequena"?

**NÃO**. Guardrails são invioláveis. Toda violação deve ser corrigida.

### Como documentar validação?

Registrar no dashboard (`.cursor/docs/ia/strategic/strategic-validation-dashboard.md`) e atualizar conforme necessário.

---

**Criado em**: 2026-02-08  
**Última atualização**: 2026-02-08  
**Mantenedor**: Strategic Advisor (CEO)
