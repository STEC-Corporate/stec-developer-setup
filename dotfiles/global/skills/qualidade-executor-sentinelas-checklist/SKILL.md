---
name: qualidade-executor-sentinelas-checklist
description: Fornece checklist compacto do fluxo executor mais sentinelas e da ordem de severidade para consolidacao de achados; use junto ao agente qualidade-programa-orquestrador.
---

## Quando usar

- Apos uma mudanca de codigo, para garantir que sentinelas (arquitetura, testes, seguranca, CI) foram consideradas antes da decisao final.

## Checklist rapido

1. Executor concluiu a mudanca no escopo acordado.
2. Sentinelas analisam em paralelo (ou sequencial se recursos limitados).
3. Aplicar ordem de severidade: seguranca bloqueante > testes criticos > arquitetura bloqueante > bugs alto impacto > smells.
4. Qualquer bloqueante confirmado => reprovado.
5. Sem bloqueantes e com altas => aprovado com ressalvas + plano.
6. So medias/baixas => aprovado com backlog tecnico.

## Pre-condicoes

- Escopo e criterios de aceite definidos.

## Checklist de saida

- Contexto, achados, severidade, evidencias, acao recomendada, status final documentados.
