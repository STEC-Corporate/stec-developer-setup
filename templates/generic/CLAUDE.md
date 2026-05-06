# [Projeto] — Contexto

**Stack:** [Descrever stack/linguagem]

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
bash scripts/init.sh    # Inicializar ambiente
```

### Sensores (feedback)
- Linters: [especificar]
- Type checker: [especificar]
- Testes: [especificar]

---

## 🛠️ Stack

| Ferramenta | Versão | Propósito |
|---|---|---|
| [Tool] | [Versão] | [Descrição] |
| [Tool] | [Versão] | [Descrição] |

---

## 📁 Estrutura

```
projeto/
├── CLAUDE.md           # Este arquivo
├── progress.md         # Rastreamento
├── scripts/
│   └── init.sh         # Bootstrap
├── src/                # Código fonte
├── tests/              # Testes
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

[Descrever padrões específicos do projeto]

---

## 📚 Referências

- **TaskLink Harness:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`
- **Setup:** `/home/jesus/Projetos/stec-developer-setup/README.md`
