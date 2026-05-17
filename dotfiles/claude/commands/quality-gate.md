# /quality-gate - Validação Enterprise Quality Gates

## Descrição

Executa quality gates configuráveis para validação enterprise de código, arquitetura, segurança e compliance. Integra com TaskLink Harness Core para evidências auditáveis e orquestração de validações.

## Sintaxe

```bash
/quality-gate [--level LEVEL] [--gates GATES] [--evidence-required] [--strict] [PATH]
```

## Parâmetros

### Opcionais
- `--level LEVEL`: Nível de quality gates (basic|standard|comprehensive|enterprise)
- `--gates GATES`: Gates específicos (comma-separated)
- `--evidence-required`: Força coleta de evidências
- `--strict`: Modo strict (zero tolerance para failures)
- `PATH`: Caminho específico (padrão: projeto atual)

## Quality Levels

### `basic` - Gates Essenciais
```bash
/quality-gate --level basic
```

**Gates Executados:**
```
🔒 Security Gates:
  ✅ bandit: Python security linting
  ✅ safety: Dependency vulnerability check
  ✅ secrets: Secret scanning (gitleaks)
  
⚙️ Syntax Gates:  
  ✅ mypy: Type checking
  ✅ ruff: Code linting
  ✅ format: Code formatting check
```

**Use Cases:**
- Hot fixes em produção
- Changes simples e low-risk  
- Validação rápida pre-commit
- Desenvolvimento inicial

**Tempo típico:** 30-60 segundos

### `standard` - Gates Desenvolvimento (padrão)
```bash
/quality-gate
# ou
/quality-gate --level standard
```

**Gates Executados:**
```
🔒 Security Gates:
  ✅ bandit: Security linting  
  ✅ safety: Vulnerability scanning
  ✅ secrets: Secret detection
  
⚙️ Code Quality Gates:
  ✅ mypy: Type safety
  ✅ ruff: Linting + formatting
  ✅ complexity: Cyclomatic complexity
  ✅ duplication: Code duplication check
  
🧪 Testing Gates:
  ✅ pytest: Unit tests
  ✅ coverage: Code coverage (>80%)
  ✅ integration: Integration tests (if available)
  
🏗️ Architecture Gates:
  ✅ imports: Import dependency analysis
  ✅ api-contracts: API contract validation (if OpenAPI)
```

**Use Cases:**
- Feature development normal
- Code review preparation
- CI/CD pipeline padrão
- Desenvolvimento day-to-day

**Tempo típico:** 2-5 minutos

### `comprehensive` - Validação Completa
```bash
/quality-gate --level comprehensive
```

**Gates Executados:** Standard + 
```
🚀 Performance Gates:
  ✅ profiling: Performance profiling
  ✅ memory: Memory usage analysis  
  ✅ load-testing: Basic load testing
  ✅ benchmarks: Performance benchmarks
  
🏗️ Architecture Gates:
  ✅ design-patterns: Architecture pattern compliance
  ✅ layering: Layer violation detection
  ✅ coupling: Coupling analysis
  ✅ cohesion: Cohesion metrics
  
📊 Metrics Gates:
  ✅ maintainability: Maintainability index
  ✅ technical-debt: Technical debt assessment
  ✅ documentation: Documentation completeness
  ✅ api-versioning: API versioning compliance
```

**Use Cases:**
- Features críticas e high-risk
- Refactoring major
- Architecture changes
- Release preparation

**Tempo típico:** 10-20 minutos

### `enterprise` - Compliance Full
```bash
/quality-gate --level enterprise
```

**Gates Executados:** Comprehensive +
```
🛡️ Enterprise Security:
  ✅ sast: Static Application Security Testing
  ✅ dast: Dynamic Application Security Testing  
  ✅ iac-security: Infrastructure as Code security
  ✅ compliance: Regulatory compliance (SOX, PCI, etc.)
  
📋 Governance Gates:
  ✅ license: License compliance
  ✅ sbom: Software Bill of Materials
  ✅ audit-trail: Complete audit trail validation
  ✅ approval: Required approvals workflow
  
🔍 Deep Analysis:
  ✅ threat-modeling: Automated threat modeling
  ✅ risk-assessment: Risk assessment scoring
  ✅ business-rules: Business rule validation
  ✅ data-privacy: Data privacy compliance (GDPR, LGPD)
```

**Use Cases:**
- Production releases
- Regulated industries
- Sensitive data handling
- Compliance-critical changes

**Tempo típico:** 30-60 minutos

## Gate Categories

### 🔒 Security Gates
```bash
/quality-gate --gates security
```

**Disponíveis:**
- `bandit`: Python security issues
- `safety`: Known vulnerabilities  
- `secrets`: Secret/credential detection
- `sast`: Static security analysis
- `dast`: Dynamic security testing
- `dependency-check`: Dependency vulnerabilities
- `container-scan`: Container image scanning

### ⚙️ Code Quality Gates
```bash
/quality-gate --gates code-quality
```

**Disponíveis:**
- `mypy`: Type checking
- `ruff`: Linting + formatting
- `complexity`: Cyclomatic complexity
- `duplication`: Code duplication
- `maintainability`: Maintainability index
- `code-smells`: Code smell detection

### 🧪 Testing Gates
```bash  
/quality-gate --gates testing
```

**Disponíveis:**
- `unit-tests`: Unit test execution
- `integration-tests`: Integration testing
- `e2e-tests`: End-to-end testing
- `coverage`: Code coverage analysis
- `mutation-testing`: Mutation testing
- `property-testing`: Property-based testing

### 🏗️ Architecture Gates
```bash
/quality-gate --gates architecture
```

**Disponíveis:**
- `layer-validation`: Architecture layer compliance
- `dependency-rules`: Dependency rule validation
- `api-contracts`: API contract validation
- `design-patterns`: Pattern compliance
- `coupling`: Coupling metrics
- `cohesion`: Cohesion analysis

### 🚀 Performance Gates
```bash
/quality-gate --gates performance
```

**Disponíveis:**
- `benchmarks`: Performance benchmarks
- `profiling`: CPU/memory profiling
- `load-testing`: Load testing
- `response-time`: Response time validation
- `throughput`: Throughput analysis
- `resource-usage`: Resource utilization

## Custom Gate Selection

### Specific Gates
```bash
/quality-gate --gates "mypy,pytest,coverage,security"
```

### Exclude Gates
```bash
/quality-gate --level standard --gates "!load-testing,!benchmarks"
```

### Gate Groups
```bash
/quality-gate --gates "@security,@testing"
# @security = bandit,safety,secrets,sast
# @testing = pytest,coverage,integration-tests
```

## Output e Reporting

### Interactive Mode
```bash
/quality-gate --level comprehensive
```

**Real-time Output:**
```
🛡️ Quality Gates Execution (comprehensive level)

🔒 Security Gates (1/4):
  ✅ bandit: No security issues found (2.1s)
  ✅ safety: All dependencies secure (1.8s)  
  ✅ secrets: No secrets detected (0.9s)
  🔄 sast: Running static analysis... (45s elapsed)

⚙️ Code Quality Gates (0/4):  
  ⏳ mypy: Queued
  ⏳ ruff: Queued
  ⏳ complexity: Queued  
  ⏳ duplication: Queued

🧪 Testing Gates (0/3):
  ⏳ pytest: Queued
  ⏳ coverage: Queued
  ⏳ integration: Queued

🏗️ Architecture Gates (0/4):
  ⏳ imports: Queued
  ⏳ layering: Queued
  ⏳ coupling: Queued
  ⏳ api-contracts: Queued
```

### Summary Report
```bash
/quality-gate --level comprehensive
```

**Final Report:**
```
📊 Quality Gates Summary
════════════════════════════════════════

🎯 Overall Score: 94.2% (Grade: A)
⏱️  Total Execution: 8m 32s
📊 Gates: 15 passed, 1 warning, 0 failed

🔒 Security: 100% ✅
  ✅ bandit: Clean (0 issues)
  ✅ safety: Clean (0 vulnerabilities)
  ✅ secrets: Clean (0 secrets)
  ✅ sast: Clean (0 critical issues)

⚙️ Code Quality: 96.5% ✅  
  ✅ mypy: Clean (0 type errors)
  ✅ ruff: Clean (0 lint issues)
  ✅ complexity: Good (avg: 4.2, max: 8)
  ⚠️  duplication: Minor (2.1% duplication)

🧪 Testing: 92.8% ✅
  ✅ pytest: 247 tests passed
  ✅ coverage: 94.2% (target: 80%)
  ✅ integration: 15 tests passed

🏗️ Architecture: 88.7% ⚠️
  ✅ imports: Clean dependencies
  ✅ layering: No violations
  ⚠️  coupling: Moderate coupling (score: 6.2)
  ✅ api-contracts: OpenAPI compliant

🚀 Performance: Not executed (level: comprehensive)

📋 Recommendations:
  • Reduce code duplication in utils/ modules
  • Consider refactoring UserService for lower coupling
  • Add performance gates for critical path validation

🎉 Quality gates passed! Ready for deployment.
```

### Evidence Collection
```bash
/quality-gate --evidence-required --level standard
```

**Evidence Generated:**
```
📋 Evidence Collected:
  📄 quality-report.json (detailed results)
  📊 coverage-report.html (test coverage)
  🔒 security-scan.json (security findings)
  📈 metrics-summary.json (code metrics)
  🧪 test-results.xml (test execution)
  
🔗 TaskLink Integration:  
  ✅ Evidence registered for task: TASK-123
  ✅ Quality score: 94.2% recorded
  ✅ Gate results linked to idea
  
📤 Artifact URLs:
  • Coverage: https://reports.example.com/coverage/abc123
  • Security: https://reports.example.com/security/abc123  
  • Full Report: https://reports.example.com/quality/abc123
```

## Configuration

### Project-level (CLAUDE.md)
```yaml
quality_gates:
  default_level: standard
  required_coverage: 85
  security_gates:
    - bandit
    - safety
    - secrets
  custom_gates:
    business_rules: ./scripts/validate-business-rules.sh
  thresholds:
    complexity_max: 10
    duplication_max: 5.0
    maintainability_min: 70
```

### Environment Variables
```bash
export QUALITY_GATE_LEVEL=comprehensive
export QUALITY_GATE_STRICT=true
export QUALITY_GATE_EVIDENCE=true
export QUALITY_GATE_TIMEOUT=1800  # 30 minutes
```

## Advanced Usage

### Strict Mode
```bash
/quality-gate --strict --level comprehensive
```
- Zero tolerance para falhas
- Falha em primeiro warning/error
- Useful para releases críticas

### Evidence-only Mode  
```bash
/quality-gate --evidence-required --level enterprise
```
- Foca em coleta de evidências
- Mesmo com gates failing  
- Útil para audit trails

### Custom Path
```bash
/quality-gate --level standard ./src/modules/auth/
```
- Valida path específico
- Útil para validação incremental
- Suporte a múltiplos paths

### Parallel Execution
```bash
/quality-gate --level comprehensive --parallel
```
- Executa gates em paralelo  
- Reduz tempo total
- Requer mais recursos

## Integration Patterns

### CI/CD Pipeline
```yaml
# .github/workflows/quality.yml
- name: Quality Gates
  run: |
    /quality-gate --level comprehensive --evidence-required
    if [ $? -ne 0 ]; then
      echo "Quality gates failed"
      exit 1
    fi
```

### Pre-commit Hook
```bash
# .git/hooks/pre-commit
#!/bin/bash
/quality-gate --level basic
```

### TaskLink Integration  
```bash
# Automatic task transition after quality gates pass
/quality-gate --level standard --auto-transition
# Moves TaskLink idea to next phase on success
```

---

**Version:** 1.0.0  
**Requires:** TaskLink Harness Core v2.0.0+  
**Integration:** Evidence Collection, TaskLink API, Audit Trails