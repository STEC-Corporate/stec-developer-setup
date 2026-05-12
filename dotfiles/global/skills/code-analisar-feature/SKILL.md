---
name: code-analisar-feature
description: Análise completa de uma feature/página cruzando código real com documentação. Produz relatório de gaps, campos mortos, conexões e docs desatualizados. Use quando o usuário pedir para analisar uma página, feature, tela ou funcionalidade específica.
---

# Análise de Feature: Código vs Documentação

Skill que cruza o código real (`src/`) com a documentação (`docs/`) para produzir um relatório completo sobre o estado real de uma feature ou página.

## Quando usar

- Usuário pede para analisar uma página ou feature específica
- Antes de replicar uma feature do músico para outro perfil
- Para auditar se a documentação condiz com o código
- Para entender conexões entre páginas/features

## Pré-condições

- Nome da feature, página ou rota fornecido pelo usuário
- Acesso ao código fonte em `src/` e documentação em `docs/`

## Fluxo de Análise (5 camadas)

### Camada 1: CÓDIGO — O que realmente existe

Dado o nome da feature/página, localizar e analisar:

1. **Feature folder**: `src/features/<feature-name>/`
   - Listar estrutura: `presentation/`, `application/`, `domain/`, `infrastructure/`
   - Contar componentes, hooks, services, views
   - Identificar as views (cada view = uma "tela" ou "aba")

2. **Rotas**: `src/app/<profile>/<section>/`
   - Que rotas existem? (page.tsx, layout.tsx)
   - Que parâmetros recebem? ([eventId], [projectId])
   - Rotas dinâmicas vs estáticas

3. **Componentes da página**: ler as views principais
   - Que abas/tabs existem? (TabsTrigger, TabsContent)
   - Que campos/sections existem em cada aba?
   - Que componentes são usados?

4. **Dados**: 
   - Que hooks buscam dados? (useQuery, useFetch, useService)
   - Que serviços chamam? Para onde apontam (mock vs API real)?
   - Que tipos/interfaces definem a estrutura de dados?

5. **Conexões**:
   - Links/navegações para outras páginas (router.push, Link href)
   - Props que recebem dados de pai/contexto
   - Eventos que disparam ações em outras features

**Output da Camada 1:**
```markdown
## Código: <nome da feature>

### Estrutura
- Feature: src/features/<name>/
- Rotas: /musician/<section>/[id]
- Views: 5 (list, detail, tab-equipe, tab-eventos, tab-financeiro)
- Componentes: 23
- Hooks: 8
- Services: 4

### Abas/Seções da página principal
1. **Aba Equipe** — componentes: TeamMemberList, TeamMemberCard
   - Campos: nome, função, status, avatar
   - Dados: useTeamMembers() → mock (sem API real)
2. **Aba Eventos** — componentes: EventList, EventCard
   - Campos: nome, data, local, status
   - Dados: useProjectEvents() → mock
   ...

### Conexões
- Link para: /musician/events/[eventId] (na aba Eventos)
- Link para: /musician/team/[memberId] (na aba Equipe)
- Recebe: projectId do context/route
```

### Camada 2: DOCUMENTAÇÃO — O que os docs dizem

Procurar documentação relacionada em:

1. **Business Rules**: `docs/gestao-tarefas/03-especificacao-produto/business-rules/<profile>/<feature>/`
   - Que regras de negócio estão documentadas?
   - Correspondem ao que o código faz?

2. **User Flows**: `docs/gestao-tarefas/03-especificacao-produto/user-flows/<profile>/<feature>/`
   - Que jornadas estão documentadas?
   - Os passos condizem com as rotas reais?

3. **API Specifications**: `docs/gestao-tarefas/03-especificacao-produto/api-specifications/<profile>/<feature>/`
   - Que endpoints estão documentados?
   - Existem no código? São mock ou reais?

4. **UI Canonical**: `docs/gestao-tarefas/03-especificacao-produto/ui-canonical/`
   - Existe inventário canônico desta página?
   - Se sim: ordem de blocos, campos, abas condiz com o código?

5. **Architecture/Reference**: `docs/gestao-ideias/04-referencia-tecnica/referencia/`
   - Há docs de arquitetura que afetam esta feature?
   - Permissões, tipos de perfil, etc.

**Output da Camada 2:**
```markdown
## Documentação encontrada

| Tipo | Arquivo | Condiz com código? |
|------|---------|-------------------|
| Business Rules | fe-project-events.md | Parcial — menciona 3 campos que não existem |
| User Flow | fe-events-user-flow.md | Sim, mas falta aba Timeline |
| API Specs | endpoints.md | Mock — nenhuma API real |
| UI Canonical | — | NÃO EXISTE para esta página |
| Architecture | permissions-matrix.md | Referencia permissões corretas |
```

### Camada 3: CRUZAMENTO — Gaps e divergências

Para cada aba/seção/campo, produzir tabela de cruzamento:

| Elemento | Código | Doc | Status |
|----------|--------|-----|--------|
| Aba Equipe | Existe (TeamTab) | Documentada em fe-project-team.md | OK |
| Aba Timeline | Existe (TimelineTab) | NÃO documentada | GAP: código sem doc |
| Campo "orçamento total" | NÃO existe | Documentado em fe-financial.md | FICÇÃO: doc sem código |
| Link para evento | Existe (/events/[id]) | Documentado no user-flow | OK |
| Dados da equipe | Mock (useTeamMembers) | Doc diz "API /team/members" | DIVERGÊNCIA: mock vs API |

### Camada 4: CONEXÕES — Mapa de dependências

Produzir mapa de conexões da feature:

```
<Feature atual>
├── ENTRA de: Dashboard (link "Ver projeto")
├── ENTRA de: Lista de projetos (click no card)
│
├── SAI para: /events/[eventId] (aba Eventos → click)
├── SAI para: /team/[memberId] (aba Equipe → click)
├── SAI para: /contracts/[contractId] (aba Contratos → click)
│
├── DADOS de: useProject(projectId) → mock
├── DADOS de: useTeamMembers(projectId) → mock
└── DADOS de: useProjectEvents(projectId) → mock
```

### Camada 5: RELATÓRIO FINAL

Consolidar em relatório acionável:

```markdown
## Relatório: <nome da feature>

### Resumo
- X abas/seções analisadas
- Y gaps encontrados (código sem doc)
- Z ficções encontradas (doc sem código)
- W conexões verificadas

### Ações recomendadas
1. CRIAR ui-canonical para esta página (não existe)
2. ATUALIZAR fe-project-events.md — remover campos que não existem
3. ARQUIVAR fe-old-financial.md — descreve versão anterior
4. DOCUMENTAR aba Timeline (existe no código, sem doc)

### Docs em referencia/ afetados
- permissions-matrix.md: OK, condiz com código
- ratings-architecture.md: DESATUALIZADO, menciona componente removido

### Qualidade dos dados
- 4/8 hooks usam mocks (sem API real)
- 2 campos mostram "N/A" ou fallback sempre (dados mortos)
```

## Checklist de saída

- [ ] Camada 1 (Código) analisada completamente
- [ ] Camada 2 (Documentação) levantada
- [ ] Camada 3 (Cruzamento) com tabela de gaps
- [ ] Camada 4 (Conexões) com mapa de dependências
- [ ] Camada 5 (Relatório) com ações recomendadas
- [ ] Docs desatualizados identificados com ação (atualizar/arquivar/criar)

## Cobertura

- Stacks: React, NextJS, TypeScript (frontend)
- Domínios: qualquer feature do SoundLink Template Frontend
- Perfis: músico (referência), todos os outros (replicação)
