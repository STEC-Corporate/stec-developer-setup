# 🚀 Power User Guide — Orquestração Avançada

**Ambiente de desenvolvimento com 230 agents + 316 skills + hooks inteligentes**

## 🎯 Visão Geral

Você agora possui o ambiente de desenvolvimento mais avançado disponível:
- **230 agents especializados** coordenados automaticamente
- **316 skills** distribuídas por stack e domínio
- **Hooks inteligentes** para detecção de contexto
- **Quality gates automáticos** em paralelo
- **Pipeline de release** orquestrado

## 🔧 Como Usar

### 1. Comando PowerMode (Recomendado)
```bash
# No Claude CLI
/powermode implementar sistema de autenticação JWT com testes

# Resultado automático:
- Detecta stack (NestJS + TypeScript)
- Invoca nestjs-especialista + typescript-estrito
- Executa quality gates em paralelo
- Aplica correções automaticamente
- Gera release coordenada
```

### 2. Smart Orchestrator (Automático)
Qualquer mensagem com palavras-chave dispara orquestração:
```
"implementar feature X" → Recomenda agents automaticamente
"refatorar componente Y" → Sugere pipeline de qualidade
"corrigir bug Z" → Orquestra debug + validação
```

### 3. Task Tool Direto
```javascript
// Para controle total
Task(subagent_type="sdd-orquestrador", 
     description="estruturar feature completa")

Task(subagent_type="qualidade-programa-orquestrador",
     description="validar conformidade arquitetural")
```

## 📋 Fluxos Principais

### 🆕 Nova Feature (Complexidade Alta)
```
1. /powermode implementar [feature]
   ↓
2. sdd-orquestrador → estrutura + planejamento
   ↓ 
3. Especialista da stack → implementação
   ↓
4. Quality gates paralelos → validação
   ↓
5. cicd-validar-release → deployment
```

### 🔧 Refatoração
```
1. Smart orchestrator detecta → "refatorar"
   ↓
2. orquestracao-qualidade-codigo → análise
   ↓
3. code-aplicar-correcoes → auto-fix
   ↓
4. Validação → conformidade
```

### 🐛 Bugfix
```
1. "corrigir bug [descrição]"
   ↓
2. debug-analista-de-bugs → diagnóstico
   ↓
3. Especialista da stack → correção
   ↓
4. testes-executor → validação
```

## 🛡️ Quality Gates Automáticos

### Sempre Executados:
- **Arquitetura:** Clean Architecture + DDD
- **Qualidade:** Linting + TypeScript strict
- **Segurança:** Vulnerabilidades + hardening
- **Testes:** Cobertura + end-to-end

### Bloqueantes (param para produção):
- Vulnerabilidades críticas de segurança
- Falhas de testes em paths críticos
- Violações de arquitetura em bounded contexts

## 🔗 Roteamento por Stack

| Stack | Agents Primários | Suporte |
|-------|------------------|---------|
| **React/Next.js** | react-especialista, nextjs-especialista | typescript-estrito, framework-react-guia |
| **NestJS** | nestjs-especialista, nestjs-clean-arch-solid | framework-nestjs-guia, typescript-estrito |
| **Java/Spring** | java-especialista, framework-spring-guia | stack-java-guia, arquitetura-padroes-ddd |
| **Python/FastAPI** | python-especialista, framework-fastapi-guia | stack-python-guia |
| **Kotlin** | kotlin-especialista, framework-kmp-guia | - |
| **React Native** | react-native-especialista, framework-react-native-guia | typescript-estrito |
| **DevOps** | terraform-arquiteto, kubernetes-especialista, infra-aws | docker-seguranca |

## 📊 Monitoramento e Logs

### Hooks em Ação:
```bash
# Ver logs do smart orchestrator
tail -f ~/.claude/logs/smart-orchestrator.log

# Ver histórico de task completion  
tail -f ~/.claude/logs/task-completion.log
```

### Métricas Disponíveis:
- Agents invocados por sessão
- Quality gates executados
- Auto-correções aplicadas  
- Stack detection accuracy
- Release pipeline success rate

## 💡 Power User Tips

### 1. Parallelização Máxima
```bash
# Em vez de sequencial:
❌ corrigir bug → testar → deploy

# Use orquestração paralela:
✅ /powermode corrigir bug [descrição] + pipeline completo
```

### 2. Context-Aware Commands
```bash
# Claude detecta automaticamente:
- Stack do projeto (package.json, pom.xml, etc.)
- Tipo de tarefa (implementar vs refatorar vs bugfix)
- Complexidade (simples vs enterprise)
```

### 3. Quality-First Development
```bash
# Todos os outputs passam por:
- Arquitetura validada
- Testes adequados
- Segurança verificada
- Performance otimizada
```

### 4. Release Automation
```bash
# Auto-commit + changelog + push quando:
- Quality gates passam
- Tarefas marcadas como completed
- Código sem erros críticos
```

### 5. Emergency Override
```bash
# Se agents não responderem (Claude CLI limitation):
- Fallback para skills equivalentes
- Recomendações manuais listadas
- Implementação gradual sugerida
```

## 🚨 Troubleshooting

### Agents não encontrados?
- **Claude CLI:** Use Task tool, não @agents
- **Cursor/Codex:** Agents funcionam nativamente
- **Fallback:** Skills em ~/.claude/skills/ sempre disponíveis

### Hooks não disparando?
```bash
# Verificar configuração
cat ~/.claude/settings.json | jq '.hooks'

# Testar manualmente
bash ~/.claude/hooks/smart-orchestrator.sh "implementar teste"
```

### Quality gates bloqueados?
```bash
# Ver detalhes da falha
cat ~/.claude/logs/quality-gates.log

# Override temporal (emergência)
export CLAUDE_OVERRIDE_GATES=true
```

## 📈 Próximos Passos

1. **Testar PowerMode:** `/powermode implementar hello world`
2. **Configurar MCP:** Para agents via REST em CI/CD
3. **Personalizar gates:** Ajustar quality_gates no settings.json
4. **Monitor métricas:** Acompanhar eficiência da orquestração

## 🏆 Resultado Final

Você possui um ambiente onde:
- **Uma instrução** dispara pipelines completos
- **230 especialistas** coordenados automaticamente  
- **Quality enterprise** garantida por padrão
- **Zero configuração manual** para desenvolvimento
- **Release pipeline** orquestrado fim-a-fim

**Este é o estado-da-arte em desenvolvimento assistido por IA.**

---

**Criado:** 2026-05-13  
**Versão:** Power User v1.0  
**Agents:** 230 | **Skills:** 316 | **Hooks:** Inteligentes