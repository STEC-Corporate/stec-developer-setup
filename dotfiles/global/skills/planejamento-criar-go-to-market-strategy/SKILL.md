---
name: planejamento-criar-go-to-market-strategy
description: Cria estratégia go-to-market completa: analisa estratégia de lançamento, expansão de mercado, crescimento e escalabilidade, parcerias estratégicas e internacionalização. Use ao planejar lançamento, expandir mercado, buscar crescimento ou periodicamente (trimestral).
---

# Criar Estratégia Go-to-Market

## Quando Usar

- Ao planejar lançamento da plataforma
- Ao expandir para novos segmentos ou geografias
- Ao buscar crescimento acelerado
- Periodicamente (trimestral) para revisão estratégica
- Ao avaliar parcerias estratégicas
- Ao planejar internacionalização (futuro)

## Processo de Criação

### 1. Analisar Estratégia de Lançamento

**Objetivo**: Definir fases de lançamento, públicos-alvo, canais e métricas

#### 1.1 Fases de Lançamento

**Fase 1: MVP - Foco em Música (0-12 meses)**
- Objetivo: Validar modelo de negócio
- Status: ✅ Em andamento
- Comunicação: "SoundLink - Conectando músicos a oportunidades"

**Fase 2: Expansão para Dança (Q3-Q4 2026)**
- Objetivo: Validar network effect entre música e dança
- Comunicação: "SoundLink - Conectando música e dança"

**Fase 3: Expansão para Teatro (2027)**
- Objetivo: Projetos multidisciplinares
- Comunicação: "SoundLink - Música, dança e teatro juntos"

**Fase 4: Expansão para Cinema (2028)**
- Objetivo: Todas as artes performáticas
- Comunicação: "SoundLink - Onde Artistas se Conectam"

**Consultar**: `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md`

---

#### 1.2 Públicos-Alvo por Fase

**Fase 1 (Música)**:
- Músicos (prioridade 1)
- Contratantes de música (prioridade 1)
- Profissionais técnicos (prioridade 2)
- Empresas musicais (prioridade 2)

**Fase 2 (Dança)**:
- Dançarinos e coreógrafos
- Contratantes de dança
- Músicos (colaboração)

**Fase 3 (Teatro)**:
- Atores e diretores
- Contratantes de teatro
- Músicos e dançarinos (colaboração)

**Fase 4 (Cinema)**:
- Cineastas e produtores
- Contratantes de cinema
- Todos os artistas (colaboração)

**Consultar**: `docs/gestao-ideias/03-produto/TIPOS-DE-USUARIO.md`

---

#### 1.3 Canais de Lançamento

**Canais Orgânicos**:
- SEO e conteúdo
- Redes sociais (Instagram, Facebook, LinkedIn, YouTube)
- Comunidades online
- Word of mouth

**Canais Pagos (Futuro)**:
- Google Ads
- Facebook/Instagram Ads
- LinkedIn Ads
- YouTube Ads

**Canais de Parceria**:
- Parcerias com escolas de música
- Parcerias com estúdios
- Parcerias com eventos
- Parcerias com influenciadores

**Consultar**: `docs/gestao-ideias/00-governanca/ia/marketing-channels.md`

---

#### 1.4 Métricas de Sucesso

**Fase 1 (Música)**:
- 1.000+ músicos ativos
- 100+ contratações/mês
- NPS > 50
- Churn < 5% mensal
- North Star: Contratações bem-sucedidas com avaliação ≥4 estrelas

**Fase 2 (Dança)**:
- 500+ dançarinos cadastrados
- 100+ contratações envolvendo dança
- 30%+ de músicos colaborando com dançarinos

**Consultar**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

---

### 2. Estratégia de Expansão

**Objetivo**: Definir segmentos e geografias prioritárias

#### 2.1 Segmentos Prioritários

**Prioridade 1**: Música (Fase 1)
- 18 tipos de usuários musicais
- Ecossistema completo
- Base para expansão

**Prioridade 2**: Dança (Fase 2)
- 5 tipos de usuários de dança
- Network effect com música
- Validação de modelo

**Prioridade 3**: Teatro (Fase 3)
- 6 tipos de usuários de teatro
- Projetos multidisciplinares
- Expansão do network effect

**Prioridade 4**: Cinema (Fase 4)
- Tipos de usuários de cinema
- Todas as artes performáticas
- Network effect completo

**Consultar**: `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md`

---

#### 2.2 Geografias Prioritárias

**Prioridade 1**: Brasil
- Mercado principal
- Foco inicial
- Validação de modelo

**Prioridade 2**: América Latina (Futuro)
- Mercados similares
- Expansão natural
- Adaptações mínimas

**Prioridade 3**: Outros Mercados (Futuro)
- Expansão global
- Adaptações necessárias
- Timeline longo prazo

**Consultar**: `docs/gestao-ideias/00-governanca/ia/internationalization-strategy.md`

---

#### 2.3 Timeline de Expansão

**2026**: Fase 1 (Música) + Início Fase 2 (Dança)
**2027**: Fase 2 (Dança) + Fase 3 (Teatro)
**2028**: Fase 3 (Teatro) + Fase 4 (Cinema)
**2029+**: Consolidação e expansão geográfica

---

### 3. Crescimento e Escalabilidade

**Objetivo**: Definir estratégias de crescimento e escalabilidade

#### 3.1 Estratégias de Crescimento

**Crescimento Orgânico**:
- Network effect natural
- Word of mouth
- SEO e conteúdo
- Comunidades

**Crescimento Acelerado**:
- Marketing pago (futuro)
- Parcerias estratégicas
- Eventos e presença
- Influenciadores

**Consultar**: `docs/gestao-ideias/00-governanca/ia/growth-scalability-strategy.md`

---

#### 3.2 Escalabilidade Técnica (5 Projetos)

**Template** (soundlink-template-frontend):
- Referência para migração
- Documentação completa
- Estrutura replicável

**Frontend Oficial** (soundlink-frontend):
- App em produção
- Recebe código do Template
- Escalável horizontalmente

**BFF** (soundlink-bff):
- Orquestração
- Adaptação para frontend
- Escalável independentemente

**APIs** (soundlink-api):
- Microsserviços
- Escalável por serviço
- Arquitetura distribuída

**Infrastructure** (soundlink-infrastructure):
- Infraestrutura como código
- Escalável automaticamente
- Monitoramento e observabilidade

**Consultar**: `.cursorrules`

---

#### 3.3 Escalabilidade Operacional

**Processos**:
- Automações (IA)
- Validações automáticas
- Análises automatizadas
- Documentação automatizada

**Equipe**:
- Estrutura escalável
- Processos definidos
- Automações reduzindo carga

**Consultar**: `docs/gestao-ideias/00-governanca/ia/automation-inventory.md`

---

### 4. Parcerias Estratégicas

**Objetivo**: Identificar e planejar parcerias estratégicas

#### 4.1 Tipos de Parcerias

**Parcerias com Escolas**:
- Escolas de música
- Escolas de dança
- Escolas de teatro
- Benefício: Acesso a alunos e professores

**Parcerias com Estúdios**:
- Estúdios de gravação
- Estúdios de produção
- Benefício: Acesso a profissionais e projetos

**Parcerias com Eventos**:
- Festivais
- Shows
- Eventos corporativos
- Benefício: Exposição e contratações

**Parcerias com Influenciadores**:
- Músicos influentes
- Dançarinos influentes
- Benefício: Alcance e credibilidade

**Consultar**: `docs/gestao-ideias/00-governanca/ia/strategic-partnerships.md`

---

#### 4.2 Parceiros Potenciais

**Prioridade Alta**:
- Escolas de música grandes
- Estúdios de gravação conhecidos
- Festivais de música

**Prioridade Média**:
- Escolas de dança
- Eventos corporativos
- Influenciadores musicais

**Prioridade Baixa**:
- Escolas de teatro
- Outros eventos
- Outros influenciadores

---

### 5. Internacionalização (Futuro)

**Objetivo**: Planejar expansão internacional

#### 5.1 Mercados Prioritários

**Prioridade 1**: América Latina
- Mercados similares ao Brasil
- Adaptações mínimas
- Expansão natural

**Prioridade 2**: Outros Mercados
- Mercados maiores
- Adaptações necessárias
- Timeline longo prazo

**Consultar**: `docs/gestao-ideias/00-governanca/ia/internationalization-strategy.md`

---

#### 5.2 Adaptações Necessárias

**Técnicas**:
- Internacionalização (i18n)
- Localização (l10n)
- Moedas e pagamentos
- Regulamentações

**Operacionais**:
- Suporte multilíngue
- Marketing local
- Parcerias locais
- Adaptação cultural

---

### 6. Validar contra Guardrails e North Star

**Consultar**: `docs/gestao-ideias/00-governanca/ia/guardrails.md` e `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`

#### Verificações Obrigatórias

1. **Estratégia não viola guardrails**:
   - ✅ Não promete destaque pago
   - ✅ Mantém transparência total
   - ✅ Mantém igualdade de oportunidades

2. **Estratégia alinhada com North Star**:
   - ✅ Foco em "Contratações bem-sucedidas com avaliação ≥4 estrelas"
   - ✅ Métricas alinhadas
   - ✅ Priorização baseada em impacto

---

### 7. Documentar Estratégia

**Onde documentar**: `docs/gestao-ideias/00-governanca/ia/go-to-market-strategy.md`

**Conteúdo**:
- Estratégia de lançamento completa
- Estratégia de expansão
- Crescimento e escalabilidade
- Parcerias estratégicas
- Internacionalização (futuro)
- Validação contra guardrails e North Star

---

## Saída Esperada

### Relatório de Estratégia Go-to-Market

```markdown
## Estratégia Go-to-Market - [Data]

### Estratégia de Lançamento
- Fases: [Lista de fases]
- Públicos-alvo: [Por fase]
- Canais: [Lista de canais]
- Métricas: [Métricas por fase]

### Expansão de Mercado
- Segmentos: [Lista de segmentos]
- Geografias: [Lista de geografias]
- Timeline: [Timeline de expansão]

### Crescimento e Escalabilidade
- Estratégias: [Lista de estratégias]
- Escalabilidade técnica: [Análise]
- Escalabilidade operacional: [Análise]

### Parcerias Estratégicas
- Tipos: [Lista de tipos]
- Parceiros: [Lista de parceiros]
- Estratégia: [Estratégia de parcerias]

### Internacionalização
- Mercados: [Lista de mercados]
- Adaptações: [Lista de adaptações]
- Timeline: [Timeline]
```

---

## Referências

- **North Star Metric**: `docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **Fronteira**: `docs/gestao-ideias/00-governanca/decisoes/FRONTEIRA-ARTE.md`
- **Estratégia de Lançamento**: `docs/gestao-ideias/00-governanca/ia/launch-strategy.md`
- **Expansão de Mercado**: `docs/gestao-ideias/00-governanca/ia/market-expansion-strategy.md`
- **Crescimento e Escalabilidade**: `docs/gestao-ideias/00-governanca/ia/growth-scalability-strategy.md`
- **Parcerias Estratégicas**: `docs/gestao-ideias/00-governanca/ia/strategic-partnerships.md`
- **Internacionalização**: `docs/gestao-ideias/00-governanca/ia/internationalization-strategy.md`
- **Canais de Marketing**: `docs/gestao-ideias/00-governanca/ia/marketing-channels.md`
- **Estratégia Comercial**: `docs/gestao-ideias/00-governanca/ia/conversion-funnel.md`

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

