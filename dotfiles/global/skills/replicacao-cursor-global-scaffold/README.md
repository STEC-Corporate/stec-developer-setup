# replicacao-cursor-global-scaffold

Skill com **template** (`scaffold/`) para o repositório **pai** criar uma pasta espelhando o contrato de `packages/cursor-global`, quando o [AI-ProjectDeveloper](../../README.md) é usado como **git submodule**.

## Origem

- Pacote oficial neste repo: `packages/cursor-global/`
- Agente operacional: `replicacao-cursor-global-bundle`
- Mapa: arquivado em `~/Projetos/temp/AGENT-KNOWLEDGE-MAP.md`

## Rastreabilidade

O scaffold **não** substitui o pacote versionado em `packages/cursor-global/` aqui; é cópia de partida para o **projeto consumidor** ajustar caminhos.

- Script de build **canônico:** `scripts/build_cursor_global_bundle.py` (suporta `CURSOR_GLOBAL_MANIFEST`).
- **Cópia espelhada** no scaffold: [`scaffold/scripts/build_cursor_global_bundle.py`](scaffold/scripts/build_cursor_global_bundle.py) — manter alinhada ao canônico ao alterar a lógica.
