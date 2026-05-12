# Premissa de migração: Template - Frontend Oficial

Documento de premissa. Regras de migração que o Frontend Oficial deve seguir.

---

## 1. Regras de rewrite de imports

### Objetivo

Baseline alinhado ao template. Alias: @/* -> ./src/*

### Regra geral

- Não reescrever imports por padrão
- Reescrever somente casos especiais (imports relativos quebrados, convenções de app/**)

### Source of truth

- Rotas, layouts: app/**
- Feature code: src/features/**
- Infra: src/clients/**, src/services/**
- Shared: src/components/**, src/lib/**, src/hooks/**, etc.

---

## 2. Princípios allow/deny

- Não copiar documentação de planejamento para o Frontend Oficial
- Não copiar fake/mock
- Deny globs para configs sensíveis: node_modules, .next, package.json, etc.

---

## 3. Referência cruzada

- Configuração das fases: docs/referencia/migracao/config-migracao-template-oficial.json
- Frontend Oficial: consultar MAPA-DOCUMENTOS para paths do Template
