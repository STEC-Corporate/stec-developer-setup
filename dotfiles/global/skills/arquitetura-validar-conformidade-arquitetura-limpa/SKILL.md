---
name: arquitetura-validar-conformidade-arquitetura-limpa
description: Verificar servico ou modulo quanto a dependencias entre camadas, IServiceResult, DTOs, nomenclatura e SOLID.
---

# validar-conformidade-clean-architecture

## Quando usar

- Revisao de um microsservico ou modulo.
- Antes de PR; validar que camadas e padroes estao corretos.

## Documentos

- .cursorrules (camadas Domain, Application, Infrastructure, Presentation; regra de dependencias; IServiceResult; nomenclatura).

## Passos

1. Listar arquivos do servico/modulo e classificar por camada (Domain, Application, Infrastructure, Presentation).
2. Verificar dependencias: Domain sem deps externas; Application so Domain; Infrastructure implementa interfaces; Presentation orquestra Application.
3. Verificar uso de IServiceResult/ServiceResult em services e retornos de erro.
4. Verificar DTOs com class-validator onde ha entrada de API.
5. Verificar nomenclatura (kebab-case arquivos, PascalCase classes, sufixos .dto.ts, .controller.ts).
6. Apontar violacoes e sugerir correcoes.

## Saida

- Relatorio de conformidade por camada.
- Lista de violacoes com sugestao de correcao.

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

