# Cursor Automations — Guia para Projetos STEC

Cursor Automations (lançado em março de 2026) executam Cloud Agents automaticamente em background,
sem interação manual, disparados por eventos do GitHub, Slack, Linear, PagerDuty ou agendamento.

---

## Como criar uma Automation

1. Acessar [cursor.com/automations/new](https://cursor.com/automations/new)
2. Escolher um trigger
3. Escrever o prompt do agente
4. Selecionar ferramentas disponíveis
5. Salvar e ativar

---

## Automations recomendadas para projetos STEC

### 0. Criação de módulo fullstack (DDD)

**Trigger:** `Linear: Issue created` (label `ddd` ou `scaffold`)
**Prompt:**
```
Você é o ddd-fullstack-module-builder.

Se a issue pedir criação de módulo/feature:
1. Se requisitos estiverem incompletos: aplicar openspec-explore e produzir openspec-propose
2. Com proposta aprovada: executar config-project (se necessário) e config-new-module
3. Criar núcleo DDD conforme escopo: core-entity, core-value-object, core-use-case, core-repository, core-dto
4. Expor backend com backend-controller e aplicar backend-nest-guard quando houver auth/roles
5. Expor frontend com frontend-form-schema
6. Rodar gates: gate-arquitetura, gate-testes, gate-seguranca

Comentar na issue o que foi gerado, o que ficou como TODO e próximos passos.
```
**Ferramentas:** MCP (Linear), Open pull request (opcional)

### 1. Review automático de PR

**Trigger:** `GitHub: PR opened`
**Prompt:**
```
Você é um revisor de código da holding STEC.
Ao receber um PR, execute:
1. gate-arquitetura: verificar Clean Architecture, SOLID e acoplamento
2. gate-seguranca: verificar auth, secrets e input validation
3. Se houver achados bloqueantes, comentar no PR e solicitar correção
4. Se aprovado, comentar resumo positivo com sugestões de melhoria

Use o formato gate-v1 para estruturar os achados.
```
**Ferramentas:** Comment on PR, Request reviewers

---

### 2. Gate de CI pós-pipeline

**Trigger:** `GitHub: CI completed`
**Prompt:**
```
Após a conclusão de um workflow de CI, verifique:
1. Se houve falhas de teste: acionar gate-testes e reportar causa raiz
2. Se houve falhas de lint/type-check: acionar code-corretor-de-linter
3. Comentar no PR com o resultado (passou/falhou) e próximos passos
```
**Ferramentas:** Comment on PR

---

### 3. Triagem de bugs do Slack

**Trigger:** `Slack: New message` (canal #bugs ou #alerts)
**Prompt:**
```
Ao receber uma mensagem de bug no Slack:
1. Analisar a mensagem e identificar o serviço afetado
2. Acionar debug-analista-de-bugs com o contexto
3. Criar um issue no Linear com título, severidade e próximos passos
4. Responder no Slack com o resumo da análise e link do issue
```
**Ferramentas:** Send to Slack, MCP (Linear)

---

### 4. Planejamento de sprint via Linear

**Trigger:** `Linear: Issue created`
**Prompt:**
```
Ao receber uma nova issue no Linear:
1. Analisar a descrição e classificar tipo (feature, bug, debt técnico)
2. Se for feature: acionar openspec-explore para análise inicial
3. Estimar complexidade (P, M, G) baseado no escopo descrito
4. Comentar na issue com a análise e sugestão de critérios de aceite
```
**Ferramentas:** MCP (Linear)

---

### 5. Scan de segurança agendado

**Trigger:** `Scheduled` (toda segunda-feira às 09h)
**Prompt:**
```
Executar scan semanal de segurança:
1. Verificar dependências desatualizadas com vulnerabilidades conhecidas
2. Checar se há secrets expostos em código recém-commitado (últimos 7 dias)
3. Executar gate-seguranca nos endpoints críticos modificados na semana
4. Gerar relatório e enviar para o canal #security no Slack
```
**Ferramentas:** Send to Slack, Open PR (se correção automática for possível)

---

## Ferramentas disponíveis nas Automations

| Ferramenta | O que faz |
|---|---|
| Open pull request | Agente escreve código e abre PR |
| Comment on PR | Posta comentários, revisões, aprovações |
| Request reviewers | Atribui revisores ao PR gatilhado |
| Send to Slack | Envia mensagem para canal Slack |
| Read Slack channels | Lê mensagens de canais públicos |
| MCP server | Conecta ferramentas externas (Linear, Jira, etc.) |
| Memories | Notas persistentes entre execuções da automation |

---

## Diferença: Automations vs Hooks vs Skills

| | Automations | Hooks | Skills |
|---|---|---|---|
| **Onde roda** | Cloud (cursor.com) | Local (máquina do dev) | Local (contexto do agente) |
| **Quando dispara** | Eventos externos (GitHub, Slack, Linear) ou schedule | Eventos do loop do agente (edição, shell, sessão) | Quando o agente decide ou usuário invoca |
| **Acesso ao código** | Via repositório GitHub | Via filesystem local | Via tools do agente |
| **Interação** | Assíncrono, sem usuário | Síncrono, intercepta ação | Síncrono, guia ação |
| **Configuração** | cursor.com/automations | hooks.json | SKILL.md |
