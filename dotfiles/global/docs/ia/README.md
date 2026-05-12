# 🤖 AI - Configurações para Inteligência Artificial

> **Documentos que guiam como a IA deve trabalhar no Modelo**

---

## 📋 O que contém esta pasta?

Esta pasta contém **configurações, princípios e scripts** para que Inteligência Artificial trabalhe de forma **consistente** e **alinhada** com a visão da Modelo.

---

## Onde estão as listas de Agents e Skills?

Inventário **atualizado para os 5 projetos** (Template, Frontend Oficial, BFF, APIs, Infrastructure). Listas nominais e descrições em [subagents.md](./subagents.md) e [skills-recomendadas.md](./skills-recomendadas.md).

| Tipo | Documentação nesta pasta (`.cursor/docs/ia`) | No repositório |
|------|---------------------------|----------------|
| **Agents** | [**subagents.md**](./subagents.md) — inventário por projeto e lista dos 12 agents do Template | `.cursor/agents/` (cada agent em um `.md`); ver [.cursor/agents/README.md](../../.cursor/agents/README.md) |
| **Skills** | [**skills-recomendadas.md**](./skills-recomendadas.md) — inventário por projeto e referência das 18 skills do Template | [**.cursor/skills/README.md**](../../.cursor/skills/README.md) (inventário canônico); arquivos: `.cursor/skills/<nome>/SKILL.md` |

---

## Plataforma Modelo: 5 projetos

Cada projeto da plataforma tem **agents** e **skills** personalizados na raiz: `.cursor/agents/` e `.cursor/skills/`. O fluxo de referência é **Template → Frontend Oficial → BFF → API** (detalhes em [.cursorrules](../../.cursorrules)).

| Projeto | Papel | Agents | Skills | Caminhos |
|---------|--------|--------|--------|----------|
| **Template** (modelo-template-frontend) | Referência de fluxos, telas, specs de API e migração para o Frontend Oficial | 12 | 18 | `.cursor/agents/`, `.cursor/skills/` (este repo) |
| **Frontend Oficial** (modelo-frontend) | App em produção; recebe código do Template por sprint | 10 | 5 | `.cursor/agents/`, `.cursor/skills/` no repo do oficial |
| **BFF** (modelo-bff) | Orquestração e adaptação para o frontend; mapeamento BFF ↔ API | 4 | 4 | `.cursor/agents/`, `.cursor/skills/` no repo do BFF |
| **APIs** (modelo-api) | Domínio e regras de negócio; contratos consumidos pelo BFF | 14 | 27 | `.cursor/agents/`, `.cursor/skills/` no repo das APIs |
| **Infrastructure** (modelo-infrastructure) | Infraestrutura e DevOps; CI/CD, ambientes, deploy e monitoramento | 7 | 7 | `.cursor/agents/`, `.cursor/skills/` no repo da infraestrutura |

Repositórios GitHub: [ITModelo](https://github.com/ITModelo) — modelo-template-frontend, modelo-frontend, modelo-bff, modelo-api, modelo-infrastructure.

Lista dos projetos com paths mapeados: [projetos-plataforma-paths-jesus.md](../referencia/migracao/projetos-plataforma-paths-jesus.md).

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`. Os 5 projetos alimentam o Modelo; projetos template copiam do Modelo (não dos 5 projetos). Fluxo A: 5 projetos → Modelo. Fluxo B: Modelo → projeto template. Ver [template-replication-flow.md](./template-replication-flow.md).

Inventário completo e lista nominal de agents/skills por projeto: [subagents.md](./subagents.md) (agents) e [skills-recomendadas.md](./skills-recomendadas.md) (skills). Fluxo e mapeamento detalhado: [.cursorrules](../../.cursorrules).

---

## 📁 Estrutura

```
.cursor/docs/ia/
├── README.md                    # Este arquivo
├── guardrails.md                # ⚠️ CRÍTICO - Princípios invioláveis
├── prompts.md                   # Prompts essenciais para IA
├── subagents.md                 # Lista completa de agents (inventário por projeto + Template)
├── subagents-exemplos-praticos.md # Exemplos práticos de uso dos agents
├── skills-recomendadas.md       # Lista completa de skills (inventário por projeto + Template)
│
├── strategic/                   # 🆕 Estratégia e Validação
│   ├── strategic-advisor-use-cases.md
│   ├── strategic-validation-dashboard.md
│   ├── north-star-impact-analysis.md
│   ├── multi-project-impact-analysis.md
│   └── guardrails-validation-process.md
│
├── financial/                   # 🆕 Estratégia Financeira
│   ├── financial-projections.md
│   ├── financial-sustainability.md
│   ├── revenue-model.md
│   ├── cost-analysis.md
│   └── feature-roi-analysis.md
│
├── commercial/                  # 🆕 Estratégia Comercial
│   ├── conversion-funnel.md
│   ├── conversion-optimization.md
│   ├── commercial-metrics.md
│   ├── prospecting-strategy.md
│   └── qualification-process.md
│
├── marketing/                   # 🆕 Estratégia de Marketing
│   ├── marketing-metrics.md
│   ├── marketing-channels.md
│   ├── content-strategy.md
│   ├── market-segmentation.md
│   └── brand-positioning.md
│
├── competitive/                 # 🆕 Análise Competitiva
│   ├── competitive-positioning.md
│   ├── competitive-differentiation.md
│   ├── competitive-benchmarking.md
│   ├── competitive-defense-strategy.md
│   ├── competitive-threats.md
│   ├── competitors-identification.md
│   ├── current-competitive-moats.md
│   └── new-competitive-moats.md
│
├── moats/                       # 🆕 Moats e Network Effects
│   ├── network-effects-strategy.md
│   └── operational-lock-in-strategy.md
│
├── go-to-market/                # 🆕 Go-to-Market
│   ├── launch-strategy.md
│   ├── market-expansion-strategy.md
│   ├── growth-scalability-strategy.md
│   ├── strategic-partnerships.md
│   └── internationalization-strategy.md
│
├── innovation/                  # 🆕 Inovação e IA
│   ├── ai-strategy.md
│   ├── innovation-roadmap.md
│   ├── technology-experimentation.md
│   └── automation-inventory.md
│
├── quality/                     # 🆕 Qualidade e Performance
│   ├── quality-metrics.md
│   ├── testing-strategy-complete.md
│   ├── performance-validation-strategy.md
│   ├── continuous-optimization.md
│   └── monitoring-observability-strategy.md
│
├── market-analysis/              # 🆕 Análise de Mercado
│   └── market-analysis.md
│
└── playbooks/                   # Scripts de decisão
    ├── feature-prioritization.md
    ├── conflict-resolution.md
    ├── ranking-adjustment.md
    └── communication-guidelines.md
```

Listas completas: **agents** em [subagents.md](./subagents.md), **skills** em [skills-recomendadas.md](./skills-recomendadas.md) e [.cursor/skills/README.md](../../.cursor/skills/README.md).

---

## 🛡️ Guardrails (MAIS IMPORTANTE)

**Arquivo**: `guardrails.md`

**O que é**: Princípios filosóficos e estratégicos **invioláveis** que a IA (e toda equipe) DEVE respeitar.

**Quando ler**: 
- ✅ Antes de implementar QUALQUER feature
- ✅ Antes de tomar QUALQUER decisão arquitetural
- ✅ Quando IA sugere algo e você tem dúvida
- ✅ Onboarding de novos desenvolvedores

**Conteúdo principal**:
- ❌ **NUNCA**: Destaque pago, manipulação de ranking, misturar perfis
- ✅ **SEMPRE**: Dados reais, transparência, Clean Architecture

**Por quê é crítico**: Garante que IA não sugira features que violem princípios core da Modelo. Ao implementar ou documentar features, consultar `docs/referencia/migracao/`, `docs/fluxo/api-specifications/`, `user-flows/`, `business-rules/`, `.cursor/plans/` e `src/` quando relevante.

---

## 💬 Prompts

**Arquivo**: `prompts.md`

**O que é**: Prompts prontos para usar com IA ao trabalhar no Modelo.

**Quando usar**:
- Ao pedir IA para criar nova feature
- Ao pedir IA para revisar código
- Ao pedir IA para documentar algo
- Ao pedir IA para tomar decisão

**Exemplo de prompt**:
```markdown
# Contexto: Modelo

GUARDRAILS OBRIGATÓRIOS:
- NUNCA implementar destaque pago para músicos
- SEMPRE basear ranking em dados reais
- SEMPRE seguir Clean Architecture

TAREFA: [sua tarefa aqui]
```

---

## 🤖 Agents (SubAgentes)

**Lista completa (inventário por projeto + 12 agents do Template):** [subagents.md](./subagents.md). Arquivos dos agents: `.cursor/agents/` (ver [.cursor/agents/README.md](../../.cursor/agents/README.md)).

**Exemplos práticos:** [subagents-exemplos-praticos.md](./subagents-exemplos-praticos.md)

**O que é**: Assistentes de IA especializados para delegar tarefas complexas. **Os listados abaixo são do Template**; cada um dos 5 projetos tem seus próprios agents em `.cursor/agents/` (inventário completo em subagents.md).

**Quando usar**: Tarefas complexas com isolamento de contexto, validações especializadas (Clean Architecture, TypeScript, Guardrails), verificação independente do trabalho.

**Agents do Template** (12):
- plan-creator, plan-executor, verifier, guardrails-checker, clean-architecture-validator, feature-completeness-verifier
- typescript-strict-enforcer, documentation-generator, erp-crm-specialist, security-auditor, debugger, test-runner

**Exemplo de uso**:
```
> /guardrails-checker validate this feature proposal
> /verifier confirm the auth flow is complete
> /test-runner execute tests for the new feature
```

**Mais detalhes**: [subagents.md](./subagents.md) (inventário por projeto) | [subagents-exemplos-praticos.md](./subagents-exemplos-praticos.md) (exemplos)

---

## 🎯 Strategic Advisor (CEO)

**Arquivo**: `.cursor/agents/strategic-advisor.md`

**O que é**: Agente CEO estratégico, proativo e preditivo que interpreta conversas, analisa contexto estratégico, toma decisões sobre skills, stack, mercado e IA. Valida features contra North Star Metric e Guardrails antes da implementação.

**Quando usar**:
- Análise estratégica de features/propostas
- Decisões sobre stack tecnológico
- Avaliação de necessidade de skills
- Monitoramento de tendências de mercado
- Identificação de oportunidades de IA
- Validação contra guardrails e princípios
- Cálculo de impacto na North Star Metric
- Análise de impacto multi-projeto
- Qualquer momento em que análise estratégica seja necessária

**Capacidades principais**:
- **Análise Estratégica**: Interpreta conversas, analisa impacto na North Star, valida contra Guardrails
- **Decisões Técnicas**: Avalia skills, stack, tendências de mercado, oportunidades de IA
- **Predições**: Impacto estratégico, técnico, de negócio e multi-projeto
- **Recomendações**: Próximos passos, documentos a criar, ADRs a revisar, priorização

**Comportamento proativo**:
- Monitora contexto da conversa continuamente
- Identifica padrões e necessidades não expressas
- Antecipa perguntas baseado em tópicos, decisões recentes, mudanças no código
- Sugere melhorias, validações e alertas sem ser solicitado

**Exemplo de uso**:
```
> /strategic-advisor analisar esta proposta de feature
> /strategic-advisor validar impacto desta decisão nos 5 projetos
> /strategic-advisor calcular impacto na North Star desta feature
```

**Skills de suporte**:
- [calculate-north-star-impact](../../.cursor/skills/calculate-north-star-impact/SKILL.md) - Calcula impacto na North Star Metric
- [validate-multi-project-impact](../../.cursor/skills/validate-multi-project-impact/SKILL.md) - Analisa impacto nos 5 projetos

**Skills de suporte**:
- [calculate-north-star-impact](../../.cursor/skills/calculate-north-star-impact/SKILL.md) - Calcula impacto na North Star Metric
- [validate-multi-project-impact](../../.cursor/skills/validate-multi-project-impact/SKILL.md) - Analisa impacto nos 5 projetos
- [auto-validate-guardrails](../../.cursor/skills/auto-validate-guardrails/SKILL.md) - Validação automática de guardrails

**Documentos relacionados**:
- [north-star-impact-analysis.md](./strategic/north-star-impact-analysis.md) - Histórico de análises de impacto
- [multi-project-impact-analysis.md](./strategic/multi-project-impact-analysis.md) - Histórico de decisões multi-projeto
- [guardrails-validation-process.md](./strategic/guardrails-validation-process.md) - Processo de validação de guardrails
- [strategic-validation-dashboard.md](./strategic/strategic-validation-dashboard.md) - Dashboard de validações estratégicas
- [strategic-advisor-use-cases.md](./strategic/strategic-advisor-use-cases.md) - Casos de uso do Strategic Advisor
- [Planos Estratégicos CEO](../../.cursor/plans/CEO/README.md) - Planos estratégicos completos

**Mais detalhes**: [Strategic Advisor Agent](../../.cursor/agents/strategic-advisor.md) | [Planos CEO](../../.cursor/plans/CEO/README.md)

---

## 💰 Análise Financeira Estratégica

**Skill**: `.cursor/skills/evaluate-financial-strategy/SKILL.md`

**O que é**: Sistema completo de análise financeira estratégica: modelo de receita, projeções financeiras, análise de custos, ROI de features e validação de sustentabilidade financeira.

**Quando usar**:
- Ao avaliar modelo de receita
- Ao projetar crescimento financeiro
- Ao analisar ROI de features
- Ao tomar decisões financeiras estratégicas
- Periodicamente (mensal/trimestral) para acompanhamento
- Ao validar sustentabilidade financeira
- **Custos operacionais** (jurídico, contábil, pagamentos, break-even): consultar [ADR-020](../decisoes/adr-020-operational-costs-sustainability.md)

**Documentos relacionados**:
- [**ADR-020**](../decisoes/adr-020-operational-costs-sustainability.md) - **Fonte de verdade**: Custos operacionais (jurídico, contábil, pagamentos), comparação comissões vs mensalidade, cronograma, uso de IA
- [operational-requirements-analysis.md](./financial/operational-requirements-analysis.md) - Análise detalhada: sistema de pagamentos, D&O/responsabilidade civil, KYC, ferramentas de suporte
- [feature-roi-analysis.md](./financial/feature-roi-analysis.md) - Análise de ROI de features implementadas e propostas
- [revenue-model.md](./financial/revenue-model.md) - Modelo de receita detalhado da plataforma
- [financial-projections.md](./financial/financial-projections.md) - Projeções financeiras para 3, 6 e 12 meses
- [cost-analysis.md](./financial/cost-analysis.md) - Análise detalhada de custos (infraestrutura, desenvolvimento, operação; base: ADR-020)
- [financial-sustainability.md](./financial/financial-sustainability.md) - Validação de sustentabilidade financeira (break-even: ADR-020)

**Princípios fundamentais**:
- ✅ Plataforma 100% gratuita para usuários (ADR-015)
- ✅ Receita única: Comissões sobre contratações bem-sucedidas
- ✅ Taxa progressiva: 10% → 5% (diminui conforme valor aumenta)
- ❌ NUNCA planos premium para músicos (guardrail)
- ✅ Validação contra North Star Metric

**Mais detalhes**: [Skill de Análise Financeira](../../.cursor/skills/evaluate-financial-strategy/SKILL.md) | [Modelo de Receita](./financial/revenue-model.md)

---

## 💼 Estratégia Comercial

**Skill**: `.cursor/skills/evaluate-sales-strategy/SKILL.md`

**O que é**: Sistema completo de estratégia comercial: funil de conversão, estratégia de vendas, prospecção, qualificação, métricas comerciais e otimização de conversão.

**Quando usar**:
- Ao analisar funil de conversão
- Ao otimizar vendas
- Ao projetar crescimento
- Periodicamente (mensal/trimestral) para acompanhamento
- Ao identificar gargalos no funil
- Ao analisar estratégia de prospecção
- Ao qualificar leads

**Documentos relacionados**:
- [conversion-funnel.md](./commercial/conversion-funnel.md) - Mapeamento completo do funil de conversão
- [prospecting-strategy.md](./commercial/prospecting-strategy.md) - Estratégia de prospecção por perfil
- [qualification-process.md](./commercial/qualification-process.md) - Processo de qualificação de leads
- [commercial-metrics.md](./commercial/commercial-metrics.md) - Métricas comerciais e targets
- [conversion-optimization.md](./commercial/conversion-optimization.md) - Estratégias e experimentos de otimização

**Princípios fundamentais**:
- ✅ Foco em qualidade (leads qualificados)
- ✅ Personalização por perfil (músicos, contratantes, outros)
- ✅ Mensuração contínua (dados para decisões)
- ✅ Otimização iterativa (teste e aprendizado)
- ✅ Alinhamento com North Star Metric

**Mais detalhes**: [Skill de Estratégia Comercial](../../.cursor/skills/evaluate-sales-strategy/SKILL.md) | [Funil de Conversão](./commercial/conversion-funnel.md)

---

## 📢 Estratégia de Marketing

**Skill**: `.cursor/skills/evaluate-marketing-strategy/SKILL.md`

**O que é**: Sistema completo de estratégia de marketing: posicionamento de marca, segmentação de mercado, estratégia de conteúdo, canais de marketing e métricas de marketing.

**Quando usar**:
- Ao definir estratégia de marketing
- Ao criar campanhas
- Ao analisar ROI de marketing
- Periodicamente (mensal/trimestral) para acompanhamento
- Ao validar posicionamento de marca
- Ao analisar segmentação de mercado
- Ao otimizar canais de marketing

**Documentos relacionados**:
- [brand-positioning.md](./marketing/brand-positioning.md) - Posicionamento de marca completo
- [market-segmentation.md](./marketing/market-segmentation.md) - Segmentação de mercado por perfil
- [content-strategy.md](./marketing/content-strategy.md) - Estratégia de conteúdo e calendário editorial
- [marketing-channels.md](./marketing/marketing-channels.md) - Canais de marketing e ROI por canal
- [marketing-metrics.md](./marketing/marketing-metrics.md) - Métricas de marketing e targets

**Princípios fundamentais**:
- ✅ Posicionamento: "Modelo - Onde Artistas se Conectam"
- ✅ Fronteira: Artes Performáticas (música, dança, teatro, cinema, performance)
- ✅ Validação contra Guardrails (nunca prometer destaque pago)
- ✅ Alinhamento com North Star Metric
- ✅ Mensagem personalizada por segmento

**Mais detalhes**: [Skill de Marketing](../../.cursor/skills/evaluate-marketing-strategy/SKILL.md) | [Posicionamento de Marca](./marketing/brand-positioning.md)

---

## 🏆 Análise Competitiva

**Skill**: `.cursor/skills/evaluate-competitive-landscape/SKILL.md`

**O que é**: Sistema completo de análise competitiva: identificação de concorrentes, benchmarking, análise de diferenciação, análise de mercado e posicionamento competitivo.

**Quando usar**:
- Ao analisar mercado competitivo
- Ao definir estratégia competitiva
- Ao identificar oportunidades de mercado
- Periodicamente (trimestral) para acompanhamento
- Ao validar diferenciação competitiva
- Ao analisar ameaças e oportunidades

**Documentos relacionados**:
- [competitors-identification.md](./competitive/competitors-identification.md) - Identificação de concorrentes diretos, indiretos e alternativas
- [competitive-benchmarking.md](./competitive/competitive-benchmarking.md) - Comparação detalhada em features, preços, UX e posicionamento
- [competitive-differentiation.md](./competitive/competitive-differentiation.md) - Diferenciais, vantagens competitivas e moats
- [market-analysis.md](./market-analysis/market-analysis.md) - Tamanho do mercado, crescimento, tendências e oportunidades
- [competitive-positioning.md](./competitive/competitive-positioning.md) - Posição atual, oportunidades, ameaças e estratégia

**Princípios fundamentais**:
- ✅ Pioneirismo no segmento (primeiro marketplace de artes performáticas)
- ✅ Diferenciação baseada em mérito e transparência (não destaque pago)
- ✅ Network effect natural entre artistas
- ✅ Posicionamento forte e defensável
- ✅ Validação contra Guardrails e Fronteira

**Mais detalhes**: [Skill de Análise Competitiva](../../.cursor/skills/evaluate-competitive-landscape/SKILL.md) | [Diferenciação Competitiva](./competitive/competitive-differentiation.md)

---

## 🤖 Inovação e IA

**Skill**: `.cursor/skills/identify-ai-opportunities/SKILL.md`

**O que é**: Sistema completo de inovação e IA: identificação de oportunidades, roadmap de inovação, estratégia de IA, inventário de automações e experimentação tecnológica.

**Quando usar**:
- Ao identificar processos repetitivos
- Ao considerar automações
- Ao revisar eficiência de processos
- Periodicamente (trimestral) para revisão contínua
- Ao planejar novos agents/skills
- Ao avaliar ROI de automações

**Documentos relacionados**:
- [innovation-roadmap.md](./innovation/innovation-roadmap.md) - Roadmap completo de inovação e IA
- [ai-strategy.md](./innovation/ai-strategy.md) - Estratégia completa de IA (agents, skills, roadmap)
- [automation-inventory.md](./innovation/automation-inventory.md) - Inventário completo de automações
- [technology-experimentation.md](./innovation/technology-experimentation.md) - Registro de experimentações tecnológicas

**Princípios fundamentais**:
- ✅ Priorização por ROI (impacto vs esforço)
- ✅ Validação contra Guardrails em todas as automações
- ✅ Foco em eficiência e qualidade
- ✅ Experimentação contínua
- ✅ Métricas de sucesso claras

**Mais detalhes**: [Skill de Identificação de Oportunidades](../../.cursor/skills/identify-ai-opportunities/SKILL.md) | [Roadmap de Inovação](./innovation/innovation-roadmap.md)

---

## 🛡️ Moats e Vantagem Competitiva

**Skill**: `.cursor/skills/evaluate-competitive-advantage/SKILL.md`

**O que é**: Sistema completo de análise e fortalecimento de moats competitivos: análise de moats atuais, identificação de ameaças, estratégia de defesa, criação de novos moats, network effects e lock-in operacional.

**Quando usar**:
- Ao analisar vantagem competitiva sustentável
- Ao desenvolver estratégia de defesa
- Ao identificar oportunidades de fortalecimento
- Periodicamente (trimestral) para acompanhamento
- Ao avaliar ameaças competitivas
- Ao planejar criação de novos moats

**Documentos relacionados**:
- [current-competitive-moats.md](./competitive/current-competitive-moats.md) - Análise completa dos moats atuais
- [competitive-threats.md](./competitive/competitive-threats.md) - Identificação de ameaças competitivas
- [competitive-defense-strategy.md](./competitive/competitive-defense-strategy.md) - Estratégia completa de defesa
- [new-competitive-moats.md](./competitive/new-competitive-moats.md) - Novos moats a criar
- [network-effects-strategy.md](./moats/network-effects-strategy.md) - Estratégia de network effects
- [operational-lock-in-strategy.md](./moats/operational-lock-in-strategy.md) - Estratégia de lock-in operacional

**Princípios fundamentais**:
- ✅ Moats baseados em mérito e transparência (não coerção)
- ✅ Network effect natural entre artistas
- ✅ Lock-in ético baseado em valor
- ✅ Validação contra Guardrails em todas as estratégias
- ✅ Foco em vantagem competitiva sustentável

**Mais detalhes**: [Skill de Análise de Moats](../../.cursor/skills/evaluate-competitive-advantage/SKILL.md) | [Moats Atuais](./competitive/current-competitive-moats.md)

---

## 🚀 Go-to-Market

**Skill**: `.cursor/skills/create-go-to-market-strategy/SKILL.md`

**O que é**: Sistema completo de estratégia go-to-market: estratégia de lançamento, expansão de mercado, crescimento e escalabilidade, parcerias estratégicas e internacionalização.

**Quando usar**:
- Ao planejar lançamento da plataforma
- Ao expandir para novos segmentos ou geografias
- Ao buscar crescimento acelerado
- Periodicamente (trimestral) para revisão estratégica
- Ao avaliar parcerias estratégicas
- Ao planejar internacionalização (futuro)

**Documentos relacionados**:
- [launch-strategy.md](./go-to-market/launch-strategy.md) - Estratégia completa de lançamento (4 fases)
- [market-expansion-strategy.md](./go-to-market/market-expansion-strategy.md) - Estratégia de expansão de mercado
- [growth-scalability-strategy.md](./go-to-market/growth-scalability-strategy.md) - Estratégia de crescimento e escalabilidade
- [strategic-partnerships.md](./go-to-market/strategic-partnerships.md) - Estratégia de parcerias estratégicas
- [internationalization-strategy.md](./go-to-market/internationalization-strategy.md) - Estratégia de internacionalização (futuro)

**Princípios fundamentais**:
- ✅ Lançamento por fases (Música → Dança → Teatro → Cinema)
- ✅ Validação antes de expansão (métricas de sucesso)
- ✅ Crescimento orgânico primeiro, acelerado depois
- ✅ Escalabilidade técnica considerando 5 projetos
- ✅ Parcerias estratégicas com benefício mútuo
- ✅ Validação contra Guardrails e North Star

**Mais detalhes**: [Skill de Go-to-Market](../../.cursor/skills/create-go-to-market-strategy/SKILL.md) | [Estratégia de Lançamento](./go-to-market/launch-strategy.md)

---

## ✅ Qualidade e Performance

**Skill**: `.cursor/skills/evaluate-quality-performance/SKILL.md`

**O que é**: Sistema completo de qualidade e performance: estratégia de testes completa, validação de performance, otimização contínua, monitoramento e observabilidade, e métricas de qualidade.

**Quando usar**:
- Durante code review
- Ao analisar qualidade de código
- Ao otimizar performance
- Periodicamente (semanal/mensal) para monitoramento
- Ao identificar problemas de performance
- Ao validar conformidade com padrões

**Documentos relacionados**:
- [testing-strategy-complete.md](./quality/testing-strategy-complete.md) - Estratégia completa de testes (por camada e projeto)
- [performance-validation-strategy.md](./quality/performance-validation-strategy.md) - Estratégia de validação de performance
- [continuous-optimization.md](./quality/continuous-optimization.md) - Estratégia de otimização contínua
- [monitoring-observability-strategy.md](./quality/monitoring-observability-strategy.md) - Estratégia de monitoramento e observabilidade
- [quality-metrics.md](./quality/quality-metrics.md) - Métricas completas de qualidade

**Princípios fundamentais**:
- ✅ Cobertura mínima de testes: 75%+ geral, 80%+ unit, 70%+ integration, 60%+ E2E
- ✅ Web Vitals: LCP < 2.5s, CLS < 0.1, FID < 100ms, FCP < 1.8s
- ✅ Conformidade com Clean Architecture e TypeScript Strict
- ✅ Monitoramento contínuo de métricas técnicas e de negócio
- ✅ Otimização contínua baseada em dados
- ✅ Validação contra Guardrails e padrões

**Mais detalhes**: [Skill de Qualidade e Performance](../../.cursor/skills/evaluate-quality-performance/SKILL.md) | [Estratégia de Testes](./quality/testing-strategy-complete.md)

---

## 📖 Playbooks

**Pasta**: `playbooks/`

**O que é**: Scripts de decisão para situações comuns.

**Quando usar**: Quando você (ou IA) precisa tomar decisão e quer ser consistente.

### Playbooks Disponíveis

#### 1. `feature-prioritization.md`
**Quando usar**: Decidir qual feature implementar primeiro

**Exemplo**:
```
SE feature impacta North Star Metric > 10%
E alinha com OKR do trimestre
ENTÃO prioridade ALTA
```

#### 2. `conflict-resolution.md`
**Quando usar**: Músico vs contratante em conflito, dados inconsistentes, etc.

**Exemplo**:
```
SE conflito é sobre pagamento
E valor < R$ 500
ENTÃO sugerir negociação direta
SENÃO escalar para mediação
```

#### 3. `ranking-adjustment.md`
**Quando usar**: Decidir se/como ajustar algoritmo de ranking

**Exemplo**:
```
SE mudança aumenta transparência
E não permite manipulação
ENTÃO validar com dados reais
```

#### 4. `communication-guidelines.md`
**Quando usar**: Redigir notificações, emails, mensagens do sistema

**Exemplo**:
```
SEMPRE usar tom profissional mas amigável
NUNCA prometer o que não pode cumprir
SEMPRE ser transparente sobre problemas
```

---

## 🎯 Skills

**Lista completa (inventário por projeto + 18 skills do Template):** [skills-recomendadas.md](./skills-recomendadas.md) e [.cursor/skills/README.md](../../.cursor/skills/README.md). Arquivos das skills: `.cursor/skills/<nome>/SKILL.md`.

Os outros projetos (Oficial, BFF, APIs, Infrastructure) têm suas próprias skills em `.cursor/skills/` no respectivo repositório. Referência e **quando usar** cada skill: [skills-recomendadas.md](./skills-recomendadas.md).

---

## 🔄 Como Usar com IA

### Passo 1: Sempre Incluir Guardrails

Ao pedir algo para IA, **sempre** comece com:

```markdown
# CONTEXTO: Modelo Platform

GUARDRAILS (OBRIGATÓRIO):
[copiar seção resumida de guardrails.md]

TAREFA:
[sua tarefa aqui]
```

---

### Passo 2: Usar Prompts Prontos

Consulte `prompts.md` para prompts já testados e validados.

**Exemplo**: Em vez de "crie uma feature de busca", use:
```markdown
[Prompt de prompts.md - Criar Feature]

FEATURE: Sistema de busca de músicos
GUARDRAILS APLICÁVEIS: 
- Ranking por dados reais
- Transparência total
```

---

### Passo 3: Consultar Playbook Relevante

Se a tarefa envolve decisão, consulte playbook apropriado:

- **Priorização** → `playbooks/feature-prioritization.md`
- **Conflito** → `playbooks/conflict-resolution.md`
- **Ranking** → `playbooks/ranking-adjustment.md`
- **Comunicação** → `playbooks/communication-guidelines.md`

---

### Passo 4: Validar Saída da IA

Antes de aceitar sugestão da IA, verificar:

- [ ] Não viola nenhum Guardrail?
- [ ] Segue playbook relevante?
- [ ] Alinha com North Star Metric?
- [ ] Documentado em fe-*.md?

---

## 🎯 Relação com Outros Documentos

```
docs/
├── ai/                          # ← VOCÊ ESTÁ AQUI
│   ├── guardrails.md           # Princípios invioláveis
│   ├── prompts.md              # Prompts prontos
│   └── playbooks/              # Scripts de decisão
│
├── decisoes/                    # Decisões tomadas
│   ├── adr-*.md                # Decisões arquiteturais (baseadas em guardrails)
│   └── decision-log.md         # Decisões menores (baseadas em playbooks)
│
├── planejamento/
│   ├── metrics/
│   │   └── north-star.md       # Métrica que guia tudo
│   └── okrs-kpis-q1-2026.md    # Metas do trimestre
│
└── fluxo/
    ├── business-rules/         # Regras específicas de negócio
    └── user-flows/             # Fluxos de usuário
```

**Como se relacionam**:

1. **Guardrails** → Define o QUE pode e o que NÃO pode
2. **Playbooks** → Define COMO tomar decisões consistentes
3. **ADRs** → Registra decisões arquiteturais (baseadas em guardrails)
4. **Decision Log** → Registra decisões menores (baseadas em playbooks)
5. **North Star** → Define direção principal
6. **OKRs/KPIs** → Define metas específicas

---

## 💡 Diferença Entre Documentos

| Documento | Propósito | Exemplo |
|-----------|-----------|---------|
| **Guardrails** | Princípios filosóficos | "NUNCA destaque pago" |
| **.cursorrules** | Regras técnicas de código | "SEMPRE usar TypeScript strict" |
| **Business Rules** | Regras de negócio | "Cachê mínimo é R$ 200" |
| **Playbooks** | Scripts de decisão | "SE X ENTÃO Y" |
| **ADRs** | Decisões arquiteturais | "Decidimos usar NextJS porque..." |
| **Decision Log** | Decisões menores | "Mudamos cor do botão" |

---

## 🚀 Quick Start para Desenvolvedores

### Se você é novo no projeto:

1. **Leia PRIMEIRO**: `guardrails.md` (15 minutos)
2. **Entenda**: `playbooks/` (escolha relevante para sua tarefa)
3. **Use**: `prompts.md` quando trabalhar com IA
4. **Consulte sempre**: Ao tomar decisões

### Se você é IA trabalhando no Modelo:

1. **SEMPRE carregue**: `guardrails.md` no contexto
2. **SEMPRE valide**: Sugestões contra guardrails
3. **SEMPRE consulte**: Playbook relevante antes de decisão
4. **SEMPRE documente**: Decisões em `decision-log.md`

---

## 📈 Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 20/01/2026 | Criação inicial (guardrails, prompts, 4 playbooks) |
| 1.1 | 27/01/2026 | Adição de SubAgentes personalizados |
| 1.2 | 03/02/2026 | Plataforma 4 projetos; inventário agents/skills (Template, Oficial, BFF, APIs) |
| 1.3 | 04/02/2026 | Adição do 5º projeto (Infrastructure); plataforma com 5 projetos |
| 1.4 | 06/02/2026 | Alinhamento com subagents e skills atualizados nos 5 projetos; tabela com nomes dos repos e links GitHub; referência única em `.cursor/docs/ia` |
| 1.5 | 08/02/2026 | Adição do Strategic Advisor (CEO) - agente estratégico proativo e preditivo; skills de suporte (calculate-north-star-impact, validate-multi-project-impact); documentos de análise estratégica |
| 1.6 | 08/02/2026 | Sistema de validação estratégica completo - skill auto-validate-guardrails; integração com Strategic Advisor; processo de validação documentado; dashboard de validações criado |
| 1.7 | 21/01/2026 | Sistema de análise financeira estratégica completo - skill evaluate-financial-strategy; análise de ROI de features; modelo de receita detalhado; projeções financeiras; análise de custos; validação de sustentabilidade |
| 1.8 | 21/01/2026 | Sistema de estratégia comercial completo - skill evaluate-sales-strategy; funil de conversão mapeado; estratégia de prospecção; processo de qualificação; métricas comerciais; otimização de conversão |
| 1.9 | 21/01/2026 | Sistema de estratégia de marketing completo - skill evaluate-marketing-strategy; posicionamento de marca; segmentação de mercado; estratégia de conteúdo; canais de marketing; métricas de marketing |
| 2.0 | 21/01/2026 | Sistema de análise competitiva completo - skill evaluate-competitive-landscape; identificação de concorrentes; benchmarking; diferenciação competitiva; análise de mercado; posicionamento competitivo |
| 2.1 | 21/01/2026 | Sistema de inovação e IA completo - skill identify-ai-opportunities; roadmap de inovação; estratégia de IA; inventário de automações; experimentação tecnológica |
| 2.2 | 21/01/2026 | Sistema de moats e vantagem competitiva completo - skill evaluate-competitive-advantage; análise de moats atuais; ameaças competitivas; estratégia de defesa; novos moats; network effects; lock-in operacional |
| 2.3 | 21/01/2026 | Sistema de go-to-market completo - skill create-go-to-market-strategy; estratégia de lançamento; expansão de mercado; crescimento e escalabilidade; parcerias estratégicas; internacionalização |
| 2.4 | 21/01/2026 | Sistema de qualidade e performance completo - skill evaluate-quality-performance; estratégia de testes completa; validação de performance; otimização contínua; monitoramento e observabilidade; métricas de qualidade |
| 2.5 | 11/02/2026 | Referência a ADR-020 (custos operacionais, sustentabilidade) na seção de análise financeira e em Links Úteis; fonte de verdade para jurídico, contábil, pagamentos e break-even |

**Próximas atualizações**: Conforme necessidade

---

## ❓ FAQ

### Quando devo consultar Guardrails?
**SEMPRE** antes de implementar feature nova ou tomar decisão arquitetural.

### Guardrails pode mudar?
Sim, mas RARAMENTE e com justificativa muito forte (via ADR).

### E se Guardrail conflita com requisito do cliente?
Guardrail prevalece. Se cliente pede destaque pago, recusamos (está nos guardrails).

### Posso criar novos Playbooks?
Sim! Se você identifica padrão de decisão recorrente, crie playbook e submeta para revisão.

### Guardrails vs .cursorrules?
- **Guardrails**: Princípios de PRODUTO e ESTRATÉGIA
- **.cursorrules**: Regras técnicas de CÓDIGO

Ambos são obrigatórios, mas para coisas diferentes.

---

## 📞 Links Úteis

- [**ADR-020**](../decisoes/adr-020-operational-costs-sustainability.md) - Custos operacionais e sustentabilidade (jurídico, contábil, pagamentos, CEO)
- [Guardrails](./guardrails.md) - **LEIA PRIMEIRO**
- [Prompts](./prompts.md) - Prompts prontos
- [SubAgentes (agents)](./subagents.md) — **Lista completa** de agents por projeto e 12 agents do Template
- [Exemplos Práticos](./subagents-exemplos-praticos.md) — Exemplos de uso dos agents do Template
- [Skills](./skills-recomendadas.md) — **Lista completa** de skills por projeto e 18 skills do Template
- [Playbooks](./playbooks/) - Scripts de decisão
- [North Star Metric](../planejamento/metrics/north-star.md) - Métrica principal
- [ADRs](../decisoes/README.md) - Decisões arquiteturais

---

**Mantenedor**: Frontend Template Creator  
**Última revisão**: 11/02/2026
