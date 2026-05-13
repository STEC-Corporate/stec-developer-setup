#!/usr/bin/env bash
# Smart Orchestrator Hook — Orquestração inteligente baseada em contexto
# Acionado por PreMessage em palavras-chave de desenvolvimento
# Parte do ambiente Power User com 230+ agents coordenados

set -e

# Configurações do ambiente
CLAUDE_DIR="${HOME}/.claude"
HOOKS_DIR="${CLAUDE_DIR}/hooks"
DOCS_ROOT="${LLM_DOCS_ROOT:-$CLAUDE_DIR/docs/llm}"
LOG_FILE="${CLAUDE_DIR}/logs/smart-orchestrator.log"

# Cria diretório de logs se não existir
mkdir -p "$(dirname "$LOG_FILE")"

# Função de logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOG_FILE"
}

log "Smart Orchestrator iniciado - Analisando contexto da mensagem"

# Extrai a mensagem do usuário
USER_MESSAGE="${USER_MESSAGE:-$1}"
[[ -z "$USER_MESSAGE" ]] && exit 0

# Detecta se estamos em um repositório git
if [[ ! -d .git ]]; then
    log "Não é um repositório git - pulando orquestração"
    exit 0
fi

# Função para detectar stack tecnológico
detect_stack() {
    local message="$1"
    local pwd_context="$(pwd)"
    
    # Análise baseada em arquivos do projeto
    if [[ -f "package.json" ]]; then
        if grep -q "next" package.json 2>/dev/null; then
            echo "nextjs"
        elif grep -q "react-native" package.json 2>/dev/null; then
            echo "react-native"
        elif grep -q "react" package.json 2>/dev/null; then
            echo "react"
        elif grep -q "nest" package.json 2>/dev/null; then
            echo "nestjs"
        else
            echo "nodejs"
        fi
    elif [[ -f "pom.xml" ]] || [[ -f "build.gradle" ]] || [[ -f "build.gradle.kts" ]]; then
        if grep -q "spring" pom.xml build.gradle* 2>/dev/null; then
            echo "spring-java"
        elif grep -q "kotlin" pom.xml build.gradle* 2>/dev/null; then
            echo "kotlin"
        else
            echo "java"
        fi
    elif [[ -f "pyproject.toml" ]] || [[ -f "requirements.txt" ]] || [[ -f "setup.py" ]]; then
        if grep -q "fastapi\|uvicorn" pyproject.toml requirements.txt 2>/dev/null; then
            echo "fastapi"
        elif grep -q "flask" pyproject.toml requirements.txt 2>/dev/null; then
            echo "flask"
        else
            echo "python"
        fi
    elif [[ -f "Cargo.toml" ]]; then
        echo "rust"
    elif [[ -f "go.mod" ]]; then
        echo "golang"
    elif [[ -f "main.tf" ]] || [[ -f "*.tf" ]]; then
        echo "terraform"
    elif [[ -f "Dockerfile" ]] || [[ -f "docker-compose.yml" ]]; then
        echo "docker"
    else
        # Análise baseada na mensagem
        echo "$message" | grep -qiE "react native|expo" && echo "react-native" && return
        echo "$message" | grep -qiE "next\.js|nextjs" && echo "nextjs" && return  
        echo "$message" | grep -qiE "react|jsx|tsx" && echo "react" && return
        echo "$message" | grep -qiE "nestjs|nest\.js" && echo "nestjs" && return
        echo "$message" | grep -qiE "spring boot|spring" && echo "spring-java" && return
        echo "$message" | grep -qiE "kotlin" && echo "kotlin" && return
        echo "$message" | grep -qiE "java" && echo "java" && return
        echo "$message" | grep -qiE "python|django|flask|fastapi" && echo "python" && return
        echo "$message" | grep -qiE "rust|cargo" && echo "rust" && return
        echo "$message" | grep -qiE "golang|go " && echo "golang" && return
        echo "$message" | grep -qiE "terraform|tf" && echo "terraform" && return
        echo "$message" | grep -qiE "docker|kubernetes|k8s" && echo "docker" && return
        echo "generic"
    fi
}

# Função para detectar tipo de tarefa
detect_task_type() {
    local message="$1"
    
    echo "$message" | grep -qiE "implementar|criar|develop|build|add feature" && echo "feature" && return
    echo "$message" | grep -qiE "refactor|refatorar|reorganiz|clean|melhor" && echo "refactor" && return
    echo "$message" | grep -qiE "bug|fix|erro|corrigi|problem" && echo "bugfix" && return
    echo "$message" | grep -qiE "test|teste|spec|coverage" && echo "testing" && return
    echo "$message" | grep -qiE "deploy|release|ci/cd|pipeline" && echo "devops" && return
    echo "$message" | grep -qiE "arquitetura|design|pattern|structure" && echo "architecture" && return
    echo "$message" | grep -qiE "security|seguran|vuln|harden" && echo "security" && return
    echo "$message" | grep -qiE "performance|otimiz|speed|memory" && echo "performance" && return
    echo "$message" | grep -qiE "migra|upgrad|version" && echo "migration" && return
    echo "development"
}

# Função para detectar complexidade
detect_complexity() {
    local message="$1"
    
    # Alta complexidade
    echo "$message" | grep -qiE "microsserviço|microservice|sistema distribu|arquitetura completa|enterprise|full stack" && echo "high" && return
    echo "$message" | grep -qiE "migração completa|refactor completo|sistema inteiro" && echo "high" && return
    
    # Média complexidade  
    echo "$message" | grep -qiE "módulo|component|service|api completa|feature completa" && echo "medium" && return
    echo "$message" | grep -qiE "integração|database|crud|auth" && echo "medium" && return
    
    # Baixa complexidade (padrão)
    echo "low"
}

# Função para recomendar agents baseado no contexto
recommend_agents() {
    local stack="$1"
    local task_type="$2" 
    local complexity="$3"
    
    local agents=()
    
    # Agents de planejamento (sempre para medium/high)
    if [[ "$complexity" == "medium" || "$complexity" == "high" ]]; then
        agents+=("sdd-orquestrador")
        agents+=("planejamento-criador")
    fi
    
    # Agents específicos por stack
    case "$stack" in
        "nextjs"|"react")
            agents+=("nextjs-especialista" "react-especialista" "typescript-estrito")
            agents+=("framework-nextjs-guia" "framework-react-guia")
            ;;
        "react-native")
            agents+=("react-native-especialista" "framework-react-native-guia")
            agents+=("typescript-estrito")
            ;;
        "nestjs")
            agents+=("nestjs-especialista" "nestjs-clean-arch-solid")
            agents+=("framework-nestjs-guia" "typescript-estrito")
            ;;
        "spring-java"|"java")
            agents+=("java-especialista" "framework-spring-guia")
            agents+=("stack-java-guia")
            ;;
        "kotlin")
            agents+=("kotlin-especialista" "framework-kmp-guia")
            ;;
        "python"|"fastapi"|"flask")
            agents+=("python-especialista" "framework-fastapi-guia" "framework-flask-guia")
            agents+=("stack-python-guia")
            ;;
        "rust")
            agents+=("rust-especialista" "stack-rust-guia")
            ;;
        "golang")
            agents+=("go-especialista" "stack-go-guia")
            ;;
        "terraform")
            agents+=("terraform-arquiteto" "infra-aws")
            ;;
        "docker")
            agents+=("docker-seguranca" "kubernetes-especialista")
            ;;
    esac
    
    # Agents específicos por tipo de tarefa
    case "$task_type" in
        "feature")
            agents+=("arquitetura-validar-limpa" "testes-completude-feature")
            agents+=("observabilidade-aplicacao")
            ;;
        "refactor")
            agents+=("orquestracao-qualidade-codigo" "code-aplicar-correcoes")
            agents+=("arquitetura-padroes-ddd" "arquitetura-validar-limpa")
            ;;
        "bugfix")
            agents+=("debug-analista-de-bugs" "debug-depurador")
            agents+=("code-validador" "testes-executor")
            ;;
        "testing")
            agents+=("testes-engenheiro-api" "testes-verificador" "testes-executor")
            ;;
        "devops")
            agents+=("cicd-infra" "cicd-quality-gates-advisor")
            agents+=("seguranca-auditor" "observabilidade-stack")
            ;;
        "architecture")
            agents+=("arquitetura-padroes-ddd" "arquitetura-validar-limpa")
            agents+=("arch-clean-architecture-guia" "arch-hexagonal-guia")
            ;;
        "security")
            agents+=("seguranca-auditor" "seguranca-api")
            agents+=("seguranca-verificador-guardrails")
            ;;
        "performance")
            agents+=("observabilidade-aplicacao" "custos-otimizador")
            ;;
        "migration")
            agents+=("migracao-executor" "legado-analisar-modulo")
            ;;
    esac
    
    # Quality gates para alta complexidade
    if [[ "$complexity" == "high" ]]; then
        agents+=("qualidade-programa-orquestrador")
        agents+=("cicd-validar-release")
    fi
    
    # Remove duplicatas e retorna
    printf '%s\n' "${agents[@]}" | sort -u
}

# Função para gerar recomendação de Task calls
generate_task_recommendations() {
    local stack="$1"
    local task_type="$2"
    local complexity="$3"
    local agents_list="$4"
    
    echo "# 🚀 Smart Orchestrator Recommendations"
    echo ""
    echo "**Contexto detectado:**"
    echo "- Stack: $stack"
    echo "- Tipo: $task_type" 
    echo "- Complexidade: $complexity"
    echo ""
    echo "**Agents recomendados para Task tool:**"
    echo ""
    
    local priority=1
    while IFS= read -r agent; do
        [[ -z "$agent" ]] && continue
        
        echo "$priority. \`Task(subagent_type=\"$agent\", description=\"[sua tarefa]\")\`"
        ((priority++))
    done <<< "$agents_list"
    
    echo ""
    echo "**Pipeline sugerido:**"
    echo ""
    
    case "$complexity" in
        "high")
            echo "1. **Planejamento:** sdd-orquestrador para estruturar"
            echo "2. **Implementação:** Especialista da stack + arquitetura"  
            echo "3. **Quality Gates:** qualidade-programa-orquestrador"
            echo "4. **Release:** cicd-validar-release"
            ;;
        "medium")
            echo "1. **Análise:** Especialista da stack"
            echo "2. **Implementação:** code-aplicar-correcoes + validadores"
            echo "3. **Verificação:** testes-completude-feature"
            ;;
        "low")
            echo "1. **Implementação direta:** Especialista da stack"
            echo "2. **Validação:** orquestracao-qualidade-codigo"
            ;;
    esac
    
    echo ""
    echo "**Power User Tip:** Use \`/powermode [sua tarefa]\` para orquestração automática completa!"
}

# Análise do contexto
STACK=$(detect_stack "$USER_MESSAGE")
TASK_TYPE=$(detect_task_type "$USER_MESSAGE")
COMPLEXITY=$(detect_complexity "$USER_MESSAGE")

log "Contexto detectado: stack=$STACK, type=$TASK_TYPE, complexity=$COMPLEXITY"

# Gera recomendações de agents
AGENTS_LIST=$(recommend_agents "$STACK" "$TASK_TYPE" "$COMPLEXITY")
RECOMMENDATIONS=$(generate_task_recommendations "$STACK" "$TASK_TYPE" "$COMPLEXITY" "$AGENTS_LIST")

# Log das recomendações
log "Agents recomendados: $(echo "$AGENTS_LIST" | tr '\n' ' ')"

# Saída para o Claude
printf '{"systemMessage": "%s"}' "$(echo "$RECOMMENDATIONS" | sed 's/"/\\"/g' | tr '\n' '\\n')"

log "Smart Orchestrator finalizado com sucesso"