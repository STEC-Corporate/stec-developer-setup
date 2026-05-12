# 🛡️ Guardrails - Modelo

> **Princípios Invioláveis que a IA (e toda a equipe) DEVE respeitar ao gerar código, conteúdo ou tomar decisões**

---

## 🎯 O que são Guardrails?

Guardrails são **regras invioláveis** que definem os limites e princípios fundamentais da Modelo. Eles garantem que:
- A IA não sugira features que violem nossos princípios
- Desenvolvedores mantenham consistência com a visão
- Decisões estejam alinhadas com valores core

**Diferença de Business Rules**: 
- **Business Rules** = Regras de negócio específicas (como calcular cachê, validar proposta)
- **Guardrails** = Princípios filosóficos e estratégicos invioláveis

---

## ❌ NUNCA (Proibições Absolutas)

### 1. Monetização e Ranking

#### ❌ NUNCA implementar destaque pago para músicos
**Motivo**: Queremos igualdade e destaque por mérito real, não por quem paga mais.

**Isso significa**:
- ❌ Não criar planos premium para músicos
- ❌ Não criar boost pago
- ❌ Não criar "destacar meu perfil"
- ❌ Não criar "impulsionamento"
- ❌ Não criar "prioridade na busca"

**Exceção**: Contratantes PODEM ter planos pagos (eles não competem entre si).

---

#### ❌ NUNCA permitir manipulação do ranking
**Motivo**: Ranking deve refletir mérito real baseado em dados verificáveis.

**Isso significa**:
- ❌ Não permitir músico alterar próprio ranking
- ❌ Não permitir comprar posição no ranking
- ❌ Não permitir avaliações falsas
- ❌ Não permitir dados falsos para subir ranking

**Princípio**: Se um músico está no topo, é porque os DADOS reais provam que ele merece.

---

#### ❌ NUNCA permitir bypass do fluxo de contratação formal
**Motivo**: Proteger modelo de negócio que sustenta a plataforma e gera dados verificáveis.

**Isso significa**:
- ❌ Empresas que criam eventos **NÃO podem convidar músicos** via busca interna
- ❌ Event Production Companies **DEVEM usar Find-Performances** para contratar
- ❌ Music Schools **DEVEM usar Find-Performances** para contratar músicos
- ❌ Booking Agencies **DEVEM usar Find-Performances** para contratar músicos
- ❌ Não permitir adicionar músicos a eventos sem passar por fluxo de contratação formal

**Por quê?**:
- Garante comissão sobre contratações (sustenta plataforma)
- Gera dados verificáveis (avaliações, histórico)
- Mantém transparência no processo
- Protege igualdade (todos passam pelo mesmo processo)

**Exceção**: Empresas PODEM convidar profissionais técnicos/visuais (não competem com músicos).

**ADR Relacionada**: ADR-006

---

#### ❌ NUNCA tratar todos PF como empresa ou todos como colaboradores
**Motivo**: Músico é ÚNICO PF com estrutura empresarial. Outros PF são colaboradores.

**Isso significa**:
- ❌ Não criar CRM/ERP para fotógrafos (não precisam)
- ❌ Não criar "Meus Projetos" empresarial para técnicos (não faz sentido)
- ❌ Não tratar fotógrafo como "empresa de fotografia" (não reflete mercado)
- ✅ Apenas músico tem gestão empresarial completa (CRM, ERP, gestão de banda)

**Por quê?**:
- Músico atua como empresa no mercado (gerencia carreira, banda, cachê)
- Fotógrafo é colaborador individual (foca em portfólio, disponibilidade)
- Features devem ser úteis, não genéricas

**Exceção**: Visuais/Técnicos podem convidar do próprio tipo (equipe temporária), mas sem estrutura empresarial completa.

**ADR Relacionada**: ADR-007

---

#### ❌ NUNCA usar Profile como vitrine ou colocar avaliações em Profile
**Motivo**: Profile = currículo. Projetos = trabalho. Avaliações medem trabalho, não pessoa.

**Isso significa**:
- ❌ Não criar avaliações de Profile (avaliar pessoa genérica)
- ❌ Não tratar Profile como landing page pública
- ❌ Não misturar avaliações de projetos diferentes no Profile
- ❌ Não mostrar avaliações internas para contratantes
- ✅ Avaliações são SEMPRE de projetos/execuções específicas
- ✅ Profile serve como currículo (dados pessoais/profissionais)

**Por quê?**:
- Avaliações devem medir trabalho específico (dados verificáveis)
- Profile é fonte de herança para projetos
- Contratantes contratam projetos, não pessoas

**Exceção**: Contratante pode ver Profile resumido de integrantes (contexto), mas avaliações ficam no projeto.

**ADR Relacionada**: ADR-008

---

### 2. Perfis e Identidades

#### ❌ NUNCA misturar empresário com produtor musical
**Motivo**: Têm papéis opostos no ecossistema musical.

**Isso significa**:
- ❌ **Empresário (music_manager)**: Representa músicos, NÃO contrata
- ❌ **Produtor Musical (music_producer)**: Produz música, PODE contratar
- ❌ Não criar perfil híbrido "empresário-produtor"
- ❌ Não permitir empresário fazer proposta para seu próprio artista

**Separação clara**: São perfis distintos com fluxos distintos.

---

#### ❌ NUNCA tratar músicos e contratantes da mesma forma
**Motivo**: Têm necessidades, objetivos e fluxos completamente diferentes.

**Isso significa**:
- ❌ Não criar features "genéricas" para ambos
- ❌ Não usar mesma UI para músico e contratante
- ❌ Não misturar dashboards
- ❌ Não compartilhar funcionalidades sem validar ambos os lados

**Princípio**: Sempre perguntar "Isso faz sentido para MÚSICO? E para CONTRATANTE?"

---

### 3. Dados e Transparência

#### ❌ NUNCA esconder dados que afetam decisões do usuário
**Motivo**: Transparência total é valor core da Modelo.

**Isso significa**:
- ❌ Não esconder algoritmo de ranking
- ❌ Não esconder como cachê médio é calculado
- ❌ Não usar "caixa preta" em decisões importantes
- ❌ Não esconder por que um perfil apareceu na busca

**Princípio**: Usuário sempre deve entender "por que isso aconteceu?"

---

#### ❌ NUNCA usar dados falsos ou mockados em produção
**Motivo**: Dados falsos destroem confiança e credibilidade.

**Isso significa**:
- ❌ Não criar perfis falsos para "popular plataforma"
- ❌ Não inventar avaliações
- ❌ Não simular atividade
- ❌ Não inflar números de usuários

**Em desenvolvimento**: Pode usar mocks, mas SEMPRE marcado claramente como "MOCK".

---

### 4. Segurança e Privacidade

#### ❌ NUNCA expor dados sensíveis sem consentimento
**Motivo**: Privacidade é direito fundamental e obrigação legal (LGPD).

**Isso significa**:
- ❌ Não expor telefone/email sem permissão
- ❌ Não expor endereço completo publicamente
- ❌ Não expor dados bancários
- ❌ Não compartilhar histórico de propostas sem consentimento
- ❌ Não vender/compartilhar dados com terceiros

**Princípio**: Dados do usuário são DELE, não nossos.

---

#### ❌ NUNCA implementar features sem validação de permissões
**Motivo**: Segurança é obrigatória, não opcional.

**Isso significa**:
- ❌ Não criar endpoint sem autenticação
- ❌ Não permitir ação sem verificar permissão
- ❌ Não confiar em validação apenas no frontend
- ❌ Não expor dados sem verificar ownership

**Princípio**: Backend SEMPRE valida, frontend é apenas UX.

---

### 5. Identidade e Fronteira Estratégica

#### ❌ NUNCA adicionar tipos que não são arte performática
**Motivo**: Modelo é plataforma das ARTES PERFORMÁTICAS, não marketplace genérico.

**Isso significa**:
- ❌ Não adicionar gastronomia (chef, bartender, catering)
- ❌ Não adicionar decoração genérica (decorador, florista)
- ❌ Não adicionar serviços gerais (segurança, limpeza, logística)
- ❌ Não adicionar qualquer tipo "só porque tem eventos"

**Regra de Ouro (3 critérios TODOS verdadeiros)**:
1. É artista performático OU apoia DIRETAMENTE a arte?
2. Trabalha em projetos/performances artísticas?
3. Usa modelo Profile + Portfólio + Projetos + Avaliações?

**O que ENTRA**:
- ✅ Música, dança, teatro, cinema, performance
- ✅ Técnicos/visuais que apoiam arte (som, luz, foto, vídeo)
- ✅ Infraestrutura artística (estúdios, escolas)
- ✅ Contratantes de artistas

**O que NÃO ENTRA**:
- ❌ Gastronomia (não é performance artística)
- ❌ Decoração (não é performance artística)
- ❌ Serviços gerais (não colaboram artisticamente)

**ADR Relacionada**: ADR-011

---

### 6. Arquitetura e Qualidade

#### ❌ NUNCA violar Clean Architecture
**Motivo**: Arquitetura limpa garante manutenibilidade e escalabilidade.

**Isso significa**:
- ❌ Não fazer camada interna depender de camada externa
- ❌ Não colocar lógica de negócio no frontend
- ❌ Não misturar responsabilidades das camadas
- ❌ Não criar imports circulares

**Princípio**: Se a IA sugere algo que viola Clean Architecture, recuse.

---

#### ❌ NUNCA usar `any` em TypeScript
**Motivo**: TypeScript strict mode é obrigatório para qualidade de código.

**Isso significa**:
- ❌ Não usar `any` em tipos
- ❌ Não desabilitar strict mode
- ❌ Não usar `@ts-ignore` sem justificativa MUITO forte
- ❌ Não usar `as any` para "resolver" erro de tipo

**Alternativa**: Usar `unknown` com type guards quando tipo é realmente desconhecido.

---

## ✅ SEMPRE (Obrigações Absolutas)

### 1. Mérito e Transparência

#### ✅ SEMPRE basear ranking em dados reais e verificáveis
**O que são dados reais**:
- ✅ Número de contratações completadas
- ✅ Avaliações de contratantes reais
- ✅ Taxa de aceite de propostas
- ✅ Taxa de comparecimento em eventos
- ✅ Tempo de resposta a propostas

**O que NÃO são dados reais**:
- ❌ "Popularidade" artificial
- ❌ Curtidas compradas
- ❌ Seguidores falsos
- ❌ Auto-avaliação

---

#### ✅ SEMPRE valorizar cachês baseado em dados de mercado
**Como valorizar**:
- ✅ Usar dados históricos de contratações
- ✅ Considerar região geográfica
- ✅ Considerar tipo de evento
- ✅ Considerar experiência comprovada
- ✅ Mostrar faixa de preço médio transparente

**Por quê**: Músicos precisam saber quanto cobrar; contratantes precisam saber quanto é justo.

---

### 2. Experiência do Usuário

#### ✅ SEMPRE separar fluxos de músicos e contratantes
**Músico vê**:
- ✅ Propostas recebidas
- ✅ Calendário de eventos confirmados
- ✅ Perfil para atrair contratantes
- ✅ Estatísticas de performance

**Contratante vê**:
- ✅ Busca de músicos
- ✅ Propostas enviadas
- ✅ Eventos criados
- ✅ Avaliações de músicos contratados

**Regra**: Se uma tela serve para ambos, provavelmente está errada.

---

#### ✅ SEMPRE priorizar mobile-first
**Motivo**: Maioria dos músicos e contratantes usa mobile.

**Isso significa**:
- ✅ Testar SEMPRE em mobile primeiro
- ✅ Touch targets ≥ 44px
- ✅ Layout responsivo obrigatório
- ✅ Performance otimizada para 3G

---

### 3. Documentação e Qualidade

#### ✅ SEMPRE documentar regras de negócio em arquivos fe-*.md
**Motivo**: Frontend não implementa lógica de negócio, apenas documenta para backend.

**Isso significa**:
- ✅ Criar fe-[feature].md para cada feature
- ✅ Documentar User Stories com critérios de aceitação
- ✅ Especificar APIs necessárias
- ✅ Definir regras de negócio para backend implementar

**Princípio**: Frontend é apresentação, backend é lógica.

---

#### ✅ SEMPRE manter cobertura de testes ≥75%
**Metas por tipo**:
- ✅ API Services: ≥80%
- ✅ Custom Hooks: ≥85%
- ✅ Components: ≥70%
- ✅ Fluxos críticos: 100% e2e

**Motivo**: Qualidade de código é inegociável.

---

### 4. Padrões de Código

#### ✅ SEMPRE seguir padrão universal de UI/UX
**Padrões obrigatórios**:
- ✅ Botões verdes para modais
- ✅ Botões cinzas para navegação
- ✅ Margens responsivas: `w-full px-4 py-6 sm:px-6 lg:px-6`
- ✅ Títulos: `text-2xl font-bold`
- ✅ Descrições: `text-sm text-muted-foreground`
- ✅ Tooltips em TODOS os campos e botões
- ✅ TabHelpButton em TODAS as abas

---

#### ✅ SEMPRE usar RORO pattern (Receive Object, Return Object)
**Exemplo**:
```typescript
// ✅ CORRETO
function processUser({ userId, options }: ProcessUserParams): ProcessUserResult {
  return { success: true, data: user }
}

// ❌ ERRADO
function processUser(userId: string, option1: string, option2: boolean): User {
  return user
}
```

---

### 5. Comunicação e Colaboração

#### ✅ SEMPRE usar OKRs/KPIs para guiar priorização
**Processo**:
1. Verificar OKRs do trimestre
2. Verificar qual KR a feature impacta
3. Priorizar features que impactam múltiplos KRs
4. Validar se alinha com North Star Metric

**Motivo**: Não fazer features "porque sim", fazer com propósito claro.

---

#### ✅ SEMPRE atualizar documentação ANTES de implementar
**Ordem correta**:
1. Criar business-rules (fe-*.md)
2. Criar user-flows
3. Criar api-specifications
4. Implementar código
5. Criar testes
6. Atualizar OKRs/KPIs

**Motivo**: Documentação é contrato, código é implementação do contrato.

---

## 🔄 Workflow de Decisão com Guardrails

Quando a IA ou desenvolvedor tem dúvida sobre uma decisão:

### Passo 1: Verificar Guardrails
- A decisão viola algum ❌ NUNCA? → Recusar imediatamente
- A decisão cumpre todos ✅ SEMPRE? → Validar princípios

### Passo 2: Consultar North Star
- Isso aproxima da nossa North Star Metric?
- "Contratações bem-sucedidas com avaliação positiva"

### Passo 3: Validar com OKRs
- Impacta algum Key Result do trimestre?
- Qual OKR será afetado?

### Passo 4: Verificar ADRs
- Já tomamos decisão similar antes?
- O que decidimos e por quê?

### Passo 5: Criar Decision Log
- Documentar decisão tomada
- Justificar baseado em Guardrails + North Star + OKRs

---

## 🎓 Exemplos Práticos

### Exemplo 1: Feature "Destacar Perfil" ❌

**Sugestão**: "Vamos criar um botão 'Destacar meu perfil' por R$ 50/mês"

**Verificação**:
- ✅ Guardrail violado: "❌ NUNCA implementar destaque pago para músicos"
- 🚫 **RECUSAR IMEDIATAMENTE**

**Alternativa válida**: "Melhorar ranking através de mais contratações e avaliações positivas"

---

### Exemplo 2: Campo "Cachê Sugerido" ✅

**Sugestão**: "Mostrar faixa de cachê médio baseado em região, experiência e tipo de evento"

**Verificação**:
- ✅ Cumpre: "SEMPRE valorizar cachês baseado em dados de mercado"
- ✅ Cumpre: "SEMPRE basear ranking em dados reais"
- ✅ Alinha com North Star: Ajuda contratações bem-sucedidas
- ✅ **APROVAR**

---

### Exemplo 3: Perfil "Empresário-Produtor" ❌

**Sugestão**: "Criar perfil híbrido para quem é empresário E produtor musical"

**Verificação**:
- ✅ Guardrail violado: "❌ NUNCA misturar empresário com produtor"
- 🚫 **RECUSAR**

**Alternativa válida**: "Permitir Multi-Profile (um login, dois perfis separados)"

---

### Exemplo 4: Endpoint sem Auth ❌

**Código**:
```typescript
// GET /api/musicians/:id/proposals
// Retorna todas as propostas do músico
```

**Verificação**:
- ✅ Guardrail violado: "❌ NUNCA implementar features sem validação de permissões"
- ✅ Guardrail violado: "❌ NUNCA expor dados sensíveis sem consentimento"
- 🚫 **RECUSAR**

**Correção**:
```typescript
// GET /api/musicians/:id/proposals
// Requer autenticação
// Valida que userId === :id (músico só vê próprias propostas)
```

---

## 🤖 Prompts para IA

Ao trabalhar com IA no Modelo, sempre incluir:

```markdown
# GUARDRAILS OBRIGATÓRIOS

NUNCA:
- Implementar destaque pago para músicos
- Permitir manipulação de ranking
- Misturar empresário com produtor
- Violar Clean Architecture
- Usar `any` em TypeScript

SEMPRE:
- Basear ranking em dados reais
- Separar fluxos músico/contratante
- Documentar em fe-*.md
- Seguir padrão universal UI/UX
- Manter cobertura de testes ≥75%
```

---

## 📚 Relação com Outros Documentos

| Documento | Relação |
|-----------|---------|
| `.cursorrules` | Regras técnicas de código |
| `business-rules/` | Regras específicas de negócio |
| `guardrails.md` | **Princípios filosóficos e estratégicos** |
| `decisions/adr-*.md` | Decisões arquiteturais tomadas |
| `decisions/decision-log.md` | Decisões menores do dia a dia |
| `playbooks/` | Scripts de decisão baseados em guardrails |
| `metrics/north-star.md` | Métrica principal que guia tudo |
| `okrs-kpis-q1-2026.md` | Metas do trimestre |

---

## ✅ Checklist de Validação

Antes de aprovar qualquer feature/código/decisão, verificar:

- [ ] Não viola nenhum ❌ NUNCA dos Guardrails?
- [ ] Cumpre todos ✅ SEMPRE aplicáveis?
- [ ] Alinha com North Star Metric?
- [ ] Impacta positivamente algum OKR?
- [ ] Está documentado em fe-*.md?
- [ ] Tem testes adequados?
- [ ] Segue padrões de código (.cursorrules)?
- [ ] Respeita Clean Architecture?

**Se TODAS as respostas forem SIM → APROVAR**  
**Se QUALQUER resposta for NÃO → RECUSAR ou AJUSTAR**

---

## 🔄 Atualização de Guardrails

**Quem pode atualizar**: Apenas decisão estratégica (fundador + equipe core)

**Quando atualizar**:
- Mudança fundamental na visão do produto
- Nova descoberta que invalida princípio anterior
- Expansão para novo mercado/segmento

**Como atualizar**:
1. Criar ADR explicando mudança
2. Atualizar guardrails.md
3. Comunicar para TODA a equipe
4. Atualizar playbooks afetados
5. Revisar código existente se necessário

**⚠️ IMPORTANTE**: Mudanças em Guardrails são RARAS e devem ser muito bem justificadas.

---

**Criado em**: 20/01/2026  
**Última atualização**: 20/01/2026  
**Versão**: 1.0  
**Responsável**: Frontend Template Creator  
**Revisão obrigatória**: Trimestral (junto com OKRs)

---

## 💡 Lembre-se

> **Guardrails não são restrições, são PROTEÇÃO.**
> 
> Eles protegem a visão da Modelo, garantem consistência e evitam decisões que possam comprometer o produto no futuro.
> 
> Quando em dúvida: consulte os Guardrails ANTES de implementar.

---

*Este documento deve ser lido e entendido por TODOS que trabalham no Modelo: desenvolvedores, designers, produto e IA.*
