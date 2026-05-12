---
name: code-aplicar-rate-limit-endpoint
description: Aplicar ou ajustar rate limiting em endpoint conforme padrao do projeto.
---

# aplicar-rate-limit-endpoint

## Documentos

.cursorrules (rate limit), Docs/plano-seguranca.md.

## Passos

1. Identificar endpoint (ex.: login, register, APIs publicas).
2. Aplicar decorator ou guard de rate limit conforme .cursorrules (ex.: RateLimit com windowMs e maxRequests).
3. Garantir headers X-RateLimit-* quando aplicavel.
4. Nao quebrar contrato do endpoint.

## Saida

Rate limiting aplicado ou ajustado. Documentacao se necessario.

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

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

