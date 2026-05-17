# /evidence-collect - Coleta Automática de Evidências para Audit Trails

## Descrição

Coleta evidências auditáveis durante desenvolvimento para compliance enterprise e audit trails. Integra com TaskLink Harness Core para tracking automático de artifacts, execuções e decisões.

## Sintaxe

```bash
/evidence-collect [--strategy STRATEGY] [--types TYPES] [--continuous] [--task TASK_ID] [PATH]
```

## Parâmetros

### Opcionais
- `--strategy STRATEGY`: Estratégia de coleta (passive|active|triggered|continuous)
- `--types TYPES`: Tipos de evidência (comma-separated)
- `--continuous`: Modo contínuo (monitor durante desenvolvimento)
- `--task TASK_ID`: TaskLink task ID para associação
- `PATH`: Caminho específico (padrão: projeto atual)

## Collection Strategies

### `passive` - Coleta Passiva (padrão)
```bash
/evidence-collect --strategy passive
```

**Como funciona:**
- Aguarda evidências aparecerem naturalmente
- Monitora arquivos conhecidos (reports/, artifacts/)
- Baixo impacto na performance
- Ideal para desenvolvimento normal

**Evidências coletadas:**
```
📊 Build Artifacts:
  ✅ Test reports: pytest-results.xml
  ✅ Coverage: .coverage, htmlcov/
  ✅ Lint reports: ruff-report.json
  ✅ Type check: mypy-report.txt
  
🔒 Security Artifacts:  
  ✅ Security scans: bandit-report.json
  ✅ Dependency audit: safety-report.json
  ✅ Secret scanning: gitleaks-report.json
  
🏗️ Architecture Artifacts:
  ✅ API docs: openapi.json, swagger.json
  ✅ Database schemas: migrations/, schema.sql
  ✅ Architecture diagrams: docs/architecture/
```

### `active` - Coleta Ativa
```bash
/evidence-collect --strategy active
```

**Como funciona:**
- Busca ativamente por evidências
- Executa comandos para gerar artifacts
- Análise profunda do projeto
- Ideal para audit completo

**Evidências geradas:**
```
🔍 Active Evidence Generation:
  🧪 Executing tests... → pytest --cov=. --cov-report=html
  🔒 Security scanning... → bandit -f json -o security-report.json
  📊 Code metrics... → radon cc . --json
  🏗️ Architecture analysis... → pydeps --show-deps
  
📋 Generated Artifacts:
  ✅ coverage-report.html (test coverage)
  ✅ security-scan.json (security analysis)  
  ✅ code-metrics.json (complexity metrics)
  ✅ dependency-graph.svg (architecture)
  ✅ performance-profile.json (if available)
```

### `triggered` - Coleta por Eventos
```bash
/evidence-collect --strategy triggered
```

**Como funciona:**
- Reage a eventos específicos (git commit, file changes)
- Coleta contextual baseada em triggers
- Eficiente e targeted
- Ideal para CI/CD integration

**Triggers suportados:**
```
🎯 Git Triggers:
  📝 pre-commit: Coleta diff, lint results
  📝 post-commit: Coleta commit message, changed files
  📝 pre-push: Coleta test results, security scans
  
📁 File Triggers:
  🐍 *.py changed: Type check, lint, test coverage
  📋 requirements.txt: Dependency audit, license check
  🏗️ docker files: Container security scan
  📊 API schemas: Contract validation, compatibility
  
⚙️ Tool Triggers:
  🧪 Test execution: Coverage, results, performance
  🔒 Security scan: Vulnerability reports, compliance
  📊 Build: Artifacts, metrics, deployment readiness
```

### `continuous` - Monitoramento Contínuo
```bash
/evidence-collect --strategy continuous
```

**Como funciona:**
- Monitora continuamente durante desenvolvimento
- Coleta em tempo real
- Streams de evidência
- Ideal para compliance rigoroso

**Continuous Collection:**
```
🔄 Real-time Monitoring:
  👀 File watcher: Active on project files
  ⏱️  Interval: 30s collections
  📊 Metrics: Live code quality scores
  🧪 Tests: Auto-execution on changes
  
📈 Live Dashboard:
  🎯 Quality score: 94.2% (trending ↗️)
  🧪 Test status: 247 passing, 0 failing  
  🔒 Security: Clean (last scan: 2m ago)
  📊 Coverage: 94.2% (target: 80%)
  
🚨 Real-time Alerts:
  ⚠️  Quality degradation detected
  ❌ New security vulnerability
  📉 Coverage dropped below threshold
```

## Evidence Types

### Development Artifacts
```bash
/evidence-collect --types "code,tests,docs"
```

**Coletado:**
- **code**: Source code snapshots, diffs, complexity metrics
- **tests**: Test results, coverage, test artifacts
- **docs**: Documentation, API specs, architecture diagrams  
- **build**: Build artifacts, deployment packages
- **config**: Configuration files, environment settings

### Quality Artifacts  
```bash
/evidence-collect --types "quality,security,performance"
```

**Coletado:**
- **quality**: Lint results, code metrics, technical debt
- **security**: Vulnerability scans, secret detection, compliance
- **performance**: Benchmarks, profiling, load test results
- **architecture**: Dependency analysis, pattern compliance
- **compliance**: Regulatory compliance, audit trail data

### Process Artifacts
```bash
/evidence-collect --types "process,decisions,approvals"
```

**Coletado:**
- **process**: Workflow execution, phase transitions
- **decisions**: Architecture decisions, trade-offs, rationale  
- **approvals**: Code review, stakeholder approvals
- **deployment**: Release notes, deployment logs
- **monitoring**: Runtime metrics, error rates, SLA compliance

## TaskLink Integration

### Automatic Task Association
```bash
/evidence-collect --task TASK-123
```

**Integração:**
```
📋 TaskLink Task: TASK-123
  📝 Title: Implementar autenticação JWT
  📊 Phase: EM_DEV
  👤 Assignee: developer@company.com
  
🔗 Evidence Association:
  ✅ Code changes: 12 files modified
  ✅ Test results: 15 new tests added
  ✅ Security scan: JWT implementation validated  
  ✅ Documentation: API docs updated
  ✅ Review: Code review completed
  
📈 Progress Tracking:
  🎯 Completion: 85%
  📊 Quality score: 92.1%
  🧪 Test coverage: 94%
  🔒 Security: Compliant
```

### Automatic Task Detection
```bash
/evidence-collect  # Auto-detects current task
```

**Detection Logic:**
```
🔍 Task Detection:
  📝 Git branch: feature/auth-jwt → TASK-123
  📋 Commit messages: "TASK-123: implement JWT auth"
  📁 Working directory: /project/auth-service
  🎯 Current focus: Authentication module
  
✅ Auto-associated with TASK-123
```

### Evidence Timeline
```bash
/evidence-collect --task TASK-123 --timeline
```

**Timeline View:**
```
📅 Evidence Timeline for TASK-123:

10:30 🚀 Task started
  📝 Initial commit: "TASK-123: start JWT implementation"
  📋 Evidence: git-log.json, initial-scope.md

11:15 🧪 Tests added  
  📝 Commit: "Add JWT test cases"
  📋 Evidence: test-results.xml, coverage-delta.json
  
12:30 🔒 Security review
  📋 Evidence: security-scan.json, vulnerability-report.json
  
14:45 📊 Code review completed
  📋 Evidence: review-comments.json, approval-record.json
  
15:20 ✅ Quality gates passed
  📋 Evidence: quality-report.json, all-checks-passed.json

📊 Summary: 15 evidence artifacts collected over 4h 50m
```

## Compliance Integration

### Regulatory Requirements
```bash
/evidence-collect --compliance "SOX,PCI,GDPR"
```

**Compliance Evidence:**
```
🏛️ Regulatory Compliance:

📋 SOX (Sarbanes-Oxley):
  ✅ Code review evidence (dual approval)
  ✅ Change approval workflow  
  ✅ Deployment authorization
  ✅ Audit trail completeness
  
💳 PCI DSS:
  ✅ Payment data handling evidence
  ✅ Security scan results
  ✅ Encryption validation
  ✅ Access control verification
  
🔒 GDPR:
  ✅ Data privacy impact assessment
  ✅ Personal data handling evidence
  ✅ Consent management validation
  ✅ Right to deletion compliance
```

### Audit Preparation
```bash
/evidence-collect --audit-ready --strategy comprehensive
```

**Audit Package:**
```
📦 Audit Evidence Package:
  📄 executive-summary.pdf
  📊 evidence-inventory.xlsx
  📋 compliance-matrix.json
  🔒 security-attestation.pdf
  📈 quality-metrics-report.pdf
  
📁 Detailed Artifacts:
  /evidence/
    ├── code-changes/
    ├── test-results/ 
    ├── security-scans/
    ├── reviews-approvals/
    ├── deployment-logs/
    └── compliance-checks/
    
🎯 Audit Readiness: 98.3%
  ✅ All required evidence present
  ✅ Chain of custody verified
  ✅ Digital signatures valid
  ⚠️  1 minor gap: performance benchmark missing
```

## Advanced Features

### Evidence Validation
```bash
/evidence-collect --validate --strategy active
```

**Validation Process:**
```
🔍 Evidence Validation:
  
📊 Completeness Check:
  ✅ All required artifacts present
  ✅ No gaps in evidence chain
  ✅ Timestamps consistent
  ✅ Digital signatures valid
  
🔒 Integrity Check:
  ✅ Checksums verified
  ✅ No tampering detected  
  ✅ Source authenticity confirmed
  ✅ Chain of custody intact
  
📋 Quality Check:  
  ✅ Evidence format compliance
  ✅ Data completeness
  ✅ Relevance scoring: 94.2%
  ⚠️  Recommendation: Add performance evidence
```

### Evidence Search
```bash
/evidence-collect --search "security scan" --task TASK-123
```

**Search Results:**
```
🔍 Evidence Search Results:

📊 Found 8 security scan artifacts for TASK-123:

1. 2026-05-15_10:30 - bandit-scan.json
   🔒 Security: 15 checks passed, 0 issues
   📁 Location: ./evidence/security/bandit-20260515-1030.json
   
2. 2026-05-15_14:20 - safety-audit.json  
   📋 Dependencies: 247 packages scanned, 0 vulnerabilities
   📁 Location: ./evidence/security/safety-20260515-1420.json
   
3. 2026-05-15_16:45 - container-scan.json
   🐳 Container: Base image clean, 0 CVEs
   📁 Location: ./evidence/security/container-20260515-1645.json
```

### Evidence Export
```bash
/evidence-collect --export --format zip --task TASK-123
```

**Export Package:**
```
📦 Evidence Export: TASK-123-evidence-20260515.zip

📁 Contents:
  📄 manifest.json (evidence inventory)
  📊 summary.pdf (executive summary)
  🧪 tests/ (test results and coverage)
  🔒 security/ (security scans and audits)
  📝 reviews/ (code review artifacts)
  🏗️ architecture/ (design documents)
  ⚙️ build/ (build and deployment artifacts)
  
💾 Size: 45.2 MB
🔒 Encrypted: AES-256
🎯 Integrity: SHA-256 checksums included
```

## Configuration

### Project Configuration (.evidence.yml)
```yaml
evidence:
  strategy: active
  continuous: true
  
  types:
    - code
    - tests  
    - security
    - quality
    - process
    
  tasklink:
    auto_associate: true
    auto_transition: false
    
  compliance:
    required:
      - SOX
      - security_audit
    optional:
      - performance
      - documentation
      
  storage:
    local: ./evidence/
    remote: s3://company-evidence-bucket/
    retention_days: 2555  # 7 years
    
  notifications:
    slack_webhook: https://hooks.slack.com/...
    email_alerts: compliance@company.com
```

### Environment Variables  
```bash
export EVIDENCE_STRATEGY=continuous
export EVIDENCE_TASK_AUTO_DETECT=true
export EVIDENCE_COMPLIANCE="SOX,PCI,GDPR"
export EVIDENCE_STORAGE_PATH="./evidence/"
```

---

**Version:** 1.0.0  
**Requires:** TaskLink Harness Core v2.0.0+  
**Integration:** TaskLink API, Compliance Frameworks, Audit Systems