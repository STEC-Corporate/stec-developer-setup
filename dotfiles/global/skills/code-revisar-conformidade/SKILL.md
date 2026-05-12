---
name: code-revisar-conformidade
description: Revisar conformidade de trecho ou módulo com .cursorrules, Clean Architecture e SOLID.
---

## Objetivo

Revisar de forma padronizada a conformidade de código com as regras do projeto.

## Passos

1. Sobre o trecho ou módulo indicado: verificar alinhamento com `.cursorrules` (NestJS, TypeScript strict, nomenclatura, limites de função/classe).
2. Verificar Clean Architecture: dependências entre camadas; domain independente de framework.
3. Verificar SOLID (responsabilidade única, injeção de dependências, interfaces quando aplicável).
4. Verificar uso de DTOs, validação e tratamento de erros; código claro sem comentários desnecessários.
5. Produzir lista objetiva: itens em conformidade e itens a corrigir, com referência a arquivo/trecho.
6. Não alterar código; apenas apontar e sugerir correções.

## Contexto

- Regras: `.cursorrules` do repositório SoundLink BFF.

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

