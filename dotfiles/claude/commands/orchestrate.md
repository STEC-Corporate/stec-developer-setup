# /orchestrate - Orquestração Agentic Inteligente

## Descrição

Orquestra execução de agents especializados com base em análise de contexto do projeto e requirements da task. Utiliza o TaskLink Harness Core para routing inteligente e quality gates enterprise.

## Sintaxe

```bash
/orchestrate [--context auto|manual] [--agents AGENTS] [--mode MODE] [--quality LEVEL] TASK_DESCRIPTION
```

## Parâmetros

### Obrigatórios
- `TASK_DESCRIPTION`: Descrição da task a ser executada

### Opcionais  
- `--context auto|manual`: Detecção de contexto (padrão: auto)
- `--agents AGENTS`: Lista de agents específicos (comma-separated)
- `--mode MODE`: Modo de execução (sequential|parallel|pipeline|collaborative)
- `--quality LEVEL`: Nível quality gates (basic|standard|comprehensive|enterprise)

## Modos de Execução

### `sequential` (padrão)
```bash
/orchestrate "Implementar autenticação JWT no backend"
```
- Executa agents sequencialmente
- Aguarda completude antes do próximo
- Ideal para dependencies complexas

### `parallel`  
```bash
/orchestrate --mode parallel "Refatorar arquitetura para microservices"
```
- Executa agents simultaneamente
- Maior velocidade para tasks independentes
- Requer agents sem dependencies

### `pipeline`
```bash
/orchestrate --mode pipeline "Criar feature completa de pagamento"
```
- Execução em stages com dependencies
- Balanceia velocidade e safety
- Ideal para workflows estruturados

### `collaborative`
```bash
/orchestrate --mode collaborative "Design e implementar nova API"
```
- Agents colaboram em tempo real
- Ideal para tasks criativas/complexas
- Máxima flexibilidade e adaptação

## Quality Levels

### `basic`
```bash
/orchestrate --quality basic "Fix typo em documentação"
```
- Gates essenciais: security, syntax
- Rápido para changes simples
- Mínimo overhead

### `standard` (padrão)
```bash
/orchestrate "Implementar nova feature de busca"
```
- Gates padrão desenvolvimento
- Balanceado para maioria das tasks
- Coverage, lint, type checking

### `comprehensive`
```bash
/orchestrate --quality comprehensive "Refatorar core business logic"
```
- Validação completa qualidade
- Performance, security, architecture
- Para changes críticos

### `enterprise`
```bash
/orchestrate --quality enterprise "Migração dados sensíveis"
```
- Compliance completo + audit trails
- Governance e aprovações
- Para production/compliance

## Context Detection

### Auto (padrão)
```bash
/orchestrate "Otimizar performance API"
```
O sistema detecta automaticamente:
- **Stack:** python|node|java|dotnet|go|rust
- **Domain:** api|frontend|infra|data|security|business
- **Complexity:** trivial|simple|moderate|complex|enterprise
- **Confidence:** Score 0-1 da detecção

### Manual
```bash
/orchestrate --context manual "Implementar cache Redis"
```
Sistema pergunta contexto se detecção automática for baixa confiança (<0.7).

## Agent Selection

### Auto (padrão)
```bash
/orchestrate "Implementar testes unitários"
```
Sistema seleciona agents baseado em:
- Context detectado
- Capabilities requeridas  
- Agent priority scores
- Dependency resolution

### Manual
```bash
/orchestrate --agents "python-backend,tester,code-reviewer" "Refatorar auth service"
```
Especifica agents exatos:
- `python-backend`: Especialista Python backend
- `tester`: Geração e execução testes  
- `code-reviewer`: Review qualidade código
- `architect`: Design arquitetural
- `documenter`: Documentação técnica

## Examples Práticos

### Backend API Development
```bash
# Context: Python FastAPI project
/orchestrate "Implementar endpoint CRUD para Users"

# Auto-detected:
# - Stack: python
# - Domain: api  
# - Complexity: moderate
# - Agents: [python-backend, tester, code-reviewer]
# - Mode: sequential (dependencies)
# - Quality: standard
```

### Frontend Feature
```bash
# Context: React TypeScript project  
/orchestrate --quality comprehensive "Criar dashboard analytics com charts"

# Auto-detected:
# - Stack: typescript
# - Domain: frontend
# - Complexity: complex
# - Agents: [react-frontend, typescript-specialist, tester]
# - Mode: pipeline (UI → logic → tests)
```

### Infrastructure Changes
```bash
# Context: Kubernetes + Terraform
/orchestrate --mode parallel --quality enterprise "Migrar para AWS EKS"

# Auto-detected:
# - Stack: generic  
# - Domain: infrastructure
# - Complexity: enterprise
# - Agents: [infra-devops, architect, security-specialist]
# - Mode: parallel (independent workstreams)
```

### Full-Stack Feature
```bash
# Context: Multi-repo project
/orchestrate --mode collaborative "Implementar sistema notificações real-time"

# Auto-detected:
# - Stack: mixed (python backend + react frontend)
# - Domain: fullstack
# - Complexity: complex  
# - Agents: [architect, python-backend, react-frontend, tester]
# - Mode: collaborative (cross-cutting feature)
```

## Output e Progress

### Real-time Progress
```
🎯 Orchestrating: Implementar autenticação JWT

🔍 Context Detection:
  ✅ Stack: python (confidence: 0.95)
  ✅ Domain: api (confidence: 0.88)  
  ✅ Complexity: moderate (confidence: 0.92)

🤖 Agent Routing:
  ✅ Selected: python-backend (priority: 85)
  ✅ Selected: security-specialist (priority: 90)  
  ✅ Selected: tester (priority: 75)

⚡ Execution Plan:
  1. architect → Design JWT architecture
  2. python-backend → Implement JWT endpoints  
  3. security-specialist → Security review
  4. tester → Generate integration tests

🚀 Executing...
  ✅ architect completed (2.3min)
  🔄 python-backend in progress (45s elapsed)
  ⏳ security-specialist queued
  ⏳ tester queued
```

### Quality Gates
```
🛡️ Quality Gates (standard level):
  ✅ Security scan: passed
  ✅ Type checking: passed  
  ✅ Lint: passed
  ✅ Unit tests: passed (95% coverage)
  🔄 Integration tests: running
  ⏳ Performance tests: queued
```

### Evidence Collection  
```
📋 Evidence Collected:
  📝 Code changes: 12 files modified
  🧪 Test results: 47 tests passed  
  🔒 Security scan: clean
  📊 Coverage report: 95.2%
  ⚡ Performance: 150ms p95 (within SLA)
```

## Integration com TaskLink

### Automatic Idea Creation
```bash
# Cria automaticamente idea no TaskLink
/orchestrate "Implementar feature X" 
# → Gera idea com evidências automáticas
```

### Evidence Registration
```bash
# Registra evidências durante execução
# → PRs, test reports, security scans
# → Audit trail completo
```

### Phase Transitions
```bash
# Move idea através das phases automaticamente
# → NOVA → EM_SPEC → PRONTO_PARA_DEV → EM_DEV
```

## Error Handling

### Agent Failures
```
❌ Agent Failed: python-backend
   Reason: Import error in auth module
   
🔄 Recovery Options:
  1. Retry with same agent
  2. Route to fallback agent  
  3. Skip and continue
  4. Abort orchestration
  
Choose [1-4]:
```

### Quality Gate Failures
```
❌ Quality Gate Failed: security-scan
   Issues: 2 medium vulnerabilities found
   
🛡️ Security Issues:
  - SQL injection risk in user query
  - Weak JWT secret configuration
  
🔧 Auto-fix available: Yes
Apply fixes? [y/N]:
```

### Timeout Handling
```
⏰ Timeout: tester (5min limit exceeded)
   
🔄 Options:
  1. Extend timeout (+5min)
  2. Continue without tests
  3. Abort orchestration
  
Choose [1-3]:
```

## Configuration

### Project-level (CLAUDE.md)
```yaml
orchestration:
  default_quality: standard
  default_mode: sequential  
  agent_timeout: 300s
  quality_gates:
    - security
    - lint  
    - tests
    - coverage
```

### Environment Variables
```bash
export ORCHESTRATION_QUALITY=comprehensive
export ORCHESTRATION_MODE=pipeline
export ORCHESTRATION_TIMEOUT=600
```

## Debugging

### Verbose Mode
```bash
/orchestrate --verbose "Debug task execution"
```
- Mostra decisão routing detalhada
- Agent selection scoring
- Quality gate execution logs  
- Performance metrics

### Dry Run
```bash
/orchestrate --dry-run "Preview orchestration plan"
```
- Mostra plano sem executar
- Agent routing decisions
- Estimated execution time
- Quality gates que serão executados

---

**Version:** 1.0.0  
**Requires:** TaskLink Harness Core v2.0.0+  
**Integration:** TaskLink API, Quality Gates, Evidence Collection