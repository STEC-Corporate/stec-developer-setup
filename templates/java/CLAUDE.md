# [Projeto] — Contexto

**Stack:** Java 17+ | Build: Maven/Gradle | JVM: OpenJDK/Temurin

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
bash scripts/init.sh    # Setup Java, build deps, banco de dados
```

### Sensores (feedback)
- Linters: `mvn checkstyle:check` (ou gradle)
- Testes: `mvn test` (ou gradle test)
- Build: `mvn clean package` (ou gradle build)

---

## 🛠️ Stack

| Ferramenta | Versão | Propósito |
|---|---|---|
| Java | 17+ | Linguagem principal |
| Maven/Gradle | Latest | Build system |
| JUnit | 5+ | Framework de testes |
| Checkstyle | Latest | Linting |
| SLF4J | Latest | Logging |

---

## 📁 Estrutura

```
projeto/
├── CLAUDE.md                    # Este arquivo
├── progress.md                  # Rastreamento
├── pom.xml (ou build.gradle)    # Build configuration
├── scripts/
│   └── init.sh                  # Bootstrap
├── src/main/java                # Código fonte
├── src/test/java                # Testes
└── docs/
    └── arquitetura.md           # Decisões técnicas
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

[Descrever padrões: naming Java, estrutura de pacotes, annotations, etc.]

---

## 📚 Referências

- **TaskLink Harness:** `/home/jesus/Projetos/tasklink/docs/tutoriais/Tutorial-Harness.md`
- **Setup:** `/home/jesus/Projetos/stec-developer-setup/README.md`
