---
name: docker-criar-ou-ajustar-docker-compose
description: Criar ou ajustar docker-compose para rodar microsservicos e dependencias em ambiente local.
---

# criar-ou-ajustar-docker-compose

## Quando usar

Configurar ambiente local; adicionar novo microsservico ao compose; resolver porta, env ou rede.

## Documentos

Docs/microsservicos.md, README, docker-compose existente.

## Passos

1. Listar microsservicos e portas em microsservicos.md.
2. Propor ou ajustar docker-compose.yml e variantes (dev, monitoring).
3. Incluir dependencias (MongoDB, Redis) e opcionalmente Prometheus, Grafana, Jaeger.
4. Alinhar portas e env aos servicos; garantir health checks quando possivel.

## Saida

docker-compose.yml e variantes. Alinhado a apps/ e portas do microsservicos.md.

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

