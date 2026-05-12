# Operational V1 Contract

## Objetivo

Definir um contrato de saída enxuto para agents com:

- `role_type: operacional`
- `blocking_authority: false`
- `report_format: operacional-v1`

Esse contrato existe para diferenciar executores e orquestradores dos agents sentinela que usam `gate-v1`.

## Princípios

1. `operacional-v1` não é auditoria formal.
2. A saída deve ser curta, acionável e orientada à entrega.
3. Deve registrar decisão prática, não julgamento de compliance em profundidade.
4. Pode mencionar riscos e achados, mas sem assumir a estrutura extensa de um gate.
5. Quando o agent for um orquestrador, a ênfase deve cair em plano, delegação e próximo passo.

## Estrutura canônica

### 1. Contexto operacional

- objetivo
- escopo
- artefatos relevantes

### 2. Resultado

- status: `concluido | parcial | bloqueado`
- resumo: 1 a 3 linhas

### 3. Evidências

- mudanças, validações ou observações objetivas

### 4. Riscos e dependências

- riscos imediatos
- dependências externas ou pendências

### 5. Próximo passo recomendado

- próxima ação única ou sequência curta

## Template de saída

```text
Contexto operacional
- objetivo: <...>
- escopo: <...>
- artefatos: <...>

Resultado
- status: <concluido | parcial | bloqueado>
- resumo: <1 a 3 linhas>

Evidências
- <fato verificável>
- <fato verificável>

Riscos e dependências
- <risco ou pendência>

Próximo passo recomendado
- <ação seguinte>
```

## Quando usar

Use `operacional-v1` para:

- especialistas de stack
- executores de documentação
- orquestradores de fluxo
- agentes de replicação ou scaffolding
- agentes de apoio técnico sem autoridade de bloqueio

## Quando não usar

Não use `operacional-v1` para:

- `sentinela-estrito`
- agents com `blocking_authority: true`
- gates de arquitetura, testes, segurança ou CI
- validações formais que exigem severidade consolidada

## Diferença para gate-v1

`operacional-v1`:
- curto
- orientado a execução
- registra contexto e próximo passo
- pode apontar risco sem formalismo extenso

`gate-v1`:
- formal
- orientado a aprovação ou reprovação
- exige severidade, achados e critérios de bloqueio
- serve para consolidação por sentinelas

## Perfis de uso

### Especialista de stack

Foco em:
- qualidade técnica
- aderência à stack
- próximos passos de implementação

### Executor documental

Foco em:
- artefatos gerados ou atualizados
- consistência estrutural
- pendências de conteúdo

### Orquestrador

Foco em:
- estado do fluxo
- delegações ou handoffs
- dependências entre etapas

## Regras de migração

Ao converter um agent de `operacional-v1`:

1. remover o bloco `Formato de saida padrao (sentinela)`
2. manter contexto específico do agent
3. inserir referência explícita a este contrato quando útil
4. evitar checklist de gate, critérios de bloqueio e severidade máxima como estrutura principal

## Observação

Agents operacionais ainda podem mencionar:

- risco
- prioridade
- impedimento
- recomendação

Mas isso deve aparecer de forma leve, sem reproduzir o aparato completo de `gate-v1`.
