# [Projeto] — Contexto

**Stack:** Python 3.11+ | Build: setuptools/poetry | Package manager: pip

---

## 🎯 Objetivo

[Descrever o propósito do projeto em 2-3 linhas]

---

## 📋 Harness

Este projeto segue o padrão de governança **Harness — Agent = Model + Harness**.

Referência: `@~/.claude/HARNESS.md`

### Guias (feedforward)
- Este arquivo → contexto do projeto
- `progress.md` → estado do trabalho em andamento
- `docs/arquitetura.md` → decisões técnicas

### Memória + Bootstrap
```bash
bash scripts/init.sh    # Inicializar venv, instalar deps, preparar ambiente
```

### Sensores (feedback)
- Linters: `ruff check .`
- Type checker: `mypy .`
- Testes: `pytest tests/ -v`

---

## 🛠️ Stack

| Ferramenta | Versão | Propósito |
|---|---|---|
| Python | 3.11+ | Linguagem principal |
| pip/venv | Latest | Gerenciador de pacotes e ambientes |
| pytest | Latest | Framework de testes |
| mypy | Latest | Type checking |
| ruff | Latest | Linting e formatação |

---

## 📁 Estrutura

```
projeto/
├── CLAUDE.md           # Este arquivo
├── progress.md         # Rastreamento
├── pyproject.toml      # Metadados do projeto
├── scripts/
│   └── init.sh         # Bootstrap
├── src/                # Código fonte
├── tests/              # Testes unitários
└── docs/
    └── arquitetura.md  # Decisões técnicas
```

---

## 🚀 Como começar

1. **Inicializar ambiente:**
   ```bash
   bash scripts/init.sh
   ```

2. **Registrar ideia no TaskLink** (obrigatório):
   ```bash
   tasklink idea create \
     --title "..." \
     --problem "..." \
     --hypothesis "..." \
     --profile "..."
   ```

3. **Começar a codificar** — siga as convenções deste arquivo.

---

## ⚙️ Convenções

[Descrever padrões: nomes, estrutura, como organizar código, etc.]

---

## 📚 Referências

- **TaskLink Harness:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`
- **Setup:** `/home/jesus/Projetos/stec-developer-setup/README.md`
