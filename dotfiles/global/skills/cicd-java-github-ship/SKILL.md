---
name: cicd-java-github-ship
description: Prepara e envia alterações para o GitHub (testes, commit, push). Use quando o usuário pedir para enviar para o GitHub, fazer push, commitar e subir, publicar alterações ou enviar tudo para o repositório remoto.
---

# Envio para o GitHub em projetos Java

Prepara e envia alterações para o repositório remoto: validar com testes, revisar mudanças, commitar com mensagem clara e fazer push.

## Quando usar

Acionar em frases como: "enviar para o GitHub", "fazer push", "commitar e subir", "publicar alterações", "enviar tudo para o GitHub".

## Pré-requisito

Rodar testes antes de commitar: `./scripts/test-all.sh` ou `mvn test`. Se houver falha, não prosseguir com commit/push até o usuário corrigir ou autorizar.

## Fluxo recomendado

1. **git status** — Listar alterações e confirmar o que será enviado.
2. **Branch** — Se for trabalho em nova feature e ainda estiver em `master`/`main`, sugerir ou criar branch `feature/<nome-descritivo>` (conforme `README.md`, seção Contribuição).
3. **git add** — Adicionar arquivos relevantes (ou `.` para envio completo); verificar `.gitignore` e evitar arquivos sensíveis ou gerados desnecessários.
4. **git commit -m "mensagem"** — Mensagem clara e objetiva (ver convenção abaixo).
5. **git push origin <branch-atual>** — Enviar ao remoto. Não usar `--force` a menos que o usuário peça explicitamente.

## Mensagem de commit

- Preferir formato descritivo em português:
  - Com tipo (opcional): `feat(escopo): descrição`, `fix(escopo): descrição`
  - Ou frase curta: "Adiciona exportação Excel em relatórios", "Corrige validação da palavra-chave"
- Evitar mensagens genéricas ("atualização", "fix").

## Referências

- Diretrizes de contribuição: `README.md` (seção Contribuição)
- Script de testes: `scripts/test-all.sh`
- Script de envio (testes + commit + push): `scripts/ship-to-github.sh`

## Pull Request (opcional)

Se o usuário quiser abrir PR: orientar a fazê-lo no GitHub após o push (link do repositório ou "Compare & pull request"). A skill não precisa executar abertura de PR, apenas descrever o passo.

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
