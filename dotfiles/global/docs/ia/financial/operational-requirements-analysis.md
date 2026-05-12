# Análise de Requisitos Operacionais - SoundLink

> **Documento Estratégico**: Análise detalhada de itens operacionais citados na ADR-020 (sistema de pagamentos, seguros, compliance/KYC, suporte), para fundamentar decisões de utilidade, inclusão e priorização.

---

## 📑 Índice

1. [Sistema de Pagamentos](#1-sistema-de-pagamentos)
2. [Seguro D&O e Responsabilidade Civil](#2-seguro-do-e-responsabilidade-civil)
3. [Compliance e KYC](#3-compliance-e-kyc)
4. [Ferramentas de Suporte](#4-ferramentas-de-suporte)
5. [Recomendações por Fase](#5-recomendações-por-fase)

---

## 1. Sistema de Pagamentos

### O que é

O sistema de pagamentos de um marketplace inclui:

- **Gateway**: intermediário que processa pagamentos (PIX, cartão, boleto)
- **Escrow**: retenção do valor até conclusão do serviço (protege ambas as partes)
- **Split de pagamento**: divisão automática entre plataforma (comissão), prestador (cachê) e eventualmente terceiros
- **Conciliação**: reconciliação de transações com relatórios e extratos

### Opções no mercado brasileiro

| Gateway | PIX | Cartão | Split marketplace | Escrow | Custo típico |
|---------|-----|--------|-------------------|--------|--------------|
| **Stripe Connect** | ✅ | ✅ | ✅ | ✅ | ~2,5–3% + R$ 0,39/transação |
| **Mercado Pago** | ✅ | ✅ | ✅ (Split) | Via link | ~2–3% (varia por plano) |
| **PagSeguro** | ✅ | ✅ | ✅ (Split) | Integrado | ~2,99–4,99% |
| **Pagar.me** | ✅ | ✅ | ✅ | Via API | ~2,49–3,49% |
| **PagBank** | ✅ | ✅ | ✅ | Sim | Negociável por volume |

### Requisitos para marketplace SoundLink

- **Split obrigatório**: repasse automático para prestador (cachê) e retenção da comissão da plataforma (ADR-012, ADR-014)
- **Métodos**: PIX (prioridade) e cartão de crédito
- **Escrow desejável**: reduz disputas; liberar pagamento após confirmação de realização do evento
- **NF-e/Nota fiscal**: prestador emite; plataforma pode exigir comprovação para liberar repasse

### Utilidade para SoundLink

| Aspecto | Utilidade | Quando necessário |
|---------|-----------|-------------------|
| Gateway + split | **Essencial** | Desde primeira transação paga na plataforma |
| Escrow | **Alta** | Reduz conflitos; recomendado desde o lançamento |
| Antecipação de recebíveis | Baixa (início) | Útil quando volume alto de prestadores precisar de liquidez |

### Recomendação

- **Incluir** desde o lançamento (fim 2026/início 2027)
- **Custo**: variável (~2% sobre GMV); não é custo fixo mensal relevante no planejamento inicial
- **Próximo passo**: definir gateway (Stripe Connect, Mercado Pago ou PagSeguro) e documentar em ADR específica

---

## 2. Seguro D&O e Responsabilidade Civil

### O que é

**D&O (Diretors and Officers)**  
Seguro que protege diretores e executivos contra ações judiciais por decisões de gestão (erros, omissões, má administração). Comum em empresas com investidores ou conselho.

**Responsabilidade Civil (RC)**  
Seguro que cobre danos a terceiros causados pela atividade da empresa. Para plataformas: falhas na operação (ex.: vazamento de dados), danos a usuários ou prestadores.

### Quando é necessário

| Tipo | Obrigatório por lei? | Comum quando |
|------|----------------------|-------------|
| **D&O** | Não | Investidores, conselho, fusões/aquisições |
| **RC** | Não (geral) | Grandes operações; contratos com clientes corporativos; mitigação de risco |

### Para a SoundLink

- **D&O**: Não prioritário na fase bootstrap; considerar se houver investidores externos ou conselho formal
- **RC**: Útil para mitigar risco de processos (ex.: falha na plataforma, dados, LGPD). Custo moderado (R$ 200–500/mês para startup pequena)

### Utilidade

| Fase | D&O | Responsabilidade Civil |
|------|-----|------------------------|
| Pré-lançamento / testes | ❌ Desnecessário | ⚠️ Opcional (avaliar risco) |
| Lançamento | ❌ Desnecessário | ⚠️ Recomendado para tranquilidade |
| Com investidores | ✅ Avaliar | ✅ Recomendado |
| Grande escala | ✅ Avaliar | ✅ Recomendado |

### Recomendação

- **D&O**: **Adiar** até investidores externos ou conselho formal
- **Responsabilidade civil**: **Avaliar** no lançamento; custo baixo (R$ 200–400/mês) pode ser justificado para reduzir exposição
- **Alternativa**: Operar sem RC inicialmente e contratar quando volume ou sensibilidade aumentar

---

## 3. Compliance e KYC

### O que é

**Compliance**  
Conformidade com leis e regulamentações (LGPD, Código de Defesa do Consumidor, regulamentação do Banco Central etc.).

**KYC (Know Your Customer)**  
Verificação de identidade e legitimidade de clientes. Em contexto financeiro: obrigatório para instituições financeiras e operações com alto risco de lavagem de dinheiro.

### Quando KYC é obrigatório

- **Instituições financeiras**: Obrigatório (Banco Central)
- **Plataformas de pagamento** (quem processa pagamentos): Podem ter requisitos conforme regulamento
- **Marketplaces que intermedeiam pagamentos**: O gateway geralmente assume parte da responsabilidade; a plataforma pode precisar validar prestadores em alguns cenários
- **Alto volume / valores altos**: Maior pressão regulatória e dos gateways para KYC dos sellers

### Para a SoundLink

- **LGPD**: Obrigatória; já coberta em termos de uso e políticas (ver guardrails, ADR-020)
- **KYC formal**: Não obrigatório para marketplace de serviços artísticos no modelo atual; gateways (Stripe, Mercado Pago) fazem KYC dos recebedores ao abrir conta
- **Validação de prestadores**: Cadastro com CPF/CNPJ e dados básicos; pode ser suficiente na fase inicial

### Utilidade

| Item | Obrigatório? | Utilidade para SoundLink | Custo estimado |
|------|---------------|--------------------------|----------------|
| LGPD (termos, DPO, auditoria) | Sim | Essencial | Ver ADR-020 (jurídico) |
| KYC robusto (documento, selfie, etc.) | Não (início) | Baixa | R$ 0–100/usuário (ferramentas) ou incluído no gateway |
| Compliance AML (lavagem) | Depende | Baixa em marketplace de serviços | — |
| Auditoria de conformidade | Opcional | Baixa no início | R$ 2.000–5.000/ano |

### Recomendação

- **LGPD**: Manter conforme já planejado (termos, políticas, ferramentas)
- **KYC formal**: **Adiar**; gateway faz verificação básica ao cadastrar recebedores; reforçar KYC se volume ou ticket médio crescer muito
- **Compliance dedicado**: **Não** na fase inicial; tratar no âmbito do jurídico e do gateway

---

## 4. Ferramentas de Suporte

### O que é

Ferramentas para atendimento ao usuário: tickets, chat, FAQ, base de conhecimento.

### Opções

| Ferramenta | Tipo | Custo típico | Destaques |
|------------|------|--------------|-----------|
| **Email (suporte@soundlink.com.br)** | Manual | R$ 0 | Simples; sem gestão de tickets ou SLA |
| **Zendesk** | Ticketing + conhecimento | R$ 50–200/agente/mês | Suporte estruturado, relatórios |
| **Intercom** | Chat + automação | R$ 70–200/mês | Chat ao vivo, bots, produto |
| **Freshdesk** | Ticketing | R$ 0–100/agente/mês | Alternativa ao Zendesk |
| **Crisp / Tawk** | Chat | R$ 0–50/mês | Mais barato; menos recursos |
| **Central de Ajuda (fe-help)** | FAQ interno | R$ 0 | Já existente; reduz tickets simples |

### Quando fazer sentido

| Volume estimado | Recomendação | Custo |
|-----------------|--------------|-------|
| &lt; 50 tickets/mês | Email + Central de Ajuda | R$ 0 |
| 50–200 tickets/mês | Crisp, Tawk ou plano básico Zendesk | R$ 0–100 |
| 200+ tickets/mês | Zendesk ou Intercom com SLA | R$ 100–200 |

### Utilidade para SoundLink

- **Pré-lançamento / testes**: Email suficiente
- **Lançamento**: Avaliar volume; Central de Ajuda + email podem bastar
- **Crescimento**: Migrar para Zendesk/Intercom quando tickets atrapalharem ou precisar de métricas de SLA

### Recomendação

- **Fase inicial**: **Email + Central de Ajuda** (R$ 0)
- **Quando adotar ferramenta**: Ao atingir ~50+ tickets/mês ou necessidade de SLA/relatórios
- **Custo planejado na ADR-020 (R$ 0–200)**: Reserva para adoção quando fizer sentido

---

## 5. Recomendações por Fase

### Pré-lançamento (até meados 2026)

| Item | Decisão | Custo |
|------|---------|-------|
| Sistema de pagamentos | Definir e integrar gateway + split | Variável (~2% GMV) |
| D&O | Não contratar | R$ 0 |
| Responsabilidade civil | Avaliar; pode adiar | R$ 0 ou R$ 200–400 |
| KYC | Delegar ao gateway | R$ 0 |
| Suporte | Email + Central de Ajuda | R$ 0 |

### Lançamento (fim 2026 / início 2027)

| Item | Decisão | Custo |
|------|---------|-------|
| Gateway | Em produção | Variável |
| D&O | Manter adiado | R$ 0 |
| Responsabilidade civil | Recomendado contratar | R$ 200–400 |
| KYC | Manter delegado ao gateway | R$ 0 |
| Suporte | Avaliar por volume | R$ 0–100 |

### Crescimento (2027+)

| Item | Decisão | Custo |
|------|---------|-------|
| D&O | Avaliar se investidores/conselho | R$ 300–800 |
| KYC | Reforçar se volume/alvo exigir | R$ 100–300 |
| Suporte | Zendesk/Intercom se &gt; 50 tickets/mês | R$ 100–200 |

---

## 📚 Referências

- **ADR-020**: Custos operacionais e sustentabilidade (tabela de custos)
- **ADR-012, ADR-013, ADR-014**: Modelo de comissões e split
- **cost-analysis.md**: Custos fixos e variáveis
- **Guardrails**: LGPD e privacidade

---

**Criado em**: 2026-02-11  
**Última atualização**: 2026-02-11  
**Revisão**: Trimestral ou quando houver decisões sobre gateway, seguros ou suporte
