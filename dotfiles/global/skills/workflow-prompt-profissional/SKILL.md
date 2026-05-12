---
name: workflow-prompt-profissional
description: Pipeline Brainstorm → Brief → prompt mestre. Na fase Brainstorm, lê código e documentos do repositório (com paths ou exploração guiada), sintetiza fatos e lacunas, faz perguntas; só depois consolida o Brief (checklist + «Entendi assim») e, opcionalmente, o bloco «prompt mestre» copiável. Use quando o objetivo ainda for ambíguo, quando quiser evitar má interpretação, ou quando precisar refinar instruções para outra IA com contexto do projeto.
---

# workflow-prompt-profissional

Processo repetível em **três camadas**, do mais aberto ao mais executável:

| Camada | Nome | Propósito |
|--------|------|-----------|
| **1** | **Brainstorm (descoberta)** | Alinhar realidade (código + docs) com intenção; reduzir interpretações erradas **antes** de comprometer um Brief. |
| **2** | **Brief** | Consolidar requisitos com checklist e confirmação («Entendi assim»). |
| **3** | **Prompt mestre** | Um único bloco copiável para outra sessão, modelo ou ferramenta. |

**Ordem padrão:** quando houver dúvida sobre o que o repositório faz, sobre escopo ou sobre termos do domínio, **começar pela camada 1**. Se o pedido já for pontual e totalmente especificado (ex.: «tom formal, 200 palavras, audiência técnica»), pode-se ir direto à **camada 2** com o acordo do usuário.

## O que não é

- **Não** substitui [`planejamento-criador`](../../agents/planejamento-criador.md) (planos de trabalho `.plan.md` no repositório).
- **Não** substitui [`openspec-explore`](../openspec-explore/SKILL.md) para mudanças OpenSpec — pode complementar (brainstorm de contexto → brief de prompt para outro agente).
- **Brainstorm** aqui é **alinhamento com fontes do projeto**, não substitui decisão de produto/arquitetura humana.

## Quando usar Brainstorm obrigatoriamente (recomendado)

- O usuário menciona **features, rotas, regras de negócio** ou «como está no código» sem citar arquivos.
- Há **risco de interpretação** (termos ambíguos, vários perfis de usuário, glossário de produto).
- O pedido mistura **objetivo editorial** (prompt para IA) com **estado real do repo** — antes de escrever o Brief, **ler** o que importa (`docs/`, `src/`, specs).

## Princípios globais

1. **Brainstorm antes do Brief** quando qualquer premissa puder estar errada: primeiro fatos e perguntas, depois consolidação.
2. **Perguntas em lotes pequenos** na Brainstorm e no Brief (3–6 por turno).
3. **Uma passagem de confirmação** antes do prompt final: seção **«Entendi assim»** no Brief; na Brainstorm, usar o bloco **«Brainstorm — síntese»** (factos, lacunas, perguntas — ver template na skill).
4. **Não inventar** detalhes do domínio: se faltar dado crítico, perguntar ou indicar o arquivo a abrir.
5. **Idioma**: interação e documentação em **PT-BR**, salvo idioma explícito para o texto final da IA destinatária.

### Hook Cursor (`beforeSubmitPrompt`)

Por defeito o hook **pausa** envios que parecem **plano novo** ou **ajuda explícita para criar/refinar prompt**, e aponta para este fluxo (**brainstorm opcional → brief → prompt mestre**). Para desligar: `PLAN_BRIEF_GATE=0` em `.cursor/hooks/local.env`. Para um só envio: primeira linha `SKIP_PLAN_BRIEF`. Detalhes em [hooks/README](../../hooks/README.md).

---

## Camada 1 — Brainstorm (descoberta)

**Objetivo:** cruzar o pedido do usuário com **evidências** do repositório (e docs externos só se o usuário fornecer).

### Entradas úteis

- Paths absolutos ou relativos a pastas/arquivos prioritários.
- Pergunta única ou lista de dúvidas («está implementado X?», «onde fica Y?»).

### O que o assistente faz

1. **Inventário contextual:** usar busca/leitura (`grep`, codebase search, `Read`) nos caminhos relevantes; seguir [`docs-map-repository`](../docs-map-repository/SKILL.md) ou [MAPA-DOCUMENTOS](../../docs/MAPA-DOCUMENTOS.md) quando existir no projeto.
2. **Síntese estruturada** (template):

```markdown
## Brainstorm — síntese

### O que encontrei (factos)
- …

### Lacunas ou divergências (repo vs o que você pediu)
- …

### Perguntas para você (próximo lote)
1. …
```

3. **Iterar** até o usuário considerar o terreno firme **ou** pedir explicitamente para **passar ao Brief**.

### O que não fazer na Brainstorm

- **Não** emitir o **prompt mestre** final nesta fase.
- **Não** assumir implementação sem evidência no código/doc (marcar como «não verificado»).

### Passagem para o Brief

Transição explícita quando o usuário disser algo como: «fecha o brainstorm», «partimos para o brief», «pode consolidar», ou quando as perguntas estiverem respondidas e não houver mais ambiguidade crítica.

---

## Camada 2 — Brief

Equivalente ao «fluxo clássico» de intake + checklist + confirmação, **agora sempre depois** da Brainstorm quando esta foi usada; caso contrário, começa aqui.

### Fase A — Intake

1. Parágrafo livre ou bullets: **o que** se quer da IA destinatária e **para quê**.
2. Listar 3–5 bullets do que **já** está claro e do que **ainda** está em aberto.

### Fase B — Perguntas direcionadas

Perguntar só sobre lacunas da checklist abaixo (lotes curtos).

### Dimensões (checklist)

| # | Dimensão | Perguntas-guia |
|---|----------|----------------|
| 1 | Papel e expertise | Que persona a IA deve assumir? Em qual área? |
| 2 | Tom | Formal, informal, didático, sucinto, etc. |
| 3 | Formato | Parágrafos, bullets, tabela, JSON, etc. |
| 4 | Objetivo | Resultado concreto e mensurável. |
| 5 | Audiência | Quem consome a saída? |
| 6 | Restrições de tamanho | Mín/máx palavras, seções. |
| 7 | Perspectivas | Uma opinião, pros/contras, ângulos múltiplos. |
| 8 | Validação | Pedir confirmação de entendimento na resposta. |
| 9 | Contexto e fatos | Dados a colar; pode incluir **trechos consolidados da Brainstorm**. |
| 10 | Inclusões obrigatórias | Palavras-chave, tópicos. |
| 11 | Vocabulário | Termos a usar ou evitar. |
| 12 | Exclusões | O que não fazer ou não mencionar. |
| 13 | Exemplos (few-shot) | Amostra de estilo ou estrutura. |
| 14 | Idioma da resposta da IA | Se diferente do idioma do Brief com o usuário. |
| 15 | Iteração | Como refinar depois (expandir, encurtar, etc.). |

### Fase C — «Entendi assim»

```markdown
## Entendi assim (confirme ou corrija)

- Objetivo: ...
- Papel: ...
- Tom e formato: ...
- Audiência: ...
- Restrições: ...
- Inclusões / exclusões / vocabulário: ...
- Contexto necessário em anexo (incl. síntese Brainstorm se houver): ...
```

Aguardar confirmação ou correções.

---

## Camada 3 — Prompt mestre (opcional até pedir)

Emitir **um único bloco** markdown copiável:

````markdown
### Prompt mestre — copiar abaixo

```
[Instruções consolidadas: papel, formato, objetivo, audiência, restrições,
contexto (incluindo fatos da Brainstorm se relevante), inclusões/exclusões,
idioma da resposta.]
```
````

---

## Saída e rastreabilidade

Ao fechar a Camada 3:

`Brief gerado pela skill workflow-prompt-profissional (pipeline Brainstorm → Brief → prompt mestre).`

Se só Brainstorm + Brief sem prompt mestre:

`Brief consolidado pela skill workflow-prompt-profissional (sem prompt mestre nesta sessão).`

