# Plano: Migrar Documentos para Nova Estrutura SoundLink

> **Status:** CONCLUÍDO (2026-04-30) — execução no repo; plano histórico. Estado atual: [`docs/MAPA-DOCUMENTOS.md`](../MAPA-DOCUMENTOS.md).

---

## 1. Objetivo

Mover todos os documentos da estrutura legada (`docs/planejamento/`, `docs/api-specifications/`, `docs/referencia/` temporária) para a nova estrutura padrão SoundLink (`docs/gestao-tarefas/03-especificacao-produto/`), garantindo:
- Preservação do histórico de revisões (via `git mv`)
- Links internos atualizados e funcionais
- Índices (INDEX.md) criados em cada pasta de perfil
- Consistência terminológica em PT-BR

---

## 2. Escopo (O Que Será Feito)

### 2.1 Documentos de `docs/planejamento/` → `user-flows/` e `business-rules/`

| Ordem | Documento Origem | Destino | Tipo | Prioridade |
|-------|------------------|---------|------|------------|
| 1 | `jornada-contratante-mvp.md` | `user-flows/contratante-individual/` | User flow | Alta |
| 2 | `glossario-olinket.md` | `business-rules/_shared/` | Glossário | Alta |
| 3 | `decisoes-alinhamento-plano-olinket-build-ready.md` | `business-rules/contratante-individual/` | Regras de negócio | Média |
| 4 | `home-olinket-corte-2.md` | `user-flows/_shared/publico/home.md` | User flow | Alta |
| 5 | `detalhe-olinket-corte-3.md` | `user-flows/_shared/publico/descoberta.md` | User flow | Alta |
| 6 | `contratante-olinket-corte-4.md` | `user-flows/contratante-individual/dashboard.md` | User flow | Alta |
| 7 | `negociacao-olinket-corte-5.md` | `user-flows/contratante-individual/propostas.md` | User flow | Alta |
| 8 | `criar-evento-olinket-corte-6.md` | `user-flows/contratante-individual/criar-evento.md` | User flow | Média |
| 9 | `criar-evento-olinket-corte-7.md` | `user-flows/contratante-individual/evento-especificidades.md` | User flow | Média |
| 10 | `lifecycle-evento-olinket.md` | `business-rules/contratante-individual/evento-lifecycle.md` | Regras de negócio | Média |
| 11 | `plano-olinket-workspaces-e-contratante.md` | `business-rules/_shared/arquitetura-workspace.md` | Arquitetura | Baixa |
| 12 | `matriz-ecras-soundlink-olinket.md` | `ui-canonical/matriz-telas.md` | UI Canonical | Alta |
| 13 | `visao-olinket-soundlink-paridade-e-proximo-plano.md` | `docs/gestao-tarefas/_indices/roadmap-olinket.md` | Roadmap | Média |
| 14 | `auth-estrategia-mvp.md` | `business-rules/_shared/autenticacao.md` | Regras de negócio | Média |
| 15 | `integracao-api-fase4.md` | `api-specifications/fase4-backend.md` | API Spec | Média |

### 2.2 Fragmentos PBR → `business-rules/`

| Ordem | Documento Origem | Destino | Descrição | Prioridade |
|-------|------------------|---------|-----------|------------|
| 16 | `fragmento-pbr02-agregadores-globais.md` | `business-rules/contratante-individual/agregadores.md` | Contratos, pagamentos, mensagens | Baixa |
| 17 | `fragmento-pbr03-notificacoes-centro.md` | `business-rules/contratante-individual/notificacoes.md` | Centro de notificações | Baixa |
| 18 | `fragmento-pbr05-campos-evento-formulario.md` | `business-rules/contratante-individual/evento-formulario.md` | Formulário de evento | Média |
| 19 | `fragmento-pbr06-agenda-calendario-tarefas.md` | `business-rules/contratante-individual/agenda.md` | Agenda e tarefas | Baixa |
| 20 | `fragmento-pbr07-especificacao-dominio.md` | `business-rules/_shared/dominio-permissoes.md` | Permissões e domínio | Baixa |

### 2.3 Documentos de `docs/referencia/` → Ajustar Localização

| Ordem | Documento | Ação | Destino |
|-------|-----------|------|---------|
| 21 | `cursor-context-olinket.md` | Mover | `gestao-ideias/04-referencia-tecnica/referencia/dev/` |
| 22 | `sincronizacao-adr-001-adr-035.md` | Mover | `gestao-ideias/00-governanca/decisoes/` |
| 23 | `caminhos-repos-locais.md` | Manter | `referencia/` (atualizar refs) |

### 2.4 Documentos de `docs/api-specifications/` → Nova Estrutura

| Ordem | Documento Origem | Destino |
|-------|------------------|---------|
| 24 | `olinket-endpoints.md` | `api-specifications/endpoints.md` |

### 2.5 Criar Índices (INDEX.md)

Após a migração, criar INDEX.md em:
- `business-rules/_shared/INDEX.md`
- `business-rules/contratante-individual/INDEX.md`
- `business-rules/contratante-empresarial/INDEX.md` (estrutura vazia)
- `business-rules/profissional/INDEX.md` (estrutura vazia)
- `user-flows/_shared/INDEX.md`
- `user-flows/contratante-individual/INDEX.md`
- `user-flows/contratante-empresarial/INDEX.md` (estrutura vazia)
- `user-flows/profissional/INDEX.md` (estrutura vazia)
- `api-specifications/_shared/INDEX.md`
- `api-specifications/contratante/INDEX.md`
- `api-specifications/profissional/INDEX.md`

---

## 3. Não-Escopo (O Que NÃO Será Feito)

- ❌ Alterar conteúdo dos documentos (apenas path e links)
- ❌ Renomear arquivos que já estão em PT-BR com termos corretos
- ❌ Modificar código fonte da aplicação (`src/`)
- ❌ Criar novos documentos do zero
- ❌ Migrar documentos de outros repositórios
- ❌ Apagar o histórico git (usaremos `git mv` para preservar)

---

## 4. Fases/Tarefas

### Fase 1: Preparação
- [ ] 1.1 Verificar status git (working directory limpo)
- [ ] 1.2 Fazer backup do branch atual (ou criar branch `docs/migracao-estrutura`)
- [ ] 1.3 Validar que estrutura de pastas destino existe
- [ ] 1.4 Revisar MAPA-DOCUMENTOS.md para confirmação final

### Fase 2: Migração em Lotes (por Prioridade)

#### Lote A — Alta Prioridade (User Flows Core)
- [ ] 2.1 Mover `jornada-contratante-mvp.md`
- [ ] 2.2 Mover `home-olinket-corte-2.md`
- [ ] 2.3 Mover `detalhe-olinket-corte-3.md`
- [ ] 2.4 Mover `contratante-olinket-corte-4.md`
- [ ] 2.5 Mover `negociacao-olinket-corte-5.md`

#### Lote B — Glossário e Regras Fundamentais
- [ ] 2.6 Mover `glossario-olinket.md`
- [ ] 2.7 Mover `auth-estrategia-mvp.md`
- [ ] 2.8 Mover `fragmento-pbr05-campos-evento-formulario.md`

#### Lote C — UI Canonical e API
- [ ] 2.9 Mover `matriz-ecras-soundlink-olinket.md`
- [ ] 2.10 Mover `olinket-endpoints.md`
- [ ] 2.11 Mover `integracao-api-fase4.md`

#### Lote D — Eventos e Lifecycle
- [ ] 2.12 Mover `criar-evento-olinket-corte-6.md`
- [ ] 2.13 Mover `criar-evento-olinket-corte-7.md`
- [ ] 2.14 Mover `lifecycle-evento-olinket.md`

#### Lote E — Arquitetura e Decisões
- [ ] 2.15 Mover `decisoes-alinhamento-plano-olinket-build-ready.md`
- [ ] 2.16 Mover `plano-olinket-workspaces-e-contratante.md`
- [ ] 2.17 Mover `visao-olinket-soundlink-paridade-e-proximo-plano.md`
- [ ] 2.18 Mover `cursor-context-olinket.md`
- [ ] 2.19 Mover `sincronizacao-adr-001-adr-035.md`

#### Lote F — Fragmentos PBR Restantes
- [ ] 2.20 Mover `fragmento-pbr02-agregadores-globais.md`
- [ ] 2.21 Mover `fragmento-pbr03-notificacoes-centro.md`
- [ ] 2.22 Mover `fragmento-pbr06-agenda-calendario-tarefas.md`
- [ ] 2.23 Mover `fragmento-pbr07-especificacao-dominio.md`

### Fase 3: Atualização de Links
- [ ] 3.1 Identificar links relativos em cada documento movido
- [ ] 3.2 Atualizar links que apontavam para `planejamento/` → novos caminhos
- [ ] 3.3 Atualizar links que apontavam para `api-specifications/` legado
- [ ] 3.4 Validar links internos (grep por `](../` e `](./`)

### Fase 4: Criação de Índices
- [ ] 4.1 Criar `business-rules/_shared/INDEX.md`
- [ ] 4.2 Criar `business-rules/contratante-individual/INDEX.md`
- [ ] 4.3 Criar `user-flows/_shared/INDEX.md`
- [ ] 4.4 Criar `user-flows/contratante-individual/INDEX.md`
- [ ] 4.5 Criar `api-specifications/_shared/INDEX.md`
- [ ] 4.6 Criar `api-specifications/contratante/INDEX.md`
- [ ] 4.7 Criar `api-specifications/profissional/INDEX.md`

### Fase 5: Limpeza e Validação
- [ ] 5.1 Remover pastas legado vazias (se aplicável)
- [ ] 5.2 Atualizar `docs/MAPA-DOCUMENTOS.md` com status concluído
- [ ] 5.3 Atualizar `docs/README.md` se necessário
- [ ] 5.4 Verificar conformidade com regra `document-lifecycle.mdc`

---

## 5. Script para Execução em Batch

```bash
#!/bin/bash
# Script: migrar-docs-batch.sh
# Executar da raiz do repositório

echo "=== FASE 2: Migração em Lotes ==="

# Lote A — Alta Prioridade (User Flows Core)
git mv "docs/planejamento/jornada-contratante-mvp.md" "docs/gestao-tarefas/03-especificacao-produto/user-flows/contratante-individual/"
git mv "docs/planejamento/home-olinket-corte-2.md" "docs/gestao-tarefas/03-especificacao-produto/user-flows/_shared/publico/home.md"
git mv "docs/planejamento/detalhe-olinket-corte-3.md" "docs/gestao-tarefas/03-especificacao-produto/user-flows/_shared/publico/descoberta.md"
git mv "docs/planejamento/contratante-olinket-corte-4.md" "docs/gestao-tarefas/03-especificacao-produto/user-flows/contratante-individual/dashboard.md"
git mv "docs/planejamento/negociacao-olinket-corte-5.md" "docs/gestao-tarefas/03-especificacao-produto/user-flows/contratante-individual/propostas.md"

# Lote B — Glossário e Regras Fundamentais
git mv "docs/planejamento/glossario-olinket.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/_shared/"
git mv "docs/planejamento/auth-estrategia-mvp.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/_shared/autenticacao.md"
git mv "docs/planejamento/fragmento-pbr05-campos-evento-formulario.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/contratante-individual/evento-formulario.md"

# Lote C — UI Canonical e API
git mv "docs/planejamento/matriz-ecras-soundlink-olinket.md" "docs/gestao-tarefas/03-especificacao-produto/ui-canonical/matriz-telas.md"
git mv "docs/api-specifications/olinket-endpoints.md" "docs/gestao-tarefas/03-especificacao-produto/api-specifications/endpoints.md"
git mv "docs/planejamento/integracao-api-fase4.md" "docs/gestao-tarefas/03-especificacao-produto/api-specifications/fase4-backend.md"

# Lote D — Eventos e Lifecycle
git mv "docs/planejamento/criar-evento-olinket-corte-6.md" "docs/gestao-tarefas/03-especificacao-produto/user-flows/contratante-individual/criar-evento.md"
git mv "docs/planejamento/criar-evento-olinket-corte-7.md" "docs/gestao-tarefas/03-especificacao-produto/user-flows/contratante-individual/evento-especificidades.md"
git mv "docs/planejamento/lifecycle-evento-olinket.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/contratante-individual/evento-lifecycle.md"

# Lote E — Arquitetura e Decisões
git mv "docs/planejamento/decisoes-alinhamento-plano-olinket-build-ready.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/contratante-individual/"
git mv "docs/planejamento/plano-olinket-workspaces-e-contratante.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/_shared/arquitetura-workspace.md"
git mv "docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md" "docs/gestao-tarefas/_indices/roadmap-olinket.md"

# Lote F — Fragmentos PBR Restantes
git mv "docs/planejamento/fragmento-pbr02-agregadores-globais.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/contratante-individual/agregadores.md"
git mv "docs/planejamento/fragmento-pbr03-notificacoes-centro.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/contratante-individual/notificacoes.md"
git mv "docs/planejamento/fragmento-pbr06-agenda-calendario-tarefas.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/contratante-individual/agenda.md"
git mv "docs/planejamento/fragmento-pbr07-especificacao-dominio.md" "docs/gestao-tarefas/03-especificacao-produto/business-rules/_shared/dominio-permissoes.md"

# Lote G — Documentos de referencia/
git mv "docs/referencia/cursor-context-olinket.md" "docs/gestao-ideias/04-referencia-tecnica/referencia/dev/"
git mv "docs/referencia/sincronizacao-adr-001-adr-035.md" "docs/gestao-ideias/00-governanca/decisoes/"

echo "=== Migração concluída ==="
echo "Próximo: Atualizar links e criar INDEX.md"
```

---

## 6. Checklist de Validação

### 6.1 Validação de Migração
- [ ] Todos os documentos da lista foram movidos com `git mv`
- [ ] `git log --follow` mostra histórico preservado em arquivos movidos
- [ ] Pastas legado estão vazias ou removidas
- [ ] Nenhum documento ficou em local incorreto

### 6.2 Validação de Links
- [ ] Nenhum link quebrado apontando para `../planejamento/`
- [ ] Nenhum link quebrado apontando para `../api-specifications/`
- [ ] Links entre documentos movidos estão funcionais
- [ ] Links para `docs/referencia/` permanecem válidos

### 6.3 Validação de Índices
- [ ] INDEX.md existe em cada pasta de perfil listada
- [ ] Índices listam todos os documentos da pasta
- [ ] Índices seguem template padrão (se houver)

### 6.4 Validação PT-BR
- [ ] Nenhum termo PT-PT foi introduzido durante a migração
- [ ] Termos como "canônica", "arquivo", "compartilhar" estão corretos

### 6.5 Validação Git
- [ ] `git status` mostra apenas arquivos movidos (não deletados/criados como untracked)
- [ ] Commit de migração está pronto para push

---

## 7. Critério de Pronto (Definition of Done)

- [ ] **100% dos documentos migrados**: Todos os ~23 documentos da lista movidos para destinos corretos
- [ ] **Histórico preservado**: `git log --follow` funciona em arquivos movidos
- [ ] **Links atualizados**: Nenhum link relativo quebrado dentro dos documentos migrados
- [ ] **Índices criados**: INDEX.md em todas as pastas de perfil listadas
- [ ] **Estrutura legado limpa**: Pastas `planejamento/` e `api-specifications/` legado vazias ou removidas
- [ ] **MAPA-DOCUMENTOS.md atualizado**: Status reflete migração concluída
- [ ] **Commit realizado**: Commit com mensagem "docs: migra documentos para estrutura SoundLink"
- [ ] **Validação de conformidade**: Scripts `verify-docs-process.sh` e `audit-docs-conformity.sh` passam

---

## 8. Riscos e Mitigação

| Risco | Probabilidade | Impacto | Mitigação |
|-------|---------------|---------|-----------|
| Links quebrados após migração | Alta | Médio | Rodar grep por padrões de link; validar manualmente documentos core |
| Perda de histórico (mv sem git) | Baixa | Alto | Usar apenas `git mv`; nunca `mv` + `git add` |
| Conflitos com trabalho paralelo | Média | Médio | Coordenar com equipe; fazer em branch dedicado |
| Caminhos de destino incorretos | Média | Médio | Validar cada movimento contra MAPA-DOCUMENTOS.md antes de executar |
| Documentos esquecidos | Baixa | Médio | Usar este plano como checklist; verificar `git status` no final |

---

## 9. Referências Cruzadas

- **Fonte da migração**: `docs/MAPA-DOCUMENTOS.md`
- **Regra de conformidade**: `.cursor/rules/document-lifecycle.mdc`
- **Regra PT-BR**: `.cursor/rules/pt-br-linguagem.mdc`
- **Template de índice**: `docs/gestao-ideias/04-referencia-tecnica/_templates/`
- **Auditoria P0**: `docs/referencia/auditoria-paridade-P0.md`

---

## 10. Comandos Úteis para Validação

```bash
# Verificar documentos não rastreados (devem ser zero após git mv)
git status

# Buscar links potencialmente quebrados apontando para planejamento/
grep -r "\.\./planejamento/" docs/
grep -r "\.\./api-specifications/" docs/

# Listar todos os arquivos markdown na nova estrutura
find docs/gestao-tarefas/03-especificacao-produto/ -name "*.md" | sort

# Verificar histórico preservado (exemplo)
git log --follow docs/gestao-tarefas/03-especificacao-produto/business-rules/_shared/glossario-olinket.md

# Rodar scripts de conformidade
bash scripts/verify-docs-process.sh
bash scripts/audit-docs-conformity.sh --fail-on-changed origin/main
```

---

*Plano gerado conforme workflow STEC e prompt de planejamento para migração de documentos.*
