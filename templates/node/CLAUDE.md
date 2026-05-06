# [Projeto] — Contexto

**Stack:** Node.js / TypeScript | Runtime: Node 18+ | Package manager: npm/yarn

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
bash scripts/init.sh    # Instalar deps, configurar variáveis, setup de BD
```

### Sensores (feedback)
- Linters: `npm run lint`
- Type checker: `npm run typecheck`
- Testes: `npm run test`

---

## 🛠️ Stack

| Ferramenta | Versão | Propósito |
|---|---|---|
| Node.js | 18+ | Runtime |
| TypeScript | 5+ | Tipagem estática |
| npm/yarn | Latest | Gerenciador de pacotes |
| ESLint | Latest | Linting |
| Jest/Vitest | Latest | Testes |

---

## 📁 Estrutura

```
projeto/
├── CLAUDE.md           # Este arquivo
├── progress.md         # Rastreamento
├── package.json        # Dependências e scripts
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

[Descrever padrões: TypeScript strict mode, estrutura de pastas, naming, etc.]

---

## 📚 Referências

- **TaskLink Harness:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`
- **Setup:** `/home/jesus/Projetos/stec-developer-setup/README.md`
