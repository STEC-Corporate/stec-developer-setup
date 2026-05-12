---
name: cicd-enviar-para-remoto
description: Enviar o branch atual para o repositório remoto (git push). Sem add/commit; usada após commit de release ou quando já há commits prontos.
---

## Objetivo

Enviar o branch atual para o repositório remoto (ex.: `git push origin <branch>`). Deve ser usada **apenas** quando a validação completa já tiver passado e os commits estiverem feitos (garantido pelo agent cicd-commit-e-release ou pelo fluxo que a invoca).

## Quando usar

- Após o agent **cicd-commit-e-release** ter criado o commit de release (changelog + package.json + mensagem com versão).
- Quando o usuário ou o agent **cicd-enviar** solicitar envio ao remoto.
- Quando já existirem commits locais prontos para enviar.

## Passos (sem script)

1. Confirmar que está no root do repositório Git (onde está `.git`).
2. Obter o branch atual (`git branch --show-current` ou equivalente).
3. Executar `git push origin <branch_atual>` (ou `git push -u origin <branch_atual>` se for o primeiro push do branch). Usar o remote configurado (padrão `origin`).
4. Reportar sucesso ou falha (ex.: erro de permissão, rede, rebase necessário).

## Regras

- **Não** fazer `git add` nem `git commit` nesta skill; apenas push.
- Se houver falha de push (ex.: remote à frente), reportar e não alterar histórico local.

## Script

Se existir em `.cursor/skills/cicd-enviar-para-remoto/scripts/`:
- **push-to-remote.sh** — verifica se o diretório atual é um repositório Git, obtém o branch atual, executa `git push origin "$BRANCH"`. Executar a partir do root do projeto.

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

