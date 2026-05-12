---
name: seguranca-revisar-seguranca-endpoint
description: Verificar guards JWT e roles, rate limiting e sanitizacao em endpoint e sugerir correcoes.
---

# revisar-seguranca-endpoint

## Documentos

Docs/plano-seguranca.md, .cursorrules.

## Passos

1. Identificar endpoint.
2. Verificar se tem guard de autenticacao e autorizacao quando sensivel.
3. Verificar rate limiting onde aplicavel.
4. Verificar sanitizacao de entrada (DTOs, validacao).
5. Listar correcoes necessarias.

## Saida

Checklist de seguranca. Sugestoes de correcao.

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

