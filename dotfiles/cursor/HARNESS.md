# Harness — Padrão de Desenvolvimento STEC/Olinket

## Fórmula Central

```
Agent = Model + Harness
```

O **harness** é tudo que encapsula o modelo (Claude/GPT/etc). Sem harness, o modelo é apenas potencial genérico. Com harness, torna-se um agente estruturado, confiável e auditável.

---

## Três Camadas do Harness

### 1️⃣ Guides — Feedforward (contexto que recebemos antes de agir)

- **CLAUDE.md / AGENTS.md** — contexto do projeto, stack, convenções
- **Spec/Tasks** — especificações, ideias, tarefas vivas (TaskLink)
- **Arquitetura docs** — decisões técnicas (ADRs), padrões

### 2️⃣ Memória + Bootstrap

- **progress.md** — estado atual: o que foi feito, próximos passos, bloqueadores
- **scripts/init.sh** — bootstrap: cria venv/npm install/Maven build, prepara ambiente
- **git discipline** — um commit por decisão, branches atômicos por feature/ideia

### 3️⃣ Sensores — Feedback (validação após agir)

- **Linters** (ruff, eslint) — código limpo, sem desvios
- **Type checkers** (mypy, tsc) — contratos respeitados
- **Testes/E2E** (pytest, vitest, jest) — comportamento verificado
- **Review agent** — valida se o output segue os gates do projeto

---

## Estrutura Mínima de Projeto com Harness

Todo projeto deve ter (no mínimo):

```
projeto/
├── CLAUDE.md                # Contexto + convenções para IA
├── progress.md              # Estado: feito, fazendo, próximo, bloqueadores
├── scripts/
│   └── init.sh              # Bootstrap: prepara venv/deps/bd
├── docs/
│   └── arquitetura.md       # ADRs, decisões técnicas
└── .git/                    # Sempre um repositório Git
```

---

## Pacotes Internos — TaskLink Harness (Python)

Três pacotes complementares para Python projects:

| Pacote | Caminho | O que faz |
|--------|---------|----------|
| **tasklink-harness-core** | `/home/jesus/Projetos/tasklink-harness-core` | Tipos Pydantic, validators, skills, hooks |
| **tasklink-harness-cli** | `/home/jesus/Projetos/tasklink-harness-cli` | CLI: `tasklink idea\|task\|approval` |
| **tasklink-harness-integration** | `/home/jesus/Projetos/tasklink-harness-integration` | Webhooks GitHub, CI/CD gates, rules engine |

**Instalar em projeto Python:**
```bash
pip install -e "file:///home/jesus/Projetos/tasklink-harness-core"
```

**⚠️ Não publicar em PyPI** — são produtos internos apenas.

---

## Como Usar ao Iniciar Novo Projeto

1. **Criar repositório:**
   ```bash
   git init && git add . && git commit -m "initial commit"
   ```

2. **Aplicar harness:**
   ```bash
   ~/.claude/scripts/harness-apply.sh      # Claude detecta + cria
   # ou manualmente:
   @harness-apply                          # No Cursor
   ```

3. **Executar bootstrap:**
   ```bash
   bash scripts/init.sh
   ```

4. **Registrar ideia no TaskLink (obrigatório):**
   ```bash
   tasklink idea create \
     --title "Nome da ideia" \
     --problem "Qual é o problema?" \
     --hypothesis "Qual é a hipótese de valor?" \
     --profile "Quem é o usuário?"
   ```

5. **Começar a codificar** — siga CLAUDE.md.

---

## Regras Globais (não negociáveis)

| Regra | Por quê |
|-------|---------|
| Todo projeto é um repositório Git `.git/` | Auditoria, rastreabilidade |
| CLAUDE.md + progress.md em todo projeto | Contexto para a IA + memória entre sessões |
| Ideia registrada no TaskLink antes de codificar | Governança, rastreamento de mudanças |
| `scripts/init.sh` executável e automático | Bootstrap confiável, reprodutível |
| Uma decisão = um commit | Auditoria clara, reverter é seguro |
| Type checkers (mypy/tsc) passam | Contratos respeitados, menos runtime errors |

---

## Referências

- **Tutorial completo:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`
- **Repositório setup:** `/home/jesus/Projetos/stec-developer-setup`
- **TaskLink:** `http://localhost:3333` (ou documentação do projeto)
