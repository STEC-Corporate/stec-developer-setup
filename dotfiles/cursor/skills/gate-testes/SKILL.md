---
name: gate-testes
description: Executa gate de testes (unit, integracao, e2e) com analise de risco e cobertura esperada.
---

# gate-testes

## Quando usar
- Antes de merge/release
- Quando houver mudancas de alto impacto
- Quando sentinelas apontarem risco medio ou superior

## Instrucoes
1. Revisar diff e classificar risco por dominio.
2. Aplicar checklist do gate.
3. Produzir resultado com severidade e evidencias.
4. Retornar status final: aprovado/aprovado com ressalvas/reprovado.

## Checklist
- Conformidade tecnica
- Risco operacional
- Evidencias e recomendacoes

## Saida obrigatoria
- Use o template padrao em `reference.md` desta skill.
- Sempre preencher: contexto, resultado final, achados, checklist, bloqueios, plano de acao e metadados.
- Decisao final obrigatoria: `aprovado`, `aprovado_com_ressalvas` ou `reprovado`.
- Classificar todos os achados com severidade: `bloqueante`, `alta`, `media` ou `baixa`.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.

