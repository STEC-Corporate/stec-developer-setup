# Template de Prompt - Tree of Thoughts (ToT)

> Copie e preencha para decisões estratégicas com múltiplos caminhos

---

## Template

```markdown
# Decisão ToT: [TÍTULO DA DECISÃO]

## Contexto
[Descrever decisão a tomar, restrições conhecidas, documentos relevantes]

## Fase 1 - Geração
Gerar 3-5 caminhos alternativos. Cada caminho deve ser viável e não violar guardrails (.cursor/docs/ia/guardrails.md).

**Caminhos**:
1. [Caminho A]: [descrição]
2. [Caminho B]: [descrição]
3. [Caminho C]: [descrição]
4. [Caminho D]: [descrição] (opcional)
5. [Caminho E]: [descrição] (opcional)

## Fase 2 - Avaliação (0-10)
Para cada caminho, avaliar:

| Caminho | North Star | Guardrails | Complexidade | Risco | Soma |
|---------|------------|------------|--------------|-------|------|
| A | | | | | |
| B | | | | | |
| C | | | | | |

**Critérios**:
- North Star: 10 = alto impacto em contratações bem-sucedidas
- Guardrails: 10 = plenamente conforme
- Complexidade: 10 = menor esforço
- Risco: 10 = menor risco

**Manter** caminhos com soma ≥24.

## Fase 3 - Seleção
Caminhos selecionados: [listar 2-3 melhores]

Alternativas descartadas e motivos:
- [Caminho X]: [motivo]

## Fase 4 - Consolidação
**Decisão final**: [Nome do caminho escolhido]

**Justificativa**:
- North Star: [como impacta]
- Guardrails: [conformidade]
- Complexidade: [esforço estimado]
- Risco: [nível e mitigação]
```

---

## Exemplo Preenchido

```markdown
# Decisão ToT: Ordem de migração de repositórios fake

## Contexto
Centralizar ~128 repositórios fake em lib/mocks/canonical. Objetivo: suportar Matriz de Interações entre 18 perfis.

## Fase 1 - Geração
1. Por dependência: folhas do grafo primeiro
2. Por domínio: contracts → client-relations → messages
3. Por impacto Matriz: client-relations, contracts primeiro
4. Híbrido: Matriz + dependência + restante

## Fase 2 - Avaliação
| Caminho | North Star | Guardrails | Complexidade | Risco | Soma |
|---------|------------|------------|--------------|-------|------|
| Dependência | 6 | 10 | 7 | 8 | 31 |
| Domínio | 5 | 10 | 8 | 7 | 30 |
| Impacto Matriz | 8 | 10 | 6 | 7 | 31 |
| Híbrido | 8 | 10 | 5 | 6 | 29 |

## Fase 3 - Seleção
Selecionados: Impacto Matriz, Dependência

## Fase 4 - Consolidação
**Decisão**: Impacto Matriz primeiro (client-relations, contracts), depois por dependência.
**Justificativa**: Acelera Matriz; contracts/client-relations são core da simbiose.
```

---

## Referências

- [Playbook ToT](./tot-strategic-decision.md)
- [Skill ToT](../../../.cursor/skills/tot-strategic-decision/SKILL.md)
