# TODO: Orquestração de Agents - TaskLink Harness Core

## 🎯 Objetivo

Disponibilizar os novos agents de orquestração do TaskLink Harness Core para todos os developers via:
1. **Commands do Claude Code** (via `dotfiles/claude/commands/`)
2. **Agents do Cursor** (via `dotfiles/cursor/agents/`) 
3. **Global agents** (via `dotfiles/global/agents/`)

## 📋 Tarefas

### **Phase 1: Análise da Implementação Atual**

- [ ] **Revisar agents implementados no harness-core**
  - [ ] `harness/agents/agent_router.py` - Router inteligente
  - [ ] `harness/agents/context_detector.py` - Detecção de contexto
  - [ ] `harness/agents/evidence_collector.py` - Coleta de evidências  
  - [ ] `harness/agents/quality_gate_orchestrator.py` - Orquestração de quality gates
  - [ ] `harness/orchestration/types.py` - Types da orquestração

- [ ] **Analisar qualidade dos components existentes**
  - [ ] Review code quality dos agents (coverage, tipos, docs)
  - [ ] Review skills implementadas (async patterns, error handling)
  - [ ] Review hooks (safety, performance, edge cases)
  - [ ] Identificar gaps e melhorias necessárias

### **Phase 2: Commands do Claude Code**

- [ ] **Criar command: `/orchestrate`**
  - Localização: `dotfiles/claude/commands/orchestrate.md`
  - Funcionalidade: Orquestrar execution plans com agents especializados
  - Parâmetros: `--context`, `--agents`, `--mode`, `--quality-level`

- [ ] **Criar command: `/route-agent`** 
  - Localização: `dotfiles/claude/commands/route-agent.md`
  - Funcionalidade: Detectar contexto e rotear para agent especializado
  - Parâmetros: `--stack`, `--domain`, `--complexity`

- [ ] **Criar command: `/quality-gate`**
  - Localização: `dotfiles/claude/commands/quality-gate.md` 
  - Funcionalidade: Executar validação via quality gates
  - Parâmetros: `--level`, `--gates`, `--evidence-required`

- [ ] **Criar command: `/evidence-collect`**
  - Localização: `dotfiles/claude/commands/evidence-collect.md`
  - Funcionalidade: Coletar evidências para audit trails
  - Parâmetros: `--strategy`, `--types`, `--continuous`

### **Phase 3: Agents do Cursor**

- [ ] **Criar agent: `orchestration-master.md`**
  - Localização: `dotfiles/cursor/agents/orchestration-master.md`
  - Responsabilidade: Coordenar execution plans multi-agent
  - Integração: TaskLink Harness Core APIs

- [ ] **Criar agent: `context-analyzer.md`**
  - Localização: `dotfiles/cursor/agents/context-analyzer.md`
  - Responsabilidade: Detectar stack, domain, complexity automaticamente
  - Output: Context object para routing decisions

- [ ] **Criar agent: `quality-orchestrator.md`**
  - Localização: `dotfiles/cursor/agents/quality-orchestrator.md`
  - Responsabilidade: Executar quality gates enterprise
  - Integração: Evidence collection + audit trails

### **Phase 4: Global Agents**

- [ ] **Migrar para global agents:**
  - [ ] `dotfiles/global/agents/orquestracao-agent-router.md`
  - [ ] `dotfiles/global/agents/orquestracao-context-detector.md` 
  - [ ] `dotfiles/global/agents/orquestracao-evidence-collector.md`
  - [ ] `dotfiles/global/agents/orquestracao-quality-gates.md`

- [ ] **Criar orchestration index:**
  - [ ] `dotfiles/global/agents/orquestracao-INDEX.md` 
  - [ ] Mapear agents → capabilities → use cases
  - [ ] Dependencies e execution flows

### **Phase 5: Documentação e Testing**

- [ ] **Criar guias de uso:**
  - [ ] `docs/ia/orchestration-agents-guide.md`
  - [ ] Examples práticos de cada agent
  - [ ] Integration patterns com TaskLink

- [ ] **Testing e validation:**
  - [ ] Testar commands em projetos Python/Node/Java
  - [ ] Validar integration com harness-core
  - [ ] Performance e reliability testing

### **Phase 6: Integration com TaskLink Products**

- [ ] **Coordenar com produtos TaskLink:**
  - [ ] musician-service: Adicionar orquestração agentic
  - [ ] contract-service: Routing para agents especializados  
  - [ ] Outros serviços: Evidence collection automática

- [ ] **CI/CD Integration:**
  - [ ] Quality gates nos pipelines
  - [ ] Evidence collection automática
  - [ ] Audit trails para compliance

## 🔧 Critérios de Aceitação

### **Commands (Claude Code)**
- ✅ Commands funcionais via Claude Code CLI
- ✅ Integração com TaskLink Harness Core APIs
- ✅ Error handling e timeout management
- ✅ Documentação completa com examples

### **Agents (Cursor)**  
- ✅ Agents funcionais em projetos reais
- ✅ Context detection automática
- ✅ Quality gates enterprise-grade
- ✅ Evidence collection para audit

### **Global Agents**
- ✅ Agents reutilizáveis cross-project
- ✅ Routing matrix bem definida
- ✅ Dependencies claras entre agents
- ✅ Performance otimizada

### **Quality Metrics**
- ✅ Code coverage > 80% para todos os agents
- ✅ Type safety completa (mypy clean)
- ✅ Lint sem warnings (ruff clean)
- ✅ Integration tests passando

## 🗓️ Timeline

| Phase | Duração | Owner | Entrega |
|-------|---------|-------|---------|
| 1 | 2 dias | Dev Team | Análise completa atual state |
| 2 | 3 dias | Claude Team | Commands funcionais |
| 3 | 3 dias | Cursor Team | Agents integrados | 
| 4 | 2 dias | Global Team | Migration completa |
| 5 | 2 dias | Docs Team | Documentação + testing |
| 6 | 3 dias | Product Team | Integration TaskLink |

**Total:** ~15 dias úteis

## 🔗 Dependencies

- ✅ TaskLink Harness Core v2.0.0+ 
- ✅ Claude Code com support a custom commands
- ✅ Cursor com agents habilitados
- ✅ Python 3.10+ nos ambientes target
- ✅ TaskLink API endpoints acessíveis

## 📊 Success Metrics

- **Adoption Rate:** 80% dos devs usando orchestration agents em 30 dias
- **Quality Improvement:** 25% redução em code review feedback
- **Efficiency:** 40% redução no tempo de implementation features
- **Compliance:** 100% audit trails para changes enterprise

---

**Created:** 2026-05-15  
**Last Updated:** 2026-05-15  
**Status:** 🟡 Planning - Ready for execution  
**Priority:** 🔴 High - Core agentic capability  
**Owner:** TaskLink Harness Team
