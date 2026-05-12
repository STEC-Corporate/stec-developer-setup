# Fluxo de release – commit e push

Este documento explica o que é commitado e enviado ao remoto quando se usa o agent **commit-and-release** (ou o orquestrador **validate-fix-release**).

## Atualização com o remoto antes do release

Antes de criar o commit de release, o agent executa **git pull** (branch atual, remote ex.: `origin`). Se o pull **falhar** (ex.: conflito de merge) ou se o pull **produzir um merge commit** (histórico local e remoto divergiram e o Git fez merge automático), o fluxo **para**. O agent reporta uma mensagem pedindo que você resolva ou revise o merge manualmente e, após concluir, invoque novamente o agent (validate-fix-release ou commit-and-release). Não há atualização de CHANGELOG, commit nem push até que o merge esteja resolvido/revisado.

## Quando o fluxo passa (pull ok): push automático de todos os arquivos

Quando o **git pull** passa (sem merge nem conflito), o agent **commita automaticamente** todas as alterações pendentes: se existirem arquivos modificados ou não rastreados além de CHANGELOG.md e package.json, é criado um **commit de conteúdo** com esses arquivos (mensagem genérica, ex.: `chore: alterações pré-release`). Em seguida o agent atualiza CHANGELOG e package.json, cria o commit de release (somente esses dois arquivos) e invoca o push. O **push envia todos os commits** (commit de conteúdo, se houver, e commit de release) ao remoto **sem necessidade de intervenção do usuário**. Não é preciso commitar manualmente antes de invocar o agent.

## O que o release commit contém

O commit de release contém **somente**:

- **CHANGELOG.md** (seção da nova versão e conteúdo movido de `[Unreleased]`)
- **package.json** (campo `version` atualizado)

Nenhum outro arquivo é incluído nesse commit. A skill **criar-commit-release** e o agent **commit-and-release** fazem apenas `git add CHANGELOG.md package.json` e um único commit com mensagem que inclui a versão (ex.: `chore(release): v0.3.1`).

## O que o push envia

O **push-after-validation** envia ao remoto **todos os commits** já existentes no branch atual. Quando o fluxo passa, isso inclui o commit de conteúdo (se houve alterações além de CHANGELOG/package.json) e o commit de release. Alterações que não tenham sido commitadas (working tree suja) seriam excluídas; o agent evita isso ao fazer o commit de conteúdo automaticamente antes do release.

## Referências

- Agent: `.cursor/agents/commit-and-release.md`
- Skill do commit de release: `.cursor/skills/criar-commit-release/SKILL.md`
- Correção e loop de qualidade: `.cursor/docs/correction-agent.md`
