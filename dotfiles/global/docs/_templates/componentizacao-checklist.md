# ✅ Checklist de Componentização e Migração

> **Use este checklist ao identificar padrões repetidos e migrar para componentes reutilizáveis**

---

## 📋 Componente: [Nome do Componente]

**Data de Início**: [Data]  
**Responsável**: [Nome]  
**Sprint**: [Número]  
**Lote**: [Lote 1 / Lote 2 / Lote 3]

---

## Fase 0: 🔍 Inventário e Catalogação

### Identificação de Padrões

- [ ] Mapeei arquivos repetidos por categoria:
  - [ ] Modais de formulário
  - [ ] Headers por tipo de perfil
  - [ ] Barras de busca com filtros
  - [ ] Cards de métricas
  - [ ] Upload de imagem com preview/crop
  - [ ] Título + descrição de página
  - [ ] Outros: [especificar]

### Catalogação

- [ ] Criei catálogo com:
  - [ ] Nome do padrão identificado
  - [ ] Paths de todos os arquivos que usam o padrão
  - [ ] Lista de variações encontradas
  - [ ] Dependências identificadas
  - [ ] Exemplos de uso documentados

**Arquivos identificados**:
```
[Exemplo]
- src/features/musician-projects/presentation/components/ProjectFormModal.simple.tsx
- src/features/visual-professional-projects/presentation/components/project-form-modal.component.tsx
- [adicionar outros...]
```

---

## Fase 1: ✅ Critérios de Extração

### Validação de Critérios

- [ ] **3+ ocorrências** com 70%+ de similaridade estrutural
- [ ] Variações podem ser resolvidas via **props/slots**
- [ ] Padrão visual e UX é **obrigatório** (modais, tooltips, barras de busca)
- [ ] **NÃO** há diferenças grandes de layout ou fluxo
- [ ] Componente **NÃO** é altamente específico da feature

### Decisão

- [ ] ✅ **Aprovado para extração** | ❌ **Rejeitado** | ⚠️ **Requer análise adicional**

**Justificativa**: [Por que extrair ou não extrair]

---

## Fase 2: 🎨 Design da API do Componente

### Estrutura do Componente

- [ ] Defini localização: `src/components/[categoria]/[nome-componente]`
- [ ] Componente segue **Clean Architecture** (apenas apresentação)
- [ ] **Sem regras de negócio** no componente

### Props e Slots

- [ ] Props obrigatórias definidas
- [ ] Props opcionais definidas
- [ ] Slots/children definidos (quando necessário)
- [ ] Types TypeScript criados
- [ ] JSDoc adicionado nas props principais

### Variações por Perfil

- [ ] Estratégia de cores definida (props de variante ou tema)
- [ ] Mapeamento centralizado em `lib/constants` ou tema
- [ ] Variantes suportadas: [listar: musician, contractor, etc.]

**API Proposta**:
```typescript
// Exemplo
interface ComponentProps {
  // documentar props
}
```

---

## Fase 3: 🧪 Migração Piloto (1-2 Features)

### Pré-Migração (Baseline)

- [ ] Capturei comportamento atual nas páginas piloto (antes da troca)
- [ ] Registrei cores e variações por perfil:
  - [ ] Cores de botões
  - [ ] Headers de tabela
  - [ ] Tabs
  - [ ] Outros elementos visuais
- [ ] Tirei screenshots/evidências visuais do estado atual

**Features Piloto**:
- [ ] Feature 1: [nome]
- [ ] Feature 2: [nome]

### Durante a Migração

- [ ] Implementei componente base em `src/components/[categoria]/[nome]`
- [ ] Migrei primeira feature piloto
- [ ] Migrei segunda feature piloto (se aplicável)
- [ ] Componente funciona em ambas as features

### Testes de Migração Piloto

#### Smoke Test Manual

**Consultar**: `docs/referencia/dev/components/testes-exemplo/smoke-manual.md`

- [ ] Fluxos críticos testados:
  - [ ] Abrir modal (se aplicável)
  - [ ] Salvar/submit (se aplicável)
  - [ ] Filtrar (se aplicável)
  - [ ] Trocar tab (se aplicável)
  - [ ] Outros: [especificar]
- [ ] Nenhum erro no console
- [ ] Funcionalidade principal preservada

#### Validação Visual

**Consultar**: `docs/referencia/dev/components/testes-exemplo/validacao-visual.md`

- [ ] Layout preservado (grid, espaços, alinhamentos)
- [ ] Tipografia consistente
- [ ] Estados visuais funcionando:
  - [ ] Hover
  - [ ] Disabled
  - [ ] Loading
  - [ ] Error
  - [ ] Empty
- [ ] Responsividade mantida (mobile, tablet, desktop)

#### Validação por Perfil

**Consultar**: `docs/referencia/dev/components/testes-exemplo/cores-por-perfil.md`

- [ ] Cores validadas para cada perfil:
  - [ ] Músico (musician)
  - [ ] Contratante (contractor)
  - [ ] Outros: [especificar]
- [ ] Variações visuais por perfil funcionando
- [ ] Evidências visuais capturadas (screenshots)

### Checklist de Validação da Migração

- [ ] **Funcionalidade**: Fluxo principal e estados de erro
- [ ] **Layout**: Grid, espaços, alinhamentos e tipografia
- [ ] **Estados**: Loading, empty, hover, disabled
- [ ] **Acessibilidade básica**: Foco visível e navegação por teclado
- [ ] **Cores por perfil**: Botões, headers de tabela e tabs

### Guardrails

- [ ] Componente **NÃO** viola Clean Architecture
- [ ] Componente **NÃO** contém regras de negócio
- [ ] Componente mantém conformidade com padrões UI/UX
- [ ] Componente facilita portabilidade futura

---

## Fase 4: 📦 Rollout em Lotes

### Lote Atual

- [ ] Lote identificado: [Lote 1 / Lote 2 / Lote 3]
- [ ] Features do lote listadas
- [ ] Ordem de migração definida

**Lotes Recomendados**:

**Lote 1** (alto ganho / baixa complexidade):
- [ ] Modais de projetos (apenas estrutura base do modal)
- [ ] Barra de busca padrão
- [ ] Uso consistente de `page-title` ou `page-header`

**Lote 2** (impacto alto / média complexidade):
- [ ] Upload de imagem com preview/crop
- [ ] Cards de métricas

**Lote 3** (impacto alto / alta complexidade):
- [ ] Headers por perfil

### Migração Incremental

- [ ] Feature 1 migrada: [nome]
- [ ] Feature 2 migrada: [nome]
- [ ] Feature 3 migrada: [nome]
- [ ] [adicionar conforme necessário]

### Testes Pós-Migração (Lotes Seguintes)

#### Testes Unitários/Integração

**Consultar**: `docs/referencia/dev/components/testes-exemplo/unitarios-integracao.md`

- [ ] Componente base testado:
  - [ ] Props testadas
  - [ ] Slots testados
  - [ ] Estados de erro testados
  - [ ] Estados de loading testados
- [ ] Cobertura ≥ 75%

#### Testes E2E/Playwright

**Consultar**: `docs/referencia/dev/components/testes-exemplo/e2e-playwright.md`

- [ ] Fluxos críticos testados:
  - [ ] Formulário (se aplicável)
  - [ ] Upload (se aplicável)
  - [ ] Filtros/tabs (se aplicável)
- [ ] Testes passando

#### Checklist de Regressão Visual por Perfil

- [ ] Regressão visual validada para cada perfil
- [ ] Nenhuma quebra visual identificada
- [ ] Evidências documentadas

---

## Fase 5: 📚 Documentação e Finalização

### Documentação do Componente

- [ ] README do componente criado (se necessário)
- [ ] Exemplos de uso documentados
- [ ] Props documentadas com JSDoc
- [ ] Variantes documentadas
- [ ] Guia de contribuição atualizado

### Atualização de Catálogo

- [ ] Catálogo de componentes atualizado
- [ ] Guideline de contribuição atualizada
- [ ] Componente adicionado à lista de componentes reutilizáveis

### Limpeza

- [ ] Código duplicado removido
- [ ] Imports antigos atualizados
- [ ] Arquivos obsoletos removidos (se aplicável)

---

## 📊 Métricas da Componentização

### Impacto Esperado

- **Redução de código duplicado**: [% estimado]
- **Componentes afetados**: [número]
- **Features migradas**: [número]
- **Tempo de desenvolvimento futuro**: [redução estimada]

### Benefícios

- [ ] Redução de repetição de código
- [ ] Manutenção facilitada
- [ ] Consistência visual melhorada
- [ ] Portabilidade para projeto oficial facilitada

---

## 🔗 Links Importantes

- **Relatório de Componentização**: `docs/referencia/dev/components/relatorio-componentizacao.md`
- **Guia de Testes Smoke**: `docs/referencia/dev/components/testes-exemplo/smoke-manual.md`
- **Guia de Validação Visual**: `docs/referencia/dev/components/testes-exemplo/validacao-visual.md`
- **Guia de Cores por Perfil**: `docs/referencia/dev/components/testes-exemplo/cores-por-perfil.md`
- **Guia de Testes Unitários**: `docs/referencia/dev/components/testes-exemplo/unitarios-integracao.md`
- **Guia de Testes E2E**: `docs/referencia/dev/components/testes-exemplo/e2e-playwright.md`
- **Guardrails**: `.cursor/docs/ia/guardrails.md`
- **Clean Architecture**: `docs/decisoes/adr-004.md`

---

## 💬 Notas e Observações

[Qualquer informação adicional, desafios encontrados, lições aprendidas, etc.]

---

**Criado em**: [Data]  
**Última Atualização**: [Data]  
**Status**: [ ] Em Planejamento | [ ] Em Inventário | [ ] Em Design | [ ] Em Piloto | [ ] Em Rollout | [ ] Concluída
