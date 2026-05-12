---
name: code-revisar-code-beachlink
description: Revisa código seguindo padrões do BeachLink. Use ao revisar código antes de commit, ao analisar código existente, ou ao validar conformidade com padrões do projeto.
---

# Revisar Código BeachLink

## Quando Usar

- Ao revisar código antes de commit
- Ao analisar código existente para conformidade
- Ao validar se código segue padrões do projeto
- Ao fazer code review de PRs

## Checklist de Revisão

### ⚠️ VERIFICAÇÃO OBRIGATÓRIA: Tamanho de Arquivos

**ANTES de continuar, SEMPRE verificar tamanho**:

- [ ] **Usar Skill `code-verificar-file-sizes`** para verificar todos arquivos
- [ ] Listar TODOS componentes com tamanho
- [ ] Listar TODOS hooks com tamanho
- [ ] Marcar violações como 🔴 Crítico

**Se violações encontradas**: Reportar como 🔴 Crítico e não prosseguir até corrigir.

### Guardrails BeachLink

- [ ] Fluxo respeitado: taxa → BLE → aceite vendedor → pagamento produto
- [ ] Dois Pix separados (taxa BeachLink + produto ao vendedor)
- [ ] Sem intermediação do valor do produto
- [ ] Sem liberar pedido sem taxa paga; sem liberar pagamento produto sem aceite
- [ ] BLE usado apenas para confirmação de proximidade onde aplicável
- [ ] Cliente sem app/cadastro (captive portal + páginas web)
- Consultar: `docs/gestao-ideias/00-governanca/ia/guardrails.md`

### Clean Architecture

- [ ] Estrutura organizada por features
- [ ] Camadas respeitadas (domain → application → infrastructure → presentation)
- [ ] Domain Layer não depende de camadas externas
- [ ] Separação clara entre camadas

### TypeScript

- [ ] TypeScript strict mode sem erros
- [ ] Nenhum `any` usado (usar `unknown` se necessário)
- [ ] Types bem definidos
- [ ] Interfaces usadas para object shapes extensíveis
- [ ] RORO pattern aplicado

### Componentes React

**⚠️ OBRIGATÓRIO**: Verificar tamanho de TODOS os componentes analisados

- [ ] **VERIFICAR tamanho de cada componente** (contar linhas do arquivo)
- [ ] Máximo 200 linhas por componente
- [ ] Componentes acima de 200 linhas identificados e listados
- [ ] Props tipadas com interfaces
- [ ] `'use client'` apenas quando necessário
- [ ] Server Components usados quando possível

**Exemplo de saída obrigatória**:
```
Componentes verificados:
- order-form.tsx: 250 linhas 🔴 CRÍTICO (acima de 200)
- beachpoint-list.tsx: 150 linhas ✅ OK
```

### Custom Hooks

**⚠️ OBRIGATÓRIO**: Verificar tamanho de TODOS os hooks analisados

- [ ] **VERIFICAR tamanho de cada hook** (contar linhas do arquivo)
- [ ] Máximo 150 linhas por hook
- [ ] Hooks acima de 150 linhas identificados e listados
- [ ] Responsabilidade única; prefixo `use`; retornam objetos nomeados

### UI/UX BeachLink

- [ ] Mobile-first (captive portal e telas de pedido)
- [ ] Telas curtas, botões óbvios, texto claro
- [ ] Sem exigir app ou cadastro do cliente nas telas de fluxo

### Testes

- [ ] Testes criados (cobertura adequada)
- [ ] Testes unitários para services/hooks
- [ ] Testes de integração para fluxos
- [ ] Testes E2E para fluxos críticos (portal, taxa, BLE, aceite, Pix)
- [ ] Nenhum teste falhando

### Code Quality

- [ ] Guard clauses em início de funções
- [ ] Early returns para error handling
- [ ] Funções puras quando possível
- [ ] Nomenclatura clara e consistente
- [ ] Comentários JSDoc em funções complexas

### Performance

- [ ] Server Components usados quando possível
- [ ] Imagens otimizadas
- [ ] Code splitting implementado
- [ ] Lazy loading quando apropriado

### Acessibilidade

- [ ] ARIA labels em elementos interativos
- [ ] Navegação por teclado funcional
- [ ] Contraste WCAG AA mínimo
- [ ] Screen reader compatibility

### Segurança

- [ ] Validação de inputs com Zod
- [ ] Sanitização de dados
- [ ] Sem dados sensíveis em logs
- [ ] Headers de segurança configurados

## Validação contra .cursorrules

**Consultar**: `.cursorrules` e validar:

- [ ] Guardrails BeachLink respeitados
- [ ] Clean Architecture seguida
- [ ] TypeScript strict mode
- [ ] Testes com cobertura adequada

## Formato de Feedback

### 🔴 Crítico (Must Fix)
- Violações de Guardrails BeachLink
- Violações de Clean Architecture
- **Componentes acima de 200 linhas**
- **Hooks acima de 150 linhas**
- Falta de testes críticos
- Problemas de segurança

### 🟡 Suggestion (Consider Improving)
- Melhorias de performance
- Refatorações sugeridas
- Melhorias de acessibilidade
- Otimizações de código

### 🟢 Nice to Have (Optional)
- Melhorias de legibilidade
- Adições de comentários
- Pequenas otimizações

## Referências

- **Padrões**: `.cursorrules`
- **Guardrails**: `docs/gestao-ideias/00-governanca/ia/guardrails.md`
- **Feature Checklist**: `docs/gestao-ideias/04-referencia-tecnica/_templates/feature-checklist.md` (Fase 4)

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

