---
name: Olinket — Fecho de paridade UX, descoberta e rotas em aberto
overview: "Plano alinhado às rodadas 1–3 + decisão corporativo: na **Olinket** só **Contratante Individual** e **Contratante Empresarial**; **Contratante Corporativo** (`CORPORATE_HIRER` / produtor–fornecedor) fica no **Workspace** (ex.: produtores de eventos) com **Linket** para ser contratado — §11.8, §12.1; sem troca de perfil na Olinket — §11.2. Descobrir, home, notificações, SLC, login em camadas §11.6–11.7; matriz/ADR a reconciliar."
todos:
  - id: decidir-escopo-nav
    content: "Rodada 1: agregadores + conversas (§8.1)."
    status: completed
  - id: decidir-profissional-olinket
    content: "Rodada 1: profissional só no Workspace; ofertas na home (§8.3)."
    status: completed
  - id: decidir-descobrir-vs-soundlink
    content: "Rodada 1+2: Descobrir; home recorte; ranking e regras (§8.4, §11.4)."
    status: completed
  - id: decidir-formulario-evento
    content: "Rodada 1+2: evento o mais completo possível; visão ciclo completo, não MVP (§11.5)."
    status: completed
  - id: rota-kernel
    content: "Rodada 1: sem /olinket/kernel (§8.6)."
    status: completed
  - id: rodada2-paridade-essencial
    content: "Rodada 2: paridade ‘o essencial comum’ + calendário/tarefas; sem repertório como produto; notificações detalhadas; contrato idêntico; cliente↔papel (§11)."
    status: completed
  - id: fechar-corporativo-e-slc
    content: Corporativo no Workspace + Linket; Olinket só Individual+Empresarial (§11.8). SLC fechado (§11.6 / §14.2).
    status: completed
  - id: alinhar-matriz-com-decisoes
    content: Reconciliar matriz-ecras, visão, ADR-001 com §11.8 — feito 2026-04-24.
    status: completed
  - id: dividir-planos-build-ready-paridade
    content: Plano decomposto em PBR-01…07 + índice (2026-04-24) — ver §15 e olinket-paridade-indice-planos-build-ready.plan.md.
    status: completed
  - id: especificar-dois-contratantes-olinket
    content: Implementar cadastro/header só Individual+Empresarial na Olinket; ligações ao Workspace (§11.8); **sem** troca de perfil — **execução:** PBR-01.
    status: completed
  - id: especificar-agregadores-e-notificacoes
    content: Agregadores + notificações (§11.1, §11.6 / §12.4) — **execução:** PBR-02 + PBR-03.
    status: pending
  - id: especificar-avaliacoes-e-ia-home
    content: "Regras de destaque: cadastros completos, avaliações, localização/IA; sem anúncio pago (§11.4); camadas login/SEO fechadas em §11.7."
    status: completed
  - id: atualizar-docs-pos-decisao
    content: Ciclo SDD 2026-04-28 — jornada, visão, matriz, excertos C2/C3, referência UX e planos filhos PBR-01/PBR-04 alinhados ao código; rever após PBR-05/06/07.
    status: completed
isProject: true
---

# Plano — Fecho de paridade UX, descoberta e o que ainda falta (Olinket ↔ SoundLink)

> **Liga a:** [matriz-ecras-soundlink-olinket.md](../docs/planejamento/matriz-ecras-soundlink-olinket.md), [visao-olinket-soundlink-paridade-e-proximo-plano.md](../docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md), [referencia-soundlink-template-frontend-ux.md](../docs/planejamento/referencia-soundlink-template-frontend-ux.md), [jornada-contratante-mvp.md](../docs/planejamento/jornada-contratante-mvp.md), [negociacao-olinket-corte-5.md](../docs/planejamento/negociacao-olinket-corte-5.md).

**Público deste plano:** equipe de produto, negócio e desenho de jornada.

**Estado do código e docs (2026-04-28):** **PBR-01** (cadastro/header) e **PBR-04** (home recorte “Comece por aqui”, `/descobrir`, SEO, gate §11.7 na ficha) estão **documentados** nas matrizes e excertos listados no **§16** (fim deste documento). **PBR-05** — formulário de evento SLC (Zod, passo «Disponibilidade e período», `buildEventFromInput` completo vs `CreateEventInput`, fragmento em `docs/planejamento/`) está **implementado neste repo** conforme plano-filho. **PBR-02** — rotas agregadoras `/conta/mensagens`, `/conta/contratos`, `/conta/pagamentos`, assistente de contratos stub, repositórios locais e smoke E2E — está **implementado** (fragmento `docs/planejamento/fragmento-pbr02-agregadores-globais.md`). **PBR-03** — centro de notificações (sino, `/conta/notificacoes`, abas por origem, `localStorage`) — está **implementado** (`docs/planejamento/fragmento-pbr03-notificacoes-centro.md`). **PBR-06** — agenda `/conta/agenda` (calendário + tarefas locais; fragmento `docs/planejamento/fragmento-pbr06-agenda-calendario-tarefas.md`) — está **implementado**. **PBR-07** — domínio evento/projeto/carrinho e permissões (pendência plano §12) está **documentado**: [`docs/planejamento/pbr07-especificacao-dominio-permissoes.md`](../../docs/planejamento/pbr07-especificacao-dominio-permissoes.md); implementação **BFF/backend** continua nos repositórios correspondentes quando existirem — ver §5 da especificação e [índice](./olinket-paridade-indice-planos-build-ready.plan.md).
---

## 1. Objetivo

Definir, com critério único, **o que a Olinket oferece** ao contratante e visitante em **paridade** com a SoundLink no que for **comum e essencial à interação**, e **o que fica** só no Workspace — incluindo **Contratante Corporativo** como perfil de **workspace** (oferta via Linket), não como terceiro tipo de conta **no hub** Olinket (§11.8).

---

## 2. Princípios (rodadas 1 e 2)

- O **evento** continua o centro do contratante; **Mensagens / Contratos / Pagamentos** têm **agregador global** e **contexto de evento** (e, para mensagens, também **por cliente** no espírito do CRM).
- **Profissional** opera no **Workspace**; entrada “sou profissional” **redireciona** à home do Workspace. Na Olinket permanecem **descoberta** e **ficha pública** de oferta, **sem** repertório como **feature** de produto (apenas dado informativo **dentro do evento** quando fizer sentido, como referência **página individual de evento** na SoundLink).
- **”Tudo” na Olinket** = **o que for de uso comum e essencial** para **ambos lados** interagirem, **não** a cópia de tudo o que o músico tem no Workspace (ver §11.1). **Repertório: não.**
- **Calendário de eventos** e **agenda de tarefas** são **úteis para o contratante** na Olinket (âmbito a detalhar na especificação).
- **find-connections** e **find-events** **não** são rotas Olinket (Workspaces) — inalterado (§8.4).
- **Entrega:** **não** se trabalha com visão de MVP mínima; a entrega alinha-se a **SLC** (**Simple, Lovable, Complete** — §11.6, §14.2). O desenho pode partir em **vários planos**; **o que não importa na decisão** é o tempo, **e sim** a **completude** das opções **relevantes** para o evento.

---

## 3. Faixas de trabalho

| Faixa | O quê | Critério de “feito” |
|--------|--------|----------------------|
| **A — Agregadores** | Mensagens, Contratos, Pagamentos globais + uso no evento. | Especificação aprovada; criadora de contratos **alinhada** à SoundLink (passos e blocos), **UI** Olinket (§11.3). |
| **B — Descobrir e home** | **Descobrir** = lista rica/“imensa” ao longo do tempo; **home** = **recorte** (§11.4). | Regras de recorte, avaliação e localização/IA **documentadas**; reforço: **nunca** colocação paga, **sempre** por **avaliações** (e evolução do critério). |
| **C — Evento** | Formulário **o mais completo possível** para a intenção; dados de apoio (ex. conteúdo informativo, sem “produto repertório”). | Especificação de campos e validações. |
| **D — Contratantes na Olinket** | **Dois** tipos no hub: **Individual** e **Empresarial** (cadastro, header). **Sem troca de perfil** na Olinket (diferente da rodada 2 §11.2 original); **Contratante Corporativo** não como tier Olinket — ver §11.8. | Spec de cadastro e journeys; deep links / contratos com produtores no Workspace quando aplicável. |
| **E — Notificações** | **Sino** no header → **página** com todas as notificações, **separadas por agrupamentos** (estrutura por **abas**), cada agrupamento refletindo **origem** (STEC, evento, pessoa, etc.). | Wireframe de informação aprovado. |
| **F — Calendário e tarefas** (contratante) | Incluir no desenho da Olinket (§11.1). | Detalhar com engenharia: ligação ao evento, lembretes, etc. |
| **G — Documentação** | Matriz, jornada, ADR, referência. | Sincronizado com §8–11 e fechamento §12. |

---

## 4. Riscos

- **Risco A — Perfil corporativo** (**mitigado por decisão §11.8**): quem **compra e vende** produção/serviço corporativo opera no **Workspace + Linket**; a Olinket não duplica esse papel como terceiro tipo de conta.
- **Risco B — “Cadastro completo”** e **avaliação** definem o ranque: sem política de fraude, privacidade e explicabilidade, **a IA por local** pode gerar litígio ou desconfiança.
- **Risco C — Paridade de contrato “idêntica”:** dependência de **duas** UIs e um **mesmo** modelo de passos; risco de fork se não houver **pacote** ou spec **compartilhada** (monorepo / contrato de domínio).

---

## 5. Entregáveis

1. ~~Fechamento da rodada 3 (§12) para corporativo~~ — **§12.1 fechada** (§11.8); SLC e (opcional) governança de avaliação/IA em §11.6–11.7 / §14.2.
2. Atualização de **matriz**, **jornada**, **referência SoundLink** e **ADR**.
3. Decomposição em **subplanos** (ciclo completo) **sem** cortar requisito por falsa economia de escopo de produto; cadência = decisão de projeto, não de **“menos pães”** no desenho.

---

## 6. Referência SoundLink

(mantida — ver tabela no histórico do repositório; reforçar `public-project-details` para dado in-evento, não feature de repertório global.)

---

## 7. Questionário original (histórico)

Respostas integradas em §8 e §11.

---

## 8. Respostas consolidadas — rodada 1 (2026-04-24)

### 8.1 Mensagens, Contratos e Pagamentos (7.1a–7.1c)

- **Mensagens:** na SoundLink há divisão por natureza de usuário (internos vs externos); na Olinket há **apenas contratante**, então a feature **Mensagens** funciona como **agregador** de todas as conversas. Os chats podem nascer **dentro de cada evento** (e em outros fluxos, ex.: por cliente, no espírito de “Relacionamento com Clientes”); a conversa deve **também** aparecer na visão agregada de Mensagens — o mesmo fio pode ser lido no processo do evento e na caixa agregada.
- **Contratos e pagamentos:** mesma lógica — **features agregadoras** para registro, armazenamento e busca central; o evento continua sendo onde se usam as informações **daquele** trabalho.
- **Contratos (criação):** nem a Olinket nem os Workspaces fornecem contrato pronto; **usuários criam** os próprios modelos e usam nas negociações (alinhado à SoundLink: criadora de contratos no produto, conteúdo jurídico é do usuário).

### 8.2 Perfil do contratante (7.2 e 7.2b)

- **Sim:** o contratante precisa de **ficha completa** para criar eventos e para o prestador saber **com quem** está falando.
- **Tipos no hub Olinket** (cadastro define tipo e **altera header e opções**):
  - **Contratante individual** — pessoa física (ex.: casamento, quem ainda não sabe bem o que procura).
  - **Contratante empresarial** — pessoa jurídica (ex.: bar, pub, restaurante contratando show no estabelecimento).
- **Contratante corporativo** (organização que **também** presta produção/serviços de evento e precisa de **Linket** para ser contratada): **não** como terceiro tipo de conta na Olinket — perfil **workspace** (ex.: produtores / rota `corporate-hirer` no template SoundLink), ver **§11.8**.
- **Referência técnica SoundLink:** `CONTRACTOR_INDIVIDUAL`, `CONTRACTOR_BUSINESS`, `CORPORATE_HIRER`; só os dois primeiros são âncoras de produto **Olinket-first** neste plano.

### 8.3 Profissional e Olinket (7.3)

- Cada profissional trabalha **apenas** no seu Workspace.
- Se o usuário entra na Olinket e se identifica como **Profissional**, escolhe a área e é **direcionado para a home do Workspace** — **não** realiza fluxo de trabalho na Olinket.
- Na **home da Olinket** devem aparecer as **ofertas dos profissionais** (vitrine/descoberta para quem visita como público ou contratante).

### 8.4 Descobrir e finds (7.4)

- **Descobrir** na Olinket corresponde ao que na SoundLink está em **find-performances** e **find-professionals** (uma página unificada neste produto).
- A **ficha interna** de cada profissional na Olinket deve ser **como** a página interna deles na SoundLink (paridade de experiência).
- **find-connections** e **find-events** **não** serão mostradas na Olinket: são **exclusivas dos Workspaces** (conexões internas vs eventos abertos para candidatura / rede).

### 8.5 Criação de evento (7.5)

- Deve conter **tudo o que for necessário** para caracterizar um evento; **quanto mais informação, melhor**.
- Objetivo explícito: reduzir a confusão do prestador sobre a **intenção** do contratante; a Olinket existe em parte para corrigir isso.

### 8.6 Núcleo / kernel (7.6)

- **Retirar** a linha de produto de demonstração de núcleo na Olinket.
- Manter a Olinket para **contratantes**; **profissionais** nos Workspaces separados.

### 8.7 Paridade ampla (ajustada pela rodada 2)

A exigência de **paridade** com a SoundLink na Olinket deve ser lida em conjunto com **§11.1** (“o essencial comum a **ambos** para **interagirem**”), **não** como clonagem de **todas** as features de músico (incl. **repertório** fora do evento).

---

## 9. Tensões com a documentação existente

| Tópico | Estado pós-rodada 2 |
|--------|----------------------|
| “Tudo = SoundLink” | **Fechado** no sentido **comum+essencial**; **repertório** fora; **repertório in-evento** informativo ok. **Calendário de eventos** e **agenda de tarefas** na Olinket **sim**; detalhe operacional a especificar. |
| find-events / find-connections | Mantém-se: **não** são páginas Olinket. |
| Contratante corporativo | **Fechado** — Workspace + Linket; não como tipo Olinket — §11.8. |
| Notificações | **Sino + página geral com abas por agrupamento** — alinhar com produto e compliance (STEC + negócio). |
| Home vs Descobrir | **Recorte** vs lista **crescente**; critério de evolução do destaque: **inscrições** completas** → **avaliações** → **relevância** com **local** (e IA). **Sem** pagamento por visibilidade. |

---

## 10. Perguntas — rodada 2 (arquivo: respondidas)

As perguntas antigas de §10 foram **respondidas** em §11 (onde aplicável) ou **substituídas** por **rodada 3** quando ainda há dúvida (corporativo, SLC, governança).

---

## 11. Respostas consolidadas — rodada 2 (2026-04-24)

*Correção de grafia do original: “peril” → perfil, “cadsatros” → cadastros, “tbm” → também.*

### 11.1 Paridade “tudo” e features comuns (antiga §10.1; parte da 8.7)

- **”Tudo”** significa o que for de **uso comum e essencial** para **ambas as partes** **interagirem**.
- **Inclui** no âmbito do **contratante** na Olinket: **calendário de eventos** e **agenda de tarefas** (úteis ao contratante; na SoundLink o contratante não tinha tudo isso ainda, mas o produto traz isso com **visão SLC** — ver §11.5).
- **Não** entra **Repertório** como **feature** de produto; apenas **informativo dentro do evento** (e **página individual do evento** como referência de espírito na SoundLink).
- **Notificações:** **sino** no **header**; ao abrir, **uma página** com **todas** as notificações, **separadas por agrupamentos**; estrutura sugerida: **sistema de abas**, cada agrupamento **referente** a notificações vindas de **algum lugar** (produto, tela) ou de **alguém** (origem clara).

### 11.2 Troca de perfil e corporativo (antiga §10.2 — **atualizado**)

- **Sem troca de perfil na Olinket** (decisão explícita do produto): o hub **não** replica o modelo SoundLink de alternar chapéus dentro da mesma app Olinket.
- **Contratante empresarial vs individual:** nuances do tipo **casar / uso PF sob conta PJ** passam a ser tratadas por **regra de produto** (segunda conta, convites, ou fluxo jurídico) — **a especificar**, não por toggle de perfil na Olinket.
- **Contratante corporativo:** ver **§11.8** (workspace + Linket; fora dos dois tipos Olinket).

### 11.3 “Cliente” e criadora de contratos (antiga §10.3)

- **Ponto de vista de produto:** quem no **contexto de um evento (Olinket)** figura como **“cliente”** do ponto de vista do processo = **lado do profissional** (i.e. o contratante atua no papel que o prestador enxerga como cliente de **aquele** trabalho). Quem, no **Workspace**, é “cliente” do **prestador** = o **contratante** (a relação inverte o nome conforme a lente).
- **Criadora de contratos** na Olinket: **idêntica** no que toca a **passos e blocos** (mesmo fluxo que na SoundLink); a **UI** **segue o design system** Olinket.

### 11.4 Home e Descobrir (antiga §10.4)

- A **home** não repetirá a **lista imensa** de **Descobrir**; mostrará um **recorte** (curadoria/destaques).
- A lista em **Descobrir** cresce com o tempo; **não** haverá **pagamento** **para** “subir” no feed — a **regra** principal é **sempre por avaliações**.
- **Inicialmente** o recorte (home) privilegia os **últimos** a concluir **cadastro** **completo**; **com o tempo** prevalecem os **mais bem avaliados** (e o refinamento desse critério é **documento** de produto).
- Com **tempo e dados**, entra **inteligência** para sugerir destaques **por** **local** do **usuário** (e, implicitamente, relevância além de só recência e nota).

### 11.5 Formulário de evento e visão de entrega (antiga §10.5)

- **Não** se trabalha com a lógica de “MVP enxuto” para decidir o **desenho**; a **visão** é de **ciclo completo** em formato **SLC** (definição fechada em §11.6 / §14.2).
- O objetivo é **tudo o que fizer** sentido, **completo** e **funcional**, **para uso do ciclo** integral.
- A **entrega** pode ser **dividida** em **vários planos**; **o tempo** de implementação **não** é o fator de corte no **o quê** incluir: o essencial é **máxima** de opções **relevantes** e **importantes** **para o evento**.

### 11.6 Respostas — rodada 3 (12.2, 12.3, 12.4 e esclarecimento 12.5)

- **12.2 — SLC:** a sigla é **Simple, Lovable, Complete** (não “ciclo de vida de software” no sentido de SDLC). **Simple** = claro, focado, sem excesso de escopo de uma vez; **Lovable** = pessoas **querem** usar (cuidado, prazer, confiança), em contraste com MVP muitas vezes percebido como “cru”; **Complete** = para a **promessa** escolhida, a experiência **fecha o ciclo** (não fica “meio produto” que depende de desculpas). Ver síntese e links em **§14.2** (público: Jason Cohen / *A Smart Bear*, *Your customers hate MVPs. Make a SLC instead.*).
- **12.3 — Home, Descobrir, recorte, local:** **Confirmado** — o recorte privilegia **últimos cadastros completos**; quantidade de cards **de 1 a 8** desde o início. **Inteligência** por local (cidade/estado); **visitante não cadastrado** não traz isso no perfil — **filtro básico** na **home** (ao lado ou acima dos cards) para aproximar destaques; ao ir a **Descobrir**, o estado do filtro **pode persistir** e **filtros avançados** aparecem. **Login na ficha profunda** e **SEO em listagens** — ver **§11.7** (fechamento **12.2** produto).
- **12.4 — Notificações:** leitura **obrigatória** no sentido de **não** ignorar a caixa, com ação de **“marcar como lido”**; controles **por aba** (categoria) — alinhado a “por agrupamento” na §11.1.
- **12.5 — O que era a pergunta (esclarecimento):** na rodada 2, **12.5** pedia **uma frase-limite para o time de vendas**: além de **já** excluir “pagar para estar no topo”, **que outra frase a equipa de vendas não pode dizer?** (evitar promessas legais/operacionais perigosas). Se **não** houver outro teto, pode registar-se explicitamente: *“O único limite explícito hoje é: sem posicionamento pago; demais regras a definir com jurídico/produto.”*

### 11.7 Resposta produto — login, SEO e paridade com SoundLink (12.2 **fechado**)

- **Sem login:** **cards** na **home** e página **Descobrir** (equivalente ao conteúdo que hoje estaria em **find-performances** + **find-professionals** no `soundlink-template-frontend`). Conteúdo **suficiente** para **busca** e **SEO** (metadados, snippets, compartilhamento de listagens).
- **Com login:** **página individual do profissional** — o que no SoundLink corresponderia à **página pública do projeto** (oferta completa, profundidade de contratação e intenção). Objetivo: reter **dados** e **intenção** do interessado antes de expor o detalhe completo.
- **Nota de alinhamento:** no clone SoundLink, `docs/gestao-ideias/04-referencia-tecnica/referencia/architecture/mapa-encaixe-hub-publico-interacoes-slug.md` fixa a **página pública do projeto** como **única verdade** de oferta + mídia + contratação; na Olinket a **decisão** é exigir **login** para essa profundidade (página **individual** do profissional), mantendo **home + Descobrir + cards** **públicos** para **SEO**. Isto **diverge** de **ADR-036** (finds no workspace com **sessão**): na Olinket, a **descoberta** pública reabre a entrada anônima; alinha a **intenção** de **ADR-035** (descoberta antes da conta) para o **hub** Olinket.

### 11.8 Decisão produto — Contratante Corporativo no Workspace (§12.1 **fechada**)

- **Ponto central:** quem **presta** produção/serviços de evento (além de poder contratar) precisa de **oferta contratável** → **Linket** no **Marketlink / Workspace**, não de uma terceira “conta contratante” isolada só na Olinket.
- **Olinket (hub):** permanecem **apenas** **Contratante Individual** e **Contratante Empresarial** como tipos de utilizador **do produto Olinket**.
- **Contratante Corporativo** no sentido SoundLink (`ProfileType.CORPORATE_HIRER`, rota `/corporate-hirer`, headers dedicados): perfil de **workspace**, no **mesmo** eixo que **produtores de eventos** (não dois produtos distintos — ver **§11.9** item 2); **alinhado a ADR-035** (prestador com Linket vs contratante leve na Olinket).
- **Implicação:** não há paridade “três contratantes na Olinket”; a matriz **Olinket ↔ SoundLink** deve documentar que o antigo **corporativo** = **jornada Workspace**, com ligações desde a Olinket (contratos, convites, URLs) quando o fluxo atravessa comprador → produtor.

### 11.9 Fechamento — Evento, cadastro e corporativo = produtores (2026-04-24)

1. **Evento:** no hub, define-se como **estrutura de contratações**; **Individual** e **Empresarial** **criam** evento; **Empresarial** pode ter estrutura interna maior (equipe / atividades); **Individual** faz contratações **diretas**. Fonte normativa: [ADR-001 §3.6](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md).

2. **Workspace:** o uso que antes era rotulado “Contratante Corporativo” no hub **compartilha** o **mesmo** workspace de **produtores de eventos** — não existe linha “corporate-hirer” à parte na Olinket; no SoundLink, rotas/`CORPORATE_HIRER` são legado até migração ([ADR-001 §3.5](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md)).

3. **Fluxo Individual → empresa produtora (esclarecimento da antiga §10 / “item 4”):** quando um comprador **Individual** na Olinket contrata uma **empresa produtora** cuja operação (propostas, equipe, entregáveis) vive sobretudo no **Workspace**, na Olinket permanecem sobretudo **estado do evento**, **mensagens por evento** (canônico ADR-002), **contrato/pagamento** quando existirem; o **usuário** pode ser **convidado** ou seguir **deep link** ao contexto correto no SoundLink conforme integração futura (**BFF/SSO**) — sem criar quarto tipo de conta “corporativo” na Olinket.

4. **Cadastro:** pergunta **Contratante Individual** vs **Empresarial**; Individual com opção **PF ou PJ**; Empresarial **só PJ** ([ADR-001 §3.7](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md)).

5. **Marketing / pricing / posicionamento** detalhado: mantém-se nos **ADRs SoundLink**; esta rodada **não** duplica regra comercial aqui.

6. **ADRs Olinket atualizados nesta rodada:** [ADR-001](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md) §3.5–§3.8; referências nos [ADR-002](../docs/gestao-ideias/00-governanca/decisoes/adr-002-mensagens-canal-canonico.md), [ADR-003](../docs/gestao-ideias/00-governanca/decisoes/adr-003-estrategia-pacotes-cross-repo.md), [ADR-004](../docs/gestao-ideias/00-governanca/decisoes/adr-004-mocks-partilhados-cross-repo.md).

7. **Registro da narrativa oral (usuário)** — texto canônico na fonte **[ADR-001 §3.8](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md)** (acompanhar pedido sempre pela Olinket; Workspace para produtora e cada profissional; vários elos num evento visíveis na Olinket; delegação de contratação ao produtor no Workspace; contraste Linket vs conta leve).

### 11.10 Jornada Olinket vs Workspace (espelho do ADR-001 §3.8)

- **Contratante (Individual ou Empresarial):** pedido/evento seguidos **pela Olinket** (sem vitrine Linket como prestador — **ADR-001 §2**).
- **Produtora e profissionais:** operação principal no **Workspace** (Linket, oferta, back-office).
- **Vários vínculos no mesmo evento:** o contratante **vê**, na Olinket, cada elo que faz parte das **contratações** daquele evento (**§3.6**).
- **Delegação:** quem faz a ponta com fornecedor (ex.: músico só pela produtora) faz no **Workspace** da produtora (e no do músico); a Olinket reflete o **quadro** do evento segundo regras e integrações.
- **Fonte normativa:** [ADR-001 §3.8](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md).

---

## 12. Pendências após decisão §11.8 (não são bloqueios de princípio)

1. Detalhar **regras de evento vs projeto vs carrinho** (produto) e rever **matriz de permissões** no backend relativamente ao template SoundLink legado — **fora do âmbito** deste plano como lista fechada.
2. ~~Atualizar copy e ADR-001 / matriz-ecras~~ — **feito** (2026-04-24): [matriz-ecras-soundlink-olinket.md](../docs/planejamento/matriz-ecras-soundlink-olinket.md), [jornada-contratante-mvp.md](../docs/planejamento/jornada-contratante-mvp.md), [visao-olinket-soundlink-paridade-e-proximo-plano.md](../docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md), [ADR-001 §3.5–§3.8](../docs/gestao-ideias/00-governanca/decisoes/adr-001-olinket-template-frontend-prestador-contratante.md)).

*(A secção histórica “§12.1 aberta” sobre corporativo foi **substituída** por §11.8.)*

---

## 13. Próximo passo operacional

1. ~~Responder §12.1~~ — **feito** em §11.8.
2. ~~Atualizar matriz, jornada, visão, ADR~~ — ver §12 item 2 e ADR-001 §3.5–§3.8. Pendente quando existir nova rodada: **SLC** em docs de visão, **notificações** (abas / marcar lido), critérios home/descobrir por sprint.
3. Abrir **subplanos** por macrodomínio, em linha com **SLC** (cada entrega: simples no recorte, amável na UX, completa no fluxo do recorte escolhido).

---

## 14. Pesquisa de apoio (SoundLink repositório + mercado + SLC)

### 14.1 Contratante corporativo — o que o **este** repositório documenta (SoundLink)

- No inventário [referencia-soundlink-template-frontend-ux.md](../docs/planejamento/referencia-soundlink-template-frontend-ux.md) **só** aparece, como nav de referência, o **contratante individual**: `ContractorIndividualHeader`, `CONTRACTOR_INDIVIDUAL_NAV_ITEMS`, `from=contractor-individual`, base típica `/contractor-individual`. *(No **clone** SoundLink existem também `contractor-business` e `corporate-hirer` — ver §14.1c; reconciliar o inventário local quando possível.)*
- **Conclusão (repo Olinket):** documentação cita sobre **nav** o contratante **individual**; o resto depende do clone — ver **§14.1c** (pesquisa feita no path `D:\SoundLink\Projetos\soundlink-template-frontend`: ADRs, user-flows, planos; **Empresarial** mapeia a `contractor-business`, não rótulo “corporativo” literal).

### 14.1b Mercado e linguagem (internet — leitura geral, não conselho jurídico)

- Em eventos e compras **B2B**, o **comprador** costuma ser a **empresa/instituição** com processo (orçamento, **vários** decisores — compras, marketing, operações, jurídico), **ticket** mais alto, **ciclos** mais longos e **KPI/ROI** (ver discussões gerais em conteúdos de *eventos corporativos* e *vendas B2B*).
- **Decisão consolidada (§11.8):** entidade no papel **“Contratante Corporativo”** (compra **e** oferta de produção/serviço com **Linket**) → **Workspace**, não como terceiro tipo no hub Olinket. **Individual** e **Empresarial** permanecem como âncoras **Olinket**.

### 14.1c Pesquisa no clone `D:\SoundLink\Projetos\soundlink-template-frontend` (docs + ADRs)

*Pesquisa em 2026-04-24 neste caminho local; citar paths relativos ao clone.*

| Fonte | O que diz para **perfis / contratante** |
|--------|----------------------------------------|
| **ADR-035** (`docs/.../adr-035-olinket-template-frontend-prestador-contratante.md`) | **Prestador** = Workspace + **Linket**; **contratante** = **Olinket**, **sem** página estilo Linket, conta **leve**. **Revogado** texto antigo sobre “evolução” para prestador na **mesma** âncora — ver **ADR-001 §2.1** (2026-04-24). |
| **ADR-036** (`adr-036-soundlink-workspace-busca-e-home.md`) | SoundLink = **workspace**; buscas em `/app/search/find-*` **exigem sessão**; contratação com proposta/pagamento na **Olinket**; finds com vocabulário **rede/inspiração**, não “contratar aqui”. |
| **mapa-encaixe-hub-publico-interacoes-slug.md** | **Projeto musical** é o que se contrata; **página pública do projeto** = oferta + mídia + fluxo de orçamento; anônimo pode **cair** em registo ao enviar orçamento. *(A Olinket escolhe login **antes** da página **profunda** — ver §11.7.)* |
| **fe-find-performances-user-flow.md** | Personas explícitas: **Contratante Individual** e **Contratantes Empresariais** (eventos corporativos); **mesma** página para visitantes. |
| **Rotas / planos** em `plans-local-templates` | **Contratante Individual** ≈ `/contractor-individual/`; **Contratante Empresarial** ≈ `/contractor-business/` (dashboard, perfil, métricas). |
| **`CORPORATE_HIRER` / `/corporate-hirer`** | **Contratante Corporativo** no UI (`profile-management-content.utils.ts`); **sem** role `prestador` na matriz derivada **vs** Empresarial com `prestador` — decisão Olinket: **hub** só Individual+Empresarial; **corporativo** como **workspace** + Linket (**§11.8**). |

**§12.1 (fechada):** ver **§11.8**. O clone já tinha **três** tipos no código; o produto Olinket **absorve dois** no hub e desloca **corporativo** para **workspace**.

### 14.2 SLC — *Simple, Lovable, Complete* (internet)

- O conceito é amplamente atribuído a **Jason Cohen** (post **“S.L.C. — Slick is the new M.V.P”** / *A Smart Bear*; texto longo: [longform.asmartbear.com/slc](https://longform.asmartbear.com/slc/)). Pronúncia em inglês: **“slick”** (como o adjetivo). **Simple** = escopo pequeno o suficiente para dominar. **Lovable** = as pessoas **gostam** de usar; **não** é suficiente “funciona mas é desconfortável”. **Complete** = para o problema prometido, a solução **cumpre** o trabalho; critica o MVP clássico de ser **voluntariamente** “inacabado” e **pouco** digno de orgulho. Artigos de apoio (resumo): [helio](https://helio.app/product-discovery/minimum-viable-product-alternatives/slc/), [Hubtree](https://www.hubtree.ventures/post/simple-lovable-complete-slc-products-a-comprehensive-overview). **Ligação com IA:** **usuários** têm **menos paciência** para produtos que parecem rascunho; SLC puxa para **clareza + confiança** no primeiro contato, alinhado ao vosso posicionamento.

## 15. Plano-mãe — completude e planos filhos build-ready (2026-04-24)

**Completude:** as **decisões** e a **documentação** (matriz, visão, ADR-001 até §3.8, jornada) estão **fechadas** para o âmbito estratégico. O plano **não** está completo no sentido de **execução**: implementação e specs detalhadas seguem nos planos filhos; pendências explícitas continuam em **§12**.

**Índice dos planos derivados** (`isProject: true` salvo o índice): [olinket-paridade-indice-planos-build-ready.plan.md](./olinket-paridade-indice-planos-build-ready.plan.md).

| ID | Ficheiro |
|----|----------|
| PBR-01 | [olinket_pbr01_contratantes_hub_cadastro_header.plan.md](./olinket_pbr01_contratantes_hub_cadastro_header.plan.md) |
| PBR-02 | [olinket_pbr02_agregadores_global_evento.plan.md](./olinket_pbr02_agregadores_global_evento.plan.md) |
| PBR-03 | [olinket_pbr03_notificacoes_centro.plan.md](./olinket_pbr03_notificacoes_centro.plan.md) |
| PBR-04 | [olinket_pbr04_home_descobrir_seo_login.plan.md](./olinket_pbr04_home_descobrir_seo_login.plan.md) |
| PBR-05 | [olinket_pbr05_evento_formulario_slc.plan.md](./olinket_pbr05_evento_formulario_slc.plan.md) |
| PBR-06 | [olinket_pbr06_calendario_tarefas_contratante.plan.md](./olinket_pbr06_calendario_tarefas_contratante.plan.md) |
| PBR-07 | [olinket_pbr07_dominio_evento_projeto_carrinho_backend.plan.md](./olinket_pbr07_dominio_evento_projeto_carrinho_backend.plan.md) |

**Ordem de execução dos filhos:** está definida só no **[índice](./olinket-paridade-indice-planos-build-ready.plan.md)** (PBR-01 → PBR-04 ↔ PBR-05 → PBR-02 → PBR-03 → PBR-06 → PBR-07); **não** seguir a ordem numérica PBR-01…PBR-07 da tabela acima como se fosse roadmap.

Os TODOs do frontmatter deste ficheiro foram **parcialmente superseded**: `especificar-dois-contratantes-olinket` → **PBR-01**; `especificar-agregadores-e-notificacoes` → **PBR-02** + **PBR-03** — fechados no código (2026-04-28); manter apenas se ainda houver follow-up de produto.

---

## 16. Fecho do ciclo SDD — alinhamento documentação ↔ código (2026-04-28)

**Âmbito deste fecho:** trabalho já entregue no template sob **PBR-01** e **PBR-04** + decisões estratégicas já estabilizadas nas §8–§11 deste documento.

| Artefacto | O que foi sincronizado |
|-----------|-------------------------|
| [jornada-contratante-mvp.md](../docs/planejamento/jornada-contratante-mvp.md) | Rotas `/`, `/descobrir`, `/descobrir/[slug]` e papel do recorte na home vs lista completa. |
| [visao-olinket-soundlink-paridade-e-proximo-plano.md](../docs/planejamento/visao-olinket-soundlink-paridade-e-proximo-plano.md) | Tabela §2 — linha **Comece por aqui**. |
| [matriz-ecras-soundlink-olinket.md](../docs/planejamento/matriz-ecras-soundlink-olinket.md) | Nota §1 (recorte home); linha **3.35** (ficha pública + gate). |
| [home-olinket-corte-2.md](../docs/planejamento/home-olinket-corte-2.md) | §1.1 recorte “Comece por aqui”; contrato `SearchInputHero` (`localeFilter`, ids). |
| [detalhe-olinket-corte-3.md](../docs/planejamento/detalhe-olinket-corte-3.md) | §3.5 login em camadas + SEO. |
| [referencia-soundlink-template-frontend-ux.md](../docs/planejamento/referencia-soundlink-template-frontend-ux.md) | §4.1 bullet visitante §11.7. |

**Pasta `docs/gestao-tarefas/03-especificacao-produto/`:** **não** será espelhada neste repositório — a especificação canónica será mantida num **repositório centralizador** (modelo análogo ao submodule `.cursor`), em preparação. Enquanto isso, **`docs/planejamento/`** e fragmentos (ex.: [fragmento PBR-05](../docs/planejamento/fragmento-pbr05-campos-evento-formulario.md)) servem de registro local.

**Completação (sentido estrito):** desenho + docs para **PBR-01/PBR-04** estão **fechados**; **PBR-05**, **PBR-02**, **PBR-03** e **PBR-06** estão **feitos no código** ao nível SLC/planos-filho. **PBR-07** segue em roadmap quando especificação/backend (índice + TODOs).

**Risco conjunto futuro:** alterações ao **contrato de URL da busca** ou ao **modelo de sessão/auth** exigem rever **excertos C2/C3**, **detalhe** e **ADR-001** coordenados.

---

*Última atualização: 2026-04-28 — **§16** fecho SDD PBR-01/PBR-04; **PBR-05** SLC + **PBR-02** agregadores + **PBR-03** notificações + **PBR-06** agenda (fragmentos em `docs/planejamento/`) implementados; spec canónica em repo centralizador em preparação (ver §16 texto sobre `gestao-tarefas`).*
