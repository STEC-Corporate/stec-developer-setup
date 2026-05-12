# Modelo de Receita - SoundLink

> **Documento Estratégico**: Modelo de receita detalhado da plataforma SoundLink, incluindo fontes de receita, validação contra guardrails e projeções.

---

## 🎯 Princípios Fundamentais

### Plataforma 100% Gratuita

**Consultar**: `docs/decisoes/adr-015-platform-100-percent-free.md`

- ✅ **Acesso completo e gratuito** para todos os perfis
- ✅ **Zero mensalidade, zero assinatura**
- ✅ **Zero taxa de permanência** (não cobramos usuários inativos)
- ✅ **Receita única**: Comissões sobre contratações bem-sucedidas

**Por quê?**:
- Zero barreira de entrada → Crescimento viral natural
- Alinhamento total → Sucesso do usuário = receita da plataforma
- LTV muito maior → R$ 3.240 vs R$ 500 de mensalidade
- Churn baixíssimo → Não há mensalidade para cancelar

---

## 💰 Fontes de Receita

### 1. Comissões sobre Contratações (Principal)

**Status**: ✅ Implementada e ativa

**Modelo**: Taxa progressiva sobre valor da contratação

**Fórmula**:
```
Taxa = máximo(10% - (0,5% × piso(valor / 1.000)), 5%)
```

**Tabela de Taxas**:

| Valor da Contratação | Taxa Aplicada | Valor da Taxa | Divisão 50/50 |
|---------------------|---------------|---------------|---------------|
| R$ 500              | 10%           | R$ 50         | R$ 25 cada    |
| R$ 1.000            | 9,5%          | R$ 95         | R$ 47,50 cada |
| R$ 2.000            | 9%            | R$ 180        | R$ 90 cada    |
| R$ 3.000            | 8,5%          | R$ 255        | R$ 127,50 cada|
| R$ 4.000            | 8%            | R$ 320        | R$ 160 cada   |
| R$ 5.000            | 7,5%          | R$ 375        | R$ 187,50 cada|
| R$ 7.000            | 6,5%          | R$ 455        | R$ 227,50 cada|
| R$ 10.000           | 5%            | R$ 500        | R$ 250 cada   |
| R$ 15.000+          | 5% (mínimo)   | 5% do valor   | 50% cada     |

**Divisão da Taxa**: 50% contratante + 50% prestador

**Exemplo**:
- Contratação de R$ 2.000 (taxa 9% = R$ 180)
- **Contratante paga**: R$ 2.000 + R$ 90 = **R$ 2.090**
- **Prestador recebe**: R$ 2.000 - R$ 90 = **R$ 1.910**
- **SoundLink recebe**: R$ 90 + R$ 90 = **R$ 180**

**Incentivo Inicial**: Primeiras 3 contratações com taxa fixa de 5%

**Por que taxa progressiva?**:
- ✅ Incentiva contratações de maior valor (mais qualidade)
- ✅ Justo: quanto maior o valor, menor a taxa percentual
- ✅ Competitivo: 5-10% vs 10-20% (Upwork/Fiverr)

**Validação contra Guardrails**:
- ✅ Não viola guardrail de ranking (taxa não afeta posição)
- ✅ Não viola guardrail de transparência (taxa clara e divulgada)
- ✅ Alinhado com modelo de negócio sustentável

**Projeção de Receita**:

| Cenário | Contratações/mês | Ticket Médio | Taxa Média | Receita Mensal |
|---------|------------------|--------------|------------|----------------|
| Início | 20 | R$ 1.200 | 9,5% | R$ 2.280 |
| Crescimento | 50 | R$ 1.500 | 9% | R$ 6.750 |
| Escala | 200 | R$ 2.000 | 8% | R$ 32.000 |

---

### 2. Planos Premium para Contratantes (Futuro)

**Status**: ⏳ Potencial fonte futura (não implementada)

**Validação contra Guardrails**:
- ✅ **PERMITIDO** para contratantes (não competem entre si)
- ❌ **PROIBIDO** para músicos (guardrail inviolável)

**Modelo Proposto** (futuro):
- Plano Básico: Gratuito (atual)
- Plano Premium: R$ 99/mês
  - Busca avançada
  - Análise de perfil detalhada
  - Suporte prioritário
  - Relatórios de métricas

**Impacto Estimado**:
- Taxa de conversão: 5-10% dos contratantes
- 100 contratantes ativos → 5-10 premium → R$ 495-990/mês

**Quando Implementar**:
- Após validar demanda real
- Sem violar guardrails
- Como complemento (não substituição) do modelo de comissões

---

### 3a. Serviços Financeiros Opcionais (Futuro, alinhado à era IA)

**Status**: ⏳ Potencial fonte futura (não implementada)

**Contexto**: Na era da IA, monetização pode vir de **serviços avançados opcionais** sem violar igualdade de destaque (guardrail: sem premium de visibilidade para músicos).

**Exemplos de serviços** (a validar com produto/jurídico):
- Antecipação de cachê
- Seguro de evento
- Emissão de nota integrada
- Microcrédito artístico

**Validação contra Guardrails**:
- ✅ Não é destaque pago para músicos
- ✅ Gera receita sem quebrar igualdade na busca/ranking
- ✅ Alinhado com visão de infraestrutura financeira (lock-in operacional)

**Consultar**: `.cursor/docs/ia/moats/operational-lock-in-strategy.md`, `.cursor/docs/ia/strategic/strategic-principles-ia-era.md`

---

### 3. Marketplace de Serviços (Futuro)

**Status**: ⏳ Potencial fonte futura (não implementada)

**Modelo Proposto** (futuro):
- Taxa sobre intermediação de serviços adicionais
- Exemplos: Equipamentos, transporte, hospedagem

**Validação contra Guardrails**:
- ✅ Não pode violar guardrail de ranking
- ✅ Não pode violar guardrail de transparência
- ✅ Deve manter alinhamento com North Star

**Impacto Estimado**: A definir após validação de demanda

---

## 📊 Projeções por Fonte de Receita

### Cenário Realista (12 meses)

| Fonte | Mês 1-3 | Mês 4-6 | Mês 7-9 | Mês 10-12 |
|-------|---------|---------|---------|-----------|
| Comissões | R$ 2.280 | R$ 6.750 | R$ 15.300 | R$ 32.000 |
| Premium (futuro) | R$ 0 | R$ 0 | R$ 0 | R$ 0 |
| Marketplace (futuro) | R$ 0 | R$ 0 | R$ 0 | R$ 0 |
| **Total** | **R$ 2.280** | **R$ 6.750** | **R$ 15.300** | **R$ 32.000** |

### Cenário Otimista (12 meses)

| Fonte | Mês 1-3 | Mês 4-6 | Mês 7-9 | Mês 10-12 |
|-------|---------|---------|---------|-----------|
| Comissões | R$ 3.000 | R$ 9.000 | R$ 20.000 | R$ 45.000 |
| Premium (futuro) | R$ 0 | R$ 0 | R$ 500 | R$ 1.500 |
| Marketplace (futuro) | R$ 0 | R$ 0 | R$ 0 | R$ 0 |
| **Total** | **R$ 3.000** | **R$ 9.000** | **R$ 20.500** | **R$ 46.500** |

### Cenário Pessimista (12 meses)

| Fonte | Mês 1-3 | Mês 4-6 | Mês 7-9 | Mês 10-12 |
|-------|---------|---------|---------|-----------|
| Comissões | R$ 1.500 | R$ 4.500 | R$ 10.000 | R$ 20.000 |
| Premium (futuro) | R$ 0 | R$ 0 | R$ 0 | R$ 0 |
| Marketplace (futuro) | R$ 0 | R$ 0 | R$ 0 | R$ 0 |
| **Total** | **R$ 1.500** | **R$ 4.500** | **R$ 10.000** | **R$ 20.000** |

---

## 🛡️ Validação contra Guardrails

### ❌ NUNCA Implementar

**Consultar**: `.cursor/docs/ia/guardrails.md`

1. **Destaque pago para músicos**
   - ❌ Não criar planos premium para músicos
   - ❌ Não criar boost pago
   - ❌ Não criar "destacar meu perfil"
   - ❌ Não criar "impulsionamento"

2. **Manipulação de ranking**
   - ❌ Não permitir comprar posição no ranking
   - ❌ Não permitir alterar ranking por pagamento

3. **Bypass do fluxo de contratação**
   - ❌ Não permitir contratação sem passar por fluxo formal
   - ❌ Não permitir empresas convidarem músicos diretamente

### ✅ SEMPRE Validar

1. **Ranking baseado em mérito**
   - ✅ Taxa não afeta posição no ranking
   - ✅ Ranking baseado em dados verificáveis

2. **Transparência**
   - ✅ Taxa clara e divulgada
   - ✅ Divisão 50/50 transparente

3. **Alinhamento com North Star**
   - ✅ Modelo incentiva contratações bem-sucedidas
   - ✅ Receita correlacionada com satisfação

---

## 📈 Relação com North Star Metric

### Conexão Receita ↔ North Star

**Cadeia de Causa-Efeito**:
```
Mais contratações bem-sucedidas (≥4 estrelas) →
Mais confiança na plataforma →
Mais eventos futuros →
Mais comissões →
Mais receita
```

### Validação

- **North Star alto (≥80%)**: Usuários satisfeitos → Retenção alta → Mais contratações → Mais receita
- **North Star baixo (<60%)**: Usuários insatisfeitos → Churn alto → Menos contratações → Menos receita

**Conclusão**: Modelo de receita está alinhado com North Star Metric.

---

## 🎯 Break-Even e Sustentabilidade

### Break-Even Point

**Cálculo**:
```
Break-Even = Custo fixo total / Receita média por contratação
```

**Cenários**:

| Cenário | Custo Fixo | Ticket Médio | Taxa Média | Break-Even |
|---------|------------|--------------|------------|------------|
| Conservador | R$ 2.950 | R$ 500 | 10% (R$ 50) | 59 contratações/mês |
| Realista | R$ 2.950 | R$ 1.500 | 9% (R$ 135) | 22 contratações/mês |
| Otimista | R$ 2.950 | R$ 3.000 | 8,5% (R$ 255) | 12 contratações/mês |

**Status Atual**: Break-even alcançável em 3-6 meses com crescimento orgânico

---

## 📚 Referências

- **ADR-015**: `docs/decisoes/adr-015-platform-100-percent-free.md`
- **Análise de Custos**: `docs/referencia/business/analise-custos-infraestrutura-2026.md`
- **Guardrails**: `.cursor/docs/ia/guardrails.md`
- **North Star Metric**: `docs/planejamento/metrics/north-star.md`
- **Skill de Análise Financeira**: `.cursor/skills/evaluate-financial-strategy/SKILL.md`

---

**Criado em**: 2026-01-21  
**Última atualização**: 2026-01-21  
**Revisão**: Trimestral  
**Responsável**: Strategic Advisor
