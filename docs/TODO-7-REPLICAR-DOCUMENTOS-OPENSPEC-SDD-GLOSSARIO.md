# 📋 TODO-7: Replicar documentação OpenSpec / SDD e glossário para todos os desenvolvedores

**Criado:** 2026-05-16  
**Responsável:** _a definir (Platform / Harness)_  
**Status:** ⏳ **Pendente**

---

## 🎯 Objetivo

Espalhar pelo **stec-developer-setup** (e pelo fluxo **`install.sh`**) os novos artefatos de documentação já produzidos no **`tasklink-agentic-core`**, de forma que **qualquer desenvolvedor** na holding receba na máquina:

1. Referência consolidada **OpenSpec** (`Open-spec.md`) e companheiro **SDD × skills**.
2. **Glossário** compartilhado (TaskLink Agentic Core + OpenSpec + siglas STEC).
3. **Descoberta automática no Claude Code** via `CLAUDE.md` + import `@` (política oficial descrita nos docs Claude).

Referências de verdade atual (repo de origem, até migração para `dotfiles/`):

| Artefato | Origem atual |
|---------|----------------|
| Guia OpenSpec | `~/Projetos/tasklink-agentic-core/docs/Open-spec.md` |
| Conceitos SDD + paridade skills | `~/Projetos/tasklink-agentic-core/docs/SDD-conceitos-e-paridade-skills.md` |
| Glossário global (Claude Code) | `~/.claude/docs/glossary-projetos-stec.md` *(criado na máquina de referência; deve virar arquivo versionado nos dotfiles)* |

---

## 📌 Contexto (por que esta tarefa)

- O **`tasklink-agentic-core`** concentra o guia operativo OpenSpec e o glossário de artefatos sob `openspec/changes/<slug>/`.
- O glossário **`glossary-projetos-stec.md`** foi criado sob **`~/.claude/docs/`** com import em **`~/.claude/CLAUDE.md`** — padrão alinhado à documentação **Claude Code** ([Memory — CLAUDE.md e imports](https://code.claude.com/docs/en/memory#import-additional-files)).
- **`stec-developer-setup`** já distribui `dotfiles/global/` → `~/.claude/` via **`install.sh`**; outros devs **não** recebem automaticamente os arquivos que hoje só existem no repo `tasklink-agentic-core` ou só na HOME de uma máquina.

---

## ✅ Critérios de aceite

- [ ] **Cópia versionada no repositório** dos dois documentos de `tasklink-agentic-core`:
  - [ ] Destino sugerido: `dotfiles/global/docs/ia/openspec/Open-spec.md`
  - [ ] Destino sugerido: `dotfiles/global/docs/ia/openspec/SDD-conceitos-e-paridade-skills.md`
  - [ ] Ajustar links relativos entre si (se necessário) após mover.
- [ ] **Glossário** distribuído com o instalador:
  - [ ] Colocar `glossary-projetos-stec.md` em `dotfiles/global/docs/` (ex.: `dotfiles/global/docs/glossary-projetos-stec.md` ou subpasta `docs/glossary/`).
  - [ ] Garantir que **`install.sh`** (ou fase equivalente) copie o arquivo para **`~/.claude/docs/glossary-projetos-stec.md`** quando não existir ou quando o hash divergir (política alinhada à do restante `~/.claude`).
- [ ] **`dotfiles/home/CLAUDE.md`** (template que vira **`~/CLAUDE.md`** nos devs): incluir secção curta «Glossário compartilhado» + linha `@~/.claude/docs/glossary-projetos-stec.md`, em **paridade** com o que foi feito em `~/.claude/CLAUDE.md` na máquina modelo.
- [ ] **`docs/ONBOARDING.md`** (ou secção pertinente): mencionar onde ler OpenSpec / SDD após clone + `install.sh` (paths sob `~/` e/ou dentro do próprio checkout `stec-developer-setup`).
- [ ] **Índice opcional**: link nos `CLAUDE.md` raiz da org ou num `INDEX` em `dotfiles/global/docs/ia/` apontando para `openspec/`.
- [ ] **Fonte única**: decidir se o `tasklink-agentic-core` mantém também os `.md` (duplicação aceitável com nota «canônico nos dotfiles») ou só link para o submodule/pacote — **registrar a decisão** no corpo deste TODO ao concluir.

---

## 🛠️ Tarefas técnicas sugeridas (checklist de implementação)

- [ ] Mapear os arquivos exatos escritos por **`install.sh`** em `~/.claude/docs/` (se hoje só existir `docs/llm/`, acrescentar padrão para `glossary-projetos-stec.md`).
- [ ] Rever **`scripts/validate-install.sh`**: opcional incluir «arquivo do glossário presente».
- [ ] Após merge, pedir a **um dev limpo** (VM ou novo WSL): `clone` + `bash install.sh` + abrir Claude Code — confirmar que o import **`@`** expande sem erro de path.
- [ ] Cursor: registar nos critérios de aceite OU no ONBOARDING que **Cursor não carrega `~/.claude` por defeito** — quem só usa Cursor pode `@` o doc no `CLAUDE.md` do projeto ou copiar uma regra em `.cursor`.

---

## 🔗 Ligações úteis

- Claude Code — memória e imports: https://code.claude.com/docs/en/memory  
- OpenSpec upstream: https://openspec.pro/ · https://github.com/Fission-AI/OpenSpec  

---

## 📝 Histórico

| Data | Alteração |
|------|-----------|
| 2026-05-16 | TODO criado a partir dos entregáveis OpenSpec / SDD / glossário (tasklink-agentic-core + `~/.claude`). |
