---
name: migracao-aplicar-filtro-migracao
description: Lista arquivos elegíveis para migração a partir do config de fases no Template, excluindo fake mock e docs de planejamento.
---

# Aplicar filtro de migração

## Objetivo

A partir do config no **Template** (`docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/config-migracao-template-oficial.json`) e do **id da fase** informado pelo caller (ex.: cadastro-informacoes-pessoais, informacoes-profissionais, informacoes-atendimento), produzir a lista de arquivos do Template que podem ser migrados: respeitam allowGlobs da fase, não batem em denyGlobs (da fase ou raiz) e não são documentação de planejamento.

## Quando usar

- Dry-run antes de migrar; para Migration Executor ou Sync-from-Template obter a lista elegível.

## Regras

- Incluir apenas paths que casem com allowGlobs da fase selecionada.
- Excluir paths em denyGlobs (raiz do config: fake, mock, mocks, node_modules, configs).
- Excluir docs de planejamento (docs/planejamento, docs/principais, docs/documentacao do Template). Ver docs/gestao-ideias/00-governanca/MAPA-DOCUMENTOS.md.

## Passos

1. Ler o JSON no Template: `docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/config-migracao-template-oficial.json`.
2. Selecionar a fase pelo `id` informado (ex.: cadastro-informacoes-pessoais).
3. Aplicar allowGlobs e allowList da fase; denyGlobs do raiz do config.
4. Resolver allowGlobs no Template; para cada path verificar que não casa com denyGlobs e não é doc de planejamento.
5. Retornar lista origem ou origem e destino.

## Resultado

Lista de paths elegíveis e contagem. Itens excluídos por regra.

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

