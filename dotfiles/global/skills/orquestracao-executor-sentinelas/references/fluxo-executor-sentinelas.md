# Fluxo Executor + Sentinelas

## Visão geral

O programa de qualidade usa um padrão de paralelismo controlado onde um **executor** implementa mudanças enquanto **sentinelas** analisam em paralelo.

```
Executor implementa
       │
       ▼
┌──────────────────────────────────────────────┐
│          Sentinelas (paralelo)               │
│  gate-arquitetura  gate-testes  gate-seguranca │
│  gate-ci           debug-analista-de-bugs     │
└──────────────────────────────────────────────┘
       │
       ▼
Orquestrador consolida achados
       │
       ▼
Decisão: aprovado / aprovado_com_ressalvas / reprovado
       │
       ▼
Correção guiada (se necessário) → Validação final
```

## Papéis

| Papel | Agente | Responsabilidade |
|---|---|---|
| Executor | qualquer agente de stack | Implementa a mudança |
| Sentinela Arquitetura | `gate-arquitetura` | Valida Clean Arch, SOLID, acoplamento |
| Sentinela Testes | `gate-testes` | Valida cobertura, qualidade de testes |
| Sentinela Segurança | `gate-seguranca` | Valida auth, secrets, input validation |
| Sentinela CI | `gate-ci` | Valida pipeline, qualidade mínima |
| Orquestrador | `qualidade-programa-orquestrador` | Consolida e decide |

## Política de severidade

**Ordem de prioridade para consolidação:**
1. Segurança bloqueante
2. Testes críticos
3. Arquitetura bloqueante
4. Bugs de alto impacto
5. Smells e melhorias

**Regra de decisão:**
- Qualquer `bloqueante` confirmado → `reprovado`
- Sem bloqueante, com `alta` → `aprovado_com_ressalvas` + plano de correção
- Apenas `media`/`baixa` → `aprovado` com backlog técnico

**Conflito entre sentinelas:** priorizar maior severidade. Evidência insuficiente → nova rodada de análise.

## Formato de saída obrigatório dos sentinelas

Ver `skills/gate-arquitetura/reference.md` para o template completo de saída (`gate-v1`).

Campos obrigatórios:
- `gate`, `tarefa_id`, `stack`, `dominio`, `escopo`, `artefatos_analisados`
- `decisao`, `severidade_maxima`, `resumo_executivo`
- Lista de `achados` com `id`, `titulo`, `severidade`, `categoria`, `evidencia`, `impacto`, `recomendacao`, `status`
- `checklist` com `pass`/`fail`/`na`
- `criterios_de_bloqueio`
- `plano_de_acao` com `acoes_imediatas` e `acoes_pos_merge`
- `metadados` com `timestamp` e `versao_template`
