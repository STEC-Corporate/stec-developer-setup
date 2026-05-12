# 🌳 Playbook: Tree of Thoughts (ToT) - Decisão Estratégica

> **Script de decisão para quando há múltiplas soluções plausíveis**

---

## 🎯 Quando Usar Este Playbook

Use ToT quando a decisão tiver **várias soluções plausíveis** e for necessário explorar, avaliar e selecionar a melhor. **Não use** para decisões binárias ou quando o caminho ótimo for óbvio.

### Checklist: Esta decisão precisa de ToT?

- [ ] Existem 3+ caminhos plausíveis e viáveis?
- [ ] A escolha não é óbvia (não é Sim/Não)?
- [ ] Trade-offs entre opções existem?
- [ ] A decisão impacta múltiplos domínios ou perfis?

**Se 2+ respostas forem SIM** → Use ToT.

---

## 📊 CoT vs ToT: Quando Usar Cada Um

| Situação | Use |
|----------|-----|
| Violação de guardrail? | **CoT** (resposta binária: Não fazer) |
| Qual feature priorizar? (uma claramente melhor) | **CoT** |
| Qual feature priorizar? (empate ou score 0.9-1.1) | **ToT** |
| Ordem de migração de repositórios | **ToT** |
| Estrutura de pastas para canonical | **ToT** |
| Feature "Requer Ajustes" (múltiplas correções) | **ToT** |
| Ordem de implementação dos 18 perfis | **ToT** |

---

## 🔄 Processo ToT (4 Fases)

### Fase 1 - Geração

Gerar **3-5 caminhos alternativos**. Cada caminho deve ser viável e não violar guardrails.

### Fase 2 - Avaliação (0-10)

| Critério | 0 | 10 |
|----------|---|-----|
| North Star | Nenhum impacto | Alto impacto |
| Guardrails | Viola | Plenamente conforme |
| Complexidade | Alto esforço | Baixo esforço |
| Risco | Alto risco | Baixo risco |

**Manter** caminhos com soma ≥24.

### Fase 3 - Seleção

Selecionar os 2-3 melhores. Desempate: North Star > Guardrails.

### Fase 4 - Consolidação

Documentar decisão final com justificativa e alternativas descartadas.

---

## 📋 Exemplo Aplicado: Ordem de Migração para Repositórios Fake

**Pergunta**: Qual a melhor ordem para migrar repositórios fake para `lib/mocks/canonical`?

### Alternativas Geradas

| # | Caminho | Descrição |
|---|---------|-----------|
| A | Por dependência | Migrar na ordem do grafo de dependências (folhas primeiro) |
| B | Por domínio | Migrar por domínio: contracts → client-relations → messages → ... |
| C | Por impacto Matriz | Priorizar domínios que a Matriz de Interações usa (client-relations, contracts) |
| D | Híbrido | Fase 1: domínios Matriz; Fase 2: por dependência; Fase 3: restante |

### Avaliação (0-10)

| Caminho | North Star | Guardrails | Complexidade | Risco | Soma |
|---------|------------|------------|--------------|-------|------|
| A | 6 | 10 | 7 | 8 | 31 |
| B | 5 | 10 | 8 | 7 | 30 |
| C | 8 | 10 | 6 | 7 | 31 |
| D | 8 | 10 | 5 | 6 | 29 |

### Decisão Consolidada

**Recomendação**: Caminho **C** (por impacto Matriz) ou **A** (por dependência).

**Justificativa C**: Acelera a Matriz de Interações (pré-requisito para integração dos 18 perfis). Domínios client-relations e contracts são core para a simbiose contratante↔músico.

**Alternativas descartadas**:
- B: Menor impacto na Matriz; ordem arbitrária
- D: Mais complexo de executar sem ganho proporcional

---

## 🔗 Integração com Outros Playbooks

| Playbook | Quando usar junto |
|----------|-------------------|
| [Feature Prioritization](./feature-prioritization.md) | Score limítrofe (0.9-1.1) → usar ToT para explorar cenários |
| [validate-feature-strategy](../../../.cursor/skills/validate-feature-strategy/SKILL.md) | Feature "Requer Ajustes" → ToT para gerar alternativas de correção |

---

## 📚 Referências

- [Skill ToT](../../../.cursor/skills/tot-strategic-decision/SKILL.md)
- [Template de Prompt ToT](./tot-prompt-template.md)
- [Guardrails](../guardrails.md)
- [North Star Metric](../../planejamento/metrics/north-star.md)
