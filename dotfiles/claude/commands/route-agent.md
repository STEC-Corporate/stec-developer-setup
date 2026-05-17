# /route-agent - Routing Inteligente para Agents Especializados

## Descrição

Detecta contexto do projeto e roteia tasks para agents especializados mais adequados. Utiliza análise automática de stack, domain e complexity para seleção ótima de agents.

## Sintaxe

```bash
/route-agent [--stack STACK] [--domain DOMAIN] [--complexity LEVEL] [--explain] TASK_DESCRIPTION
```

## Parâmetros

### Obrigatórios
- `TASK_DESCRIPTION`: Descrição da task para routing

### Opcionais
- `--stack STACK`: Override stack detection (python|node|java|dotnet|go|rust|generic)
- `--domain DOMAIN`: Override domain detection (api|frontend|infra|data|security|business)  
- `--complexity LEVEL`: Override complexity (trivial|simple|moderate|complex|enterprise)
- `--explain`: Mostra reasoning detalhado das decisões

## Context Detection

### Automatic Detection
```bash
/route-agent "Implementar cache Redis para API"
```

**Output:**
```
🔍 Context Analysis:
  📁 Project: /home/user/api-service
  ⚙️  Stack: python (confidence: 0.94)
      └─ Detected: requirements.txt, main.py, FastAPI patterns
  🏗️  Domain: api (confidence: 0.92)  
      └─ Detected: FastAPI, REST endpoints, database models
  🎯 Complexity: moderate (confidence: 0.87)
      └─ Reasons: Redis integration, caching strategy, API changes
      
🤖 Recommended Agent: python-backend
   ✅ Capabilities: [api_design, caching, performance]
   ✅ Stack Match: python (exact match)
   ✅ Domain Match: api (specialized) 
   ✅ Complexity: handles up to enterprise
   ⭐ Suitability Score: 0.94
```

### Manual Override
```bash
/route-agent --stack java --domain api "Implementar cache Redis"
```

**Output:**
```
🔍 Context (Manual Override):
  ⚙️  Stack: java (override)
  🏗️  Domain: api (override)
  🎯 Complexity: moderate (auto-detected)
      
🤖 Recommended Agent: java-specialist
   ✅ Capabilities: [code_generation, api_design, performance]
   ✅ Stack Match: java (exact match)
   ✅ Domain Match: api (compatible)
   ⭐ Suitability Score: 0.91
```

## Agent Selection Logic

### Stack-based Routing
```bash
# Python projects
/route-agent "Refatorar data processing pipeline"
# → python-data (specialized for data workloads)

# Node.js projects  
/route-agent "Otimizar performance frontend"
# → react-frontend (specialized for React/Next.js)

# Java projects
/route-agent "Implementar microservice"  
# → java-specialist (enterprise Java patterns)

# Generic/unknown stack
/route-agent "Revisar arquitetura geral"
# → architect (stack-agnostic)
```

### Domain-based Routing
```bash
# API/Backend domain
/route-agent "Implementar autenticação"
# → Prefers: python-backend, java-specialist, api-security

# Frontend domain
/route-agent "Criar dashboard interativo"
# → Prefers: react-frontend, vue-specialist, ui-designer

# Infrastructure domain  
/route-agent "Setup CI/CD pipeline"
# → Prefers: infra-devops, cloud-architect, cicd-specialist

# Data domain
/route-agent "Otimizar queries database"  
# → Prefers: data-engineer, database-specialist, performance-optimizer
```

### Complexity-based Routing
```bash
# Trivial (config, typos)
/route-agent "Fix typo em README"
# → code-reviewer (lightweight agent)

# Simple (single module changes)
/route-agent "Add validation campo email"
# → python-backend (straightforward implementation)

# Moderate (multi-module, business logic)
/route-agent "Implementar sistema pagamentos"
# → architect + python-backend + security-specialist

# Complex (architecture changes)
/route-agent "Migrar para microservices"
# → architect + multiple specialists + infra-devops

# Enterprise (system-wide, high-risk)
/route-agent "Migração database produção"
# → architect + data-engineer + security + infra (full team)
```

## Explain Mode

### Detailed Reasoning
```bash
/route-agent --explain "Implementar sistema notificações"
```

**Output:**
```
🔍 Context Detection Process:

📁 File Analysis:
  ✅ package.json found → Node.js project
  ✅ tsconfig.json found → TypeScript enabled
  ✅ pages/ directory → Next.js framework
  ✅ components/ → React components
  🎯 Result: Stack = typescript, Domain = frontend

🧠 Complexity Analysis:  
  📊 Factors considered:
    • Cross-cutting feature (+2) → affects multiple modules
    • Real-time requirements (+1) → WebSockets/SSE complexity  
    • User interaction (+1) → UI/UX considerations
    • Backend integration (+1) → API design needed
  🎯 Result: Complexity = complex (score: 5/5)

🤖 Agent Evaluation:

   1. react-frontend (score: 0.89)
      ✅ Stack match: typescript (exact)
      ✅ Domain match: frontend (specialized)
      ✅ Capabilities: [ui_design, real_time, notifications]
      ⚠️  Complexity: max=complex (at limit)
      
   2. architect (score: 0.82) 
      ✅ Complexity: max=enterprise (over-qualified)
      ✅ Capabilities: [system_design, integration]
      ⚠️  Stack: generic (not specialized)
      ⚠️  Domain: generic (not specialized)
      
   3. fullstack-specialist (score: 0.76)
      ✅ Stack match: typescript (exact)
      ✅ Complexity: max=enterprise (over-qualified)  
      ⚠️  Domain: mixed (not frontend-focused)

🏆 Selected: react-frontend
   Reasoning: Highest specialization for frontend notification UI with
   exact stack match and appropriate complexity handling.
   
💡 Alternative: If backend work needed, consider collaborative mode with
   react-frontend + node-backend agents.
```

## Agent Registry

### Specialized Agents
```bash
# Python ecosystem
python-backend     # FastAPI, Django, Flask backends
python-data        # Pandas, NumPy, ML pipelines  
python-testing     # pytest, coverage, test automation

# JavaScript/TypeScript ecosystem  
react-frontend     # React, Next.js, UI components
node-backend       # Express, NestJS, API development
typescript-specialist # Type safety, advanced TypeScript

# Java ecosystem
java-specialist    # Spring, enterprise patterns
java-testing       # JUnit, integration testing
microservices-java # Microservice architecture

# Infrastructure
infra-devops      # CI/CD, containers, orchestration
cloud-architect   # AWS, Azure, GCP architecture
security-specialist # Security, compliance, auditing
```

### Generic Agents
```bash
# Cross-cutting specialists
architect         # System design, architecture reviews
code-reviewer     # Code quality, best practices  
tester           # Test strategy, automation
documenter       # Technical documentation
performance-optimizer # Profiling, optimization
```

## Multi-Agent Recommendations

### Collaborative Tasks
```bash
/route-agent "Implementar feature completa e-commerce"
```

**Output:**
```
🎯 Multi-Agent Recommendation:
   This task requires multiple specialized agents:
   
   🏗️  architect (Phase 1)
      Role: Design system architecture
      Deliverables: API design, database schema, component structure
      
   🎨 react-frontend (Phase 2)  
      Role: Implement user interface
      Deliverables: Product catalog, cart, checkout UI
      
   ⚙️  python-backend (Phase 2, parallel)
      Role: Implement business logic  
      Deliverables: APIs, payment integration, inventory
      
   🧪 tester (Phase 3)
      Role: End-to-end testing
      Deliverables: Test suites, automation, quality gates
      
💡 Suggestion: Use /orchestrate --mode pipeline for structured execution
```

### Fallback Recommendations
```bash
/route-agent "Debug performance issue"
```

**Output:**
```
🤖 Primary: performance-optimizer (score: 0.91)
   ✅ Specialized in profiling and optimization
   
🔄 Fallbacks:
   1. python-backend (score: 0.78) - if Python-specific issue  
   2. architect (score: 0.72) - if architectural problem
   3. code-reviewer (score: 0.69) - if code quality issue
   
⚡ Auto-fallback: Enabled (switches if primary agent fails)
```

## Integration Workflows

### TaskLink Integration
```bash
/route-agent "Feature: Sistema de relatórios"
# → Automatically creates TaskLink idea
# → Routes to appropriate agent
# → Tracks evidence during execution
```

### Quality Gates
```bash
/route-agent "Security: Audit authentication"  
# → Routes to security-specialist
# → Enables security quality gates
# → Requires security evidence
```

### CI/CD Integration  
```bash
/route-agent "Deploy: Production release"
# → Routes to infra-devops
# → Enables deployment gates
# → Requires approval workflows
```

## Performance Metrics

### Routing Accuracy
```
📊 Routing Statistics (Last 30 days):
   ✅ Successful routings: 94.2%
   🔄 Fallback activations: 5.8%
   ⚡ Average routing time: 23ms
   🎯 Agent satisfaction score: 4.7/5
```

### Context Detection
```
🔍 Detection Accuracy:
   ⚙️  Stack detection: 96.1%
   🏗️  Domain detection: 91.7%  
   🎯 Complexity detection: 88.3%
   📊 Overall confidence: 0.89
```

## Debugging e Troubleshooting

### Low Confidence Detection
```bash
/route-agent "Implement some feature"
```

**Output:**
```
⚠️  Low Confidence Detection:
   Stack: unknown (confidence: 0.12)
   Domain: generic (confidence: 0.34)
   
🔧 Suggestions:
   1. Be more specific: "Implement REST API for user management"  
   2. Include tech details: "Add Redis caching to Python FastAPI"
   3. Specify context: --stack python --domain api
   
❓ Manual routing recommended
```

### No Suitable Agent
```bash  
/route-agent --stack cobol "Modernize legacy system"
```

**Output:**
```
❌ No Suitable Agent Found:
   Stack 'cobol' not supported by any registered agent
   
🔄 Fallback Options:
   1. architect (generic system design)
   2. legacy-modernization (if available)
   3. custom agent registration needed
   
💡 Consider: Create specialized legacy-cobol agent
```

---

**Version:** 1.0.0  
**Requires:** TaskLink Harness Core v2.0.0+  
**Integration:** Agent Registry, Context Detection, Quality Gates