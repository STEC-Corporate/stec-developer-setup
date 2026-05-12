# Travas TaskLink nos repositórios consumidores (STEC — neutro)

## Objetivo

Alinhar **travas técnicas** com rules/skills/hooks do submodule `.cursor/` (AI-ProjectDeveloper) quando a holding adotar TaskLink como fonte de verdade para ideias/tarefas de fluxo.

## Variáveis de ambiente

| Variável | Valores | Efeito no agente (Cursor) |
|----------|---------|------------------------------|
| `TASKLINK_DOC_LOCK` | `off` (omissão), `soft`, `strict` | Controla o hook `preToolUse` (ex.: `tasklink-doc-lock.sh`) |
| `TASKLINK_BYPASS` | `1` | Desativa a trava do hook (uso excepcional; auditar no Git) |

## Paths bloqueados (exemplo)

O hook inspeciona o payload da ferramenta; se referenciar arquivos sob:

- `docs/gestao-ideias/01-exploracao/`
- `docs/gestao-ideias/02-execucao/`
- `docs/gestao-tarefas/01-intake-ideias/`
- `docs/gestao-tarefas/02-triagem-refinamento/`

…então aplica `soft` ou `strict` conforme `TASKLINK_DOC_LOCK`.

**Tipicamente fora do bloqueio:** `docs/gestao-tarefas/03-especificacao-produto/` para espelhar código — política exata é da equipe.

## Camadas

| Camada | Bloqueia humano no editor? |
|--------|----------------------------|
| TaskLink (API + UI) | Sim, no produto |
| Cursor `preToolUse` | Só fluxo **agente** |
| Rules + skills `.cursor/` | Instruem; não bloqueiam por si |
| Git / CI | Sim no **merge**, se configurado |

## Ligações

- [`tasklink-gestao-tarefas.md`](./tasklink-gestao-tarefas.md)
- `.cursor/SUBMODULES.md`
