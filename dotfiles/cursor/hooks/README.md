# Hooks do projeto (`.cursor/hooks/`)

Scripts invocados por [`.cursor/hooks.json`](../hooks.json). Política de segurança: [`.cursor/rules/cursor-hooks-safety.mdc`](../rules/cursor-hooks-safety.mdc).

## Dispatch central

- **`cursor-hooks-dispatch.sh`** — `sessionStart`, `afterFileEdit`, `beforeShellExecution`, `preToolUse`.

### Abas ou “tela em branco” a cada mensagem do agente

O Cursor pode **abrir o script do hook no editor** quando o hook corre. O `preToolUse` **sem filtro** executa antes de **cada** ferramenta (Read, Grep, Shell, etc.), não só quando você envia texto — por isso parece “a cada mensagem trocada”. Mitigação neste repo:

1. **`matcher`** em `preToolUse` — só corre para ferramentas de edição (`Write`, `StrReplace`, …), alinhado à lógica que já só bloqueia edits em paths TaskLink.
2. **`command` como string única** (ex.: `bash .cursor/hooks/...`) em vez de `"command": "bash"` + `"args": [...]`, para reduzir ruído de abas (ver skill `create-hook` e `dotfiles/cursor/hooks.json`).

Se o nome da ferramenta no teu Cursor não casar com o regex do `matcher`, ajusta em [hooks.json](../hooks.json) ou reporta para alargarmos a lista.

## `beforeSubmitPrompt` — plano novo **ou** brainstorm **ou** ajuda com prompt (**ligado por padrão**)

Lembra o fluxo **workflow-prompt-profissional** (pipeline **Brainstorm** opcional → **Brief** → prompt mestre) quando a mensagem *parecer* pedir:

1. um **plano novo** / `.plan.md` / caminho em `.cursor/plans/`, **ou**
2. **brainstorm** explícito (ex.: «brainstorm», «chuva de ideias», «sessão de brainstorm», «descoberta guiada» — heurística em texto; não é garantia perfeita), **ou**
3. **ajuda para criar/refinar um prompt**.

**Limitação da API Cursor:** neste gancho só existe `continue` / `user_message` ao bloquear. **Não é possível** anexar lembrete invisível “ao lado” do prompt sem uma pausa; injeção de contexto inicial usa `sessionStart` (`additional_context`), não cada envio.

**Limitação adicional:** em alguns modos (ex.: fluxos que não passam pelo gancho de envio da mesma forma), o hook pode não executar — não é necessariamente falha do script.

| Situação | Efeito |
|----------|--------|
| **Padrão** (sem `local.env`) | Gate **ativo**: se casar os padrões, **bloqueia** e mostra a mensagem com `@workflow-prompt-profissional-guia` e a skill. |
| `export PLAN_BRIEF_GATE=0` em `local.env` | Gate **desligado**: todos os prompts passam direto (`continue: true`). |
| Primeira linha do prompt = `SKIP_PLAN_BRIEF` | Um envio específico passa mesmo com gate ligado (brief já feito ou urgência). |

Arquivos: `plan-brief-before-submit.sh` (entrada stdin JSON + opcionalmente `local.env`), `plan-brief-before-submit.py`.

**Pasta local do Cursor (fora do repo):** planos gerados pela UI podem aparecer em `%USERPROFILE%\.cursor\plans\` — pode criar a pasta manualmente para mover `.plan.md`; não é obrigatório para o hook.

## Outros

- **`on-stop.sh`** — comando opcional `CURSOR_HOOK_STOP_CMD`.

Copie `local.env.example` para `local.env` na mesma pasta (ignorado pelo git) para definir flags.
