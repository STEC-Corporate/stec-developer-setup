# Progress — stec-developer-setup

## Última sessão
- Data: 2026-05-16
- Status: instaladores instalam OpenSpec CLI (npm global) quando há npm

## Feito
- [x] **`install.sh` / `install.ps1`**: após dotfiles/`~/CLAUDE.md`, tenta **`npm install -g @fission-ai/openspec@latest`** (`SKIP_OPENSPEC_CLI` para omitir; falha não aborta o harness) — ver `README.md`
- [x] TODO-7: criado [`docs/TODO-7-REPLICAR-DOCUMENTOS-OPENSPEC-SDD-GLOSSARIO.md`](docs/TODO-7-REPLICAR-DOCUMENTOS-OPENSPEC-SDD-GLOSSARIO.md) — replicar para todos os desenvolvedores (via `dotfiles/` + `install.sh`) os guias `Open-spec.md`, `SDD-conceitos-e-paridade-skills.md` e `glossary-projetos-stec.md` (~/.claude/docs)
- [x] Ambiente Claude Code configurado (CLAUDE.md, hooks, settings)
- [x] Custom commands: /review, /adr, /harness
- [x] Symlinks para agents e skills globais
- [x] T-SETUP-002: Melhorias Module Federation registradas (2026-05-15)
  - Tarefas E13 adicionadas ao CLAUDE.md com análise detalhada
  - Base de conhecimento atualizada com soluções técnicas testadas
  - Catálogo de frameworks expandido incluindo Module Federation
  - 10 TODOs específicos criados para implementação dos assets

## Fazendo
- [ ] Validar integração Claude Code CLI with agents existentes
- [ ] Testar loop autônomo com orquestrador

## Próximo
- [ ] Conectar gateway MCP ao Claude Code
- [ ] Mapear monorepos (quando solicitado)

## Bloqueadores
- Nenhum
