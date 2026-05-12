---
name: migracao-executar-migracao-hexagonal
description: Executar o plano de migracao aprovado refatorando para portas e adaptadores seguindo cursorrules.
---

# executar-migracao-hexagonal

## Quando usar

Plano de migracao hexagonal aprovado; execucao da refatoracao.

## Documentos

.cursorrules, plano gerado por criar-plano-migracao-hexagonal.
Consultar `references/hexagonal-patterns.md` antes de iniciar (estrutura, regras, checklist e armadilhas).

## Passos

1. Seguir plano etapa a etapa.
2. Refatorar para portas (interfaces) e adaptadores (implementacoes); domínio no centro.
3. Manter regras de dependencia (Domain independente; Application depende do Domain; Infrastructure implementa interfaces).
4. Atualizar testes conforme plano; validar contratos e health.

## Saida

Codigo refatorado. Clean Architecture preservada. Testes passando.

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

