# 📋 Casos de Uso - Strategic Advisor (CEO)

> **Exemplos práticos de uso do Strategic Advisor em diferentes cenários do SoundLink**

---

## 🎯 Cenários de Uso

### Cenário 1: Validação de Feature

**Situação**: Proposta de nova feature "Sistema de avaliações pós-evento"

**Uso do Strategic Advisor**:
```
/strategic-advisor analisar esta proposta de feature: Sistema de avaliações pós-evento
```

**Resposta Esperada**:
1. **Análise Contextual**: Identifica que avaliações são core da North Star Metric
2. **Validação**: 
   - ✅ Não viola guardrails
   - ✅ Impacto ALTO na North Star (>10%)
3. **Decisão/Recomendação**: Aprovar implementação com prioridade ALTA
4. **Predições**: 
   - Impacto estratégico: ALTO (diretamente relacionado à métrica)
   - Impacto técnico: MÉDIO (nova feature, mas padrão conhecido)
   - Impacto multi-projeto: Template → Frontend → BFF → API
5. **Próximos Passos**: 
   - Validar especificações de API
   - Criar business-rules e user-flows
   - Implementar no Template primeiro
6. **Alertas Proativos**: 
   - "Lembre-se de validar contra guardrail de transparência nas avaliações"
   - "Esta feature precisa ser replicada nos 5 projetos"

---

### Cenário 2: Decisão sobre Stack

**Situação**: Considerando atualizar Next.js 14 → 15

**Uso do Strategic Advisor**:
```
/strategic-advisor analisar atualização de Next.js 14 para 15
```

**Resposta Esperada**:
1. **Análise Contextual**: Identifica que atualização pode melhorar performance
2. **Validação**: 
   - ✅ Não viola guardrails
   - ⚠️ Impacto na North Star: BAIXO (melhoria técnica)
3. **Decisão/Recomendação**: 
   - Avaliar custo-benefício
   - Testar em ambiente isolado primeiro
   - Considerar impacto multi-projeto
4. **Predições**: 
   - Impacto técnico: ALTO (melhorias de performance)
   - Impacto multi-projeto: Template → Frontend Oficial
   - Risco: MÉDIO (breaking changes possíveis)
5. **Próximos Passos**: 
   - Verificar changelog do Next.js 15
   - Testar em branch isolada
   - Validar compatibilidade com dependências
6. **Alertas Proativos**: 
   - "Há breaking changes no Next.js 15. Quer que eu liste?"
   - "Esta atualização afeta Template e Frontend Oficial. Precisa estratégia de migração."

---

### Cenário 3: Necessidade de Skill

**Situação**: Identificada necessidade de validar impacto multi-projeto

**Uso do Strategic Advisor**:
```
/strategic-advisor avaliar necessidade de skill para validar impacto multi-projeto
```

**Resposta Esperada**:
1. **Análise Contextual**: Identifica que decisões multi-projeto são frequentes
2. **Validação**: 
   - ✅ Skill não existe ainda
   - ✅ Necessidade justificada
3. **Decisão/Recomendação**: 
   - Criar skill `validate-multi-project-impact`
   - Prioridade: ALTA (evita problemas de desalinhamento)
4. **Predições**: 
   - Impacto estratégico: ALTO (previne problemas)
   - Impacto técnico: BAIXO (skill simples)
5. **Próximos Passos**: 
   - Criar skill em `.cursor/skills/validate-multi-project-impact/`
   - Documentar processo
   - Integrar com Strategic Advisor
6. **Alertas Proativos**: 
   - "Esta skill deve ser usada antes de qualquer decisão arquitetural"
   - "Considere criar skill similar para outros projetos se necessário"

---

### Cenário 4: Análise Multi-Projeto

**Situação**: Decisão de adicionar nova feature que afeta múltiplos projetos

**Uso do Strategic Advisor**:
```
/strategic-advisor validar impacto desta decisão nos 5 projetos: Adicionar sistema de notificações push
```

**Resposta Esperada**:
1. **Análise Contextual**: Identifica que notificações afetam frontend e backend
2. **Validação**: 
   - ✅ Não viola guardrails
   - ⚠️ Impacto multi-projeto: ALTO (afeta 4 dos 5 projetos)
3. **Decisão/Recomendação**: 
   - Implementar no Template primeiro
   - Replicar para Frontend Oficial na próxima sprint
   - Implementar no BFF (orquestração)
   - Implementar na API (domínio)
   - Atualizar Infrastructure (configurações)
4. **Predições**: 
   - Impacto multi-projeto: Template → Frontend → BFF → API → Infrastructure
   - Timeline: 2-3 sprints
   - Risco: MÉDIO (múltiplas integrações)
5. **Próximos Passos**: 
   - Criar especificações no Template
   - Planejar migração por sprint
   - Coordenar implementação entre projetos
6. **Alertas Proativos**: 
   - "Esta feature requer coordenação entre 4 projetos. Considere criar plano detalhado."
   - "Lembre-se de atualizar documentação em todos os projetos."

---

### Cenário 5: Proatividade

**Situação**: Conversa sobre implementação de feature

**Uso do Strategic Advisor**:
```
[Conversa normal sobre feature]
[Strategic Advisor detecta automaticamente necessidade de validação]
```

**Resposta Proativa Esperada**:
1. **Análise Contextual**: "Notei que você está trabalhando em [feature]. Você já validou contra North Star Metric?"
2. **Validação Sugerida**: 
   - "Esta feature pode violar o guardrail X. Quer que eu valide?"
   - "Baseado nas decisões anteriores (ADR-Y), sugiro revisar antes de prosseguir"
3. **Alertas Proativos**: 
   - "Há uma atualização de Next.js disponível que pode melhorar performance. Quer que eu avalie?"
   - "Esta feature impacta qual dos 5 projetos? Precisa ser replicada?"

---

### Cenário 6: Decisão competitiva / Priorização na era IA

**Situação**: Discussão sobre roadmap de IA, ameaça de concorrente IA-first ou priorização de features (matching, mentor de carreira, etc.)

**Uso do Strategic Advisor**:
```
/strategic-advisor considerar ameaça de concorrente IA-first e priorizar roadmap de IA de produto
```

**Resposta Esperada**:
1. **Análise Contextual**: Consulta `.cursor/docs/ia/strategic/strategic-principles-ia-era.md`, `.cursor/docs/ia/competitive/competitive-threats.md` (§ 2.3), `.cursor/docs/ia/innovation/product-ai-roadmap.md`
2. **Validação**: Princípio "IA não mata marketplace; marketplace sem IA morre"; ameaça 2.3 (concorrente como agente sem marketplace); defesa = dados proprietários + lock-in + IA no núcleo; roadmap Product AI pós-lançamento
3. **Decisão/Recomendação**: Priorizar fundação de dados agora; matching/mentor quando houver volume; manter transparência e guardrails
4. **Alertas Proativos**: Consultar strategic-principles-ia-era e product-ai-roadmap em decisões de IA; Admin pode ter dashboard "Estratégia & Era IA" (plano strategic-ia-era-dashboard)

---

## 📊 Padrões de Uso Identificados

### Uso Frequente
- Validação de features antes de implementação
- Análise de impacto na North Star
- Decisões sobre stack tecnológico

### Uso Moderado
- Avaliação de necessidade de skills
- Análise multi-projeto
- Monitoramento de tendências
- **Decisões competitivas e priorização na era IA** (princípios, ameaça 2.3, Product AI roadmap)

### Uso Ocasional
- Identificação de oportunidades de IA
- Análise de mercado
- Validação de decisões arquiteturais complexas

---

## 🔄 Processo de Atualização

Este documento deve ser atualizado:
- ✅ Sempre que novo caso de uso é identificado
- ✅ Após validação de uso em cenários reais
- ✅ Periodicamente (trimestral) para revisão

---

## 📚 Referências

- **Strategic Advisor**: `.cursor/agents/strategic-advisor.md`
- **Skills de Suporte**: 
  - [calculate-north-star-impact](../../.cursor/skills/calculate-north-star-impact/SKILL.md)
  - [validate-multi-project-impact](../../.cursor/skills/validate-multi-project-impact/SKILL.md)
- **Documentos de Análise**:
  - [north-star-impact-analysis.md](./north-star-impact-analysis.md)
  - [multi-project-impact-analysis.md](./multi-project-impact-analysis.md)
  - [strategic-principles-ia-era.md](./strategic-principles-ia-era.md) — princípios na era IA
  - [competitive-threats.md](../competitive/competitive-threats.md) — ameaça 2.3 (concorrente IA-first)
  - [product-ai-roadmap.md](../innovation/product-ai-roadmap.md) — IA de produto

---

**Criado em**: 2026-02-08  
**Última atualização**: 2026-02-08  
**Mantenedor**: Strategic Advisor (CEO)
