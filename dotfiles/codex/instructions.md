# Global Instructions — Codex Harness

## O que é Harness

Harness é o padrão de governança **Agent = Model + Harness** que estrutura como toda ferramenta de IA trabalha em projetos STEC/Olinket.

Referência completa: `~/.codex/HARNESS.md`

---

## Instrução Automática: Verificar Harness

**Ao iniciar qualquer tarefa em um projeto com `.git`:**

1. Verificar se o projeto tem:
   - `CLAUDE.md` de projeto (não o global `~/CLAUDE.md`)
   - `progress.md`
   - `scripts/init.sh`

2. Se falta qualquer um destes:
   - **Informar ao usuário** que o harness está incompleto
   - **Sugerir aplicação**: "Este projeto precisa de harness. Aplicar? (y/n)"
   - Se sim: criar os arquivos faltantes seguindo templates

3. Se todos existem:
   - Continuar normalmente com a tarefa

---

## Stack Detection

Ao criar harness, detectar stack do projeto:

```
pyproject.toml ou requirements.txt → Python
package.json                        → Node/TypeScript
pom.xml ou build.gradle             → Java
Nenhum dos anteriores               → genérico
```

Aplicar templates específicos para cada stack (estrutura, convenções, scripts).

---

## Regras Globais

| Regra | Descrição |
|-------|-----------|
| **`.git` obrigatório** | Todo projeto é um repositório — auditoria, rastreabilidade |
| **CLAUDE.md + progress.md** | Contexto para IA + memória entre sessões |
| **Ideia no TaskLink primeiro** | Registrar `tasklink idea create` antes de codificar |
| **scripts/init.sh** | Bootstrap automático e reprodutível |
| **Um commit = uma decisão** | Auditoria clara, reverter é seguro |
| **Type checking OK** | mypy/tsc devem passar — contratos respeitados |

---

## Como Aplicar Harness

Ao identificar projeto incompleto:

```bash
# Templates estão em: ~/.codex/HARNESS.md referência
# Criar CLAUDE.md, progress.md, scripts/init.sh, docs/arquitetura.md
# Detectar stack automaticamente
# git add + git commit -m "chore: apply harness structure (stack)"
```

---

## Comportamento Esperado

**Cenário 1: Novo projeto (sem harness)**
```
Codex: Este projeto não tem harness. Aplicando estrutura...
  ✅ CLAUDE.md (Python) criado
  ✅ progress.md criado
  ✅ scripts/init.sh criado
  ✅ docs/arquitetura.md criado
  ✅ Commits realizados

Próximos passos: bash scripts/init.sh
```

**Cenário 2: Projeto com harness parcial (falta progress.md)**
```
Codex: Detectada estrutura incompleta (falta: progress.md)
  ✅ progress.md criado
  ✅ Commit realizado

Harness agora completo. Prosseguindo com tarefa...
```

**Cenário 3: Projeto com harness completo**
```
Codex: Harness OK ✅
  Prosseguindo com tarefa...
```

---

## Referências

- **Harness completo:** `~/.codex/HARNESS.md`
- **Setup:** `/home/jesus/Projetos/stec-developer-setup`
- **Tutorial:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`

---

**Data:** 2026-05-06  
**Status:** Ativo em todas as sessões Codex
