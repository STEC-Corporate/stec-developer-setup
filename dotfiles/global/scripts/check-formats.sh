#!/bin/bash
# check-formats.sh — Validação de formatos de artefatos em dotfiles/global/
# Verifica: skills (SKILL.md), rules (.mdc), agents (.md), hooks, codex/skills
# Exit code: 0 se tudo ok, 1 se houver erros

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")/global"

ERRORS=0
WARNINGS=0

# Cores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função para validar se um arquivo tem frontmatter YAML válido
has_valid_frontmatter() {
    local file="$1"
    local required_keys="$2"  # space-separated list of keys to check

    # Verifica se começa com ---
    if ! head -1 "$file" | grep -qE '^\-\-\-'; then
        return 1
    fi

    # Para cada chave obrigatória, verifica se existe
    for key in $required_keys; do
        if ! grep -qE "^${key}:" "$file" 2>/dev/null; then
            return 1
        fi
    done

    return 0
}

echo "🔍 Validando formatos de artefatos em dotfiles/global/..."
echo ""

# 1. SKILLS
echo "📚 Skills (dotfiles/global/skills/):"
SKILL_COUNT=0
SKILL_ERRORS=0

if [ ! -d "$GLOBAL_DIR/skills" ]; then
    echo "  ❌ Diretório skills não encontrado"
    ((ERRORS++))
else
    for skill_dir in "$GLOBAL_DIR/skills"/*; do
        [ -d "$skill_dir" ] || continue

        skill_name=$(basename "$skill_dir")

        # Exceção: skills/hooks/ é uma pasta de scripts, não uma skill
        if [ "$skill_name" = "hooks" ]; then
            echo "  ⚠️  skills/hooks/ — exceção (contém scripts, não skill)"
            ((WARNINGS++))
            continue
        fi

        SKILL_MD="$skill_dir/SKILL.md"
        if [ ! -f "$SKILL_MD" ]; then
            echo "  ❌ $skill_name — falta SKILL.md"
            ((SKILL_ERRORS++))
            ((ERRORS++))
        else
            # Validar frontmatter básico (name + description)
            if has_valid_frontmatter "$SKILL_MD" "name description"; then
                ((SKILL_COUNT++))
            else
                echo "  ❌ $skill_name — SKILL.md sem frontmatter completo"
                ((SKILL_ERRORS++))
                ((ERRORS++))
            fi
        fi
    done
fi

if [ $SKILL_ERRORS -eq 0 ]; then
    echo -e "  ${GREEN}✅ $SKILL_COUNT skills com SKILL.md válido${NC}"
else
    echo -e "  ${RED}❌ $SKILL_ERRORS erros encontrados${NC}"
fi
echo ""

# 2. RULES
echo "📋 Rules (dotfiles/global/rules/):"
RULE_COUNT=0
RULE_ERRORS=0

if [ ! -d "$GLOBAL_DIR/rules" ]; then
    echo "  ❌ Diretório rules não encontrado"
    ((ERRORS++))
else
    for rule_file in "$GLOBAL_DIR/rules"/*.mdc; do
        [ -f "$rule_file" ] || continue

        rule_name=$(basename "$rule_file")

        # Validar frontmatter (obrigatório: description)
        if has_valid_frontmatter "$rule_file" "description"; then
            ((RULE_COUNT++))
        else
            echo "  ❌ $rule_name — falta frontmatter YAML ou 'description'"
            ((RULE_ERRORS++))
            ((ERRORS++))
        fi
    done
fi

if [ $RULE_ERRORS -eq 0 ]; then
    echo -e "  ${GREEN}✅ $RULE_COUNT rules com frontmatter válido${NC}"
else
    echo -e "  ${RED}❌ $RULE_ERRORS erros encontrados${NC}"
fi
echo ""

# 3. AGENTS
echo "🤖 Agents (dotfiles/global/agents/):"
AGENT_COUNT=0
AGENT_ERRORS=0

if [ ! -d "$GLOBAL_DIR/agents" ]; then
    echo "  ❌ Diretório agents não encontrado"
    ((ERRORS++))
else
    for agent_file in "$GLOBAL_DIR/agents"/*.md; do
        [ -f "$agent_file" ] || continue

        agent_name=$(basename "$agent_file" .md)

        # INDEX.md é especial, não é um agente
        if [ "$agent_name" = "INDEX" ]; then
            continue
        fi

        # Validar frontmatter (obrigatório: name + description)
        if has_valid_frontmatter "$agent_file" "name description"; then
            ((AGENT_COUNT++))
        else
            echo "  ❌ $agent_name.md — falta frontmatter ou campos obrigatórios"
            ((AGENT_ERRORS++))
            ((ERRORS++))
        fi
    done
fi

if [ $AGENT_ERRORS -eq 0 ]; then
    echo -e "  ${GREEN}✅ $AGENT_COUNT agents com frontmatter válido${NC}"
else
    echo -e "  ${RED}❌ $AGENT_ERRORS erros encontrados${NC}"
fi
echo ""

# 4. CODEX SKILLS
echo "🔮 Codex Skills (dotfiles/global/codex/skills/):"
CODEX_COUNT=0
CODEX_ERRORS=0

if [ ! -d "$GLOBAL_DIR/codex/skills" ]; then
    echo "  ⚠️  Diretório codex/skills não encontrado"
    ((WARNINGS++))
else
    for codex_dir in "$GLOBAL_DIR/codex/skills"/*; do
        [ -d "$codex_dir" ] || continue

        codex_name=$(basename "$codex_dir")
        CODEX_MD="$codex_dir/SKILL.md"

        if [ ! -f "$CODEX_MD" ]; then
            echo "  ❌ $codex_name — falta SKILL.md"
            ((CODEX_ERRORS++))
            ((ERRORS++))
        else
            if has_valid_frontmatter "$CODEX_MD" "name description"; then
                ((CODEX_COUNT++))
            else
                echo "  ❌ $codex_name — SKILL.md sem frontmatter completo"
                ((CODEX_ERRORS++))
                ((ERRORS++))
            fi
        fi
    done
fi

if [ $CODEX_ERRORS -eq 0 ]; then
    echo -e "  ${GREEN}✅ $CODEX_COUNT codex skills com SKILL.md válido${NC}"
else
    echo -e "  ${RED}❌ $CODEX_ERRORS erros encontrados${NC}"
fi
echo ""

# 5. HOOKS
echo "🪝 Hooks:"

if [ -f "$GLOBAL_DIR/hooks.json" ]; then
    echo -e "  ${GREEN}✅ global/hooks.json (paths relativos)${NC}"
else
    echo -e "  ${RED}❌ global/hooks.json falta${NC}"
    ((ERRORS++))
fi

CURSOR_HOOKS="$(dirname "$GLOBAL_DIR")/cursor/hooks.json"
if [ -f "$CURSOR_HOOKS" ]; then
    echo -e "  ${GREEN}✅ cursor/hooks.json (paths absolutos)${NC}"
else
    echo -e "  ${RED}❌ cursor/hooks.json falta${NC}"
    ((ERRORS++))
fi
echo ""

# RESUMO
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 RESUMO DA VALIDAÇÃO"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Skills:       $SKILL_COUNT ✅"
echo "  Rules:        $RULE_COUNT ✅"
echo "  Agents:       $AGENT_COUNT ✅"
echo "  Codex Skills: $CODEX_COUNT ✅"
echo ""
if [ $WARNINGS -gt 0 ]; then
    echo -e "  ${YELLOW}⚠️  Warnings: $WARNINGS${NC}"
fi
if [ $ERRORS -eq 0 ]; then
    echo -e "  ${GREEN}✅ Sem erros detectados${NC}"
    echo ""
    exit 0
else
    echo -e "  ${RED}❌ Erros: $ERRORS${NC}"
    echo ""
    exit 1
fi
