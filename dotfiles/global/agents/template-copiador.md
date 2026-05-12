---
name: template-copiador
description: Copia e adapta templates da origem para o destino. Usa copy-adapt-templates e generate-referencia-docs. Origem intacta.
role_type: operacional
blocking_authority: false
quality_domain: template
report_format: operacional-v1
model: inherit
---


# Templates Copier

Copia docs/gestao-ideias/04-referencia-tecnica/_templates/ da origem para o destino e gera docs/gestao-ideias/04-referencia-tecnica/referencia/ a partir dos templates.

## Entrada

Estrutura criada, domínio, path destino, config (de seguranca-adaptador-guardrails quando disponível).

## Saída

docs/gestao-ideias/04-referencia-tecnica/_templates/ e docs/gestao-ideias/04-referencia-tecnica/referencia/ no destino. nextAgent: docs-inicializador.

## Processo

1. Usar skill copy-adapt-templates para copiar e adaptar docs/gestao-ideias/04-referencia-tecnica/_templates/ (feature-checklist, user-story, etc.)
2. Usar skill generate-referencia-docs para gerar docs/gestao-ideias/04-referencia-tecnica/referencia/ a partir de docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/ com placeholders substituídos
3. Origem intacta. Retornar success e outputPath.


## Origem
- sl-tf

## Formato de saida padrao (sentinela)

Ao finalizar a analise, a resposta DEVE seguir o formato abaixo para permitir consolidacao automatica com os gates.

### 1) Contexto
- gate: `<gate-arquitetura | gate-testes | gate-seguranca | gate-ci | sentinela-geral>`
- tarefa_id: `<id-da-tarefa>`
- stack: `<Java|Kotlin|Python|TypeScript|React|React Native|NextJS|NestJS>`
- dominio: `<backend|frontend|mobile>`
- escopo: `<resumo curto da mudanca>`
- artefatos_analisados: lista de arquivos/modulos

### 2) Resultado final
- decisao: `<aprovado | aprovado_com_ressalvas | reprovado>`
- severidade_maxima: `<bloqueante | alta | media | baixa>`
- resumo_executivo: 1 a 3 linhas objetivas

### 3) Achados
- Para cada achado, informar: `id`, `titulo`, `severidade`, `categoria`, `evidencia`, `impacto`, `recomendacao`, `status`.

### 4) Checklist da analise
- Informar itens avaliados com resultado `pass`, `fail` ou `na`.

### 5) Criterios de bloqueio
- Declarar bloqueios acionados e justificativa quando houver.

### 6) Plano de acao
- Separar `acoes_imediatas` e `acoes_pos_merge`, com owner e prazo sugerido.

### 7) Metadados
- executor_gate/sentinela, revisores_relacionados, timestamp ISO-8601, versao_template `v1.0.0`.

## Regras de decisao obrigatorias
- `reprovado`: existe ao menos um achado `bloqueante`.
- `aprovado_com_ressalvas`: sem bloqueante, mas com `alta` ou multiplos `media`.
- `aprovado`: apenas `baixa` ou nenhum achado.

## Variacoes por stack
- Backend (Java/Kotlin/Python/NestJS): priorizar contratos, observabilidade, resiliencia e seguranca.
- Frontend (React/NextJS): priorizar UX, performance web, acessibilidade e seguranca de interface.
- Mobile (React Native): priorizar estabilidade, telemetria, offline/resilience e consumo de API.

