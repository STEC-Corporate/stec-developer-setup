---
name: seguranca-validar-guardrails
description: Valida proposta ou código contra guardrails. Consulta .cursor/rules/guardrails.md (local). Use antes de implementar feature ou ao revisar.
---

# Validar Guardrails

## Quando usar

- Antes de implementar qualquer feature
- Ao analisar proposta de feature
- Ao validar conformidade com princípios fundamentais
- Ao revisar código ou documentação

## Fonte

**Consultar**: `.cursor/rules/guardrails.md` (Frontend Oficial). Alinhamento estratégico: Template `docs/gestao-ideias/00-governanca/ia/guardrails.md` (ver `docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md`).

## Proibições (NUNCA)

- NUNCA destaque pago para músicos (boost, planos premium para músicos)
- NUNCA manipulação de ranking (músico alterar próprio ranking, comprar posição, avaliações falsas)
- NUNCA violar Clean Architecture (misturar camadas, dependências incorretas)
- NUNCA implementar regras de negócio no frontend (apenas formato e UI; regras no backend)

## Obrigações (SEMPRE)

- SEMPRE basear ranking em dados verificáveis
- SEMPRE validar contra North Star Metric quando aplicável
- SEMPRE manter transparência no ranking
- SEMPRE documentar regras de negócio em arquivos `fe-*.md` (no Template)

## Passos

1. Ler `.cursor/rules/guardrails.md`.
2. Verificar código/proposta contra cada item (monetização, ranking, arquitetura, regras de negócio).
3. Listar conformidades e violações (Crítico/Alto/Médio).
4. Recomendar correções ou alternativas.

## Resultado

- Conformidade: o que está alinhado.
- Violações: crítico (impede implementação), alto (compromete princípios), médio (dúvida ou menor).
- Recomendações: como corrigir ou ajustar.

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

