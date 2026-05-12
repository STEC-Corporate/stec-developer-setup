# TaskLink e o processo no repositório (STEC — neutro)

Este arquivo define **como este repositório convive com o TaskLink**, sem duplicar a especificação canônica da aplicação TaskLink (que vive noutro repositório de produto).

## Fontes da verdade

| Assunto | Onde é autoritativo |
|--------|----------------------|
| Ciclo de vida de documentos no repo | Regra `document-lifecycle` no submodule `.cursor/rules/` |
| Onde colocar cada tipo de doc | MAPA e fluxo **deste** projeto em `gestao-ideias/00-governanca/` (preencher) |
| Especificação de produto | `docs/gestao-tarefas/03-especificacao-produto/` |
| Governança TaskLink (API, RBAC, hierarquia) | Documentação TaskLink da organização |
| Travas no agente | [`tasklink-travas-repos.md`](./tasklink-travas-repos.md), skills e regras no submodule `.cursor/` |

## Modos de operação

### Modo A — Só Git / Markdown

- Fluxo humano/IA segue `gestao-ideias` e `gestao-tarefas`.
- `TASKLINK_DOC_LOCK` omisso ou `off`.

### Modo B — TaskLink em produção

- Estados e fechamento no TaskLink quando existir integração.

### Modo C — TaskLink-first com travas

- Ativar variáveis e hook conforme [`tasklink-travas-repos.md`](./tasklink-travas-repos.md) e CI acordado.

## Regra de ouro

O **código** e a **especificação de produto** permanecem neste repositório. O TaskLink é para estado de fluxo e rastreio quando adoptado.

## Replicação

Usar **apenas** o pacote neutro em `.cursor/docs/_stec-process-bootstrap/`, não `cp -r docs/` de outro produto.
