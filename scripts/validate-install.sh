#!/bin/bash
# Valida se ~/.claude/, ~/.cursor/ e ~/.codex/ têm todos os recursos do dotfiles/
# Fase 1: catálogo global (por contagem mínima), Fase 2: overlays (por arquivo)

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOTFILES_DIR="$REPO_DIR/dotfiles"

TOTAL_OK=0
TOTAL_MISSING=0

# Configuração de debugging
DEBUG_MODE="${DEBUG_MODE:-0}"
debug() {
    if [ "$DEBUG_MODE" = "1" ]; then
        echo "🐛 DEBUG: $*" >&2
    fi
}

# ─── Verificações de Encoding e Locale ───────────────────────────────────────
check_encoding() {
    debug "Verificando locale e encoding UTF-8..."
    
    # Verificar se locale está disponível
    if command -v locale >/dev/null 2>&1; then
        local current_locale
        current_locale=$(locale | grep -E '^LC_ALL=|^LANG=' | head -1 | cut -d= -f2 | tr -d '"')
        debug "Locale atual: ${current_locale:-not_set}"
        
        # Verificar se locale tem UTF-8
        if ! echo "$current_locale" | grep -qi 'utf.*8'; then
            debug "Locale não é UTF-8, tentando configurar..."
            export LC_ALL=C.UTF-8 2>/dev/null || export LC_ALL=en_US.UTF-8 2>/dev/null || true
            export LANG=C.UTF-8 2>/dev/null || export LANG=en_US.UTF-8 2>/dev/null || true
        fi
    else
        debug "Comando 'locale' não disponível, configurando UTF-8 padrão..."
        export LC_ALL=C.UTF-8 2>/dev/null || export LC_ALL=en_US.UTF-8 2>/dev/null || true
        export LANG=C.UTF-8 2>/dev/null || export LANG=en_US.UTF-8 2>/dev/null || true
    fi
    
    # Verificar versão do grep para compatibilidade com emojis
    local grep_version
    if grep_version=$(grep --version 2>/dev/null | head -1); then
        debug "Versão do grep: $grep_version"
        if echo "$grep_version" | grep -q "GNU grep"; then
            export GREP_TYPE="gnu"
        elif echo "$grep_version" | grep -q "BSD grep"; then
            export GREP_TYPE="bsd"
        else
            export GREP_TYPE="unknown"
        fi
    else
        export GREP_TYPE="unknown"
        debug "Não foi possível determinar versão do grep"
    fi
}

# Função grep robusta para diferentes ambientes
robust_grep() {
    local pattern="$1"
    local file="$2"
    local options="${3:-}"
    
    debug "Executando grep robusto: pattern='$pattern' file='$file'"
    
    # Verificar se arquivo existe e é legível
    if [ ! -f "$file" ] || [ ! -r "$file" ]; then
        debug "Arquivo não existe ou não é legível: $file"
        return 1
    fi
    
    # Verificar encoding do arquivo
    if command -v file >/dev/null 2>&1; then
        local file_info
        file_info=$(file "$file" 2>/dev/null || echo "unknown")
        debug "Info do arquivo: $file_info"
        
        if echo "$file_info" | grep -qi "binary"; then
            debug "Arquivo binário detectado, pulando grep: $file"
            return 1
        fi
    fi
    
    # Tentar múltiplas estratégias de grep
    local result=1
    
    # Estratégia 1: grep com LC_ALL=C para evitar problemas de locale
    if LC_ALL=C grep $options "$pattern" "$file" >/dev/null 2>&1; then
        debug "Grep com LC_ALL=C: sucesso"
        return 0
    fi
    
    # Estratégia 2: grep com LANG=C
    if LANG=C grep $options "$pattern" "$file" >/dev/null 2>&1; then
        debug "Grep com LANG=C: sucesso"
        return 0
    fi
    
    # Estratégia 3: grep padrão
    if grep $options "$pattern" "$file" >/dev/null 2>&1; then
        debug "Grep padrão: sucesso"
        return 0
    fi
    
    # Estratégia 4: usar awk como fallback para padrões simples
    if command -v awk >/dev/null 2>&1; then
        if awk "/$pattern/ { found=1; exit } END { exit !found }" "$file" 2>/dev/null; then
            debug "Fallback awk: sucesso"
            return 0
        fi
    fi
    
    debug "Todas as estratégias de grep falharam"
    return 1
}

CLAUDE_CONFIG_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
CURSOR_CONFIG_DIR="${CURSOR_CONFIG_DIR:-$HOME/.cursor}"
CODEX_CONFIG_DIR="${CODEX_CONFIG_DIR:-$HOME/.codex}"
HOME_DIR="${HOME_DIR:-$HOME}"

# Executar verificações de encoding no início
check_encoding

echo "🔍 Validação de Instalação — stec-developer-setup"
echo "📍 Repositório: $REPO_DIR"
if [ "$DEBUG_MODE" = "1" ]; then
    echo "🐛 DEBUG MODE: Habilitado"
    echo "🐛 GREP_TYPE: ${GREP_TYPE:-not_set}"
    echo "🐛 LC_ALL: ${LC_ALL:-not_set}"
    echo "🐛 LANG: ${LANG:-not_set}"
fi
echo ""

# Verifica contagem de subdiretórios (para skills — cada skill é uma pasta)
check_subdirs() {
    local DIR="$1"
    local MIN="$2"
    local LABEL="$3"

    debug "Verificando subdiretórios em: $DIR (mínimo: $MIN)"

    if [ ! -d "$DIR" ]; then
        echo "  ❌ $LABEL — diretório $DIR não existe"
        debug "Diretório não existe: $DIR"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
        return
    fi

    if [ ! -r "$DIR" ]; then
        echo "  ❌ $LABEL — diretório $DIR não é legível"
        debug "Diretório não é legível: $DIR"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
        return
    fi

    local COUNT
    COUNT=$(find "$DIR" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l)
    debug "Contagem de subdiretórios em $DIR: $COUNT"

    if [ "$COUNT" -ge "$MIN" ]; then
        echo "  ✅ $LABEL — $COUNT dirs (mínimo $MIN)"
        TOTAL_OK=$((TOTAL_OK + 1))
    else
        echo "  ❌ $LABEL — $COUNT dirs (esperado ≥$MIN)"
        debug "Contagem insuficiente: $COUNT < $MIN"
        if [ "$DEBUG_MODE" = "1" ]; then
            echo "     🐛 Subdiretórios encontrados:"
            find "$DIR" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | head -5 | while read -r subdir; do
                echo "        - $(basename "$subdir")"
            done
            if [ "$COUNT" -gt 5 ]; then
                echo "        - ... e mais $((COUNT - 5)) diretórios"
            fi
        fi
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
    fi
}

# Verifica contagem de arquivos (para agents e rules — são arquivos planos)
check_files() {
    local DIR="$1"
    local MIN="$2"
    local LABEL="$3"

    debug "Verificando arquivos em: $DIR (mínimo: $MIN)"

    if [ ! -d "$DIR" ]; then
        echo "  ❌ $LABEL — diretório $DIR não existe"
        debug "Diretório não existe: $DIR"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
        return
    fi

    if [ ! -r "$DIR" ]; then
        echo "  ❌ $LABEL — diretório $DIR não é legível"
        debug "Diretório não é legível: $DIR"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
        return
    fi

    local COUNT
    COUNT=$(find "$DIR" -maxdepth 1 -type f 2>/dev/null | wc -l)
    debug "Contagem de arquivos em $DIR: $COUNT"

    # Verificar se há arquivos com problemas de encoding
    if [ "$DEBUG_MODE" = "1" ] && [ "$COUNT" -gt 0 ]; then
        problematic_files=0
        find "$DIR" -maxdepth 1 -type f 2>/dev/null | while read -r file; do
            if command -v file >/dev/null 2>&1; then
                file_info=$(file "$file" 2>/dev/null || echo "unknown")
                # Procurar apenas por arquivos realmente problemáticos (binários que deveriam ser texto)
                if echo "$file_info" | grep -qi "binary.*text\|data.*binary" && ! echo "$file_info" | grep -qi "utf.*text"; then
                    debug "Arquivo com encoding problemático: $(basename "$file") - $file_info"
                    problematic_files=$((problematic_files + 1))
                fi
            fi
        done
    fi

    if [ "$COUNT" -ge "$MIN" ]; then
        echo "  ✅ $LABEL — $COUNT arquivos (mínimo $MIN)"
        TOTAL_OK=$((TOTAL_OK + 1))
    else
        echo "  ❌ $LABEL — $COUNT arquivos (esperado ≥$MIN)"
        debug "Contagem insuficiente: $COUNT < $MIN"
        if [ "$DEBUG_MODE" = "1" ]; then
            echo "     🐛 Arquivos encontrados:"
            find "$DIR" -maxdepth 1 -type f 2>/dev/null | head -5 | while read -r file; do
                echo "        - $(basename "$file")"
            done
            if [ "$COUNT" -gt 5 ]; then
                echo "        - ... e mais $((COUNT - 5)) arquivos"
            fi
        fi
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
    fi
}

# Verifica todos os arquivos de um overlay (Fase 2 — lista completa)
validate_overlay() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local TOOL_NAME=$3

    if [ ! -d "$SOURCE_DIR" ]; then
        echo "  ⚠️  Sem overlay para $TOOL_NAME"
        return
    fi

    local OK=0
    local MISSING=0

    while IFS= read -r -d '' file; do
        local REL_PATH="${file#$SOURCE_DIR/}"
        local DEST_FILE="$DEST_DIR/$REL_PATH"

        if [ -f "$DEST_FILE" ]; then
            OK=$((OK + 1))
        else
            MISSING=$((MISSING + 1))
            echo "  ❌ FALTANDO: $REL_PATH"
        fi
    done < <(find "$SOURCE_DIR" -type f -print0)

    if [ "$MISSING" -eq 0 ]; then
        echo "  ✅ Overlay: $OK arquivos presentes"
    else
        echo "  ⚠️  Overlay: $OK presentes, $MISSING faltando"
    fi

    TOTAL_OK=$((TOTAL_OK + OK))
    TOTAL_MISSING=$((TOTAL_MISSING + MISSING))
}

# ─── FASE 1: Catálogo global ───────────────────────────────────────────────────
echo "📋 FASE 1 — Catálogo global (dotfiles/global/ → ~/.*/)"
echo ""

echo "🔹 Claude Code (~/.claude/)"
check_subdirs "$CLAUDE_CONFIG_DIR/skills" 316  "skills (316 genéricas)"
check_files   "$CLAUDE_CONFIG_DIR/rules"  93   "rules (93 MDC)"
check_files   "$CLAUDE_CONFIG_DIR/hooks"  1    "hooks (task-completion.sh)"
check_files   "$CLAUDE_CONFIG_DIR/docs/llm/by-domain" 25 "docs/llm (25 domínios)"
echo ""

echo "🔹 Cursor IDE (~/.cursor/)"
check_subdirs "$CURSOR_CONFIG_DIR/skills" 316  "skills (316 genéricas)"
check_files   "$CURSOR_CONFIG_DIR/agents" 230  "agents (230 + INDEX.md)"
check_files   "$CURSOR_CONFIG_DIR/rules"  93   "rules (93 MDC)"
check_files   "$CURSOR_CONFIG_DIR/hooks"  1    "hooks (task-completion.sh)"
check_files   "$CURSOR_CONFIG_DIR/docs/llm/by-domain" 25 "docs/llm (25 domínios)"
echo ""

echo "🔹 Codex CLI (~/.codex/)"
check_subdirs "$CODEX_CONFIG_DIR/skills"  320  "skills (316 genéricas + 4 Codex-específicas)"
check_files   "$CODEX_CONFIG_DIR/agents"  229  "agents"
check_files   "$CODEX_CONFIG_DIR/rules"   93   "rules (93 MDC)"
check_files   "$CODEX_CONFIG_DIR/hooks"   1    "hooks (task-completion.sh)"
check_files   "$CODEX_CONFIG_DIR/docs/llm/by-domain" 25 "docs/llm (25 domínios)"
echo ""

# ─── FASE 2: Overlays IDE-específicos ─────────────────────────────────────────
echo "📋 FASE 2 — Overlays IDE-específicos (dotfiles/[ide]/ → ~/.*/)"
echo ""

echo "🔹 Claude Code — overlay"
validate_overlay "$DOTFILES_DIR/claude" "$CLAUDE_CONFIG_DIR" "Claude Code"
echo ""

echo "🔹 Cursor IDE — overlay"
validate_overlay "$DOTFILES_DIR/cursor" "$CURSOR_CONFIG_DIR" "Cursor IDE"
echo ""

echo "🔹 Codex CLI — overlay"
validate_overlay "$DOTFILES_DIR/codex" "$CODEX_CONFIG_DIR" "Codex CLI"
echo ""

# ─── Home Level ───────────────────────────────────────────────────────────────
echo "📋 Home Level — ~/CLAUDE.md"

# Função para validar conteúdo do ~/CLAUDE.md com fallbacks robustos
validate_claude_md() {
    local FILE="$1"
    local EXPECTED_SECTIONS=(
        "# Identidade do Desenvolvedor"
        "## Perfil"
        "## Preferências de resposta"
        "## Plataforma atual"
        "## Critério de conclusão de qualquer tarefa"
        "# Instruções Globais — Harness Automático"
        "## 🎯 Ação Obrigatória ao Iniciar Sessão"
    )
    
    local MISSING_SECTIONS=()
    
    debug "Validando estrutura do ~/CLAUDE.md: $FILE"
    
    # Verificar se arquivo existe e é legível
    if [ ! -f "$FILE" ] || [ ! -r "$FILE" ]; then
        debug "Arquivo não existe ou não é legível: $FILE"
        MISSING_SECTIONS=("${EXPECTED_SECTIONS[@]}")
    else
        # Verificar encoding do arquivo
        if command -v file >/dev/null 2>&1; then
            local file_info
            file_info=$(file "$FILE" 2>/dev/null || echo "unknown")
            debug "Encoding do ~/CLAUDE.md: $file_info"
        fi
        
        for section in "${EXPECTED_SECTIONS[@]}"; do
            local section_found=false
            
            debug "Procurando seção: '$section'"
            
            # Estratégia 1: usar robust_grep com padrão exato
            if robust_grep "^$(printf '%s' "$section" | sed 's/[[\.*^$()+{}|]/\\&/g')" "$FILE"; then
                debug "Seção encontrada com robust_grep: '$section'"
                section_found=true
            else
                # Estratégia 2: fallback sem emojis (para seções com emoji)
                local section_no_emoji
                section_no_emoji=$(echo "$section" | sed 's/[🎯]//g' | sed 's/  */ /g' | sed 's/^ *//' | sed 's/ *$//')
                
                if [ "$section_no_emoji" != "$section" ]; then
                    debug "Tentando fallback sem emoji: '$section_no_emoji'"
                    if robust_grep "^$(printf '%s' "$section_no_emoji" | sed 's/[[\.*^$()+{}|]/\\&/g')" "$FILE"; then
                        debug "Seção encontrada sem emoji: '$section_no_emoji'"
                        section_found=true
                    fi
                fi
                
                # Estratégia 3: fallback com busca parcial por palavras-chave
                if [ "$section_found" = false ]; then
                    case "$section" in
                        "# Identidade do Desenvolvedor")
                            if robust_grep "Identidade.*Desenvolvedor" "$FILE"; then
                                debug "Seção encontrada por palavras-chave: Identidade Desenvolvedor"
                                section_found=true
                            fi
                            ;;
                        "## 🎯 Ação Obrigatória ao Iniciar Sessão")
                            if robust_grep "Ação.*Obrigatória.*Iniciar.*Sessão" "$FILE" || robust_grep "Acao.*Obrigatoria.*Iniciar.*Sessao" "$FILE"; then
                                debug "Seção encontrada por palavras-chave: Ação Obrigatória"
                                section_found=true
                            fi
                            ;;
                        "# Instruções Globais — Harness Automático")
                            if robust_grep "Instruções.*Globais.*Harness" "$FILE" || robust_grep "Instrucoes.*Globais.*Harness" "$FILE"; then
                                debug "Seção encontrada por palavras-chave: Instruções Globais"
                                section_found=true
                            fi
                            ;;
                        *)
                            # Para outras seções, tentar buscar palavras-chave principais
                            local keywords
                            keywords=$(echo "$section" | sed 's/^#* *//' | sed 's/[^a-zA-Z ]//g' | head -c 20)
                            if [ -n "$keywords" ] && robust_grep "$keywords" "$FILE"; then
                                debug "Seção encontrada por palavras-chave gerais: '$keywords'"
                                section_found=true
                            fi
                            ;;
                    esac
                fi
            fi
            
            if [ "$section_found" = false ]; then
                debug "Seção NÃO encontrada: '$section'"
                MISSING_SECTIONS+=("$section")
            fi
        done
    fi
    
    if [ ${#MISSING_SECTIONS[@]} -eq 0 ]; then
        echo "  ✅ ~/CLAUDE.md estrutura completa"
        TOTAL_OK=$((TOTAL_OK + 1))
        
        # Verificar se está atualizado comparando com dotfiles/home/CLAUDE.md
        if [ -f "$DOTFILES_DIR/home/CLAUDE.md" ]; then
            if command -v md5sum >/dev/null 2>&1; then
                SRC_HASH=$(md5sum "$DOTFILES_DIR/home/CLAUDE.md" | cut -d' ' -f1)
                DEST_HASH=$(md5sum "$FILE" | cut -d' ' -f1)
                if [ "$SRC_HASH" = "$DEST_HASH" ]; then
                    echo "  ✅ ~/CLAUDE.md sincronizado com dotfiles/home/"
                    TOTAL_OK=$((TOTAL_OK + 1))
                else
                    echo "  ⚠️  ~/CLAUDE.md diverge do dotfiles/home/ — recomendado bash install.sh"
                    TOTAL_MISSING=$((TOTAL_MISSING + 1))
                fi
            else
                # Fallback: comparar data de modificação
                if [ "$DOTFILES_DIR/home/CLAUDE.md" -nt "$FILE" ]; then
                    echo "  ⚠️  ~/CLAUDE.md desatualizado — recomendado bash install.sh"
                    TOTAL_MISSING=$((TOTAL_MISSING + 1))
                else
                    echo "  ✅ ~/CLAUDE.md aparenta estar atualizado"
                    TOTAL_OK=$((TOTAL_OK + 1))
                fi
            fi
        else
            echo "  ⚠️  Não foi possível comparar com dotfiles/home/CLAUDE.md"
        fi
    else
        echo "  ❌ ~/CLAUDE.md INCOMPLETO — faltam seções:"
        for missing in "${MISSING_SECTIONS[@]}"; do
            echo "      - $missing"
        done
        echo "  🔧 Execute: bash install.sh para corrigir"
        TOTAL_MISSING=$((TOTAL_MISSING + 1))
    fi
}

if [ -f "$HOME_DIR/CLAUDE.md" ]; then
    validate_claude_md "$HOME_DIR/CLAUDE.md"
else
    echo "  ❌ ~/CLAUDE.md FALTANDO"
    echo "  🔧 Execute: bash install.sh para criar"
    TOTAL_MISSING=$((TOTAL_MISSING + 1))
fi
echo ""

# ─── Resumo ───────────────────────────────────────────────────────────────────
echo "═══════════════════════════════════════════════"
echo "📊 RESUMO"
echo "═══════════════════════════════════════════════"
echo "   ✅ OK:       $TOTAL_OK verificações"
echo "   ❌ Faltando: $TOTAL_MISSING verificações"

if [ "$DEBUG_MODE" = "1" ]; then
    echo ""
    echo "🐛 INFORMAÇÕES DE DEBUG:"
    echo "   • Grep Type: ${GREP_TYPE:-unknown}"
    echo "   • Locale: ${LC_ALL:-${LANG:-not_set}}"
    echo "   • Shell: $0 (${BASH_VERSION:-unknown})"
    echo "   • Platform: $(uname -s 2>/dev/null || echo "unknown") $(uname -m 2>/dev/null || echo "")"
    
    # Verificar se há comandos importantes disponíveis
    echo "   • Comandos disponíveis:"
    for cmd in grep awk file md5sum; do
        if command -v "$cmd" >/dev/null 2>&1; then
            version=""
            case "$cmd" in
                grep) version="$(grep --version 2>/dev/null | head -1 | cut -c1-30)" ;;
                file) version="$(file --version 2>/dev/null | head -1 | cut -c1-30)" ;;
                *) version="disponível" ;;
            esac
            echo "     ✅ $cmd: ${version:-disponível}"
        else
            echo "     ❌ $cmd: não disponível"
        fi
    done
fi

echo ""

if [ "$TOTAL_MISSING" -gt 0 ]; then
    echo "🔧 Para corrigir, execute:"
    echo "  cd $REPO_DIR && bash install.sh"
    echo ""
    if [ "$DEBUG_MODE" != "1" ]; then
        echo "💡 Para ver mais detalhes, execute:"
        echo "  DEBUG_MODE=1 bash $0"
        echo ""
    fi
    exit 1
else
    echo "🎉 Instalação completa! Todas as IDEs estão sincronizadas com o repositório."
    if [ "$DEBUG_MODE" = "1" ]; then
        echo ""
        echo "✅ Todas as verificações de encoding e compatibilidade passaram."
    fi
    exit 0
fi
