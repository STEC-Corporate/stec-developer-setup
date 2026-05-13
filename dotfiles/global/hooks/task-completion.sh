#!/usr/bin/env bash
# Task Completion Hook — detecta finalização de tarefa, faz commit, atualiza changelog e recomenda próxima ação
# Acionado pelo hook PostToolUse do Claude Code via settings.json quando TodoWrite é usado

DOCS_ROOT="${LLM_DOCS_ROOT:-$HOME/.claude/docs/llm}"
INDEX="$DOCS_ROOT/_index.yaml"

# Verifica se é uma chamada do TodoWrite
if [[ "$TOOL_NAME" != "TodoWrite" ]]; then
    exit 0
fi

# Captura os dados da ferramenta TodoWrite
TOOL_INPUT="${TOOL_INPUT:-}"
TOOL_OUTPUT="${TOOL_OUTPUT:-}"

# Verifica se alguma tarefa foi marcada como completed
if ! echo "$TOOL_INPUT" | grep -q '"status": *"completed"'; then
    exit 0
fi

# Verifica se estamos em um repositório git
if [[ ! -d .git ]]; then
    exit 0
fi

# Analisa o contexto das tarefas para identificar tarefas completadas e próxima tarefa pendente
detect_completed_and_next_task() {
    echo "$TOOL_INPUT" | python3 -c "
import json
import sys

try:
    data = json.loads(sys.stdin.read())
    todos = data.get('todos', [])
    
    # Encontra tarefas completadas (para commit/changelog)
    completed_tasks = []
    for todo in todos:
        if todo.get('status') == 'completed':
            completed_tasks.append(todo['content'])
    
    # Encontra próxima tarefa pendente
    next_task = None
    for todo in todos:
        if todo.get('status') == 'pending' and todo.get('priority') in ['high', 'medium']:
            next_task = todo
            break
    
    result = {
        'completed_tasks': completed_tasks,
        'next_task': next_task
    }
    print(json.dumps(result))
except:
    print(json.dumps({'completed_tasks': [], 'next_task': None}))
"
}

# Função para atualizar CHANGELOG.md
update_changelog() {
    local tasks=("$@")
    local changelog_file="CHANGELOG.md"
    local date=$(date +%Y-%m-%d)
    
    # Cria CHANGELOG.md se não existir
    if [[ ! -f "$changelog_file" ]]; then
        cat > "$changelog_file" << EOF
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

EOF
    fi
    
    # Adiciona entradas para cada tarefa completada
    local temp_file=$(mktemp)
    local found_unreleased=false
    
    while IFS= read -r line; do
        if [[ "$line" == "## [Unreleased]" ]]; then
            echo "$line" >> "$temp_file"
            echo "" >> "$temp_file"
            
            # Adiciona as tarefas completadas
            for task in "${tasks[@]}"; do
                echo "### Changed" >> "$temp_file"
                echo "- $task" >> "$temp_file"
                echo "" >> "$temp_file"
            done
            found_unreleased=true
        else
            echo "$line" >> "$temp_file"
        fi
    done < "$changelog_file"
    
    # Se não encontrou [Unreleased], adiciona no início
    if [[ "$found_unreleased" == false ]]; then
        {
            echo "## [Unreleased]"
            echo ""
            for task in "${tasks[@]}"; do
                echo "### Changed"
                echo "- $task"
                echo ""
            done
            echo ""
            cat "$changelog_file"
        } > "$temp_file"
    fi
    
    mv "$temp_file" "$changelog_file"
}

# Função para criar commit message baseado nas tarefas completadas
create_commit_message() {
    local tasks=("$@")
    local commit_msg=""
    
    if [[ ${#tasks[@]} -eq 1 ]]; then
        # Uma tarefa: formato direto
        commit_msg="feat: ${tasks[0]}"
    else
        # Múltiplas tarefas: formato de lista
        commit_msg="feat: complete multiple tasks

"
        for task in "${tasks[@]}"; do
            commit_msg="${commit_msg}- ${task}
"
        done
    fi
    
    # Adiciona assinatura padrão
    commit_msg="${commit_msg}
🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"
    
    echo "$commit_msg"
}

detect_domain() {
    local text="$1"
    # Ordem importa: domínios de maior risco primeiro (fintech, legal, security)
    echo "$text" | grep -qiE "fintech|bolsa|investimento|compliance financeiro|B3|derivativo|BACEN|CVM" && echo "fintech" && return
    echo "$text" | grep -qiE "LGPD|GDPR|contrato jurídico|regulação|auditoria jurídica|compliance legal|lei " && echo "legal-compliance" && return
    echo "$text" | grep -qiE "arquitetura|microsserviço|DDD|CQRS|escalabilidade|design pattern|bounded context|event sourcing|hexagonal" && echo "architecture" && return
    echo "$text" | grep -qiE "vuln|OWASP|pentest|XSS|injection|segurança|CVE|exploit|hardening|SAST" && echo "security" && return
    echo "$text" | grep -qiE "estatística|regressão|ANOVA|inferência|p-valor|distribuição|correlação|bayesiano|hipótese" && echo "statistics" && return
    echo "$text" | grep -qiE "machine learning|dataset|sklearn|notebook|feature engineering|treinamento de modelo|modelo ML" && echo "data-science" && return
    echo "$text" | grep -qiE "LLM|agente AI|prompt engineering|embedding|RAG|fine-tuning|AI agent|vector store|transformer" && echo "ai-ml-engineering" && return
    echo "$text" | grep -qiE "UX|wireframe|usabilidade|persona|jornada do usuário|protótipo|design system|acessibilidade" && echo "ux-design" && return
    echo "$text" | grep -qiE "comparar tecnologia|avaliar lib|escolher framework|trade-off tecnológico|benchmark de stack" && echo "technology-selection" && return
    echo "$text" | grep -qiE "profiling|flame graph|latência|throughput|bottleneck|otimização de performance|GC tuning" && echo "performance" && return
    echo "$text" | grep -qiE "React|Vue|Svelte|CSS|Tailwind|componente frontend|SSR|SPA|Next\.js|state management" && echo "frontend" && return
    echo "$text" | grep -qiE "Docker|Kubernetes|CI/CD|Terraform|Helm|GitOps|ArgoCD|pipeline de deploy|infra as code" && echo "devops" && return
    echo "$text" | grep -qiE "SQL|schema de banco|migration de banco|query SQL|índice de banco|sharding|PostgreSQL|MongoDB" && echo "database" && return
    echo "$text" | grep -qiE "REST API|GraphQL|OpenAPI|endpoint|versionamento de API|swagger|gRPC|contrato de API" && echo "api-design" && return
    echo "$text" | grep -qiE "iOS|Android|React Native|Flutter|Swift|Kotlin mobile|Jetpack Compose|SwiftUI" && echo "mobile" && return
    echo "$text" | grep -qiE "TDD|BDD|cobertura de testes|mock|assert|unit test|integration test|e2e|cypress|pytest" && echo "testing" && return
    echo "$text" | grep -qiE "roadmap|user story|PRD|requisito de produto|product owner|backlog|OKR|KPI|épico" && echo "product-management" && return
    echo "$text" | grep -qiE "refactor|code review|code smell|débito técnico|lint|clean code|SOLID|princípio" && echo "software-engineering" && return
    echo "$text" | grep -qiE "python|javascript|typescript|java|kotlin|rust|golang|bash script|bug fix|implementar feature" && echo "software-development" && return
    echo "$text" | grep -qiE "ideia|brainstorm|TaskLink|hipótese|inovação|validar ideia|MVP conceitual" && echo "idea-management" && return
    echo "$text" | grep -qiE "tarefa|sprint|kanban|planejamento|prioridade|backlog|story point|agendamento" && echo "task-management" && return
    echo "$text" | grep -qiE "README|changelog|docstring|tutorial|API docs|wiki|runbook|documentação técnica" && echo "documentation" && return
    echo "$text" | grep -qiE "tradução|i18n|localização|internacionalização|translate|strings de interface" && echo "language-translation" && return
    echo "$text" | grep -qiE "artigo|blog post|copy|marketing|newsletter|landing page|redação|conteúdo" && echo "content-writing" && return
    echo "other-domains"
}

# Detecta tarefas completadas e próxima tarefa
TASK_DATA=$(detect_completed_and_next_task)

# Extrai tarefas completadas
COMPLETED_TASKS_JSON=$(echo "$TASK_DATA" | python3 -c "import json, sys; data=json.loads(sys.stdin.read()); print(json.dumps(data['completed_tasks']))" 2>/dev/null)
COMPLETED_TASKS=($(echo "$COMPLETED_TASKS_JSON" | python3 -c "import json, sys; tasks=json.loads(sys.stdin.read()); [print(task) for task in tasks]" 2>/dev/null))

# Se há tarefas completadas, executa git commit e atualização do changelog
if [[ ${#COMPLETED_TASKS[@]} -gt 0 ]]; then
    # Atualiza CHANGELOG.md
    update_changelog "${COMPLETED_TASKS[@]}"
    
    # Verifica se há mudanças para committar
    if ! git diff --quiet || ! git diff --cached --quiet || [[ -n $(git ls-files --others --exclude-standard) ]]; then
        # Adiciona arquivos modificados/novos
        git add . > /dev/null 2>&1
        
        # Cria commit com mensagem apropriada
        COMMIT_MSG=$(create_commit_message "${COMPLETED_TASKS[@]}")
        
        # Faz commit usando heredoc para preservar formatação
        git commit -m "$(cat <<EOF
$COMMIT_MSG
EOF
)" > /dev/null 2>&1
        
        # Tenta fazer push para remoto (se configurado)
        if git remote get-url origin > /dev/null 2>&1; then
            git push origin HEAD > /dev/null 2>&1 || true
        fi
    fi
fi

# Extrai informações da próxima tarefa
NEXT_TASK_JSON=$(echo "$TASK_DATA" | python3 -c "import json, sys; data=json.loads(sys.stdin.read()); print(json.dumps(data['next_task']))" 2>/dev/null)

if [[ "$NEXT_TASK_JSON" == "null" || -z "$NEXT_TASK_JSON" ]]; then
    # Não há próxima tarefa
    if [[ ${#COMPLETED_TASKS[@]} -gt 0 ]]; then
        printf '{"systemMessage": "✅ Tarefa(s) completada(s) e commitada(s)! Todas as tarefas pendentes foram finalizadas."}'
    else
        printf '{"systemMessage": "✅ Tarefa completada! Todas as tarefas pendentes foram finalizadas."}'
    fi
    exit 0
fi

NEXT_TASK_CONTENT=$(echo "$NEXT_TASK_JSON" | python3 -c "import json, sys; data=json.loads(sys.stdin.read()); print(data['content'])" 2>/dev/null)
NEXT_TASK_PRIORITY=$(echo "$NEXT_TASK_JSON" | python3 -c "import json, sys; data=json.loads(sys.stdin.read()); print(data['priority'])" 2>/dev/null)

[[ -z "$NEXT_TASK_CONTENT" ]] && exit 0

# Detecta domínio da próxima tarefa
DOMAIN=$(detect_domain "$NEXT_TASK_CONTENT")
DOMAIN_FILE="$DOCS_ROOT/by-domain/$DOMAIN.md"

# Fallback se arquivo de domínio não existir
[[ ! -f "$DOMAIN_FILE" ]] && DOMAIN_FILE="$DOCS_ROOT/by-domain/other-domains.md"

if [[ -f "$DOMAIN_FILE" ]]; then
    MODEL=$(grep -m1 "\*\*Primary:\*\*" "$DOMAIN_FILE" | sed 's/.*\*\*Primary:\*\* *//' | tr -d '`' | awk '{print $1}')
    REASON=$(grep -m1 "\*\*Razão:\*\*" "$DOMAIN_FILE" | sed 's/.*\*\*Razão:\*\* *//')
    BUDGET=$(grep -A5 "### Budget" "$DOMAIN_FILE" | grep "^|" | grep -v "Modelo\|---" | head -1 | awk -F'|' '{print $2}' | xargs)
fi

# Monta mensagem
if [[ ${#COMPLETED_TASKS[@]} -gt 0 ]]; then
    MSG="✅ Tarefa(s) commitada(s) e enviada(s) | 🎯 Próxima tarefa ($NEXT_TASK_PRIORITY): $NEXT_TASK_CONTENT"
else
    MSG="🎯 Próxima tarefa ($NEXT_TASK_PRIORITY): $NEXT_TASK_CONTENT"
fi

if [[ -n "$MODEL" ]]; then
    MSG="$MSG | 💡 LLM recomendado [$DOMAIN]: $MODEL"
    [[ -n "$REASON" ]] && MSG="$MSG — $REASON"
    [[ -n "$BUDGET" ]] && MSG="$MSG | Budget: $BUDGET"
fi

printf '{"systemMessage": "%s"}' "$MSG"