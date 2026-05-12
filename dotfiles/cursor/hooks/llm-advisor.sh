#!/usr/bin/env bash
# LLM Advisor — detecta domínio e recomenda modelo ideal para Cursor IDE
# Acionado via CURSOR_HOOK_STOP_CMD em local.env

DOCS_ROOT="${LLM_DOCS_ROOT:-$HOME/.cursor/docs/llm}"
INDEX="$DOCS_ROOT/_index.yaml"

[[ ! -f "$INDEX" ]] && exit 0

# Captura contexto recente — Cursor passa contexto via stdin ou variáveis de ambiente
RECENT=""
if [[ -n "${CURSOR_CONTEXT:-}" ]]; then
    RECENT="$CURSOR_CONTEXT"
elif [[ -n "${CURSOR_LAST_RESPONSE:-}" ]]; then
    RECENT="$CURSOR_LAST_RESPONSE"
else
    RECENT=$(cat 2>/dev/null || true)
fi
[[ -z "$RECENT" ]] && exit 0

detect_domain() {
    local text="$1"
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

DOMAIN=$(detect_domain "$RECENT")
DOMAIN_FILE="$DOCS_ROOT/by-domain/$DOMAIN.md"
[[ ! -f "$DOMAIN_FILE" ]] && DOMAIN_FILE="$DOCS_ROOT/by-domain/other-domains.md"
[[ ! -f "$DOMAIN_FILE" ]] && exit 0

MODEL=$(grep -m1 "\*\*Primary:\*\*" "$DOMAIN_FILE" | sed 's/.*\*\*Primary:\*\* *//' | tr -d '`' | awk '{print $1}')
REASON=$(grep -m1 "\*\*Razão:\*\*" "$DOMAIN_FILE" | sed 's/.*\*\*Razão:\*\* *//')
BUDGET=$(grep -A5 "### Budget" "$DOMAIN_FILE" | grep "^|" | grep -v "Modelo\|---" | head -1 | awk -F'|' '{print $2}' | xargs)

[[ -z "$MODEL" ]] && exit 0

# Cursor: output em texto puro (não JSON)
echo "💡 LLM Advisor [$DOMAIN]: $MODEL recomendado"
[[ -n "$REASON" ]] && echo "   Razão: $REASON"
[[ -n "$BUDGET" ]] && echo "   Budget: $BUDGET | Detalhes: $DOCS_ROOT/by-domain/$DOMAIN.md"
