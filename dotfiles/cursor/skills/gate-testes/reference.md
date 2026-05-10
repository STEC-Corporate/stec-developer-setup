# Template Unico de Saida dos Gates

Use este formato em todos os gates (`gate-arquitetura`, `gate-testes`, `gate-seguranca`, `gate-ci`) para padronizar consolidacao e decisao.

## 1) Contexto
- gate: `<gate-arquitetura | gate-testes | gate-seguranca | gate-ci>`
- tarefa_id: `<id-da-tarefa>`
- stack: `<Java|Kotlin|Python|TypeScript|React|React Native|NextJS|NestJS>`
- dominio: `<backend|frontend|mobile>`
- escopo: `<resumo curto da mudanca>`
- artefatos_analisados:
  - `<arquivo-ou-modulo-1>`
  - `<arquivo-ou-modulo-2>`

## 2) Resultado Final
- decisao: `<aprovado | aprovado_com_ressalvas | reprovado>`
- severidade_maxima: `<bloqueante | alta | media | baixa>`
- resumo_executivo: `<1-3 linhas com conclusao objetiva>`

## 3) Achados
- id: `<ACH-001>`
  titulo: `<descricao curta do achado>`
  severidade: `<bloqueante|alta|media|baixa>`
  categoria: `<arquitetura|testes|seguranca|ci|codigo>`
  evidencia:
    - arquivo: `<path>`
      detalhe: `<trecho/regra/comportamento observado>`
  impacto: `<risco tecnico/negocio>`
  recomendacao: `<acao objetiva para correcao>`
  status: `<aberto|mitigado|aceito_com_risco>`

## 4) Checklist do Gate
- item: `<criterio 1 do gate>`
  resultado: `<pass|fail|na>`
  observacao: `<opcional>`

## 5) Criterios de Bloqueio
- bloqueios_acionados:
  - `<regra de bloqueio acionada>`
- justificativa_bloqueio: `<preencher somente se houver bloqueio>`

## 6) Plano de Acao
- acoes_imediatas:
  - `<correcao prioritaria>`
- acoes_pos_merge:
  - `<debito tecnico aceito>`
- owner_sugerido: `<time/papel>`
- prazo_sugerido: `<data ou janela>`

## 7) Metadados
- executor_gate: `<agente/skill responsavel>`
- revisores_relacionados:
  - `<sentinela-arquitetura>`
  - `<sentinela-testes>`
- timestamp: `<ISO-8601>`
- versao_template: `v1.0.0`

## Regras de decisao
- `reprovado`: existe ao menos um achado `bloqueante`.
- `aprovado_com_ressalvas`: sem bloqueante, mas com `alta` ou multiplos `media`.
- `aprovado`: apenas `baixa` ou nenhum achado.
