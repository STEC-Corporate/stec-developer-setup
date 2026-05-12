# Hooks do Cursor — AI-ProjectDeveloper

Scripts que interceptam o loop do agente Cursor para injetar contexto, validar edições e bloquear comandos destrutivos.

## Configuração

O arquivo `.cursor/hooks.json` no projeto (ou montado como `.cursor/hooks.json` nos projetos pai via submodule) ativa os hooks automaticamente. Os comandos usam o path **`.cursor/skills/hooks/`** relativo à raiz do repositório consumidor.

## Hooks disponíveis

| Hook | Script | Evento | Ação |
|---|---|---|---|
| `sessionStart` | `inject-context.sh` | Início de sessão | Injeta premissa de submodule e contexto da holding STEC |
| `afterFileEdit` | `after-file-edit.sh` | Após edição de arquivo | Avisa quando SKILL.md ou agent.md não tem campo `description` |
| `beforeShellExecution` | `guard-shell.sh` | Antes de executar shell | Bloqueia comandos destrutivos (`rm -rf`, `git push --force`, `DROP TABLE`, push direto para main) |
| `preToolUse` | `tasklink-doc-lock.sh` | Antes de ferramentas de escrita | Com `TASKLINK_DOC_LOCK=strict`/`soft`, bloqueia ou pergunta antes de editar paths de gestão de ideias (TaskLink-first) |

## Como os hooks chegam aos projetos pai

Como este repo é um submodule montado em `.cursor/`, o arquivo `hooks.json` fica disponível como `.cursor/hooks.json` no projeto pai. O Cursor carrega e recarrega automaticamente hooks ao detectar mudanças neste arquivo.

## Adicionar novos hooks

1. Criar script em `.cursor/skills/hooks/{nome}.sh`
2. Tornar executável: `chmod +x .cursor/skills/hooks/{nome}.sh`
3. Adicionar entrada em `hooks.json` com o evento e command corretos
4. Testar localmente antes de commitar

## Referência de eventos disponíveis

| Evento | Quando dispara |
|---|---|
| `sessionStart` | Início de sessão do agente |
| `sessionEnd` | Fim de sessão |
| `afterFileEdit` | Após qualquer edição de arquivo |
| `beforeFileEdit` | Antes de editar arquivo (pode bloquear) |
| `beforeShellExecution` | Antes de executar comando shell (pode bloquear) |
| `afterShellExecution` | Após executar comando shell |
| `preToolUse` | Antes de qualquer ferramenta |
| `postToolUse` | Após qualquer ferramenta |
| `subagentStart` | Ao iniciar subagente |
| `subagentStop` | Ao encerrar subagente |
| `beforeSubmitPrompt` | Antes de submeter prompt |
