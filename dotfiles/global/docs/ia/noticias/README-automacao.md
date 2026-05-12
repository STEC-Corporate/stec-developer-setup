# Automação de Notícias — Guia de Uso

> **Status**: Ativo | **Agente**: news-updater-ia | **Frequência**: Diária (09:00 UTC)

---

## 🚀 Como Usar o Prompt Automático

### Opção 1: Executar Manualmente (Ad-hoc)

```bash
# A partir de qualquer lugar no projeto
/schedule news-updater-ia .prompt-atualizar-noticias.md
```

### Opção 2: Agendar Diariamente (Automático)

```bash
# Agendar para 09:00 UTC todos os dias
/schedule --recurring "0 9 * * *" news-updater-ia .prompt-atualizar-noticias.md
```

### Opção 3: Loop Contínuo (Dev)

```bash
# Testar em modo contínuo (até parar manualmente)
/loop /schedule news-updater-ia .prompt-atualizar-noticias.md
```

---

## 📋 Checklist de Configuração

- [ ] Arquivo prompt criado: ✓ `.prompt-atualizar-noticias.md`
- [ ] Arquivo notícias existe: ✓ `NoticiasImportantes.md`
- [ ] Pasta archive criada: `archive/`
- [ ] Web Search API ativa
- [ ] Git credentials configuradas
- [ ] Submodule sincronizado

---

## 🔧 Configuração da Automação

### Via `/schedule` (Recomendado)

```bash
# Executar agora
/schedule news-updater-ia

# Executar diariamente às 09:00 UTC
/schedule --recurring "0 9 * * *" news-updater-ia

# Executar toda segunda às 08:00 UTC (semanal)
/schedule --recurring "0 8 * * 1" news-updater-ia

# Cancelar agendamento
/schedule --cancel news-updater-ia
```

### Via Loop Dinâmico

```bash
# Executar a cada 24 horas com self-pacing
/loop atualizar notícias diariamente seguindo .prompt-atualizar-noticias.md
```

---

## 📊 Fluxo de Execução

```
┌─────────────────────────────────────┐
│  09:00 UTC — Trigger Automático     │
└────────────┬────────────────────────┘
             │
             ▼
┌─────────────────────────────────────┐
│ 1️⃣ Buscar Notícias (Web Search)     │
│   - 5 queries diferentes            │
│   - Últimos 7 dias                  │
│   - Tier 1 & 2 sources              │
└────────────┬────────────────────────┘
             │
             ▼
┌─────────────────────────────────────┐
│ 2️⃣ Validar & Classificar            │
│   - Remover duplicatas              │
│   - Atribuir tags                   │
│   - Verificar links                 │
└────────────┬────────────────────────┘
             │
             ▼
┌─────────────────────────────────────┐
│ 3️⃣ Atualizar Arquivo                │
│   - Inserir novas notícias           │
│   - Arquivar > 30 dias              │
│   - Reordenar por data              │
└────────────┬────────────────────────┘
             │
             ▼
┌─────────────────────────────────────┐
│ 4️⃣ Validar Markdown                 │
│   - Tabelas corretas                │
│   - Links válidos                   │
│   - Estrutura preservada            │
└────────────┬────────────────────────┘
             │
             ▼
┌─────────────────────────────────────┐
│ 5️⃣ Commit & Push                    │
│   - Git add                         │
│   - Git commit (submodule)          │
│   - Git push (AI-ProjectDeveloper)  │
│   - Atualizar projeto pai           │
│   - Git push (soundlink-template)   │
└────────────┬────────────────────────┘
             │
             ▼
┌─────────────────────────────────────┐
│ ✅ Sucesso — Notícias Atualizadas   │
│ ❌ Erro — Alertar administrador     │
└─────────────────────────────────────┘
```

---

## 🎯 Exemplo de Execução Esperada

```
[09:00] Starting news-updater-ia...
[09:02] 🔍 Searching for "inteligência artificial notícias 2026"
[09:05] 📰 Found 12 articles from Exame, Bloomberg, CNBC
[09:08] ✅ Validated 10 articles (2 duplicates removed)
[09:10] 🏷️ Classified articles into 7 categories
[09:12] 📝 Archiving 3 articles older than 30 days
[09:14] 📄 Updating NoticiasImportantes.md
[09:15] ✔️ Markdown validation passed
[09:16] 📤 Committing to submodule (.cursor)
[09:17] 📤 Pushing to AI-ProjectDeveloper
[09:19] 📤 Updating parent project reference
[09:20] 📤 Pushing to soundlink-template-frontend
[09:21] ✅ SUCCESS! All 23 articles updated and synced
[09:21] Next run: 2026-05-01 09:00 UTC
```

---

## 🛠️ Troubleshooting

| Problema | Solução |
|----------|---------|
| Sem notícias encontradas | Verificar Web Search API; alargar período para 14 dias |
| Links quebrados | Validar URLs manualmente; remover se persistir |
| Markdown inválido | Verificar tabela; adicionar pipes faltantes |
| Git push falha | Verificar credenciais; fazer `git pull` primeiro |
| Submodule desatualizado | Executar `git submodule update --remote` |

---

## 📅 Cronograma Recomendado

| Dia/Hora | Ação | Responsável |
|----------|------|-------------|
| Diária 09:00 UTC | Buscar & atualizar notícias | Agente `news-updater-ia` |
| Segunda 08:00 UTC | Arquivar notícias > 30 dias | Agente `news-archiver` |
| Sexta 17:00 UTC | Revisar resumo semanal | Humano |
| Mensalmente | Limpar archive > 6 meses | Agente `maintenance` |

---

## 📊 Métricas & KPIs

Monitorar:
- ✓ Notícias atualizadas por dia (meta: 10-15)
- ✓ Taxa de sucesso (meta: 95%+)
- ✓ Links válidos (meta: 100%)
- ✓ Tempo de execução (meta: < 25 min)
- ✓ Cobertura de categorias (meta: 6+ de 9)

---

## 🔗 Arquivos Relacionados

- **Prompt principal**: `.prompt-atualizar-noticias.md`
- **Arquivo notícias**: `NoticiasImportantes.md`
- **Arquivo histórico**: `archive/noticias-AAAA-MM.md`
- **Este guia**: `README-automacao.md`

---

## 💡 Dicas

1. **Backup manual**: Antes da primeira automação, fazer backup de `NoticiasImportantes.md`
2. **Testar primeiro**: Executar manualmente 1-2x antes de agendar
3. **Monitorar logs**: Verificar erros nos primeiros dias
4. **Ajustar tags**: Refinir categorias conforme uso
5. **Feedback loop**: Reportar notícias não encontradas para melhorar search

---

## ✅ Próximos Passos

- [ ] Criar agent `news-updater-ia` com skill `update-noticias`
- [ ] Configurar Web Search MCP
- [ ] Agendar via `/schedule` (diariamente 09:00 UTC)
- [ ] Criar pasta `archive/` manualmente
- [ ] Testar primeira execução
- [ ] Documentar erros encontrados
- [ ] Refinar prompt baseado em feedback

---

**Status**: 🟢 Pronto para implementação

**Última revisão**: 2026-04-30

**Versão**: 1.0 (beta)
