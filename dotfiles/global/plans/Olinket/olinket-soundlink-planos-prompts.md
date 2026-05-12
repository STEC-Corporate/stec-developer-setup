# Prompts para criação e execução de planos — Olinket × SoundLink

Este documento contém **sete prompts prontos para colar**, na **ordem de criação e execução** dos planos. Em **cada** prompt, o **bloco mestre** (decisões e contexto comuns) vem **sempre no início**; logo abaixo segue o **escopo específico** daquele plano.

**Como usar:** copie **todo** o conteúdo dentro da cerca de código `markdown` da secção do plano (do título «Contexto para planos» até ao fim dos critérios) e cole num novo chat.

---

## Ordem de execução (resumo)

| Ordem | Ficheiro mental | Tema |
|-------|-----------------|------|
| 1 | Secção «Plano 1» | Migração rotas PT → literal SL |
| 2 | Secção «Plano 2» | Contratante Individual (P0) |
| 3 | Secção «Plano 3» | Contratante Empresarial + admin |
| 4 | Secção «Plano 4» | Descobrir + ficha Profissional |
| 5 | Secção «Plano 5» | Agenda tarefas × Calendário eventos |
| 6 | Secção «Plano 6» | Cadastro Profissional + `/` + DNS |
| 7 | Secção «Plano 7» | Integração Olinket ↔ Workspace |

---

## Plano 1 — Migração de rotas (PT → espelho literal SL)

```markdown
## Contexto para planos (Olinket template + referência SoundLink)

Sou o repositório **olinket-template-frontend**. Preciso de **planos de trabalho executáveis** alinhados às decisões abaixo (produto + UX + rotas + domínio). Referência de código: clone **soundlink-template-frontend** (branch `main`). Documentos já existentes no Olinket: **auditoria-paridade-P0**, **matriz-telas.md**, **ADR-001**, **matriz-reuso-soundlink-olinket.md**, glossário Olinket.

---

## Princípios fixos

1. **SoundLink** (e futuros workspaces, ex. VisualLink) são a **base operacional** para **Profissionais**. **Olinket** é o **ponto de concentração do Contratante** (**Individual** e **Empresarial**).
2. Ambição: **paridade de tela** onde fizer sentido e **integração ponta a ponta** (ex.: proposta enviada na Olinket **chega** no fluxo do workspace); a **UX da Olinket pode diferir** desde que estrutura e dados conversem com o SL.
3. Páginas completas de **Profissional** devem aproximar-se das **Find-Professional / Find-Performance** (informação, calendário, formulários conforme referência SL).
4. No SL, **Projeto** deve ser tratado em **copy/UX como “Formação Artística”** nesta fase (**sem mudança de rotas** no SL ainda — só Olinket pode ajustar copy interna se aplicável).
5. **Dois tipos de calendário/agenda:**  
   - **Agenda de Tarefas** — compromissos/atividades do dia a dia (Olinket e SL).  
   - **Calendário de Eventos** — aquilo que foi **contratado** / evento de negócio; **deve refletir em todos os calendários de eventos das partes envolvidas**.  
   Comportamento durante negociação: **paridade com o comportamento atual do SL** (estados a documentar).

---

## CRM e nomenclatura (cross-produto)

- Na Olinket, o Contratante gere **Profissional** no contexto do **Evento**.
- No SL, o Profissional gere **Cliente** no contexto da **Formação Artística** (projeto).
- **Contratante** no SL ≈ entidade do “cliente” vista pelo profissional em CRM; aberto a UI **Contratante (SL) / Contratado (Olinket)** desde que claro.  
**Regra técnica:** nomes **neutros na API** exposta/contratos internos; **copy e glossário na UI** (decisão: UI desacoplada de nomes de domínio em payload).

---

## Rotas e identidade de conta

- **Eliminar rotas PT** como canónicas na área contratante; **migrar para padrão literal do SL** (segmentos em inglês, mesma árvore que `contractor-individual` / equivalente empresarial no SL) — **redirect** do legado PT durante transição se necessário.
- **Logins separados** Individual vs Empresarial (**tipos de conta distintos**, telas e capacidades distintas).
- **Mesmo e-mail não pode** registar os dois tipos. Mensagem e fluxo: alertar **não usar e-mail empresarial para conta Individual** quando isso implicar colisão; ao **aceitar convite Empresarial** com e-mail já usado na Individual, o utilizador **perde acesso Individual** salvo **mudança prévia de e-mail** com **todo o processo de segurança**. (Validar copy/legal antes de implementar “perda de acesso”.)
- **Dashboard:** pode chamar-se Dashboard em ambos, mas **conteúdo distinto** por tipo de contratante.

---

## Profissionais e domínio

- Profissional **não** deve depender de links para “home contratante”; no **cadastro**, se escolher Profissional: escolha de **workspace**, **cards** explicativos ou **formulário com opções pré-definidas** que **deterministicamente** encaminham ao workspace certo; **sem fila humana no MVP**.
- Se sessão profissional aceder à **`/`** da Olinket: página **intermediária** (“és profissional → continuar para o workspace”) com CTA.

**DNS:** ecossistema sob **Olinket**; workspaces em **subdomínios** `{workspace}.olinket.{tld}`. **SoundLink** exemplo: **`soundlink.olinket.com`** (slug `soundlink`).

---

## Empresarial (MVP administrativo)

- Contratante Empresarial com **área administrativa** ao estilo SL **Permissões/Membros**: **convites**, **cargos/papéis**, **permissões granulares** (ver vs editar). Primeiro utilizador com copy de **administrador principal / representação**.

---

## Descoberta e nomenclatura

- Refazer **descobrir** em linha com padrões **Find-Professional / Find-Performance** onde aplicável.
- **Novas** superfícies usar **Profissional** (não Prestador) em paths e copy alinhado ao glossário.

---

## Documentação

- Estados do **Calendário de Eventos** (paridade SL vs Olinket): **fonte em `matriz-telas.md`** — tabela estado SL ↔ Olinket ↔ regra.

---

## Pedido base

Produzir **plano executável** (`.plan.md` ou estrutura do repo) para o **escopo específico** abaixo, com **fases**, **dependências**, **rotas/arquivos-chave**, **gates** (testes, `npm run lint:headers` se tocar headers, E2E quando aplicável). Assinalar **[PLANEJADO]** onde faltar BFF/API. **PT-BR** em UI e docs.

---

## Escopo específico — **Plano 1** (**executar primeiro**): migração de rotas PT → literal SL

**Objetivo:** Remover rotas PT como canónicas (`/conta`, etc.) e adoptar a **mesma estrutura de segmentos em inglês** que `soundlink-template-frontend` para `contractor-individual` e equivalente empresarial; redirects 308/307 de legado durante transição; actualizar navegação, links internos, testes unitários/E2E, links em docs (`matriz-telas`, user-flows, auditoria-P0 onde listem rotas).

**Fora do âmbito:** alterar Apex DNS em prod (apenas nota); definir backends.

**Critérios de aceitação:** nenhuma rota PT canónica nas áreas migradas; bookmarks antigos funcionam via redirect; testes e lint verdes nos módulos afectados.
```

---

## Plano 2 — Contratante Individual (auditoria-paridade-P0)

```markdown
## Contexto para planos (Olinket template + referência SoundLink)

Sou o repositório **olinket-template-frontend**. Preciso de **planos de trabalho executáveis** alinhados às decisões abaixo (produto + UX + rotas + domínio). Referência de código: clone **soundlink-template-frontend** (branch `main`). Documentos já existentes no Olinket: **auditoria-paridade-P0**, **matriz-telas.md**, **ADR-001**, **matriz-reuso-soundlink-olinket.md**, glossário Olinket.

---

## Princípios fixos

1. **SoundLink** (e futuros workspaces, ex. VisualLink) são a **base operacional** para **Profissionais**. **Olinket** é o **ponto de concentração do Contratante** (**Individual** e **Empresarial**).
2. Ambição: **paridade de tela** onde fizer sentido e **integração ponta a ponta** (ex.: proposta enviada na Olinket **chega** no fluxo do workspace); a **UX da Olinket pode diferir** desde que estrutura e dados conversem com o SL.
3. Páginas completas de **Profissional** devem aproximar-se das **Find-Professional / Find-Performance** (informação, calendário, formulários conforme referência SL).
4. No SL, **Projeto** deve ser tratado em **copy/UX como “Formação Artística”** nesta fase (**sem mudança de rotas** no SL ainda — só Olinket pode ajustar copy interna se aplicável).
5. **Dois tipos de calendário/agenda:**  
   - **Agenda de Tarefas** — compromissos/atividades do dia a dia (Olinket e SL).  
   - **Calendário de Eventos** — aquilo que foi **contratado** / evento de negócio; **deve refletir em todos os calendários de eventos das partes envolvidas**.  
   Comportamento durante negociação: **paridade com o comportamento atual do SL** (estados a documentar).

---

## CRM e nomenclatura (cross-produto)

- Na Olinket, o Contratante gere **Profissional** no contexto do **Evento**.
- No SL, o Profissional gere **Cliente** no contexto da **Formação Artística** (projeto).
- **Contratante** no SL ≈ entidade do “cliente” vista pelo profissional em CRM; aberto a UI **Contratante (SL) / Contratado (Olinket)** desde que claro.  
**Regra técnica:** nomes **neutros na API** exposta/contratos internos; **copy e glossário na UI** (decisão: UI desacoplada de nomes de domínio em payload).

---

## Rotas e identidade de conta

- **Eliminar rotas PT** como canónicas na área contratante; **migrar para padrão literal do SL** (segmentos em inglês, mesma árvore que `contractor-individual` / equivalente empresarial no SL) — **redirect** do legado PT durante transição se necessário.
- **Logins separados** Individual vs Empresarial (**tipos de conta distintos**, telas e capacidades distintas).
- **Mesmo e-mail não pode** registar os dois tipos. Mensagem e fluxo: alertar **não usar e-mail empresarial para conta Individual** quando isso implicar colisão; ao **aceitar convite Empresarial** com e-mail já usado na Individual, o utilizador **perde acesso Individual** salvo **mudança prévia de e-mail** com **todo o processo de segurança**. (Validar copy/legal antes de implementar “perda de acesso”.)
- **Dashboard:** pode chamar-se Dashboard em ambos, mas **conteúdo distinto** por tipo de contratante.

---

## Profissionais e domínio

- Profissional **não** deve depender de links para “home contratante”; no **cadastro**, se escolher Profissional: escolha de **workspace**, **cards** explicativos ou **formulário com opções pré-definidas** que **deterministicamente** encaminham ao workspace certo; **sem fila humana no MVP**.
- Se sessão profissional aceder à **`/`** da Olinket: página **intermediária** (“és profissional → continuar para o workspace”) com CTA.

**DNS:** ecossistema sob **Olinket**; workspaces em **subdomínios** `{workspace}.olinket.{tld}`. **SoundLink** exemplo: **`soundlink.olinket.com`** (slug `soundlink`).

---

## Empresarial (MVP administrativo)

- Contratante Empresarial com **área administrativa** ao estilo SL **Permissões/Membros**: **convites**, **cargos/papéis**, **permissões granulares** (ver vs editar). Primeiro utilizador com copy de **administrador principal / representação**.

---

## Descoberta e nomenclatura

- Refazer **descobrir** em linha com padrões **Find-Professional / Find-Performance** onde aplicável.
- **Novas** superfícies usar **Profissional** (não Prestador) em paths e copy alinhado ao glossário.

---

## Documentação

- Estados do **Calendário de Eventos** (paridade SL vs Olinket): **fonte em `matriz-telas.md`** — tabela estado SL ↔ Olinket ↔ regra.

---

## Pedido base

Produzir **plano executável** (`.plan.md` ou estrutura do repo) para o **escopo específico** abaixo, com **fases**, **dependências**, **rotas/arquivos-chave**, **gates** (testes, `npm run lint:headers` se tocar headers, E2E quando aplicável). Assinalar **[PLANEJADO]** onde faltar BFF/API. **PT-BR** em UI e docs.

---

## Escopo específico — **Plano 2** (**após Plano 1**): Contratante Individual + auditoria P0

**Objetivo:** Alinhar **dashboard e fluxos-chave** à **auditoria-paridade-P0**: separação explícita **Individual** em **URLs** pós-migração; dashboard **Individual** com conteúdo específico (não genérico “conta”); paridade de estados vazios, CTAs, ordem mental de navegação equivalente ao SL (`contractor-individual`).

**Entregáveis:** mapa desvio P0 → PRs; actualizar `matriz-telas.md` onde ainda houver lacunas §3 Individual.

**Critérios:** rotas e nav coerentes com Plano 1; smoke nas jornadas Individual.
```

---

## Plano 3 — Contratante Empresarial + área administrativa

```markdown
## Contexto para planos (Olinket template + referência SoundLink)

Sou o repositório **olinket-template-frontend**. Preciso de **planos de trabalho executáveis** alinhados às decisões abaixo (produto + UX + rotas + domínio). Referência de código: clone **soundlink-template-frontend** (branch `main`). Documentos já existentes no Olinket: **auditoria-paridade-P0**, **matriz-telas.md**, **ADR-001**, **matriz-reuso-soundlink-olinket.md**, glossário Olinket.

---

## Princípios fixos

1. **SoundLink** (e futuros workspaces, ex. VisualLink) são a **base operacional** para **Profissionais**. **Olinket** é o **ponto de concentração do Contratante** (**Individual** e **Empresarial**).
2. Ambição: **paridade de tela** onde fizer sentido e **integração ponta a ponta** (ex.: proposta enviada na Olinket **chega** no fluxo do workspace); a **UX da Olinket pode diferir** desde que estrutura e dados conversem com o SL.
3. Páginas completas de **Profissional** devem aproximar-se das **Find-Professional / Find-Performance** (informação, calendário, formulários conforme referência SL).
4. No SL, **Projeto** deve ser tratado em **copy/UX como “Formação Artística”** nesta fase (**sem mudança de rotas** no SL ainda — só Olinket pode ajustar copy interna se aplicável).
5. **Dois tipos de calendário/agenda:**  
   - **Agenda de Tarefas** — compromissos/atividades do dia a dia (Olinket e SL).  
   - **Calendário de Eventos** — aquilo que foi **contratado** / evento de negócio; **deve refletir em todos os calendários de eventos das partes envolvidas**.  
   Comportamento durante negociação: **paridade com o comportamento atual do SL** (estados a documentar).

---

## CRM e nomenclatura (cross-produto)

- Na Olinket, o Contratante gere **Profissional** no contexto do **Evento**.
- No SL, o Profissional gere **Cliente** no contexto da **Formação Artística** (projeto).
- **Contratante** no SL ≈ entidade do “cliente” vista pelo profissional em CRM; aberto a UI **Contratante (SL) / Contratado (Olinket)** desde que claro.  
**Regra técnica:** nomes **neutros na API** exposta/contratos internos; **copy e glossário na UI** (decisão: UI desacoplada de nomes de domínio em payload).

---

## Rotas e identidade de conta

- **Eliminar rotas PT** como canónicas na área contratante; **migrar para padrão literal do SL** (segmentos em inglês, mesma árvore que `contractor-individual` / equivalente empresarial no SL) — **redirect** do legado PT durante transição se necessário.
- **Logins separados** Individual vs Empresarial (**tipos de conta distintos**, telas e capacidades distintas).
- **Mesmo e-mail não pode** registar os dois tipos. Mensagem e fluxo: alertar **não usar e-mail empresarial para conta Individual** quando isso implicar colisão; ao **aceitar convite Empresarial** com e-mail já usado na Individual, o utilizador **perde acesso Individual** salvo **mudança prévia de e-mail** com **todo o processo de segurança**. (Validar copy/legal antes de implementar “perda de acesso”.)
- **Dashboard:** pode chamar-se Dashboard em ambos, mas **conteúdo distinto** por tipo de contratante.

---

## Profissionais e domínio

- Profissional **não** deve depender de links para “home contratante”; no **cadastro**, se escolher Profissional: escolha de **workspace**, **cards** explicativos ou **formulário com opções pré-definidas** que **deterministicamente** encaminham ao workspace certo; **sem fila humana no MVP**.
- Se sessão profissional aceder à **`/`** da Olinket: página **intermediária** (“és profissional → continuar para o workspace”) com CTA.

**DNS:** ecossistema sob **Olinket**; workspaces em **subdomínios** `{workspace}.olinket.{tld}`. **SoundLink** exemplo: **`soundlink.olinket.com`** (slug `soundlink`).

---

## Empresarial (MVP administrativo)

- Contratante Empresarial com **área administrativa** ao estilo SL **Permissões/Membros**: **convites**, **cargos/papéis**, **permissões granulares** (ver vs editar). Primeiro utilizador com copy de **administrador principal / representação**.

---

## Descoberta e nomenclatura

- Refazer **descobrir** em linha com padrões **Find-Professional / Find-Performance** onde aplicável.
- **Novas** superfícies usar **Profissional** (não Prestador) em paths e copy alinhado ao glossário.

---

## Documentação

- Estados do **Calendário de Eventos** (paridade SL vs Olinket): **fonte em `matriz-telas.md`** — tabela estado SL ↔ Olinket ↔ regra.

---

## Pedido base

Produzir **plano executável** (`.plan.md` ou estrutura do repo) para o **escopo específico** abaixo, com **fases**, **dependências**, **rotas/arquivos-chave**, **gates** (testes, `npm run lint:headers` se tocar headers, E2E quando aplicável). Assinalar **[PLANEJADO]** onde faltar BFF/API. **PT-BR** em UI e docs.

---

## Escopo específico — **Plano 3** (**após ou em paralelo cuidadoso com Plano 2**): Empresarial + admin

**Objetivo:** Árvore **Empresarial** com **o mesmo conjunto de écrãs operacionais** que Individual no primeiro corte de produto, **mais** **Área Administrativa** ao estilo **Permissões/Membros** do SL: convites, **cargos/papéis**, matriz **ver/editar** (granularidade mínima calibrada contra o SL). Primeiro utilizador: copy **administrador principal / representação**.

**Entregáveis:** rotas padrão SL empresarial; fluxo convite/aceite (demo/local); matriz permissões MVP; política **e-mail único** entre tipos e copy de conflito Individual/Convite nos formulários.

**Critérios:** demo criar empresa → admin → convidar → aceitar; rever copy/legal antes de implementar fluxo definitivo de “perda de Individual”.
```

---

## Plano 4 — Descobrir + ficha Profissional (paridade Find-*)

```markdown
## Contexto para planos (Olinket template + referência SoundLink)

Sou o repositório **olinket-template-frontend**. Preciso de **planos de trabalho executáveis** alinhados às decisões abaixo (produto + UX + rotas + domínio). Referência de código: clone **soundlink-template-frontend** (branch `main`). Documentos já existentes no Olinket: **auditoria-paridade-P0**, **matriz-telas.md**, **ADR-001**, **matriz-reuso-soundlink-olinket.md**, glossário Olinket.

---

## Princípios fixos

1. **SoundLink** (e futuros workspaces, ex. VisualLink) são a **base operacional** para **Profissionais**. **Olinket** é o **ponto de concentração do Contratante** (**Individual** e **Empresarial**).
2. Ambição: **paridade de tela** onde fizer sentido e **integração ponta a ponta** (ex.: proposta enviada na Olinket **chega** no fluxo do workspace); a **UX da Olinket pode diferir** desde que estrutura e dados conversem com o SL.
3. Páginas completas de **Profissional** devem aproximar-se das **Find-Professional / Find-Performance** (informação, calendário, formulários conforme referência SL).
4. No SL, **Projeto** deve ser tratado em **copy/UX como “Formação Artística”** nesta fase (**sem mudança de rotas** no SL ainda — só Olinket pode ajustar copy interna se aplicável).
5. **Dois tipos de calendário/agenda:**  
   - **Agenda de Tarefas** — compromissos/atividades do dia a dia (Olinket e SL).  
   - **Calendário de Eventos** — aquilo que foi **contratado** / evento de negócio; **deve refletir em todos os calendários de eventos das partes envolvidas**.  
   Comportamento durante negociação: **paridade com o comportamento atual do SL** (estados a documentar).

---

## CRM e nomenclatura (cross-produto)

- Na Olinket, o Contratante gere **Profissional** no contexto do **Evento**.
- No SL, o Profissional gere **Cliente** no contexto da **Formação Artística** (projeto).
- **Contratante** no SL ≈ entidade do “cliente” vista pelo profissional em CRM; aberto a UI **Contratante (SL) / Contratado (Olinket)** desde que claro.  
**Regra técnica:** nomes **neutros na API** exposta/contratos internos; **copy e glossário na UI** (decisão: UI desacoplada de nomes de domínio em payload).

---

## Rotas e identidade de conta

- **Eliminar rotas PT** como canónicas na área contratante; **migrar para padrão literal do SL** (segmentos em inglês, mesma árvore que `contractor-individual` / equivalente empresarial no SL) — **redirect** do legado PT durante transição se necessário.
- **Logins separados** Individual vs Empresarial (**tipos de conta distintos**, telas e capacidades distintas).
- **Mesmo e-mail não pode** registar os dois tipos. Mensagem e fluxo: alertar **não usar e-mail empresarial para conta Individual** quando isso implicar colisão; ao **aceitar convite Empresarial** com e-mail já usado na Individual, o utilizador **perde acesso Individual** salvo **mudança prévia de e-mail** com **todo o processo de segurança**. (Validar copy/legal antes de implementar “perda de acesso”.)
- **Dashboard:** pode chamar-se Dashboard em ambos, mas **conteúdo distinto** por tipo de contratante.

---

## Profissionais e domínio

- Profissional **não** deve depender de links para “home contratante”; no **cadastro**, se escolher Profissional: escolha de **workspace**, **cards** explicativos ou **formulário com opções pré-definidas** que **deterministicamente** encaminham ao workspace certo; **sem fila humana no MVP**.
- Se sessão profissional aceder à **`/`** da Olinket: página **intermediária** (“és profissional → continuar para o workspace”) com CTA.

**DNS:** ecossistema sob **Olinket**; workspaces em **subdomínios** `{workspace}.olinket.{tld}`. **SoundLink** exemplo: **`soundlink.olinket.com`** (slug `soundlink`).

---

## Empresarial (MVP administrativo)

- Contratante Empresarial com **área administrativa** ao estilo SL **Permissões/Membros**: **convites**, **cargos/papéis**, **permissões granulares** (ver vs editar). Primeiro utilizador com copy de **administrador principal / representação**.

---

## Descoberta e nomenclatura

- Refazer **descobrir** em linha com padrões **Find-Professional / Find-Performance** onde aplicável.
- **Novas** superfícies usar **Profissional** (não Prestador) em paths e copy alinhado ao glossário.

---

## Documentação

- Estados do **Calendário de Eventos** (paridade SL vs Olinket): **fonte em `matriz-telas.md`** — tabela estado SL ↔ Olinket ↔ regra.

---

## Pedido base

Produzir **plano executável** (`.plan.md` ou estrutura do repo) para o **escopo específico** abaixo, com **fases**, **dependências**, **rotas/arquivos-chave**, **gates** (testes, `npm run lint:headers` se tocar headers, E2E quando aplicável). Assinalar **[PLANEJADO]** onde faltar BFF/API. **PT-BR** em UI e docs.

---

## Escopo específico — **Plano 4** (**após Plano 1**; cuidado com links se Plano 2/3 em curso): descobrir + perfil público Profissional

**Objetivo:** Redesenhar **descoberta** e **detalhe de profissional** para proximidade de **layout e blocos** das rotas Find do SL (informação, calendário onde fizer sentido ao modelo contratante, formulários). **Canon novo:** **Profissional** em paths/copy; **`prestador`** só legacy + redirect se preciso.

**Entregáveis:** componentização, seeds/mocks até API, actualização glossário e links internos.

**Critérios:** explicitar na doc diferencas intencionais vs SL se UX Olinket divergir.
```

---

## Plano 5 — Agenda de Tarefas × Calendário de Eventos

```markdown
## Contexto para planos (Olinket template + referência SoundLink)

Sou o repositório **olinket-template-frontend**. Preciso de **planos de trabalho executáveis** alinhados às decisões abaixo (produto + UX + rotas + domínio). Referência de código: clone **soundlink-template-frontend** (branch `main`). Documentos já existentes no Olinket: **auditoria-paridade-P0**, **matriz-telas.md**, **ADR-001**, **matriz-reuso-soundlink-olinket.md**, glossário Olinket.

---

## Princípios fixos

1. **SoundLink** (e futuros workspaces, ex. VisualLink) são a **base operacional** para **Profissionais**. **Olinket** é o **ponto de concentração do Contratante** (**Individual** e **Empresarial**).
2. Ambição: **paridade de tela** onde fizer sentido e **integração ponta a ponta** (ex.: proposta enviada na Olinket **chega** no fluxo do workspace); a **UX da Olinket pode diferir** desde que estrutura e dados conversem com o SL.
3. Páginas completas de **Profissional** devem aproximar-se das **Find-Professional / Find-Performance** (informação, calendário, formulários conforme referência SL).
4. No SL, **Projeto** deve ser tratado em **copy/UX como “Formação Artística”** nesta fase (**sem mudança de rotas** no SL ainda — só Olinket pode ajustar copy interna se aplicável).
5. **Dois tipos de calendário/agenda:**  
   - **Agenda de Tarefas** — compromissos/atividades do dia a dia (Olinket e SL).  
   - **Calendário de Eventos** — aquilo que foi **contratado** / evento de negócio; **deve refletir em todos os calendários de eventos das partes envolvidas**.  
   Comportamento durante negociação: **paridade com o comportamento atual do SL** (estados a documentar).

---

## CRM e nomenclatura (cross-produto)

- Na Olinket, o Contratante gere **Profissional** no contexto do **Evento**.
- No SL, o Profissional gere **Cliente** no contexto da **Formação Artística** (projeto).
- **Contratante** no SL ≈ entidade do “cliente” vista pelo profissional em CRM; aberto a UI **Contratante (SL) / Contratado (Olinket)** desde que claro.  
**Regra técnica:** nomes **neutros na API** exposta/contratos internos; **copy e glossário na UI** (decisão: UI desacoplada de nomes de domínio em payload).

---

## Rotas e identidade de conta

- **Eliminar rotas PT** como canónicas na área contratante; **migrar para padrão literal do SL** (segmentos em inglês, mesma árvore que `contractor-individual` / equivalente empresarial no SL) — **redirect** do legado PT durante transição se necessário.
- **Logins separados** Individual vs Empresarial (**tipos de conta distintos**, telas e capacidades distintas).
- **Mesmo e-mail não pode** registar os dois tipos. Mensagem e fluxo: alertar **não usar e-mail empresarial para conta Individual** quando isso implicar colisão; ao **aceitar convite Empresarial** com e-mail já usado na Individual, o utilizador **perde acesso Individual** salvo **mudança prévia de e-mail** com **todo o processo de segurança**. (Validar copy/legal antes de implementar “perda de acesso”.)
- **Dashboard:** pode chamar-se Dashboard em ambos, mas **conteúdo distinto** por tipo de contratante.

---

## Profissionais e domínio

- Profissional **não** deve depender de links para “home contratante”; no **cadastro**, se escolher Profissional: escolha de **workspace**, **cards** explicativos ou **formulário com opções pré-definidas** que **deterministicamente** encaminham ao workspace certo; **sem fila humana no MVP**.
- Se sessão profissional aceder à **`/`** da Olinket: página **intermediária** (“és profissional → continuar para o workspace”) com CTA.

**DNS:** ecossistema sob **Olinket**; workspaces em **subdomínios** `{workspace}.olinket.{tld}`. **SoundLink** exemplo: **`soundlink.olinket.com`** (slug `soundlink`).

---

## Empresarial (MVP administrativo)

- Contratante Empresarial com **área administrativa** ao estilo SL **Permissões/Membros**: **convites**, **cargos/papéis**, **permissões granulares** (ver vs editar). Primeiro utilizador com copy de **administrador principal / representação**.

---

## Descoberta e nomenclatura

- Refazer **descobrir** em linha com padrões **Find-Professional / Find-Performance** onde aplicável.
- **Novas** superfícies usar **Profissional** (não Prestador) em paths e copy alinhado ao glossário.

---

## Documentação

- Estados do **Calendário de Eventos** (paridade SL vs Olinket): **fonte em `matriz-telas.md`** — tabela estado SL ↔ Olinket ↔ regra.

---

## Pedido base

Produzir **plano executável** (`.plan.md` ou estrutura do repo) para o **escopo específico** abaixo, com **fases**, **dependências**, **rotas/arquivos-chave**, **gates** (testes, `npm run lint:headers` se tocar headers, E2E quando aplicável). Assinalar **[PLANEJADO]** onde faltar BFF/API. **PT-BR** em UI e docs.

---

## Escopo específico — **Plano 5**: Agenda de Tarefas × Calendário de Eventos + `matriz-telas`

**Objetivo:** Duas superfícies claras na Olinket (alinhar ao SL onde existir): **Agenda de Tarefas** vs **Calendário de Eventos**. Estados durante proposta/contrato: **paridade com comportamento atual do SL**. Actualizar **`matriz-telas.md`** com tabela estado SL ↔ Olinket ↔ regra de negócio.

**Entregáveis:** navegação/componentes sem mistura dos dois conceitos; testes demo local.

**Critérios:** regra «evento alimenta todos os calendários de eventos envolvidos» articulada ao nível de produto (persistência pode ser demo até API).
```

---

## Plano 6 — Cadastro Profissional, landing `/` e DNS

```markdown
## Contexto para planos (Olinket template + referência SoundLink)

Sou o repositório **olinket-template-frontend**. Preciso de **planos de trabalho executáveis** alinhados às decisões abaixo (produto + UX + rotas + domínio). Referência de código: clone **soundlink-template-frontend** (branch `main`). Documentos já existentes no Olinket: **auditoria-paridade-P0**, **matriz-telas.md**, **ADR-001**, **matriz-reuso-soundlink-olinket.md**, glossário Olinket.

---

## Princípios fixos

1. **SoundLink** (e futuros workspaces, ex. VisualLink) são a **base operacional** para **Profissionais**. **Olinket** é o **ponto de concentração do Contratante** (**Individual** e **Empresarial**).
2. Ambição: **paridade de tela** onde fizer sentido e **integração ponta a ponta** (ex.: proposta enviada na Olinket **chega** no fluxo do workspace); a **UX da Olinket pode diferir** desde que estrutura e dados conversem com o SL.
3. Páginas completas de **Profissional** devem aproximar-se das **Find-Professional / Find-Performance** (informação, calendário, formulários conforme referência SL).
4. No SL, **Projeto** deve ser tratado em **copy/UX como “Formação Artística”** nesta fase (**sem mudança de rotas** no SL ainda — só Olinket pode ajustar copy interna se aplicável).
5. **Dois tipos de calendário/agenda:**  
   - **Agenda de Tarefas** — compromissos/atividades do dia a dia (Olinket e SL).  
   - **Calendário de Eventos** — aquilo que foi **contratado** / evento de negócio; **deve refletir em todos os calendários de eventos das partes envolvidas**.  
   Comportamento durante negociação: **paridade com o comportamento atual do SL** (estados a documentar).

---

## CRM e nomenclatura (cross-produto)

- Na Olinket, o Contratante gere **Profissional** no contexto do **Evento**.
- No SL, o Profissional gere **Cliente** no contexto da **Formação Artística** (projeto).
- **Contratante** no SL ≈ entidade do “cliente” vista pelo profissional em CRM; aberto a UI **Contratante (SL) / Contratado (Olinket)** desde que claro.  
**Regra técnica:** nomes **neutros na API** exposta/contratos internos; **copy e glossário na UI** (decisão: UI desacoplada de nomes de domínio em payload).

---

## Rotas e identidade de conta

- **Eliminar rotas PT** como canónicas na área contratante; **migrar para padrão literal do SL** (segmentos em inglês, mesma árvore que `contractor-individual` / equivalente empresarial no SL) — **redirect** do legado PT durante transição se necessário.
- **Logins separados** Individual vs Empresarial (**tipos de conta distintos**, telas e capacidades distintas).
- **Mesmo e-mail não pode** registar os dois tipos. Mensagem e fluxo: alertar **não usar e-mail empresarial para conta Individual** quando isso implicar colisão; ao **aceitar convite Empresarial** com e-mail já usado na Individual, o utilizador **perde acesso Individual** salvo **mudança prévia de e-mail** com **todo o processo de segurança**. (Validar copy/legal antes de implementar “perda de acesso”.)
- **Dashboard:** pode chamar-se Dashboard em ambos, mas **conteúdo distinto** por tipo de contratante.

---

## Profissionais e domínio

- Profissional **não** deve depender de links para “home contratante”; no **cadastro**, se escolher Profissional: escolha de **workspace**, **cards** explicativos ou **formulário com opções pré-definidas** que **deterministicamente** encaminham ao workspace certo; **sem fila humana no MVP**.
- Se sessão profissional aceder à **`/`** da Olinket: página **intermediária** (“és profissional → continuar para o workspace”) com CTA.

**DNS:** ecossistema sob **Olinket**; workspaces em **subdomínios** `{workspace}.olinket.{tld}`. **SoundLink** exemplo: **`soundlink.olinket.com`** (slug `soundlink`).

---

## Empresarial (MVP administrativo)

- Contratante Empresarial com **área administrativa** ao estilo SL **Permissões/Membros**: **convites**, **cargos/papéis**, **permissões granulares** (ver vs editar). Primeiro utilizador com copy de **administrador principal / representação**.

---

## Descoberta e nomenclatura

- Refazer **descobrir** em linha com padrões **Find-Professional / Find-Performance** onde aplicável.
- **Novas** superfícies usar **Profissional** (não Prestador) em paths e copy alinhado ao glossário.

---

## Documentação

- Estados do **Calendário de Eventos** (paridade SL vs Olinket): **fonte em `matriz-telas.md`** — tabela estado SL ↔ Olinket ↔ regra.

---

## Pedido base

Produzir **plano executável** (`.plan.md` ou estrutura do repo) para o **escopo específico** abaixo, com **fases**, **dependências**, **rotas/arquivos-chave**, **gates** (testes, `npm run lint:headers` se tocar headers, E2E quando aplicável). Assinalar **[PLANEJADO]** onde faltar BFF/API. **PT-BR** em UI e docs.

---

## Escopo específico — **Plano 6**: cadastro Profissional + raiz `/` (intermediário) + modelo DNS

**Objetivo:**  
1. Cadastro **Profissional**: cards de workspaces + formulário **opções fechadas** → **`https://{slug}.olinket.{tld}`** (ex.: `soundlink.olinket.com`).  
2. Utilizador **Profissional** na **raiz** (`/`) da Olinket: página **intermediária** + CTA para o workspace adequado.  
3. Documentar no template **`{workspace}.olinket.{tld}`** (variáveis, links absolutos, ambiente dev com mocks se preciso).

**Critérios:** jornada profissional **sem** dependência da home contratante; fallback determinístico se ramo do formulário não tiver URL (ex.: lista/cards já previstos nas decisões).
```

---

## Plano 7 — Integração Olinket ↔ Workspace (proposta / contrato)

```markdown
## Contexto para planos (Olinket template + referência SoundLink)

Sou o repositório **olinket-template-frontend**. Preciso de **planos de trabalho executáveis** alinhados às decisões abaixo (produto + UX + rotas + domínio). Referência de código: clone **soundlink-template-frontend** (branch `main`). Documentos já existentes no Olinket: **auditoria-paridade-P0**, **matriz-telas.md**, **ADR-001**, **matriz-reuso-soundlink-olinket.md**, glossário Olinket.

---

## Princípios fixos

1. **SoundLink** (e futuros workspaces, ex. VisualLink) são a **base operacional** para **Profissionais**. **Olinket** é o **ponto de concentração do Contratante** (**Individual** e **Empresarial**).
2. Ambição: **paridade de tela** onde fizer sentido e **integração ponta a ponta** (ex.: proposta enviada na Olinket **chega** no fluxo do workspace); a **UX da Olinket pode diferir** desde que estrutura e dados conversem com o SL.
3. Páginas completas de **Profissional** devem aproximar-se das **Find-Professional / Find-Performance** (informação, calendário, formulários conforme referência SL).
4. No SL, **Projeto** deve ser tratado em **copy/UX como “Formação Artística”** nesta fase (**sem mudança de rotas** no SL ainda — só Olinket pode ajustar copy interna se aplicável).
5. **Dois tipos de calendário/agenda:**  
   - **Agenda de Tarefas** — compromissos/atividades do dia a dia (Olinket e SL).  
   - **Calendário de Eventos** — aquilo que foi **contratado** / evento de negócio; **deve refletir em todos os calendários de eventos das partes envolvidas**.  
   Comportamento durante negociação: **paridade com o comportamento atual do SL** (estados a documentar).

---

## CRM e nomenclatura (cross-produto)

- Na Olinket, o Contratante gere **Profissional** no contexto do **Evento**.
- No SL, o Profissional gere **Cliente** no contexto da **Formação Artística** (projeto).
- **Contratante** no SL ≈ entidade do “cliente” vista pelo profissional em CRM; aberto a UI **Contratante (SL) / Contratado (Olinket)** desde que claro.  
**Regra técnica:** nomes **neutros na API** exposta/contratos internos; **copy e glossário na UI** (decisão: UI desacoplada de nomes de domínio em payload).

---

## Rotas e identidade de conta

- **Eliminar rotas PT** como canónicas na área contratante; **migrar para padrão literal do SL** (segmentos em inglês, mesma árvore que `contractor-individual` / equivalente empresarial no SL) — **redirect** do legado PT durante transição se necessário.
- **Logins separados** Individual vs Empresarial (**tipos de conta distintos**, telas e capacidades distintas).
- **Mesmo e-mail não pode** registar os dois tipos. Mensagem e fluxo: alertar **não usar e-mail empresarial para conta Individual** quando isso implicar colisão; ao **aceitar convite Empresarial** com e-mail já usado na Individual, o utilizador **perde acesso Individual** salvo **mudança prévia de e-mail** com **todo o processo de segurança**. (Validar copy/legal antes de implementar “perda de acesso”.)
- **Dashboard:** pode chamar-se Dashboard em ambos, mas **conteúdo distinto** por tipo de contratante.

---

## Profissionais e domínio

- Profissional **não** deve depender de links para “home contratante”; no **cadastro**, se escolher Profissional: escolha de **workspace**, **cards** explicativos ou **formulário com opções pré-definidas** que **deterministicamente** encaminham ao workspace certo; **sem fila humana no MVP**.
- Se sessão profissional aceder à **`/`** da Olinket: página **intermediária** (“és profissional → continuar para o workspace”) com CTA.

**DNS:** ecossistema sob **Olinket**; workspaces em **subdomínios** `{workspace}.olinket.{tld}`. **SoundLink** exemplo: **`soundlink.olinket.com`** (slug `soundlink`).

---

## Empresarial (MVP administrativo)

- Contratante Empresarial com **área administrativa** ao estilo SL **Permissões/Membros**: **convites**, **cargos/papéis**, **permissões granulares** (ver vs editar). Primeiro utilizador com copy de **administrador principal / representação**.

---

## Descoberta e nomenclatura

- Refazer **descobrir** em linha com padrões **Find-Professional / Find-Performance** onde aplicável.
- **Novas** superfícies usar **Profissional** (não Prestador) em paths e copy alinhado ao glossário.

---

## Documentação

- Estados do **Calendário de Eventos** (paridade SL vs Olinket): **fonte em `matriz-telas.md`** — tabela estado SL ↔ Olinket ↔ regra.

---

## Pedido base

Produzir **plano executável** (`.plan.md` ou estrutura do repo) para o **escopo específico** abaixo, com **fases**, **dependências**, **rotas/arquivos-chave**, **gates** (testes, `npm run lint:headers` se tocar headers, E2E quando aplicável). Assinalar **[PLANEJADO]** onde faltar BFF/API. **PT-BR** em UI e docs.

---

## Escopo específico — **Plano 7** (**por último** ou iniciar só por especificação): integração ponta a ponta Olinket ↔ Workspace

**Objetivo:** Especificar e, quando API existir, implementar pipelines em que acções na Olinket (proposta, aceite, contrato) **sincronizam** com o workspace do profissional (notificações, calendário de eventos, mensagens). Sem BFF: **contratos TypeScript**, **eventos de domínio**, demos marcadas **[DEMO]** / local.

**Entregáveis:** spec de eventos; pontos de extensão no código; ADR ou anexo se alterar limites do template.

**Critérios:** pelo menos um fluxo E2E de **simulação** «criado Olinket → visível/atribuído no WS» OU contrato de backend acordado; sem misturar dados locais como se fossem prod sem rótulo.
```
