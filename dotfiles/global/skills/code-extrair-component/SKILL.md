---
name: code-extrair-component
description: Guia processo de componentização seguindo componentizacao-checklist.md. Use ao identificar padrões repetidos (3+ ocorrências), ao analisar código para extração, ou ao migrar código duplicado para componentes reutilizáveis.
---

# Extrair Componente

## Quando Usar

- Ao identificar padrões repetidos (3+ ocorrências com 70%+ similaridade)
- Ao identificar componentes acima de 200 linhas (OBRIGATÓRIO refatorar)
- Ao identificar hooks acima de 150 linhas (OBRIGATÓRIO refatorar)
- Ao analisar código para oportunidades de componentização
- Ao migrar código duplicado para componentes reutilizáveis
- Ao refatorar features para usar componentes existentes

**⚠️ IMPORTANTE**: Componentes acima de 200 linhas ou hooks acima de 150 linhas DEVEM ser refatorados, mesmo sem padrões repetidos.

## Processo Completo

### Fase 0: Inventário e Catalogação

#### Verificar Tamanho de Arquivos (OBRIGATÓRIO)

**ANTES de identificar padrões, verificar tamanho**:

- [ ] Verificar tamanho de TODOS os componentes na feature
- [ ] Identificar componentes acima de 200 linhas
- [ ] Identificar hooks acima de 150 linhas
- [ ] Listar arquivos que violam limites

**Usar Skill**: `code-verificar-file-sizes` para verificação completa.

**Arquivos grandes identificados**:
```
Componentes >200 linhas:
- equipment-list-v2.tsx: 1053 linhas
- payment-methods-v2.tsx: 591 linhas
- skills-competencies-v2.tsx: 553 linhas

Hooks >150 linhas:
- use-musician-profile.ts: 180 linhas
```

#### Identificar Padrões Repetidos

Mapear arquivos repetidos por categoria:
- Modais de formulário
- Headers por tipo de perfil
- Barras de busca com filtros
- Cards de métricas
- Upload de imagem com preview/crop
- Título + descrição de página
- Outros padrões específicos

#### Catalogar

Criar catálogo com:
- Nome do padrão identificado
- Paths de todos os arquivos que usam o padrão
- Lista de variações encontradas
- Dependências identificadas
- Exemplos de uso documentados

**Formato**:
```
Padrão: [Nome]
Arquivos:
- src/features/feature1/presentation/components/Component1.tsx
- src/features/feature2/presentation/components/Component2.tsx
- src/features/feature3/presentation/components/Component3.tsx

Variações:
- Variação 1: [descrição]
- Variação 2: [descrição]
```

### Fase 1: Critérios de Extração

#### Validar Critérios

**Para Componentes Grandes (>200 linhas)**:
- [ ] Componente identificado acima de 200 linhas
- [ ] **OBRIGATÓRIO refatorar** independente de padrões repetidos
- [ ] Dividir em sub-componentes menores (<200 linhas cada)

**Para Padrões Repetidos**:
- [ ] **3+ ocorrências** com 70%+ de similaridade estrutural
- [ ] Variações podem ser resolvidas via **props/slots**
- [ ] Padrão visual e UX é **obrigatório** (modais, tooltips, barras de busca)
- [ ] **NÃO** há diferenças grandes de layout ou fluxo
- [ ] Componente **NÃO** é altamente específico da feature

#### Decisão

- ✅ **Aprovado para extração**
- ❌ **Rejeitado** (não atende critérios)
- ⚠️ **Requer análise adicional**

**Justificar**: Por que extrair ou não extrair.

### Fase 2: Design da API do Componente

#### Estrutura do Componente

- Localização: `src/components/[categoria]/[nome-componente]`
- Seguir **Clean Architecture** (apenas apresentação)
- **Sem regras de negócio** no componente

#### Props e Slots

- Props obrigatórias definidas
- Props opcionais definidas
- Slots/children definidos (quando necessário)
- Types TypeScript criados
- JSDoc adicionado nas props principais

#### Variações por Perfil

- Estratégia de cores definida (props de variante ou tema)
- Mapeamento centralizado em `lib/constants` ou tema
- Variantes suportadas documentadas

**API Proposta**:
```typescript
interface ComponentProps {
  // documentar props
  variant?: 'musician' | 'contractor' | 'professional' | 'admin'
  // ... outras props
}
```

### Fase 3: Migração Piloto (1-2 Features)

#### Pré-Migração (Baseline)

- [ ] Testes existentes documentados
- [ ] Evidências visuais capturadas (screenshots)
- [ ] Comportamento atual documentado

#### Migração

- [ ] Componente criado em `src/components/[categoria]/[nome]`
- [ ] Props e slots implementados
- [ ] Types TypeScript criados
- [ ] Migração de 1-2 features piloto
- [ ] Testes de migração executados:
  - Smoke tests
  - Visual regression tests
  - Testes por perfil (se aplicável)

#### Validação

- [ ] Comportamento idêntico ao original
- [ ] Cores corretas por perfil
- [ ] Responsividade mantida
- [ ] Acessibilidade mantida
- [ ] Performance não degradada

### Fase 4: Rollout em Lotes

#### Lote 1 (2-3 features)
- [ ] Migração completa
- [ ] Testes executados
- [ ] Validação visual
- [ ] Documentação atualizada

#### Lote 2 (3-5 features)
- [ ] Migração completa
- [ ] Testes executados
- [ ] Validação visual
- [ ] Feedback incorporado

#### Lote 3 (restante)
- [ ] Migração completa
- [ ] Testes executados
- [ ] Validação final

### Fase 5: Documentação e Finalização

- [ ] Componente documentado
- [ ] Exemplos de uso criados
- [ ] Storybook (se aplicável)
- [ ] Checklist de componentização preenchido
- [ ] Relatório de migração criado

## Checklist de Componentização

**Consultar**: `docs/gestao-ideias/04-referencia-tecnica/_templates/componentizacao-checklist.md` para checklist completo.

## Validações Obrigatórias

- 3+ ocorrências com 70%+ similaridade estrutural
- Variações resolvíveis via props/slots
- Clean Architecture respeitada (apenas apresentação)
- Testes de migração (smoke, visual, por perfil)
- Validação de cores e variações por tipo de usuário

## Referências

- **Componentização Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/componentizacao-checklist.md`
- **Relatório Componentização**: `docs/gestao-ideias/04-referencia-tecnica/referencia/dev/components/relatorio-componentizacao.md`
- **Cores Referência**: `docs/gestao-ideias/04-referencia-tecnica/referencia/dev/components/cores-referencia-hexadecimal.md`
- **Clean Architecture**: `docs/gestao-ideias/02-execucao/planejamento/architecture/clean-architecture.md`

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

