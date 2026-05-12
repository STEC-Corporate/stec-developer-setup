---
name: cicd-criar-commit-release
description: Criar um commit de release com mensagem concisa e versão na mensagem, sem fazer push.
---

## Objetivo

Criar um commit de release com mensagem concisa e **versão na mensagem do commit**, sem fazer push. O commit criado inclui **somente** CHANGELOG.md e package.json (ambos obrigatórios). Outros arquivos alterados não entram neste commit; devem ser commitados antes pelo usuário ou por outro fluxo para serem enviados no mesmo push.

## Quando usar

- Após o CHANGELOG e o package.json terem sido atualizados com a versão, pelo agent cicd-commit-e-release.
- Apenas quando a validação completa já tiver passado (garantido pelo agent).

## Entrada

- **Versão** (obrigatório): ex. 0.3.0 (deve constar na mensagem do commit, ex. chore(release): v0.3.0).
- **Resumo** (opcional): resumo curto das alterações para a mensagem.

## Passos

1. Confirmar que está no root do repositório Git.
2. Verificar quais arquivos foram alterados (CHANGELOG.md e package.json).
3. git add CHANGELOG.md package.json (ambos obrigatórios no release).
4. **Mensagem de commit:** Concisa e relevante; **deve incluir a versão** (ex. chore(release): v0.3.0, release: v0.3.0 - atualiza changelog e versão). Seguir conventional commits e .cursorrules (mensagens em português quando aplicável).
5. Executar git commit -m "<mensagem>".
6. Reportar sucesso ou falha (ex.: nada para commitar, ou erro do Git).

## Regras

- O commit criado inclui **somente** CHANGELOG.md e package.json. Não fazer push; não fazer git add genérico (apenas CHANGELOG.md e package.json para este commit de release). Outros arquivos devem ser commitados antes pelo usuário ou por outro fluxo.
- Uma única mensagem de commit para o release dessa versão.

## Script opcional

Se existir em .cursor/skills/cicd-criar-commit-release/scripts/:
- commit-release.sh — recebe VERSION e opcionalmente MESSAGE (ou monta mensagem padrão chore(release): v<VERSION>); executa git add CHANGELOG.md package.json e git commit. Executar a partir do root do projeto.

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

