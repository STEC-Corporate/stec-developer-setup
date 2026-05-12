---
name: tot-strategic-decision
description: Usa Tree of Thoughts para decisões estratégicas com múltiplos caminhos plausíveis. Use quando houver várias soluções viáveis a avaliar (ordem de migração, estrutura de pastas, priorização de domínios, feature requer ajustes)
---

# Tree of Thoughts (ToT) — Decisão Estratégica

## Quando usar

- Feature “requer ajustes” com múltiplas correções possíveis
- Priorização limítrofe (empate ou pontuações muito próximas)
- Planos com múltiplas estratégias viáveis (fases alternativas)
- Decisões de integração (ordem de migração, estrutura de pastas)
- Impacto na North Star ambíguo (múltiplas hipóteses causais)
- Matriz de interações (ordem de implementação por perfis)

## Quando não usar

- Decisão binária simples (ex.: viola guardrail? sim/não)
- Caminho ótimo único e conhecido
- Tarefas factuais diretas

## Documentos

- Guardrails: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- North Star: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- Playbook ToT: `docs/gestao-ideias/00-governanca/ia/playbooks/tot-strategic-decision.md`
- Template de prompt: `docs/gestao-ideias/00-governanca/ia/playbooks/tot-prompt-template.md`

## Passos

### 1) Geração (3–5 caminhos)

Gerar **3–5 caminhos alternativos**. Cada caminho deve:

- ser viável tecnicamente
- não violar guardrails
- ter critérios claros e verificáveis

### 2) Avaliação (0–10)

Avaliar cada caminho:

| Critério | Descrição | Escala |
|---|---|---|
| NorthStar | Impacto em contratações bem-sucedidas | 0–10 (10 = alto impacto) |
| Guardrails | Conformidade com princípios | 0–10 (0 = viola, 10 = pleno) |
| Complexidade | Esforço necessário (inverso) | 0–10 (10 = menor esforço) |
| Risco | Chance de falha (inverso) | 0–10 (10 = menor risco) |

Manter caminhos com soma **≥ 24**.

### 3) Seleção

- Manter os **2–3 melhores** caminhos (soma ≥ 24)
- Descartar alternativas com justificativa
- Em caso de empate, usar **North Star** como desempate

### 4) Consolidação

- Escolher o caminho final
- Justificar com referência a guardrails e North Star
- Documentar alternativas descartadas e motivos

## Saída

Entregar no formato:

```markdown
## Decisão ToT: [TÍTULO]

### Caminho Recomendado
[Nome e descrição do caminho escolhido]

**Justificativa**:
- North Star: [como impacta]
- Guardrails: [conformidade]
- Complexidade: [esforço estimado]
- Risco: [nível e mitigação]

### Alternativas Descartadas
1. [Caminho A]: [motivo do descarte]
2. [Caminho B]: [motivo do descarte]
```

## Pré-condições

- Contexto e objetivo da decisão definidos
- Opções plausíveis identificadas (mínimo 3)
- Critérios de sucesso acordados (ex.: reduzir risco, acelerar migração, aumentar impacto)

## Checklist de saída

- [ ] 3–5 caminhos gerados
- [ ] Pontuação por critério (0–10) registrada
- [ ] Alternativas descartadas justificadas
- [ ] Caminho final e racional documentados

## Cobertura de stack e domínio

- Domínio: planejamento/estratégia
- Stacks: agnóstico (aplicável a frontend, backend, infra)
