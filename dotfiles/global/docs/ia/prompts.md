# 💬 Prompts Essenciais - Modelo

> **Prompts testados e validados para usar com IA ao trabalhar no Modelo**

---

## 🎯 Como Usar Este Documento

1. **Copie o prompt base** relevante para sua tarefa
2. **Preencha os [placeholders]** com informações específicas
3. **Cole no chat com IA** (ChatGPT, Claude, Cursor, etc.)
4. **Valide a resposta** contra guardrails.md

---

## 📋 Índice de Prompts

1. [Criar Nova Feature](#1-criar-nova-feature)
2. [Revisar Código](#2-revisar-código)
3. [Documentar Feature](#3-documentar-feature)
4. [Criar API Specification](#4-criar-api-specification)
5. [Criar Testes](#5-criar-testes)
6. [Resolver Bug](#6-resolver-bug)
7. [Priorizar Features](#7-priorizar-features)
8. [Criar User Story](#8-criar-user-story)
9. [Gerar Texto para Usuário](#9-gerar-texto-para-usuário)
10. [Revisar Decisão](#10-revisar-decisão)

---

## 1. Criar Nova Feature

```markdown
# CONTEXTO: Modelo Platform

## Projeto
Modelo é uma plataforma para conectar músicos e contratantes, focada em mérito real e transparência.

## GUARDRAILS OBRIGATÓRIOS

### ❌ NUNCA
- Implementar destaque pago para músicos
- Permitir manipulação de ranking
- Misturar empresário com produtor musical
- Violar Clean Architecture
- Usar `any` em TypeScript

### ✅ SEMPRE
- Basear ranking em dados reais e verificáveis
- Separar fluxos de músicos e contratantes
- Documentar regras de negócio em fe-*.md
- Seguir padrão universal UI/UX
- Manter cobertura de testes ≥75%

## Arquitetura
- **Stack**: Next.js 14 App Router, TypeScript, TailwindCSS, Shadcn/ui
- **Padrão**: Clean Architecture (Domain → Application → Infrastructure → Presentation)
- **Testes**: Jest (unit/integration) + Playwright (e2e)

## TAREFA: Criar Feature

**Feature**: [nome da feature]

**Objetivo**: [o que a feature deve fazer]

**Usuário alvo**: [músico/contratante/ambos/admin]

**Requisitos**:
1. [requisito 1]
2. [requisito 2]
3. [requisito 3]

**Criar**:
1. ✅ Documentação business-rules (fe-[feature].md)
2. ✅ Documentação user-flow
3. ✅ API specification (endpoints.md, types.ts, examples.md)
4. ✅ Código seguindo Clean Architecture
5. ✅ Testes (unit + integration + e2e)

**Validar contra**:
- [ ] Não viola nenhum Guardrail
- [ ] Alinha com North Star Metric (contratações bem-sucedidas)
- [ ] Impacta algum OKR do trimestre
- [ ] Segue padrões de código (.cursorrules)
```

---

## 2. Revisar Código

```markdown
# CONTEXTO: Modelo Platform - Code Review

## GUARDRAILS OBRIGATÓRIOS
- ❌ NUNCA violar Clean Architecture
- ❌ NUNCA usar `any` em TypeScript
- ✅ SEMPRE seguir RORO pattern
- ✅ SEMPRE manter cobertura ≥75%

## Padrões Técnicos (.cursorrules)
- TypeScript strict mode habilitado
- Componentes ≤200 linhas
- Hooks ≤150 linhas
- Padrão universal UI/UX (botões verdes para modais, cinzas para navegação)
- Tooltips obrigatórios em campos e botões
- Mobile-first approach

## TAREFA: Revisar código

**Arquivo**: [caminho do arquivo]

**Código**:
```[linguagem]
[cole o código aqui]
```

**Revisar**:
1. ✅ Violações de Clean Architecture
2. ✅ Uso de `any` ou TypeScript fraco
3. ✅ Componentes/hooks muito grandes
4. ✅ Falta de tooltips
5. ✅ Violações de padrão UI/UX
6. ✅ Falta de testes
7. ✅ Imports circulares
8. ✅ Violação de RORO pattern

**Formato de resposta**:
- 🔴 **Crítico**: [violações de guardrails]
- 🟡 **Importante**: [violações de padrões]
- 🟢 **Sugestões**: [melhorias opcionais]
```

---

## 3. Documentar Feature

```markdown
# CONTEXTO: Modelo Platform - Documentação

## Padrão de Documentação
Todas as features devem ter documentação em:
- `fluxo/business-rules/[perfil]/fe-[feature].md`
- `fluxo/user-flows/[perfil]/fe-[feature]-user-flow.md`
- `fluxo/api-specifications/[perfil]/[feature]/endpoints.md`
- `fluxo/api-specifications/[perfil]/[feature]/types.ts`
- `fluxo/api-specifications/[perfil]/[feature]/examples.md`

## Template Obrigatório (fe-*.md)
- 📝 Descrição da Feature
- 🎯 User Stories para Backend
- 🔗 Dependências
- 📊 APIs Necessárias

## TAREFA: Documentar Feature

**Feature**: [nome da feature]

**Perfil**: [musician/contractor_individual/event_producer/etc.]

**Funcionalidade**: [o que faz]

**Criar documentação completa**:
1. ✅ business-rules/[perfil]/fe-[feature].md
   - User Stories com critérios de aceitação
   - Regras de negócio (para backend implementar)
   - APIs necessárias

2. ✅ user-flows/[perfil]/fe-[feature]-user-flow.md
   - Passo a passo do usuário
   - Validações de UI
   - Estados da interface

3. ✅ api-specifications/[perfil]/[feature]/
   - endpoints.md (métodos, paths, descrições)
   - types.ts (TypeScript types completos)
   - examples.md (requests/responses de exemplo)

**IMPORTANTE**:
- Frontend NÃO implementa lógica de negócio
- Apenas documenta REQUISITOS para backend
- Foco no "O QUE" precisa, não no "COMO" será feito
```

---

## 4. Criar API Specification

```markdown
# CONTEXTO: Modelo Platform - API Specification

## Padrão de API Specs
Localização: `fluxo/api-specifications/[perfil]/[feature]/`

Arquivos obrigatórios:
1. **endpoints.md**: Listar todos os endpoints necessários
2. **types.ts**: Definir TypeScript types (DTOs, responses)
3. **examples.md**: Request/response examples para cada endpoint

## TAREFA: Criar API Specification

**Feature**: [nome da feature]

**Perfil**: [musician/contractor/etc.]

**Endpoints necessários**: [listar endpoints]

**Criar**:

### 1. endpoints.md
Para cada endpoint:
- Método HTTP (GET, POST, PUT, DELETE)
- Path completo
- Descrição clara
- Autenticação necessária?
- Permissões necessárias

### 2. types.ts
Definir types TypeScript:
- Request DTOs
- Response DTOs
- Enums/constants
- Validation schemas (Zod)

### 3. examples.md
Para cada endpoint:
- Request example (headers + body)
- Response success (200/201)
- Response errors (400/401/403/404/500)
- Edge cases importantes

**Validar**:
- [ ] Todos os campos têm types corretos
- [ ] Validações Zod definidas
- [ ] Exemplos cobrem casos comuns E edge cases
- [ ] Autenticação/permissões especificadas
```

---

## 5. Criar Testes

```markdown
# CONTEXTO: Modelo Platform - Testes

## Padrões de Teste
- **Mínimo obrigatório**: 75% cobertura geral
- **API Services**: ≥80%
- **Custom Hooks**: ≥85%
- **Components**: ≥70%
- **Fluxos críticos**: 100% e2e

## Estratégia
- **Unit**: API services, hooks, utilities
- **Integration**: Features completas
- **E2E**: User flows críticos (Playwright)

## TAREFA: Criar Testes

**Arquivo a testar**: [caminho do arquivo]

**Tipo de arquivo**: [service/hook/component/page]

**Criar**:

### Se for API Service:
- ✅ Teste com mock HTTP client
- ✅ Teste success cases
- ✅ Teste error cases (400, 401, 403, 404, 500)
- ✅ Teste edge cases (empty response, timeout)
- ✅ Validar que Result Pattern está correto

### Se for Custom Hook:
- ✅ Usar renderHook do @testing-library/react
- ✅ Testar estados (loading, success, error)
- ✅ Testar efeitos colaterais
- ✅ Mock de dependências (services)

### Se for Component:
- ✅ Usar render do @testing-library/react
- ✅ Testar renderização básica
- ✅ Testar interações (clicks, inputs)
- ✅ Testar estados (loading, error, success)
- ✅ Usar userEvent (não fireEvent)

### Se for E2E (Playwright):
- ✅ User flow completo
- ✅ Usar getByRole, getByLabel (não seletores CSS)
- ✅ Web-first assertions (toBeVisible, toHaveText)
- ✅ Testar em mobile também

**Cobertura alvo**: [baseado no tipo de arquivo]
```

---

## 6. Resolver Bug

```markdown
# CONTEXTO: Modelo Platform - Bug Fix

## GUARDRAILS
- ✅ SEMPRE criar teste que reproduz o bug ANTES de corrigir
- ✅ SEMPRE verificar se fix não quebra outras funcionalidades
- ✅ SEMPRE documentar root cause

## TAREFA: Resolver Bug

**Descrição do bug**: [o que está acontecendo]

**Comportamento esperado**: [o que deveria acontecer]

**Comportamento atual**: [o que está acontecendo]

**Passos para reproduzir**:
1. [passo 1]
2. [passo 2]
3. [passo 3]

**Investigar**:
1. ✅ Identificar root cause
2. ✅ Verificar se viola algum Guardrail
3. ✅ Verificar se afeta outras funcionalidades
4. ✅ Criar teste que reproduz o bug

**Corrigir**:
1. ✅ Implementar fix mínimo necessário
2. ✅ Validar que teste agora passa
3. ✅ Rodar todos os testes (não quebrar nada)
4. ✅ Documentar root cause em commit message

**Formato de commit**:
```
fix: [descrição curta do bug]

Root cause: [explicação do que causou]
Fix: [o que foi feito para corrigir]
Testing: [como foi testado]

Fixes #[issue-number]
```
```

---

## 7. Priorizar Features

```markdown
# CONTEXTO: Modelo Platform - Priorização

## North Star Metric
**Contratações bem-sucedidas com avaliação positiva (≥4 estrelas)**

## OKRs Q1 2026
1. Finalizar template frontend do perfil do músico
2. Finalizar template frontend de projects core
3. Design system sólido e consistente
4. Garantir qualidade e facilitar trabalho do backend

## TAREFA: Priorizar Features

**Features a priorizar**:
1. [feature 1]
2. [feature 2]
3. [feature 3]

**Para cada feature, avaliar**:

### Impacto na North Star
- Alto (impacta diretamente contratações bem-sucedidas)
- Médio (impacta indiretamente)
- Baixo (não impacta)

### Alinhamento com OKRs
- Qual OKR impacta?
- Qual Key Result?
- Quanto impacta? (estimativa)

### Complexidade
- Baixa (1-2 dias)
- Média (3-5 dias)
- Alta (>5 dias)

### Dependências
- Bloqueia outras features?
- É bloqueada por outras?
- Independente?

**Resultado**:
Ordenar features por: Impacto × Alinhamento / Complexidade
```

---

## 8. Criar User Story

```markdown
# CONTEXTO: Modelo Platform - User Story

## Template Obrigatório

**Como** [tipo de usuário]  
**Quero** [ação desejada]  
**Para** [benefício/objetivo]  

**Critérios de Aceitação:**
- [ ] [critério 1]
- [ ] [critério 2]
- [ ] [critério 3]

**Regras de Negócio (para backend):**
- RN001: [regra 1]
- RN002: [regra 2]

**APIs Necessárias:**
- `[MÉTODO] [PATH]` - [descrição]

## TAREFA: Criar User Story

**Feature**: [nome da feature]

**Usuário**: [músico/contratante/admin/etc.]

**Objetivo**: [o que o usuário quer fazer]

**Criar User Story completa**:
- ✅ Formato "Como X, quero Y, para Z"
- ✅ Critérios de aceitação (claros e testáveis)
- ✅ Regras de negócio (para backend implementar)
- ✅ APIs necessárias (com métodos e paths)
- ✅ Validações de UI (se aplicável)
- ✅ Estimativa de story points (Fibonacci: 1,2,3,5,8,13,21)

**Story Points**:
- 1-2: Mudança trivial
- 3-5: Feature simples
- 8-13: Feature média
- 21+: Quebrar em múltiplas stories
```

---

## 9. Gerar Texto para Usuário

```markdown
# CONTEXTO: Modelo Platform - Comunicação com Usuário

## GUARDRAILS de Comunicação
- ✅ Tom profissional mas amigável
- ✅ Transparência total (nunca esconder informações)
- ✅ Nunca prometer o que não pode cumprir
- ✅ Linguagem clara e sem jargão técnico
- ❌ Nunca culpar o usuário
- ❌ Nunca usar tom condescendente

## Tipos de Texto
1. **Notificações**: Curtas, claras, acionáveis
2. **Emails**: Profissionais, completos, com CTA claro
3. **Mensagens de erro**: Explicar O QUE + POR QUÊ + COMO RESOLVER
4. **Tooltips**: Máximo 1-2 frases, explicativos
5. **Help text**: Detalhados, com exemplos

## TAREFA: Gerar Texto

**Tipo**: [notificação/email/erro/tooltip/help]

**Contexto**: [quando/onde aparece]

**Público**: [músico/contratante/ambos]

**Mensagem deve**:
- ✅ Ser clara e objetiva
- ✅ Explicar o que aconteceu (se aplicável)
- ✅ Explicar por que aconteceu (se aplicável)
- ✅ Indicar próximo passo (se aplicável)
- ✅ Usar tom amigável mas profissional

**Limite de caracteres**: [se houver]

**Exemplos de bons textos**:
- ❌ "Erro ao salvar"
- ✅ "Não foi possível salvar suas alterações. Verifique sua conexão e tente novamente."

- ❌ "Você precisa preencher todos os campos"
- ✅ "Para criar seu perfil, preencha nome, email e telefone."
```

---

## 10. Revisar Decisão

```markdown
# CONTEXTO: Modelo Platform - Validação de Decisão

## GUARDRAILS
[copiar seção resumida de guardrails.md]

## North Star Metric
**Contratações bem-sucedidas com avaliação positiva**

## Playbooks Disponíveis
- feature-prioritization.md
- conflict-resolution.md
- ranking-adjustment.md
- communication-guidelines.md

## TAREFA: Revisar Decisão

**Decisão proposta**: [descrever decisão]

**Contexto**: [por que esta decisão está sendo considerada]

**Validar contra**:

### 1. Guardrails
- [ ] Não viola nenhum ❌ NUNCA?
- [ ] Cumpre todos ✅ SEMPRE aplicáveis?

### 2. North Star
- [ ] Aproxima da North Star Metric?
- [ ] Impacto estimado: [alto/médio/baixo]

### 3. OKRs
- [ ] Impacta algum OKR do trimestre?
- [ ] Qual(is)?
- [ ] Impacto positivo ou negativo?

### 4. Playbook
- [ ] Existe playbook relevante?
- [ ] Se sim, decisão segue o playbook?

### 5. ADRs Anteriores
- [ ] Já tomamos decisão similar?
- [ ] Se sim, qual foi e por quê?
- [ ] Nova decisão é consistente?

**Resultado**:
- ✅ **APROVAR**: Se todas as validações passarem
- ⚠️ **AJUSTAR**: Se houver ressalvas mas é viável
- ❌ **RECUSAR**: Se violar guardrails ou OKRs críticos

**Documentar**:
- Se decisão importante → Criar ADR
- Se decisão menor → Adicionar em decision-log.md
```

---

## 🎓 Como Melhorar Estes Prompts

Se você usar um prompt e perceber que:
- ❌ IA não entendeu o contexto
- ❌ Resposta violou guardrails
- ❌ Faltou informação importante

**Ação**: 
1. Ajuste o prompt
2. Teste novamente
3. Se funcionar melhor, atualize este arquivo
4. Commit com mensagem: `docs: improve prompt [nome-do-prompt]`

---

## 📚 Recursos Adicionais

- [Guardrails](./guardrails.md) - Princípios invioláveis
- [Playbooks](./playbooks/) - Scripts de decisão
- [.cursorrules](../../.cursorrules) - Regras técnicas de código
- [North Star Metric](../planejamento/metrics/north-star.md) - Métrica principal
- [OKRs Q1](../planejamento/okrs-kpis-q1-2026.md) - Metas do trimestre

---

**Criado em**: 20/01/2026  
**Última atualização**: 20/01/2026  
**Versão**: 1.0  
**Mantenedor**: Frontend Template Creator

---

## 💡 Dica Final

> **Sempre inclua Guardrails no prompt!**
> 
> Mesmo que pareça repetitivo, sempre copiar a seção de Guardrails garante que a IA entende os limites e princípios da Modelo.
> 
> **Prompt sem Guardrails = IA pode sugerir qualquer coisa**  
> **Prompt com Guardrails = IA sugere apenas o que é permitido**
