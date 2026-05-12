# 🌟 North Star Metric - Modelo

> **A métrica mais importante que guia TODAS as decisões da Modelo**

---

## 🎯 Nossa North Star

```
Contratações bem-sucedidas com avaliação positiva (≥4 estrelas)
```

---

## 🤔 Por que Esta Métrica?

### Definição Completa

**Contratação bem-sucedida** = Contratação que resulta em:
1. ✅ Evento aconteceu (músico compareceu)
2. ✅ Pagamento foi realizado
3. ✅ Ambas as partes avaliaram mutuamente
4. ✅ Avaliação média ≥4 estrelas (de 5)

**Por que 4 estrelas**?
- 5 estrelas = perfeito (pode ser difícil alcançar sempre)
- 4-5 estrelas = muito bom, satisfeito
- 3 estrelas = neutro (não satisfeito, não insatisfeito)
- 1-2 estrelas = ruim (insatisfação)

Foco em **satisfação real**, não apenas "evento aconteceu".

---

## 💡 Por que ESTA é Nossa North Star?

### 1. Prova Satisfação de Ambos os Lados

- ✅ **Músico satisfeito**: Recebeu cachê justo, contratante foi profissional
- ✅ **Contratante satisfeito**: Músico foi bom, evento foi sucesso

Se avaliação for ≥4, ambos estão felizes.

### 2. Correlaciona com Retenção

```
Usuários com contratações bem-sucedidas:
→ Voltam para plataforma
→ Fazem mais contratações
→ Recomendam para outros
```

### 3. Correlaciona com Receita

```
Mais contratações bem-sucedidas:
→ Mais eventos futuros
→ Mais comissões
→ Mais usuários pagantes
```

### 4. Indicador de Qualidade

Se % de contratações bem-sucedidas é alto:
→ Ranking funciona (bons músicos aparecem)
→ Sistema de propostas funciona
→ Perfis estão bem preenchidos
→ Processo é claro

### 5. Impede Gaming

```
❌ Se músico aceita evento mas não comparece → Não é contratação bem-sucedida
❌ Se contratante não paga → Não é contratação bem-sucedida
❌ Se ambos avaliam mal (≤3) → Não é contratação bem-sucedida
```

Métrica é **difícil de manipular** - precisa REALMENTE funcionar.

---

## 📊 Como Medir

### Fórmula

```
North Star Score = 
  (Contratações com avaliação ≥4 estrelas) / 
  (Todas as propostas aceitas) × 100

Exemplo:
- 80 propostas aceitas no mês
- 65 resultaram em evento com avaliação ≥4
- North Star = 65/80 × 100 = 81.25%
```

### Breakdown por Etapa

Para entender onde está o problema (se houver):

```typescript
type ConversionFunnel = {
  propostas_enviadas: number        // 1000
  propostas_aceitas: number          //  200 (20% conversão)
  eventos_confirmados: number        //  190 (95% confirmam)
  eventos_realizados: number         //  180 (95% comparecem)
  eventos_pagos: number              //  175 (97% pagam)
  eventos_avaliados: number          //  170 (97% avaliam)
  eventos_positivos: number          //  160 (94% avaliam ≥4)
  
  north_star_score: 160/200 = 80%
}
```

**Onde perder usuários**:
- Proposta aceita → Evento não confirmado: Problema na confirmação
- Confirmado → Não realizado: Problema de comparecimento
- Realizado → Não pago: Problema de pagamento
- Pago → Não avaliado: Problema de engajamento
- Avaliado → Nota baixa: Problema de qualidade/match

---

## 🎯 Metas

### Baseline (Pré-Beta)
**0%** - Ainda não lançado

### Meta Beta (Primeiros 3 meses)
**≥60%** - Aprendizado inicial, ajustes necessários

### Meta 6 meses
**≥70%** - Sistema está funcionando bem

### Meta 1 ano
**≥80%** - Excelência operacional

### Meta Longo Prazo (2+ anos)
**≥85%** - Melhor da categoria

---

## 🔗 Como Todas as Features se Conectam

Cada feature do produto deve ser listada abaixo em blocos padronizados. Use sempre os campos **Conexão**, **Impacto na North Star** e **KPI de validação** para manter um padrão reconhecível e permitir ajustes posteriores.

### Bloco padrão (repetir para cada feature)

- **Conexão**: (uma linha)
- **Impacto na North Star**: (lista ou parágrafo)
- **KPI de validação**: (métrica)

---

### [Exemplo: Sistema de Busca e Ranking]

**Conexão**: Ranking baseado em mérito → Melhores resultados aparecem primeiro.

**Impacto na North Star**:
- Bom ranking = Match adequado
- Match adequado = Resultado bem-sucedido
- Resultado bem-sucedido = Avaliação positiva ✅

**KPI de validação**: Taxa de conversão proposta→aceite

---

### [Nome da próxima feature]

**Conexão**: (descrever como esta feature se conecta à North Star)

**Impacto na North Star**: (listar elos de causa-efeito até a métrica)

**KPI de validação**: (métrica para validar)

---

(Adicionar novos blocos conforme as features do projeto, seguindo o padrão acima.)

---

## 🚫 O que NÃO é North Star

Para deixar claro:

### ❌ Número Total de Usuários

**Por quê NÃO**:
- Pode ter 10.000 usuários inativos
- Não mede se produto é bom
- Vanity metric

**Usamos para**: Crescimento, mas não é North Star

---

### ❌ Número de Propostas Enviadas

**Por quê NÃO**:
- Pode ter 1.000 propostas e zero aceite
- Volume ≠ qualidade
- Não mede sucesso

**Usamos para**: Engajamento, mas não é North Star

---

### ❌ Receita

**Por quê NÃO**:
- É consequência de North Star, não causa
- Pode aumentar receita mas piorar UX (preços altos)
- Foco deve ser valor para usuário

**Usamos para**: Sustentabilidade, mas North Star vem primeiro

---

## 📈 Como Melhorar North Star

### Se North Star está baixo (<60%)

**Investigar**:
1. Onde no funil estamos perdendo? (ver breakdown)
2. Qual tipo de usuário tem problema? (músico/contratante)
3. Qual tipo de evento tem problema? (casamento/bar/etc.)

**Ações possíveis**:
- Melhorar ranking (se match está ruim)
- Melhorar propostas (se expectativas não alinham)
- Melhorar perfis (se falta informação)
- Melhorar comunicação (se há mal-entendidos)
- Melhorar escrow (se há problemas de pagamento)

---

### Se North Star está médio (60-80%)

**Otimizar**:
1. Identificar segmentos com North Star >80%
2. Entender o que funciona neles
3. Replicar para outros segmentos

**Exemplo**:
```
Casamentos: 85% North Star ✅
Bares: 65% North Star ⚠️

Por quê?
- Casamentos: Maior cachê → Músico se dedica mais
- Bares: Menor cachê → Músico pode não levar a sério

Ação:
- Exigir portfólio específico para bares
- Ou aumentar cachê mínimo de bares
```

---

## 🔄 Relação com OKRs

Todos os OKRs devem **contribuir** para North Star.

### Exemplo de Alinhamento

**OKR Q1 2026**: Finalizar template do perfil do músico

**Como impacta North Star**:
```
Perfil completo →
Contratante vê portfólio →
Decide melhor →
Match adequado →
Evento bem-sucedido →
Avaliação positiva ✅
```

**KPI de validação**:
- % de perfis completos
- Taxa de conversão (perfil completo vs incompleto)

---

## 📊 Dashboard de North Star

### Visão Geral

```
NORTH STAR SCORE: 78.5%
Contratações bem-sucedidas: 157 / 200

Breakdown:
✅ Propostas aceitas: 200
✅ Eventos confirmados: 195 (97.5%)
✅ Eventos realizados: 185 (95%)
✅ Eventos pagos: 180 (97%)
✅ Eventos avaliados: 175 (97%)
✅ Avaliações ≥4 estrelas: 157 (90%)
```

### Por Segmento

```
Por tipo de evento:
🎉 Casamentos: 85% (50/59)
🎸 Bares: 68% (34/50)
🏢 Corporativos: 82% (41/50)
🎊 Festas: 77% (32/41)
```

### Tendência

```
Jan: 65%
Fev: 72%
Mar: 78% ← Melhorando! 📈
```

---

## 💡 Comunicação da North Star

### Para Equipe Interna

**Toda reunião começa com**:
```
"Nossa North Star esta semana: 78%
(+2% vs semana passada) 📈

O que ajudou:
- Melhorias no sistema de propostas
- Novos músicos com portfólio completo

O que atrapalhou:
- Aumento de eventos em bares (North Star mais baixo)
```

### Para Usuários

**Dashboard do músico**:
```
🌟 Seus eventos bem-sucedidos: 15/18 (83%)
Você está acima da média da plataforma! (78%)

Dica para melhorar:
- Continue respondendo rápido (seu tempo: 2h)
- Mantenha perfil atualizado
```

**Dashboard do contratante**:
```
🌟 Suas contratações bem-sucedidas: 8/10 (80%)

Última contratação:
João Silva - 5 estrelas ⭐
"Excelente profissional!"
```

---

## 🛡️ Como ADRs Protegem a North Star

As decisões arquiteturais (ADRs) foram tomadas especificamente para **proteger e maximizar** a North Star Metric:

### ADR-001: Sem Plano Premium para Músicos
**Proteção**: Garante que ranking é por mérito real (não por quem paga mais)

**Impacto na North Star**:
```
Ranking baseado em mérito →
Melhores músicos aparecem primeiro →
Contratantes escolhem músicos adequados →
Match de qualidade →
Contratação bem-sucedida ✅
```

### ADR-002: Ranking Apenas por Mérito
**Proteção**: Garante que dados são verificáveis e confiáveis

**Impacto na North Star**:
```
Ranking baseado em dados reais →
Avaliações refletem qualidade →
Contratantes confiam no ranking →
Escolhem com segurança →
Contratação bem-sucedida ✅
```

### ADR-006: Empresas NÃO Convidam Músicos
**Proteção**: Garante processo formal de contratação e dados verificáveis

**Impacto na North Star**:
```
Contratação formal via Find-Performances →
Processo transparente com propostas →
Avaliações registradas →
Histórico verificável →
Match baseado em dados →
Contratação bem-sucedida ✅
```

**Por que isso importa**:
- Sem fluxo formal = Sem avaliações = Sem dados para North Star
- Empresas contratando por "quem conhece" ≠ Match de qualidade
- Bypass do fluxo = Sem receita = Sem melhorias = Pior UX = Menos North Star

### ADR-007: Músico como Única Empresa PF
**Proteção**: Garante que músicos têm ferramentas adequadas para gestão profissional

**Impacto na North Star**:
```
Músico tem CRM/ERP →
Gerencia propostas profissionalmente →
Não perde oportunidades →
Forma equipe adequada (banda) →
Apresentação de qualidade →
Contratante satisfeito →
Contratação bem-sucedida ✅
```

**E para outros PF**:
```
Fotógrafo foca no que importa (portfólio) →
Não se distrai com features irrelevantes →
Melhor apresentação →
Contratação adequada →
Trabalho bem-sucedido ✅
```

**Por que isso importa**:
- Músico precisa de gestão empresarial = Carreira profissional = Mais contratações
- Outros PF focam em portfólio = Menos confusão = Melhor experiência
- Features relevantes = UX melhor = Mais satisfação = Mais North Star

### ADR-008: Profile como Fonte de Herança (Não É Vitrine)
**Proteção**: Garante que avaliações medem trabalho específico e facilitam networking

**Impacto na North Star**:
```
Avaliações de projetos específicos →
Feedback preciso e relevante →
Melhoria focada →
Próximas contratações melhores →
Contratações bem-sucedidas ✅
```

**E para networking**:
```
Profissional vê bom trabalho →
Busca Profile (currículo) do colega →
Convida para novo projeto →
Equipe de qualidade →
Trabalho melhor →
Avaliação positiva ✅
```

**Por que isso importa**:
- Avaliações precisas de trabalho específico = Dados verificáveis = Melhoria real
- Networking via Profile = Equipes melhores = Trabalhos melhores = Mais North Star
- Sem avaliações genéricas = Sem confusão = Match adequado = Contratações bem-sucedidas

### ADR-009: Sistema de Múltiplos Perfis
**Proteção**: Permite artistas diversificarem carreira sem fricção

**Impacto na North Star**:
```
Músico cria perfil de Técnico →
Mais oportunidades de trabalho →
Mais contratações →
Mais contratações bem-sucedidas ✅
```

**Por que isso importa**:
- Profissionais podem evoluir carreira = Permanecem ativos na plataforma
- Multi-disciplinar = Mais network effect = Melhores projetos = Mais North Star

### ADR-010: Tipos Genéricos com Especialidades
**Proteção**: Estrutura escalável e consistente para todos os tipos

**Impacto na North Star**:
```
Estrutura consistente →
Código confiável →
Menos bugs →
UX melhor →
Mais satisfação ✅
```

**Por que isso importa**:
- Profissional pode destacar múltiplas habilidades = Aparece em mais buscas = Mais matches
- Buscas precisas = Match adequado = Contratações bem-sucedidas

### ADR-011: Fronteira Baseada em Arte Performática
**Proteção**: Mantém identidade forte e diferencial competitivo

**Impacto na North Star**:
```
Identidade clara ("Plataforma das Artes") →
Artistas sérios se identificam →
Rede de alta qualidade →
Melhor matching →
Contratações bem-sucedidas ✅
```

**E network effect artístico**:
```
Músico + Dançarino + Ator = Musical →
Projeto multidisciplinar →
Qualidade superior →
Contratante mais satisfeito →
Avaliação positiva ✅
```

**Por que isso importa**:
- Foco em arte = Qualidade > Quantidade = Artistas sérios = Mais North Star
- Network effect entre artes = Projetos inovadores = Diferenciação = Sucesso
- Sem diluição de marca = Posicionamento forte = Atrai melhores profissionais = Mais North Star

---

## 📚 Referências

- [OKRs Q1 2026](../okrs-kpis-q1-2026.md) - Todos alinham com North Star
- [Guardrails](../../ai/guardrails.md) - Princípios que protegem North Star
- [Metric Dictionary](./metric-dictionary.md) - Como calcular métricas
- [ADRs](../../decisions/) - Decisões arquiteturais que protegem North Star

---

**Criado em**: 2026-01-20  
**Última atualização**: 2026-01-20  
**Revisão**: Trimestral  
**Responsável**: Frontend Template Creator

---

## ✨ Lembre-se

> **"Se uma feature não aproxima da North Star, por que estamos fazendo?"**
> 
> Toda decisão, toda feature, todo ajuste deve ter resposta para:
> **"Isso aumenta contratações bem-sucedidas com avaliação positiva?"**
> 
> Se sim → Priorizar  
> Se não → Reconsiderar
