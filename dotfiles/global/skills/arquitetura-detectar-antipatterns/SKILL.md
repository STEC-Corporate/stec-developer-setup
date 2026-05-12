---
name: arquitetura-detectar-antipatterns
description: Analisar servico ou modulo e listar antipatterns (God Service, dominio anemico, vazamento de camada, etc.) com sugestao de correcao.
---

# detectar-antipatterns

## Quando usar

Revisao de codigo; servico "inchado"; refatoracao; duvida sobre onde colocar regra (dominio vs application).

## Documentos

.cursorrules (Clean Architecture, estrutura, limites por funcao/classe).

## Passos

1. Analisar servico ou modulo indicado.
2. Detectar: God Class/Service, dominio anemico, logica de negocio em controllers, dependencia de detalhes (DB, HTTP) no dominio, duplicacao de regras entre servicos.
3. Para cada antipattern: descrever onde ocorre e sugerir correcao (refatoracao pontual, extrair servico, mover para camada correta).
4. Priorizar por impacto; manter sugestoes acionaveis.

## Saida

Lista de antipatterns com local, descricao e sugestao de correcao. Sem alterar codigo diretamente (apenas recomendar).

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

