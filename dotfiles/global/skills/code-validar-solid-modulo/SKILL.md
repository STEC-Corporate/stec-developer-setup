---
name: code-validar-solid-modulo
description: Verificar modulo ou classe quanto a SRP, OCP, LSP, ISP, DIP e sugerir refatoracoes pontuais.
---

# validar-solid-modulo

## Quando usar

- Revisao de qualidade de um modulo ou classe.
- Classe ou servico muito grande ou com muitas dependencias.

## Documentos

- .cursorrules (principios SOLID descritos no agente NestJS/Clean Architecture).

## Passos

1. SRP: uma responsabilidade por classe/funcao; limites de linhas (ex.: 200 por classe, 20 por funcao).
2. OCP: extensao por interfaces e utility types; evitar alterar codigo estavel para adicionar comportamento.
3. LSP: subtipos substituiveis; noImplicitOverride; contratos de interface respeitados.
4. ISP: interfaces pequenas e focadas; nao forcar dependencias desnecessarias.
5. DIP: dependencia de abstracoes (interfaces); injecao de repos e servicos por contrato.
6. Listar violacoes e sugerir refatoracoes pontuais (extrair classe, introduzir interface, etc.).

## Saida

- Checklist SOLID por item com ok/violacao.
- Sugestoes de refatoracao priorizadas.

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

