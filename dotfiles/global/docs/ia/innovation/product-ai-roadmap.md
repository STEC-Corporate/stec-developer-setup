# Roadmap de IA de Produto (Product AI) - SoundLink

> **Documento Estratégico**: Roadmap de IA aplicada ao **produto** (matching, carreira, negociação, mercado), distinto da IA de desenvolvimento (agents/skills). Alinha com defesa contra concorrente IA-first e com North Star.

---

## ⏱️ Contexto de Cronograma

**A SoundLink está em fase de construção em 2026.** Lançamento fim 2026/início 2027. Este roadmap aplica-se **pós-lançamento**, quando houver dados reais de contratações e avaliações. *Consulte ADR-020.*

---

## 🎯 Por que IA de Produto?

- **Ameaça**: Concorrente IA-first pode atuar como agente de contratação sem marketplace (ver `.cursor/docs/ia/competitive/competitive-threats.md` § 2.3).
- **Resposta**: Usar IA **melhor** que qualquer concorrente, com **dados proprietários** que IA externa não tem.
- **Princípio**: *"IA não mata marketplace; marketplace sem IA morre."*

---

## 🧠 Pilares da IA de Produto SoundLink

### 1. Matching Preditivo

**Objetivo**: Em vez de só busca manual, calcular **score de probabilidade de fechamento** e sugerir os melhores matches.

**Inputs** (contratante): tipo de evento, orçamento, data, região.

**Cálculo**:  
`MatchScore = f(Engajamento, Conversão, Reputação, FitFinanceiro)` — probabilidade de resposta, histórico de fechamento, compatibilidade com evento, avaliação média, disponibilidade real, ticket adequado ao orçamento.

**Entrega**: Ex.: "5 músicos com maior probabilidade de fechar" para o contratante.

**Dependência**: Dados de propostas, aceites, cancelamentos e avaliações na plataforma.

**Status**: ⏳ Pós-lançamento (dados suficientes)

---

### 2. Mentor de Carreira (Inteligência de Performance)

**Objetivo**: Dentro do painel do músico, insights que **IA externa não pode dar** por depender de dados internos.

**Exemplos de insights**:
- "Seu perfil converte X% das visitas em propostas."
- "Músicos similares na sua região cobram Y% a mais."
- "Você perde contratos por demora na resposta (tempo médio Z)."
- "Estilo com maior demanda na sua cidade: …"

**Métricas usadas**: taxa visualização→proposta, proposta→fechamento, tempo de resposta, receita média por evento, comparação regional.

**Dependência**: Histórico de visualizações, propostas e fechamentos por perfil/região/estilo.

**Status**: ⏳ Pós-lançamento

---

### 3. Inteligência de Preço (Pricing Intelligence)

**Objetivo**: Sugerir faixa de cachê com base em dados reais da plataforma.

**Inputs**: região, tipo de evento, data (sazonalidade), estilo, experiência comprovada.

**Saída**: Faixa sugerida (ex.: "Cachê médio na sua região para este tipo de evento: R$ X – R$ Y").

**Evita**: Subprecificação e frustração de contratantes por preços irreais.

**Dependência**: Histórico de contratações e valores por região/evento/estilo.

**Status**: ⏳ Pós-lançamento

---

### 4. Agente de Negociação Interno (Futuro)

**Objetivo**: Apoiar (não substituir) a negociação dentro da plataforma.

**Funcionalidades possíveis**: sugestão de contraproposta, geração de contrato padrão, cláusulas sugeridas, estimativa de risco de cancelamento, sugestão de upsell (ex.: DJ + banda).

**Guardrail**: Transparência total; usuário decide; sem "caixa preta".

**Status**: ⏳ Backlog (após matching e mentor validados)

---

### 5. Inteligência de Mercado (B2B / interno)

**Objetivo**: Transformar dados agregados em **ativo estratégico** (e eventual produto B2B).

**Exemplos**: mapa de calor por cidade, ticket médio por estilo, crescimento por região, demanda sazonal, taxa de cancelamento por tipo de evento.

**Uso interno**: Priorização de features, expansão geográfica, comunicação com usuários.

**Uso B2B (futuro)**: Relatórios para casas de evento, prefeituras, produtoras (ex.: "Relatório anual do mercado musical – Sul").

**Status**: ⏳ Pós-lançamento (volume de dados)

---

## 📅 Timeline Sugerido

| Fase | Período | Foco | Entregas |
|------|---------|------|----------|
| **Fundação** | 0–6 meses pós-lançamento | Dados e métricas | Instrumentação, coleta de propostas/aceites/avaliações |
| **Matching** | 6–12 meses | Matching preditivo | Score de fechamento, sugestão de top N músicos |
| **Carreira e Preço** | 12–18 meses | Mentor + Pricing | Insights no painel do músico; sugestão de cachê por contexto |
| **Mercado** | 18–24 meses | Inteligência de mercado | Dashboards internos; opcional: primeiro relatório B2B |
| **Negociação** | Backlog | Agente interno | Contraproposta, contrato, risco (com transparência) |

---

## 🛡️ Guardrails e North Star

- **Ranking e destaque**: Nenhuma IA pode alterar ranking por mérito (guardrails). Matching **sugere** ordem por probabilidade de fechamento com base em dados reais.
- **Transparência**: Não usar "caixa preta"; explicar fatores que influenciam sugestões (ex.: região, histórico, avaliação).
- **North Star**: Toda feature de IA de produto deve **aumentar contratações bem-sucedidas com avaliação ≥4 estrelas** (ver `docs/planejamento/metrics/north-star.md`).

---

## 📚 Referências

- **Ameaça IA-first**: `.cursor/docs/ia/competitive/competitive-threats.md` (§ 2.3)
- **Defesa e anti-fragilidade**: `.cursor/docs/ia/competitive/competitive-defense-strategy.md` (Estratégia 6)
- **Princípios estratégicos**: `.cursor/docs/ia/strategic/strategic-principles-ia-era.md`
- **Lock-in**: `.cursor/docs/ia/moats/operational-lock-in-strategy.md`
- **IA de desenvolvimento**: `.cursor/docs/ia/innovation/innovation-roadmap.md`, `.cursor/docs/ia/innovation/ai-strategy.md`

---

**Criado em**: 2026-02-26  
**Última atualização**: 2026-02-26  
**Revisão**: Trimestral  
**Responsável**: Strategic Advisor / Produto
