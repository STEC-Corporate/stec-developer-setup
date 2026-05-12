# 📖 Dicionário de Métricas - {{PROJECT_NAME}}

> **Definições exatas de como cada métrica é calculada**

---

## 🎯 Por que Este Documento?

**Problema sem dicionário**:
- Métricas podem significar coisas diferentes para times diferentes
- Backend calcula de um jeito, frontend de outro
- Métricas inconsistentes entre reports
- Decisões baseadas em dados errados

**Solução: Metric Dictionary**:
- ✅ Definição ÚNICA e clara
- ✅ Fórmula exata
- ✅ O que incluir/excluir
- ✅ Como implementar

---

## 📋 Índice

{{CATEGORIES_INDEX}}

---

## 📊 Métricas Detalhadas

{{METRICS_SECTIONS}}

---

## 📊 Como Usar Este Dicionário

### Para Desenvolvedores

Ao implementar métrica:
1. Consultar definição EXATA aqui
2. Seguir fórmula documentada
3. Respeitar inclusões/exclusões
4. Implementar conforme código de exemplo

### Para PMs/Produto

Ao analisar métricas:
1. Verificar que métrica mede o que você pensa
2. Entender o que está incluído/excluído
3. Comparar com benchmark correto

### Para Atualizar

1. Se métrica muda: **Criar nova versão** (não sobrescrever)
2. Marcar versão antiga como deprecated
3. Explicar mudança em changelog
4. Atualizar código/queries

---

## 📚 Referências

- [North Star Metric](./north-star.md) - Métrica principal
- [Guardrails](../../../.cursor/docs/ia/guardrails.md) - Princípios de métricas

---

**Criado em**: {{CREATED_DATE}}  
**Última atualização**: {{UPDATED_DATE}}  
**Versão**: 1.0  
**Responsável**: {{RESPONSIBLE}}  
**Revisão**: Trimestral

---

## 🔄 Changelog

| Data | Métrica | Mudança |
|------|---------|---------|
| {{CREATED_DATE}} | Todas | Criação inicial do dicionário |
