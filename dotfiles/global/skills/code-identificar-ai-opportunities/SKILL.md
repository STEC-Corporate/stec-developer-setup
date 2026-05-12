---
name: code-identificar-ai-opportunities
description: Identifica oportunidades de IA e automação: mapeia processos, avalia viabilidade técnica, prioriza por ROI e recomenda agentes/skills a criar. Use ao identificar processos repetitivos, considerar automações, revisar eficiência ou periodicamente (trimestral).
---

# Identificar Oportunidades de IA

## Quando Usar

- Ao identificar processos repetitivos
- Ao considerar automações
- Ao revisar eficiência de processos
- Periodicamente (trimestral) para revisão contínua
- Ao planejar novos agents/skills
- Ao avaliar ROI de automações

## Processo de Identificação

### 1. Mapear Processos Atuais

**Objetivo**: Entender processos existentes que podem ser automatizados

**Áreas a Mapear**:

#### Desenvolvimento
- Criação de componentes
- Configuração de rotas
- Setup de testes
- Configuração de integrações
- Geração de código boilerplate

**Fontes de Conhecimento**:
- `.cursor/agents/` - Agents existentes
- `.cursor/skills/` - Skills existentes
- `src/` - Código existente
- `docs/` - Documentação existente

---

#### Validação
- Validação de guardrails
- Validação de North Star Metric
- Validação de Clean Architecture
- Validação de padrões de código
- Validação de documentação

**Fontes de Conhecimento**:
- `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- `.cursorrules`
- Skills de validação existentes

---

#### Documentação
- Geração de documentação
- Atualização de documentação
- Criação de ADRs
- Criação de user stories
- Documentação de APIs

**Fontes de Conhecimento**:
- `docs/` - Documentação existente
- `docs/gestao-ideias/00-governanca/decisoes/` - ADRs existentes
- `docs/gestao-tarefas/03-especificacao-produto/` - Fluxos documentados

---

#### Testes
- Geração de testes
- Execução de testes
- Análise de cobertura
- Validação de testes
- Manutenção de testes

**Fontes de Conhecimento**:
- `tests/` - Testes existentes
- Configurações de teste
- Documentação de testes

---

### 2. Identificar Oportunidades de Automação

**Objetivo**: Identificar processos que podem ser automatizados com IA

#### Processos Repetitivos

**Critérios**:
- Executado frequentemente
- Padrão previsível
- Baixa variação
- Alto tempo de execução manual

**Exemplos**:
- Criação de componentes similares
- Configuração de rotas
- Setup de testes
- Geração de documentação
- Validação de padrões

---

#### Validações Automáticas

**Critérios**:
- Regras claras e definidas
- Pode ser verificada automaticamente
- Alto valor (evita erros)
- Frequente necessidade

**Exemplos**:
- Validação de guardrails
- Validação de North Star Metric
- Validação de Clean Architecture
- Validação de padrões de código
- Validação de documentação

---

#### Geração de Código/Documentação

**Critérios**:
- Padrão bem definido
- Alta repetição
- Baixa variação
- Alto tempo de criação manual

**Exemplos**:
- Geração de componentes React
- Geração de rotas Next.js
- Geração de testes
- Geração de documentação
- Geração de ADRs

---

#### Análises Automáticas

**Critérios**:
- Dados disponíveis
- Padrões identificáveis
- Alto valor (insights)
- Frequente necessidade

**Exemplos**:
- Análise de impacto na North Star
- Análise de conformidade com guardrails
- Análise de qualidade de código
- Análise de cobertura de testes
- Análise de documentação

---

### 3. Avaliar Viabilidade Técnica

**Objetivo**: Determinar se a automação é tecnicamente viável

#### Complexidade de Implementação

**Aspectos a Avaliar**:
- Dificuldade técnica
- Dependências necessárias
- Recursos necessários
- Tempo de desenvolvimento

**Classificação**:
- 🟢 Baixa: Implementação simples, poucas dependências
- 🟡 Média: Implementação moderada, algumas dependências
- 🔴 Alta: Implementação complexa, muitas dependências

---

#### ROI Esperado

**Aspectos a Avaliar**:
- Tempo economizado
- Erros evitados
- Qualidade melhorada
- Produtividade aumentada

**Cálculo**:
```
ROI = (Benefício - Custo) / Custo × 100%

Benefício = Tempo economizado × Valor do tempo + Erros evitados × Custo do erro
Custo = Tempo de desenvolvimento + Manutenção
```

**Classificação**:
- 🟢 Alto: ROI > 300%
- 🟡 Médio: ROI 100-300%
- 🔴 Baixo: ROI < 100%

---

#### Dependências

**Aspectos a Avaliar**:
- Dependências técnicas
- Dependências de dados
- Dependências de infraestrutura
- Dependências de outros agents/skills

**Classificação**:
- 🟢 Baixas: Poucas ou nenhuma dependência
- 🟡 Médias: Algumas dependências gerenciáveis
- 🔴 Altas: Muitas dependências ou críticas

---

### 4. Priorizar por ROI

**Objetivo**: Priorizar oportunidades por impacto e esforço

#### Matriz de Priorização

**Eixos**:
- **Impacto**: Alto, Médio, Baixo
- **Esforço**: Alto, Médio, Baixo

**Priorização**:
1. **Alto Impacto + Baixo Esforço**: 🟢 Fazer primeiro
2. **Alto Impacto + Médio Esforço**: 🟡 Fazer em seguida
3. **Alto Impacto + Alto Esforço**: 🟡 Planejar
4. **Médio Impacto + Baixo Esforço**: 🟡 Fazer quando possível
5. **Médio Impacto + Médio Esforço**: 🟡 Avaliar
6. **Médio Impacto + Alto Esforço**: 🔴 Reavaliar
7. **Baixo Impacto + Baixo Esforço**: 🟡 Fazer quando houver tempo
8. **Baixo Impacto + Médio/Alto Esforço**: 🔴 Não fazer

---

#### Fatores Adicionais

**Urgência**:
- 🔴 Crítica: Bloqueia outras iniciativas
- 🟡 Importante: Melhora eficiência significativamente
- 🟢 Desejável: Melhora eficiência moderadamente

**Dependências**:
- Dependências de outras iniciativas
- Dependências de recursos
- Dependências de tempo

---

### 5. Recomendar Agents/Skills a Criar

**Objetivo**: Recomendar novos agents/skills baseado em oportunidades identificadas

#### Processo de Recomendação

1. **Identificar Gap**: Oportunidade não coberta por agents/skills existentes
2. **Avaliar Necessidade**: Alta, Média, Baixa
3. **Definir Escopo**: O que o agent/skill deve fazer
4. **Priorizar**: Baseado em ROI e urgência
5. **Recomendar**: Criar agent/skill ou melhorar existente

---

#### Tipos de Recomendações

**Novos Agents**:
- Agents especializados em áreas específicas
- Agents para novos processos
- Agents para novas validações

**Novos Skills**:
- Skills para novas automações
- Skills para novas análises
- Skills para novas validações

**Melhorias em Existentes**:
- Expandir escopo de agents/skills existentes
- Adicionar funcionalidades
- Otimizar performance

---

### 6. Validar contra Guardrails

**Objetivo**: Assegurar que automações não violam princípios

**Consultar**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`

#### Verificações Obrigatórias

1. **Automação não viola princípios**:
   - ✅ Não automatiza destaque pago
   - ✅ Não automatiza manipulação de ranking
   - ✅ Não viola Clean Architecture
   - ✅ Mantém transparência

2. **Automação alinhada com valores**:
   - ✅ Transparência total
   - ✅ Igualdade de oportunidades
   - ✅ Foco no artista

3. **Automação ética**:
   - ✅ Não substitui decisões humanas críticas
   - ✅ Não cria viés
   - ✅ Mantém controle humano

---

### 7. Documentar Análise

**Onde documentar**: `docs/gestao-ideias/00-governanca/ia/ai-opportunities-analysis.md`

**Conteúdo**:
- Processos mapeados
- Oportunidades identificadas
- Avaliação de viabilidade
- Priorização
- Recomendações de agents/skills
- Validação contra guardrails

---

## Saída Esperada

### Relatório de Oportunidades de IA

```markdown
## Análise de Oportunidades de IA - [Data]

### Processos Mapeados
- Desenvolvimento: [lista]
- Validação: [lista]
- Documentação: [lista]
- Testes: [lista]

### Oportunidades Identificadas
1. [Oportunidade 1]
   - Tipo: [Automação/Validação/Geração/Análise]
   - Viabilidade: [Alta/Média/Baixa]
   - ROI: [estimativa]
   - Prioridade: [Alta/Média/Baixa]

### Recomendações
- Novos Agents: [lista]
- Novos Skills: [lista]
- Melhorias: [lista]

### Validação
- ✅ Validação contra Guardrails: Aprovado
- ✅ Alinhamento com valores: Confirmado
- ✅ Ética: Verificado
```

---

## Referências

- **Agents Existentes**: `.cursor/agents/`
- **Skills Existentes**: `.cursor/skills/`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **North Star Metric**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Clean Architecture**: `.cursorrules`
- **Documentação**: `docs/`

---

## Exemplos de Oportunidades

### Exemplo 1: Geração Automática de Componentes

**Processo**: Criação manual de componentes React similares

**Oportunidade**: Skill para gerar componentes baseado em template

**Viabilidade**: 🟢 Alta (padrão bem definido)

**ROI**: 🟢 Alto (economiza tempo significativo)

**Prioridade**: 🟢 Alta

---

### Exemplo 2: Validação Automática de Guardrails

**Processo**: Validação manual de guardrails em código

**Oportunidade**: Skill para validar guardrails automaticamente

**Viabilidade**: 🟢 Alta (regras claras)

**ROI**: 🟢 Alto (evita erros críticos)

**Prioridade**: 🟢 Alta

**Status**: ✅ Já implementado (`seguranca-auto-validate-guardrails`)

---

### Exemplo 3: Análise Automática de Impacto na North Star

**Processo**: Análise manual de impacto de features na North Star

**Oportunidade**: Skill para calcular impacto automaticamente

**Viabilidade**: 🟢 Alta (métrica bem definida)

**ROI**: 🟢 Alto (decisões mais rápidas e precisas)

**Prioridade**: 🟢 Alta

**Status**: ✅ Já implementado (`docs-calcular-north-star-impact`)

---

## Métricas de Sucesso

### Métricas de Eficiência

- **Tempo economizado**: Redução de tempo em processos automatizados
- **Erros evitados**: Redução de erros através de validações automáticas
- **Qualidade melhorada**: Melhoria na qualidade através de automações
- **Produtividade aumentada**: Aumento na produtividade através de automações

### Métricas de ROI

- **ROI por automação**: ROI individual de cada automação
- **ROI total**: ROI agregado de todas as automações
- **Tempo de payback**: Tempo para recuperar investimento

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-01-21  
**Revisão**: Trimestral  
**Responsável**: Strategic Advisor

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.

