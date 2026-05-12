---
name: cicd-atualizar-changelog
description: Atualizar o CHANGELOG.md com uma nova versão, seguindo Keep a Changelog.
---

## Objetivo

Atualizar o `CHANGELOG.md` do projeto com uma nova versão, no formato Keep a Changelog (seção `## [X.Y.Z] - YYYY-MM-DD` e conteúdo movido/copiado de `[Unreleased]`).

## Quando usar

- Quando o agent **cicd-commit-e-release** (ou outro fluxo de release) precisar fixar a versão no CHANGELOG antes do commit.
- Antes de criar o commit de release (em conjunto com a atualização do package.json).

## Entrada

- **Versão** (obrigatório): ex. `0.3.0` (sem prefixo `v` no arquivo; pode usar `v0.3.0` na mensagem de commit).
- **Data** (opcional): formato YYYY-MM-DD; padrão é hoje.

## Passos

1. Ler o CHANGELOG atual (seção `## [Unreleased]` e estrutura existente).
2. Inserir nova seção `## [X.Y.Z] - YYYY-MM-DD` **abaixo** de `## [Unreleased]`, mantendo a linha em branco e o `---` conforme o padrão do arquivo.
3. Mover ou copiar os itens de `[Unreleased]` (subseções como ### Alterado, ### Adicionado, ### Removido e seus itens) para a nova seção da versão. Manter `## [Unreleased]` no topo; pode deixar vazio ou com placeholder para as próximas alterações.
4. Manter o formato e a ordem (Adicionado, Alterado, Removido, etc.) conforme o CHANGELOG atual.
5. Escrever o arquivo e reportar sucesso ou falha.

## Regras

- Não alterar histórico Git; apenas o conteúdo do arquivo CHANGELOG.
- Não alterar o package.json nesta skill; o agent cicd-commit-e-release atualiza o package.json separadamente.

## Script opcional

Se existir em `.cursor/skills/cicd-atualizar-changelog/scripts/`:
- **update-changelog.sh** — recebe VERSION (ex. 0.3.0) e opcionalmente DATE (YYYY-MM-DD); aplica a lógica acima. Executar a partir do root do projeto.

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
