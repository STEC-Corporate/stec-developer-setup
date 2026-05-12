# Funil de Conversão - SoundLink

> **Documento Estratégico**: Mapeamento completo do funil de conversão da plataforma SoundLink, incluindo etapas, taxas de conversão, gargalos e oportunidades de otimização.

---

## 📊 Visão Geral

Este documento mapeia o funil de conversão completo da SoundLink, desde a visita inicial até a contratação bem-sucedida (North Star Metric), identificando gargalos e oportunidades de otimização.

**⚠️ Princípios Fundamentais**:
- **Projetos são a unidade de negociação**: Contratantes contratam projetos, não perfis
- **Profile não é vitrine**: Profile serve como currículo para busca interna (convites)
- **Busca Externa gera receita**: Os **quatro** sistemas de busca pública podem gerar contratos e pagamentos pela plataforma (ver [Os 4 Finds e receita](#os-4-finds-e-receita) abaixo)
- **Funil diferenciado**: Prestadores criam projetos, Contratantes buscam projetos

**Consultar**: `docs/decisoes/adr-008-profile-as-inheritance-source.md` | `docs/decisoes/adr-016-four-search-systems.md`

### Os 4 Finds e receita

| Find | Quem usa | Como gera receita |
|------|----------|-------------------|
| **Find-Performances** | Contratantes | Contratante busca performances prontas (shows, atos) e contrata projeto → contrato e pagamento pela plataforma |
| **Find-Professionals** | Contratantes | Contratante busca profissionais por portfólio e contrata → contrato e pagamento pela plataforma |
| **Find-Connections** | Prestadores | Projeto que não encontrou na busca interna (ou por decisão) **expõe vaga**; interessados se candidatam → contrato e pagamento pela plataforma |
| **Find-Events** | Prestadores | Contratante/perfil que cria eventos **expõe evento** (não achou na busca ou por decisão); interessados se candidatam → contrato e pagamento pela plataforma |

---

## 🎯 Funil de Aquisição - Prestadores (Topo do Funil)

**Contexto**: Prestadores (músicos, técnicos, visuais, etc.) precisam criar projetos para serem contratados.

### Etapas do Funil

1. **Visita** → Usuário acessa a plataforma
2. **Cadastro** → Usuário cria conta e escolhe perfil principal
3. **Perfil Completo** → Usuário completa perfil (currículo)
4. **Primeiro Projeto** → Prestador cria primeiro projeto
5. **Primeira Contratação** → Projeto recebe primeira contratação

### Taxa de Conversão por Etapa

| Etapa | Baseline | Meta Beta | Meta 6 meses | Meta 1 ano |
|-------|----------|-----------|--------------|------------|
| **Visita → Cadastro** | 5% | 8% | 10% | 12% |
| **Cadastro → Perfil Completo** | 60% | 70% | 75% | 80% |
| **Perfil Completo → Primeiro Projeto** | 70% | 75% | 80% | 85% |
| **Primeiro Projeto → Primeira Contratação** | 20% | 25% | 30% | 35% |

### Exemplo de Cálculo

**Cenário Baseline (1000 visitas - Prestadores)**:
```
1000 visitas
  ↓ 5% conversão
50 cadastros
  ↓ 60% conversão
30 perfis completos
  ↓ 70% conversão
21 primeiros projetos
  ↓ 20% conversão
4 primeiras contratações
```

**Taxa de Conversão Geral**: 0,4% (4 contratações / 1000 visitas)

---

## 🎯 Funil de Aquisição - Contratantes (Topo do Funil)

**Contexto**: Contratantes buscam para contratar via qualquer um dos 4 Finds (Find-Performances, Find-Professionals, Find-Connections, Find-Events). Todos podem resultar em contrato e pagamento pela plataforma.

### Etapas do Funil

1. **Visita** → Usuário acessa a plataforma
2. **Cadastro** → Usuário cria conta e escolhe perfil principal
3. **Perfil Completo** → Usuário completa perfil
4. **Primeira Busca** → Contratante realiza primeira busca em um dos 4 Finds (Performances, Professionals, Connections ou Events)
5. **Primeira Contratação** → Contratante contrata primeiro projeto

### Taxa de Conversão por Etapa

| Etapa | Baseline | Meta Beta | Meta 6 meses | Meta 1 ano |
|-------|----------|-----------|--------------|------------|
| **Visita → Cadastro** | 5% | 8% | 10% | 12% |
| **Cadastro → Perfil Completo** | 60% | 70% | 75% | 80% |
| **Perfil Completo → Primeira Busca** | 80% | 85% | 90% | 95% |
| **Primeira Busca → Primeira Contratação** | 15% | 20% | 25% | 30% |

### Exemplo de Cálculo

**Cenário Baseline (1000 visitas - Contratantes)**:
```
1000 visitas
  ↓ 5% conversão
50 cadastros
  ↓ 60% conversão
30 perfis completos
  ↓ 80% conversão
24 primeiras buscas
  ↓ 15% conversão
4 primeiras contratações
```

**Taxa de Conversão Geral**: 0,4% (4 contratações / 1000 visitas)

### Gargalos Identificados - Prestadores

#### 1. Visita → Cadastro (5%)

**Causa Raiz**:
- Barreira de entrada (necessidade de cadastro)
- Falta de valor percebido antes do cadastro
- Processo de cadastro pode ser complexo

**Oportunidades de Otimização**:
- Permitir navegação sem cadastro (modo visitante)
- Demonstrar valor antes de pedir cadastro
- Simplificar processo de cadastro
- Oferecer incentivos para cadastro

#### 2. Perfil Completo → Primeiro Projeto (70%)

**Causa Raiz**:
- Prestador pode não entender necessidade de criar projeto
- Processo de criação de projeto pode ser complexo
- Falta de incentivos claros para criar projeto

**Oportunidades de Otimização**:
- Educar sobre importância de projetos (onboarding)
- Simplificar criação de projeto (wizard, templates)
- Incentivar criação de projeto (destaque, benefícios)
- Demonstrar casos de sucesso (projetos que receberam contratações)

#### 3. Primeiro Projeto → Primeira Contratação (20%)

**Causa Raiz**:
- Projeto pode não estar bem configurado (visibilidade, busca)
- Falta de confiança (primeira contratação)
- Processo de contratação pode ser complexo

**Oportunidades de Otimização**:
- Incentivar primeira contratação (primeiras 3 com taxa 5%)
- Simplificar processo de contratação
- Oferecer garantias (escrow, suporte)
- Demonstrar casos de sucesso

### Gargalos Identificados - Contratantes

#### 1. Primeira Busca → Primeira Contratação (15%)

**Causa Raiz**:
- Falta de confiança (primeira contratação)
- Processo de contratação pode ser complexo
- Falta de incentivos claros
- Projetos podem não atender expectativas

**Oportunidades de Otimização**:
- Incentivar primeira contratação (primeiras 3 com taxa 5%)
- Simplificar processo de contratação
- Oferecer garantias (escrow, suporte)
- Melhorar matching (recomendações, filtros)
- Demonstrar casos de sucesso

---

## 🎯 Funil de Conversão - Busca Externa (Meio do Funil)

**Contexto**: Funil de contratação via **Busca Externa** (qualquer um dos 4 Finds). Contratantes buscam e contratam; em Find-Connections e Find-Events, a oferta é exposta (vagas/eventos) e interessados se candidatam — em todos os casos podem ser firmados contratos e pagamentos pela plataforma.

### Etapas do Funil

**Consultar**: `docs/planejamento/metrics/north-star.md`

1. **Busca/Descoberta Realizada** → Contratante busca (Find-Performances/Find-Professionals) ou prestador descobre oferta (Find-Connections: vagas de projeto; Find-Events: eventos abertos)
2. **Visualização de Projeto** → Contratante visualiza detalhes do projeto
3. **Proposta Enviada** → Contratante envia proposta para o projeto
4. **Proposta Aceita** → Projeto aceita proposta
5. **Evento Confirmado** → Evento confirmado por ambas as partes
6. **Evento Realizado** → Projeto comparece ao evento
7. **Evento Pago** → Pagamento realizado
8. **Evento Avaliado** → Ambas as partes avaliam
9. **Evento Positivo** → Avaliação ≥4 estrelas (North Star)

### Taxa de Conversão por Etapa

| Etapa | Baseline | Meta Beta | Meta 6 meses | Meta 1 ano |
|-------|----------|-----------|--------------|------------|
| **Busca → Visualização** | 40% | 45% | 50% | 55% |
| **Visualização → Proposta** | 30% | 35% | 40% | 45% |
| **Proposta → Aceite** | 20% | 25% | 30% | 35% |
| **Aceite → Confirmação** | 95% | 97% | 98% | 99% |
| **Confirmação → Realização** | 95% | 97% | 98% | 99% |
| **Realização → Pagamento** | 97% | 98% | 99% | 99.5% |
| **Pagamento → Avaliação** | 97% | 98% | 99% | 99.5% |
| **Avaliação → Positiva** | 94% | 96% | 97% | 98% |

### Exemplo de Cálculo

**Cenário Baseline (1000 buscas realizadas)**:
```
1000 buscas realizadas
  ↓ 40% conversão
400 visualizações de projeto
  ↓ 30% conversão
120 propostas enviadas
  ↓ 20% conversão
24 propostas aceitas
  ↓ 95% conversão
23 eventos confirmados
  ↓ 95% conversão
22 eventos realizados
  ↓ 97% conversão
21 eventos pagos
  ↓ 97% conversão
20 eventos avaliados
  ↓ 94% conversão
19 eventos positivos (North Star)
```

**Taxa de Conversão Geral**: 1,9% (19 eventos positivos / 1000 buscas)

**North Star Score**: 79% (19 eventos positivos / 24 propostas aceitas)

### Gargalos Identificados

#### 1. Busca → Visualização (40%)

**Causa Raiz**:
- Resultados podem não ser relevantes
- Projetos podem não estar bem configurados (visibilidade, busca)
- Filtros podem não ser adequados

**Oportunidades de Otimização**:
- Melhorar algoritmo de ranking (ADR-002)
- Melhorar qualidade dos projetos (onboarding, templates)
- Melhorar filtros e busca
- Demonstrar valor dos projetos (destaques, avaliações)

#### 2. Visualização → Proposta (30%)

**Causa Raiz**:
- Projeto pode não atender expectativas
- Informações podem estar incompletas
- Processo de envio de proposta pode ser complexo

**Oportunidades de Otimização**:
- Melhorar qualidade dos projetos (informações completas)
- Simplificar processo de envio de proposta
- Oferecer templates de proposta
- Facilitar comunicação pré-proposta

#### 3. Proposta → Aceite (20%)

**Causa Raiz**:
- Propostas podem não ser adequadas (match ruim)
- Projeto pode não estar disponível
- Proposta pode não ser atrativa (cachê, condições)

**Oportunidades de Otimização**:
- Melhorar matching (sistema de recomendações)
- Melhorar qualidade das propostas (guias, templates)
- Incentivar respostas rápidas
- Melhorar comunicação entre partes

#### 4. Avaliados → Positivos (94%)

**Causa Raiz**:
- Match pode não ser adequado
- Expectativas não alinhadas
- Problemas na execução do evento

**Oportunidades de Otimização**:
- Melhorar matching (algoritmo de ranking)
- Alinhar expectativas (propostas claras)
- Melhorar suporte durante evento
- Facilitar comunicação entre partes

---

## 🎯 Funil de Retenção (Fundo do Funil)

### Etapas do Funil

1. **Segunda Contratação** → Usuário realiza segunda contratação
2. **Contratações Regulares** → Usuário realiza 3+ contratações
3. **Advocacy** → Usuário recomenda plataforma

### Taxa de Conversão por Etapa

| Etapa | Baseline | Meta Beta | Meta 6 meses | Meta 1 ano |
|-------|----------|-----------|--------------|------------|
| **Primeira → Segunda Contratação** | 60% | 65% | 70% | 75% |
| **Segunda → Contratações Regulares** | 80% | 85% | 90% | 95% |
| **Contratações Regulares → Advocacy** | 30% | 35% | 40% | 45% |

### Exemplo de Cálculo

**Cenário Baseline (100 primeiras contratações)**:
```
100 primeiras contratações
  ↓ 60% conversão
60 segundas contratações
  ↓ 80% conversão
48 contratações regulares (3+)
  ↓ 30% conversão
14 advocates (recomendam plataforma)
```

**Taxa de Retenção**: 60% (60 segundas contratações / 100 primeiras)

**Taxa de Advocacy**: 14% (14 advocates / 100 primeiras contratações)

### Gargalos Identificados

#### 1. Primeira → Segunda Contratação (60%)

**Causa Raiz**:
- Experiência na primeira contratação pode não ter sido positiva
- Falta de incentivos para segunda contratação
- Usuário pode não ter necessidade imediata

**Oportunidades de Otimização**:
- Garantir primeira contratação bem-sucedida (North Star)
- Incentivar segunda contratação (descontos, benefícios)
- Manter engajamento entre contratações
- Oferecer recomendações personalizadas

#### 2. Contratações Regulares → Advocacy (30%)

**Causa Raiz**:
- Falta de incentivos para recomendar
- Processo de recomendação pode ser complexo
- Usuário pode não perceber valor em recomendar

**Oportunidades de Otimização**:
- Criar programa de indicação (benefícios para ambas as partes)
- Facilitar processo de recomendação
- Demonstrar valor de recomendar (network effect)
- Reconhecer advocates (badges, destaque)

---

## 📊 Métricas de Acompanhamento

### KPIs Mensais

- **Taxa de Conversão Geral**: (Contratações / Visitantes) × 100
- **Taxa de Conversão por Etapa**: (Etapa seguinte / Etapa atual) × 100
- **Tempo Médio no Funil**: Tempo médio de visita até primeira contratação
- **Taxa de Retenção**: % de usuários que retornam no mês seguinte
- **Churn Rate**: % de usuários que deixam a plataforma

### KPIs Trimestrais

- **Tendência de Conversão**: Aumentando, estável ou diminuindo
- **Eficiência do Funil**: Taxa de conversão geral melhorando
- **Gargalos Resolvidos**: Número de gargalos otimizados
- **ROI de Otimizações**: Retorno sobre investimento em otimizações

---

## 🔍 Análise de Gargalos

### Metodologia

1. **Identificar Gargalos**: Etapas com taxa de conversão < 50%
2. **Investigar Causa Raiz**: Por que a conversão é baixa?
3. **Priorizar Gargalos**: Por impacto (número de usuários afetados)
4. **Implementar Otimizações**: Ações específicas para cada gargalo
5. **Medir Resultados**: Acompanhar métricas após otimização

### Gargalos Prioritários

1. **Visita → Cadastro (5%)**: Alto impacto (afeta todos os visitantes)
2. **Propostas → Aceites (20%)**: Alto impacto (afeta todas as propostas)
3. **Primeira Ação → Primeira Contratação (20%)**: Médio impacto (afeta usuários ativos)
4. **Primeira → Segunda Contratação (60%)**: Médio impacto (afeta retenção)

---

## 🎯 Oportunidades de Otimização

### Topo do Funil (Aquisição)

1. **Modo Visitante**: Permitir navegação sem cadastro
2. **Demonstração de Valor**: Mostrar casos de sucesso antes de cadastro
3. **Cadastro Simplificado**: Reduzir campos obrigatórios
4. **Incentivos de Cadastro**: Benefícios exclusivos para novos usuários

### Meio do Funil (Conversão)

1. **Matching Melhorado**: Sistema de recomendações inteligentes
2. **Propostas de Qualidade**: Guias e templates para propostas
3. **Comunicação Facilitada**: Chat integrado, notificações
4. **Suporte Ativo**: Ajuda durante processo de contratação

### Fundo do Funil (Retenção)

1. **Programa de Indicação**: Benefícios para ambas as partes
2. **Recomendações Personalizadas**: Sugestões baseadas em histórico
3. **Engajamento Contínuo**: Notificações, conteúdo, networking
4. **Reconhecimento**: Badges, destaque para usuários ativos

**Consultar**: `.cursor/docs/ia/commercial/conversion-optimization.md`

---

## 🔄 Revisão e Atualização

Este documento deve ser revisado:
- **Mensalmente**: Atualizar com dados reais
- **Trimestralmente**: Revisar metas e ajustar estratégias
- **Anualmente**: Revisão estratégica completa

**Próxima Revisão**: [Data]

---

## 📚 Referências

- **North Star Metric**: `docs/planejamento/metrics/north-star.md`
- **Skill de Estratégia Comercial**: `.cursor/skills/evaluate-sales-strategy/SKILL.md`
- **Otimização de Conversão**: `.cursor/docs/ia/commercial/conversion-optimization.md`
- **Métricas Comerciais**: `.cursor/docs/ia/commercial/commercial-metrics.md`

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-02-02  
**Revisão**: Mensal (dados), Trimestral (estratégias)  
**Responsável**: Strategic Advisor

---

## 📝 Notas de Atualização

**2026-02-02**: Documento atualizado para refletir modelo real da SoundLink:
- ✅ Funil diferenciado para **prestadores** (criam projetos) e **contratantes** (buscam projetos)
- ✅ Foco em **projetos** como unidade de negociação
- ✅ Inclusão de etapa **Busca → Visualização → Proposta** no funil de conversão
- ✅ Remoção de referências genéricas a "primeira ação"
- ✅ Métricas específicas para criação de projetos e busca de projetos
