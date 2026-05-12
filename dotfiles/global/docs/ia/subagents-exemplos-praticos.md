# Exemplos Práticos de Uso dos Agents - SoundLink

> **Exemplos de uso dos agents do Template (soundlink-template-frontend).** Os agents do Frontend Oficial, do BFF e das APIs têm exemplos na documentação de cada repositório.

---

## Índice

1. [Cenários Comuns](#cenários-comuns)
2. [Fluxos de Trabalho](#fluxos-de-trabalho)
3. [Pipeline: planejamento-criador → planejamento-executor → testes-verificador](#pipeline-planejamento-criador--planejamento-executor--testes-verificador)
4. [Padrões de Orquestração](#padrões-de-orquestração)

---

## Cenários Comuns

### Cenário 1: Implementar Nova Feature

**Situação**: Você precisa implementar uma nova feature, por exemplo, "Sistema de Avaliações de Músicos".

**Fluxo Recomendado**:

```
1. Primeiro, valide contra guardrails:
> /seguranca-verificador-guardrails validar esta proposta: Sistema de avaliações de músicos

2. Valide estrutura arquitetural:
> /arquitetura-validar-limpa validar a estrutura da feature de avaliações

3. Implemente a feature (agente principal)

4. Execute testes:
> /testes-executor executar testes para a feature de avaliações

5. Valide completude:
> /testes-completude-feature verificar se a feature de avaliações está completa

6. Gere documentação:
> /docs-gerador documentar a feature de avaliações (user stories, user-flow, APIs se aplicável)

7. Gates (antes de merge/release, quando aplicável):
> Execute gate-arquitetura, gate-seguranca, gate-testes e gate-ci

8. Verificação final:
> /testes-verificador confirmar que a feature de avaliações está completa e funcional
```

**Exemplo Completo de Prompt**:
```
Preciso implementar o sistema de avaliações de músicos. 
Use o seguranca-verificador-guardrails para validar que não viola princípios, 
depois o arquitetura-validar-limpa para validar estrutura, 
e após implementar, use o testes-executor, testes-completude-feature,
rode os gates (arquitetura/segurança/testes/ci) e por fim o testes-verificador.
```

---

### Cenário 2: Refatorar Código Existente

**Situação**: Você precisa refatorar uma feature existente para melhorar a arquitetura.

**Fluxo Recomendado**:

```
1. Valide estrutura atual:
> /arquitetura-validar-limpa analisar a estrutura atual da feature musician-projects

2. Valide tipos TypeScript:
> /typescript-estrito validar conformidade TypeScript na feature musician-projects

3. Refatore (agente principal)

4. Execute testes:
> /testes-executor executar testes após refatoração

5. Verifique se nada quebrou:
> /testes-verificador confirmar que a refatoração não quebrou funcionalidades existentes
```

**Exemplo Completo de Prompt**:
```
Vou refatorar a feature musician-projects. 
Primeiro valide a estrutura atual com arquitetura-validar-limpa, 
depois valide TypeScript com typescript-estrito. 
Após refatorar, execute testes e valide com testes-verificador.
```

---

### Cenário 3: Implementar Funcionalidade de Segurança

**Situação**: Você precisa implementar autenticação ou lidar com pagamentos.

**Fluxo Recomendado**:

```
1. Valide guardrails primeiro:
> /seguranca-verificador-guardrails validar proposta de autenticação

2. Implemente (agente principal)

3. Audite segurança:
> /seguranca-auditor auditar a implementação de autenticação

4. Execute testes:
> /testes-executor executar testes relacionados à segurança

5. Verificação final:
> /testes-verificador confirmar que o fluxo de autenticação está seguro e funcional
```

**Exemplo Completo de Prompt**:
```
Implementei o fluxo de autenticação OAuth. 
Use o seguranca-auditor para auditar a implementação em busca de vulnerabilidades, 
depois o testes-executor para executar testes de segurança, 
rode gate-seguranca e finalmente use testes-verificador.
```

---

### Cenário 4: Corrigir Bug ou Erro

**Situação**: Você encontrou um erro e precisa depurar.

**Fluxo Recomendado**:

```
1. Depure o erro:
> /debug-depurador investigar este erro: [mensagem de erro]

2. Após correção, execute testes:
> /testes-executor executar testes para verificar a correção

3. Verifique se está completo:
> /testes-verificador confirmar que a correção está completa e funcionando
```

**Exemplo Completo de Prompt**:
```
Encontrei este erro ao testar a busca de músicos:
"TypeError: Cannot read property 'name' of null"

Use o debug-depurador para investigar a causa raiz, 
depois execute testes com testes-executor, 
e valide com testes-verificador que a correção está completa.
```

---

### Cenário 5: Trabalhar com Features ERP/CRM

**Situação**: Você precisa implementar ou refatorar features ERP/CRM.

**Fluxo Recomendado**:

```
1. Consulte especialista ERP/CRM:
> /orquestracao-especialista-erp-crm validar a estrutura da feature financeira (ERP/CRM)

2. Valide arquitetura:
> /arquitetura-validar-limpa validar a estrutura da feature ERP/CRM

3. Implemente (agente principal)

4. Valide completude:
> /testes-completude-feature verificar completude da feature ERP/CRM

5. Gere documentação:
> /docs-gerador gerar documentação da feature ERP/CRM
```

**Exemplo Completo de Prompt**:
```
Preciso expandir a feature Financeiro para incluir ERP contábil completo. 
Use o orquestracao-especialista-erp-crm para validar a estrutura, 
o arquitetura-validar-limpa para validar arquitetura, 
e após implementar, use testes-completude-feature e docs-gerador.
```

---

## 🔄 Fluxos de Trabalho

### Fluxo Completo: Feature do Zero ao Deploy

```
┌─────────────────────────────────────────────────────────────┐
│ 1. VALIDAÇÃO INICIAL                                        │
│    /seguranca-verificador-guardrails → Valida princípios    │
│    /arquitetura-validar-limpa → Valida estrutura            │
└─────────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────────┐
│ 2. IMPLEMENTAÇÃO                                             │
│    Agente Principal → Implementa feature                     │
│    /typescript-estrito → Valida tipos (paralelo)            │
└─────────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────────┐
│ 3. TESTES E VALIDAÇÃO                                        │
│    /testes-executor → Executa testes                         │
│    /seguranca-auditor → Audita segurança (se aplicável)      │
└─────────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────────┐
│ 4. COMPLETUDE E DOCUMENTAÇÃO                                 │
│    /testes-completude-feature → Verifica completude          │
│    /docs-gerador → Gera documentação                          │
└─────────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────────┐
│ 5. VERIFICAÇÃO FINAL                                         │
│    /testes-verificador → Valida que tudo funciona            │
└─────────────────────────────────────────────────────────────┘
```

---

## Pipeline: planejamento-criador → planejamento-executor → testes-verificador

Para trabalhar com **planos** (`.cursor/plans/*.plan.md`):

1. **Criar plano**: `/planejamento-criador criar um plano para a feature X (confrontando com as skills)`
2. **Executar plano**: `/planejamento-executor executar o plano [nome-do-plano]`
3. **Validar resultado**: `/testes-verificador validar o trabalho do plano [nome-do-plano]`

O planejamento-criador gera planos Build-ready; o planejamento-executor invoca as skills indicadas; o testes-verificador confirma que tudo está funcional.

---

## Exemplos por Tipo de Tarefa

### Implementar Nova Feature

**Prompt Completo**:
```
Implementar feature: Sistema de busca avançada de músicos

1. Valide contra guardrails
2. Valide estrutura Clean Architecture
3. Implemente seguindo padrões
4. Execute testes
5. Verifique completude
6. Gere documentação
7. Valide que está funcional

Use os agents apropriados em cada etapa.
```

**Agents usados**:
- `seguranca-verificador-guardrails` - Valida princípios
- `arquitetura-validar-limpa` - Valida estrutura
- `typescript-estrito` - Valida tipos (paralelo)
- `testes-executor` - Executa testes
- `testes-completude-feature` - Verifica completude
- `docs-gerador` - Gera documentação
- `testes-verificador` - Validação final

---

### Refatorar Código

**Prompt Completo**:
```
Refatorar a feature musician-projects para melhorar Clean Architecture.

1. Analise estrutura atual
2. Identifique violações
3. Refatore código
4. Execute testes
5. Verifique que nada quebrou

Use arquitetura-validar-limpa primeiro, depois testes-executor e testes-verificador.
```

**Agents usados**:
- `arquitetura-validar-limpa` - Analisa estrutura atual
- `typescript-estrito` - Valida tipos
- `testes-executor` - Executa testes após refatoração
- `testes-verificador` - Verifica que nada quebrou

---

### Corrigir Bug

**Prompt Completo**:
```
Erro encontrado:
"TypeError: Cannot read property 'id' of undefined at UserCard.tsx:42"

Use o debug-depurador para investigar, corrigir, e depois testes-executor e testes-verificador.
```

**Agents usados**:
- `debug-depurador` - Investiga causa raiz
- `testes-executor` - Executa testes após correção
- `testes-verificador` - Verifica que correção está completa

---

### Implementar Segurança

**Prompt Completo**:
```
Implementei integração com gateway de pagamento. 
Use seguranca-auditor para auditar em busca de vulnerabilidades, 
testes-executor para testes de segurança, 
rode gate-seguranca e use testes-verificador para confirmar que está seguro.
```

**Agents usados**:
- `seguranca-verificador-guardrails` - Valida princípios (antes)
- `seguranca-auditor` - Audita segurança
- `testes-executor` - Executa testes de segurança
- `testes-verificador` - Validação final

---

### Trabalhar com ERP/CRM

**Prompt Completo**:
```
Expandir feature Financeiro para ERP contábil completo.

1. Consulte orquestracao-especialista-erp-crm para estrutura
2. Valide Clean Architecture (arquitetura-validar-limpa)
3. Implemente
4. Verifique completude
5. Gere documentação

Use os subagentes apropriados.
```

**Agents usados**:
- `orquestracao-especialista-erp-crm` - Valida estrutura ERP/CRM
- `arquitetura-validar-limpa` - Valida arquitetura
- `testes-completude-feature` - Verifica completude
- `docs-gerador` - Gera documentação

---

## 🎯 Padrões de Orquestração

### Padrão 1: Implementação Sequencial

**Quando usar**: Quando cada etapa depende da anterior.

```
> /seguranca-verificador-guardrails validar proposta de feature
> [Aguarda resultado]
> /arquitetura-validar-limpa validar estrutura
> [Aguarda resultado]
> [Implementa]
> /testes-executor executar testes
> [Aguarda resultado]
> /testes-verificador confirmar funcionalidade
```

---

### Padrão 2: Execução Paralela

**Quando usar**: Quando tarefas podem ser executadas simultaneamente.

```
> Validate architecture and TypeScript compliance in parallel
```

O Agent automaticamente executa:
- `arquitetura-validar-limpa` (paralelo)
- `typescript-estrito` (paralelo)

---

### Padrão 3: Pipeline Completo

**Quando usar**: Para features complexas que precisam de validação completa.

```
> Implement feature X following this pipeline:
> 1. Guardrails validation
> 2. Architecture validation
> 3. Implementation
> 4. Tests execution
> 5. Completeness verification
> 6. Documentation generation
> 7. Final verification
```

---

## 💡 Dicas Práticas

### 1. Comece com Validações

Sempre valide guardrails e arquitetura **antes** de implementar:

```
> /seguranca-verificador-guardrails validar esta proposta
> /arquitetura-validar-limpa validar estrutura
```

### 2. Use Verifier Sempre

Após qualquer implementação, use o testes-verificador:

```
> /testes-verificador confirmar que a implementação está completa e funcional
```

### 3. Execute Testes Proativamente

O testes-executor pode ser executado automaticamente, mas você também pode chamá-lo:

```
> /testes-executor executar testes para a nova feature
```

### 4. Combine Validações

Para validações rápidas, combine em paralelo:

```
> Validate architecture, TypeScript, and guardrails in parallel
```

### 5. Use Debugger para Erros

Sempre use debug-depurador quando encontrar erros:

```
> /debug-depurador investigar este erro: [erro]
```

---

## 🎬 Exemplo Real Completo

### Implementar Feature: "Sistema de Notificações em Tempo Real"

**Passo 1: Validação Inicial**
```
> /seguranca-verificador-guardrails validar esta feature: Sistema de notificações em tempo real usando WebSockets
```

**Resposta Esperada**: Validação de guardrails, confirmando que não viola princípios.

---

**Passo 2: Validação Arquitetural**
```
> /arquitetura-validar-limpa validar estrutura da feature de notificações em tempo real
```

**Resposta Esperada**: Validação da estrutura, sugerindo organização por features.

---

**Passo 3: Implementação**
```
Implemente o sistema de notificações em tempo real seguindo Clean Architecture.
Use WebSockets para comunicação em tempo real.
```

**Agente Principal**: Implementa a feature.

---

**Passo 4: Validação de Tipos (Paralelo)**
```
> /typescript-estrito validar TypeScript strict na feature de notificações
```

**Resposta Esperada**: Validação de tipos, identificando qualquer uso de `any` ou tipos incorretos.

---

**Passo 5: Testes**
```
> /testes-executor executar testes para a feature de notificações
```

**Resposta Esperada**: Execução de testes, relatório de resultados.

---

**Passo 6: Validação de Segurança**
```
> /seguranca-auditor auditar implementação de WebSocket por vulnerabilidades
```

**Resposta Esperada**: Auditoria de segurança, identificando vulnerabilidades potenciais.

---

**Passo 7: Verificação de Completude**
```
> /testes-completude-feature verificar se a feature de notificações está completa
```

**Resposta Esperada**: Checklist de completude, identificando o que está completo e o que falta.

---

**Passo 8: Documentação**
```
> /docs-gerador documentar a feature de notificações (user stories, user-flow, APIs se aplicável)
```

**Resposta Esperada**: Geração de documentação (user stories, JSDoc, etc.).

---

**Passo 9: Verificação Final**
```
> /testes-verificador confirmar que a feature de notificações está totalmente funcional
```

**Resposta Esperada**: Validação final, confirmando que tudo funciona de ponta a ponta.

---

## 🚀 Quick Start

### Exemplo Mais Simples

```
Implementar botão de "Favoritar Músico".

Use seguranca-verificador-guardrails para validar, 
depois implemente, 
e use testes-verificador para confirmar que funciona.
```

### Exemplo Intermediário

```
Refatorar componente UserCard para melhorar performance.

Use arquitetura-validar-limpa para validar estrutura,
typescript-estrito para validar tipos,
testes-executor para executar testes,
e testes-verificador para confirmar que nada quebrou.
```

### Exemplo Avançado

```
Implementar sistema completo de avaliações de músicos.

Pipeline completo:
1. Guardrails validation
2. Architecture validation  
3. Security audit (após implementar auth)
4. Implementation
5. Tests execution
6. Completeness verification
7. Documentation generation
8. Final verification

Use todos os subagentes apropriados em cada etapa.
```

---

## Referências

- [Agents (inventário por projeto)](./subagents.md)
- [Guardrails](./guardrails.md)
- [.cursorrules](../../.cursorrules)

---

**Nota:** O Frontend Oficial (soundlink-frontend), o BFF (soundlink-bff) e as APIs (soundlink-api) possuem seus próprios agents; exemplos de uso estão na documentação de cada projeto.

**Última atualização**: 03/02/2026
