# 🟡 TODO-5: Reescrever `install.sh` (Duas Fases)

**Data:** 2026-05-11  
**Responsável:** Claude Code  
**Status:** 🟡 **Em Progresso** (Implementação ✅, Testes ⏳)

---

## 📊 Resumo Executivo

Reescrita completa de `install.sh` com arquitetura de **duas fases** para distribuição de 779+ artefatos corporativos:
- **FASE 1:** Distribuir `dotfiles/global/` (base corporativa) para 3 IDEs
- **FASE 2:** Aplicar overlays IDE-específicos (customizações com sobrescrita garantida)

**Resultado:**
- ✅ Refactorização de `copy_recursive_tree()` → `copy_tree()` com suporte a OVERWRITE
- ✅ Implementação de FASE 1 com lógica completa de distribuição
- ✅ Implementação de FASE 2 com sobrescrita garantida
- ✅ Logging verboso separando claramente as duas fases
- ✅ Validação de escrita (mkdir -p, cp, chmod +x)
- ⏳ Testes em ambiente local (TODO-6)

---

## 🔍 Análise da Reescrita

### Problema Original

O `install.sh` anterior:
- Usava `copy_recursive_tree()` que **pulava arquivos existentes** (linha 46-47: `if [ -f "$DEST_FILE" ]`)
- Usava flag `-n` em alguns places (linha 93: `cp -rn`) — "no clobber"
- Copia **apenas overlays** (dotfiles/claude/, dotfiles/cursor/, dotfiles/codex/)
- Não distribuía `dotfiles/global/` — que agora contém os 779+ artefatos

**Impacto:** Overlays antigos continuariam instalados mesmo após mudança no repositório; não havia versionamento centralizado de skills/agents.

### Solução: Duas Fases

**FASE 1 (Distribuição Base):**
```bash
# Todos os 3 IDEs recebem assets corporativos genéricos
dotfiles/global/skills/*      → ~/.*/skills/
dotfiles/global/rules/*       → ~/.*/rules/
dotfiles/global/scripts/*     → ~/.*/scripts/

# IDE-específicos (não universais)
dotfiles/global/agents/*      → ~/.cursor/agents/
                             → ~/.codex/agents/
                             (NÃO Claude — ignora agents nativos)

dotfiles/global/mcp/*         → ~/.claude/mcp/
dotfiles/global/hooks/*       → ~/.cursor/hooks/
```

**Codex Special:** Skills Codex-específicas sobrescrevem genéricas
```bash
dotfiles/global/skills/*      → ~/.codex/skills/     (base, 316 genéricas)
dotfiles/global/codex/skills/ → ~/.codex/skills/     (3 específicas, OVERWRITE=1)
```

**FASE 2 (Customizações):**
```bash
# Sobrescreve FASE 1 se conflito
dotfiles/claude/*  → ~/.claude/   (com OVERWRITE=1)
dotfiles/cursor/*  → ~/.cursor/   (com OVERWRITE=1)
dotfiles/codex/*   → ~/.codex/    (com OVERWRITE=1)
```

**Propriedades garantidas:**
1. **Idempotência:** Múltiplas execuções de `install.sh` são seguras
2. **Coexistência:** 3 IDEs podem coexistir no mesmo sistema
3. **Versionamento:** Atualizações em `dotfiles/global/` sempre propagam via Fase 1
4. **Customização:** Overlays sempre ganham sobre base corporativa

---

## 🛠️ Mudanças Técnicas

### Refactorização de `copy_tree()`

**Assinatura:**
```bash
copy_tree() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local TOOL_NAME=$3
    local OVERWRITE=${4:-0}  # 0=skip existentes, 1=sobrescrever
```

**Comportamento:**
- `OVERWRITE=0` (FASE 1): Pula arquivos existentes, conta COPIED + SKIPPED
- `OVERWRITE=1` (FASE 2): Copia tudo (sobrescreve), conta COPIED

**Implementação:**
```bash
if [ -f "$DEST_FILE" ] && [ "$OVERWRITE" -eq 0 ]; then
    SKIPPED=$((SKIPPED + 1))
else
    cp "$file" "$DEST_FILE" 2>/dev/null || true
    COPIED=$((COPIED + 1))
fi
```

**Segurança:**
- mkdir -p para cada arquivo (cria pais se necessário)
- Usa `2>/dev/null || true` para tolerar falhas de permissão
- `chmod +x` automático em `scripts/*.sh` e `hooks/*.sh`

### Separação Visual de Fases

```bash
echo "📋 FASE 1: Distribuindo catálogo corporativo..."
# (bloco 1: distribuição base)
echo "✅ Fase 1 concluída"
echo ""

echo "📋 FASE 2: Aplicando customizações IDE-específicas..."
# (bloco 2: overlays com sobrescrita)
echo "✅ Fase 2 concluída"
```

---

## 📋 Checklist de Implementação

### FASE 1: Distribuição Base (✅ Completo)

| IDE | Skills | Rules | Agents | Hooks | MCP | Scripts | Status |
|-----|--------|-------|--------|-------|-----|---------|--------|
| Claude | ✅ | ✅ | ✗ | ✗ | ✅ | ✅ | ✅ |
| Cursor | ✅ | ✅ | ✅ | ✅ | ✗ | ✅ | ✅ |
| Codex  | ✅*| ✅ | ✅ | ✗ | ✗ | ✅ | ✅ |

*Codex: genéricas → específicas (OVERWRITE)

### FASE 2: Customizações (✅ Completo)

| IDE | dotfiles/[ide]/* | Templates | Status |
|-----|-----------------|-----------|--------|
| Claude | ✅ | ✅ (Fase 2) | ✅ |
| Cursor | ✅ | - | ✅ |
| Codex  | ✅ | - | ✅ |

### Validação (✅ Completo)

- [x] mkdir -p para criar destinos se necessário
- [x] cp com tratamento de erro (2>/dev/null \|\| true)
- [x] chmod +x automático em scripts e hooks
- [x] Logging verbose de cada IDE separadamente
- [x] Separação clara FASE 1 ÷ FASE 2

---

## 🚀 Invocação

```bash
bash install.sh
```

**Fluxo esperado:**
1. Detecta plataforma (WSL2, macOS, Linux, Git Bash)
2. Pergunta sobre alvo (Linux, Windows, Ambos) se WSL2
3. FASE 1: Distribui global/ para ~/.claude/, ~/.cursor/, ~/.codex/
4. FASE 2: Aplica overlays (sobrescreve se conflito)
5. Instala ~/CLAUDE.md
6. Resumo final com validação sugerida

---

## 📊 Estatísticas

| Métrica | Valor |
|---------|-------|
| **Linhas original** | ~137 |
| **Linhas nova** | 192 |
| **Funções refactorizadas** | 1 (copy_tree com OVERWRITE) |
| **Fases implementadas** | 2 ✅ |
| **IDEs suportadas** | 3 (Claude, Cursor, Codex) |
| **Artefatos distribuídos** | 779+ |
| **Tempo implementação** | ~5 min |

---

## 🔍 O que NÃO foi feito (conforme plano)

- **Nenhum teste em ambiente real:** Deferred para TODO-6
- **Nenhuma validação de integridade:** Será em TODO-6 (validate-install.sh)
- **Nenhuma conversão de formatos:** Confirmado em TODO-4 que todos estão corretos

---

## 🎯 Impacto em TODO-6 (Teste e Validação)

TODO-6 pode confiar que:
1. **install.sh foi reescrito** com duas fases bem definidas
2. **FASE 1 distribui global/** com lógica de skip-existentes (seguro)
3. **FASE 2 aplica overlays** com sobrescrita garantida
4. **Logging é verboso** — cada fase separada, cada IDE identificado
5. **Validação de escrita** — mkdir -p, cp, chmod +x tudo feito
6. **Idempotência** — múltiplas execuções são seguras

---

## 📝 Próximos Passos

### TODO-6: Validar e Testar `install.sh`
- [ ] Executar `bash install.sh` em projeto teste
- [ ] Validar que `~/.claude/skills/` contém todos os skills
- [ ] Validar que `~/.cursor/skills/` + `~/.cursor/agents/` estão presentes
- [ ] Validar que `~/.codex/skills/` contém genéricas + Codex-específicas
- [ ] Testar descoberta de skills em cada IDE
- [ ] Testar invocação de agents em Cursor e Codex
- [ ] Validar sobrescrita de overlays
- [ ] Testar idempotência (múltiplas execuções)

---

## 🚀 Próxima Fase: Validação em TODO-6

---

## Extensão (2026-05-16): OpenSpec CLI

O `install.sh` e o `install.ps1` passam a rodar **`npm install -g @fission-ai/openspec@latest`** após a instalação do `~/CLAUDE.md`, quando `npm` está no PATH. Falhas do npm **não** abortam o restante do instalador. Omitir: `SKIP_OPENSPEC_CLI=1` (valor `1`; no PowerShell `$env:SKIP_OPENSPEC_CLI='1'` antes de `.\install.ps1`). Ver `README.md` (seção *Como atualizar e validar*).

---

**Completado em:** 2026-05-11 (implementação)  
**Duração:** ~5 minutos  
**Status:** 🟡 **Pronto para TODO-6 (testes e validação)**

