# Uso de RAG na Documentação (Retrieval-Augmented Generation)

> Como usar recuperação de contexto sobre a documentação para alinhar a IA com guardrails, North Star e decisões.

---

## O que foi implementado

1. **Regra Cursor** (`.cursor/rules/rag-docs-context.mdc`): mapeia **intenção → documentos** a incluir no contexto.
2. **Script de busca** (`scripts/rag-query-docs.js`): pergunta em linguagem natural → trechos relevantes para colar no chat.
3. **Busca semântica (embeddings)**: script que gera índice com vetores (`scripts/rag-build-index.js`). Com o índice, a busca entende **significado** — você não precisa chamar um doc específico.
4. **RAG no chat (MCP)**: servidor MCP expõe a ferramenta `search_documentation`. O Agent do Cursor pode chamá-la ao responder — você só escreve no chat; **não precisa rodar script nem Ollama**. Usa OpenAI (se tiver índice + `OPENAI_API_KEY`) ou busca por termos.

Modos do script de busca:
- **Com índice** (`.rag-index.json`): busca por **significado** (OpenAI ou Ollama).
- **Sem índice** ou sem API: busca por **termos** (palavras que existem nos docs).

---

## Fluxo 1: Regra por intenção

Use quando souber o **tipo** da decisão:

- **Guardrails** → incluir `.cursor/docs/ia/guardrails.md`
- **Priorização** → guardrails + `.cursor/docs/ia/playbooks/feature-prioritization.md` + north-star + OKRs
- **Decisão arquitetural** → `docs/decisoes/` (ADR correspondente)
- **Ranking/busca** → guardrails + ADR-002

No Cursor, você pode:

- **@-mencionar** o arquivo (ex.: `@.cursor/docs/ia/guardrails.md`) no chat, ou
- Pedir: *"Antes de responder, considera o contexto em .cursor/docs/ia/playbooks/feature-prioritization.md e north-star.md"*

A regra em `.cursor/rules/rag-docs-context.mdc` descreve o mapeamento completo e quando aplicá-la.

---

## Fluxo 2: Script de busca (pergunta livre)

Quando a pergunta for **livre** (ex.: "como priorizamos features?" ou "o que não podemos fazer com ranking?"):

### 1. Rodar o script

No terminal, na raiz do repositório:

```bash
node scripts/rag-query-docs.js "como priorizamos features?"
```

Ou com npm (se configurado):

```bash
npm run rag:query -- "como priorizamos features?"
```

### 2. Usar a saída no chat

O script imprime trechos em markdown com **Fonte:** e o caminho do arquivo. **Copie essa saída e cole no chat do Cursor** como contexto antes de fazer a pergunta ou pedir a tarefa. A IA passará a basear a resposta nesses trechos (RAG manual).

### Exemplos de perguntas que funcionam bem

- `"como priorizamos features?"` → playbook de priorização, North Star, OKRs
- `"o que nunca podemos fazer para músicos?"` → guardrails (destaque pago, ranking, etc.)
- `"o que é north star?"` → north-star.md
- `"ranking e dados verificáveis"` → guardrails + ADR-002
- `"clean architecture frontend"` → ADR-004
- `"perfil músico como template replicação"` ou `"Meus Projetos Meus Eventos padrão"` → .cursor/docs/ia/replication-musician-as-template.md, regras de replicação

Perguntas muito genéricas ou com palavras que não aparecem nos docs podem retornar poucos ou nenhum trecho; use termos que existam na documentação (guardrails, priorização, OKR, ranking, north star, etc.). Com **índice de embeddings** (ver abaixo), você pode perguntar com suas próprias palavras.

---

## Busca semântica: gerar índice com embeddings

Para o RAG entender seu contexto **sem você chamar um doc específico**, gere o índice uma vez (e depois de mudanças relevantes nos docs).

### 1. Escolher provedor

**Opção A — OpenAI** (se você tem API key):

```bash
set OPENAI_API_KEY=sk-...
npm run rag:build
```

**Opção B — Ollama** (local, sem custo):

1. Instale [Ollama](https://ollama.com) e rode: `ollama run nomic-embed-text`
2. Com o Ollama rodando: `npm run rag:build`

(O script usa OpenAI se `OPENAI_API_KEY` estiver definida; senão usa Ollama em `http://localhost:11434`. Para outro host: `OLLAMA_HOST=http://...`.)

### 2. Onde fica o índice

O comando gera **`.rag-index.json`** na raiz (está no `.gitignore`). Contém os chunks e os vetores.

### 3. Consultar com busca semântica

Depois de gerar o índice:

```bash
npm run rag:query -- "como decidir o que fazer primeiro no sprint?"
```

Se o índice existir e a API (OpenAI ou Ollama) estiver disponível, a saída será **(busca semântica)**. Senão, fallback para busca por termos.

Recomendação: rodar `npm run rag:build` de novo quando houver mudanças relevantes em `.cursor/docs/ia/`, `docs/decisoes/` ou `docs/planejamento/`.

---

## Fluxo 3: RAG direto no chat (MCP — sem rodar script)

O projeto inclui um **servidor MCP** que expõe a busca na documentação como ferramenta. O Agent do Cursor pode chamá-la sozinho quando você fizer perguntas sobre regras, priorização ou decisões — **não precisa rodar script no terminal nem usar Ollama**.

### Como ativar

1. O arquivo **`.cursor/mcp.json`** já está configurado no repositório (servidor `soundlink-rag`).
2. **Reinicie o Cursor** completamente para carregar o servidor.
3. Em **Configurações** (Ctrl+Shift+J) → **Tools & MCP**, confira se o servidor **soundlink-rag** aparece e está ativo.
4. Opcional: ative **auto-run** para o Agent usar a ferramenta sem pedir confirmação.

### Como funciona

- Você pergunta no chat, por exemplo: *"O que nunca podemos fazer para músicos?"* ou *"Como priorizamos features?"*.
- O Agent pode invocar a ferramenta **search_documentation** com a sua pergunta.
- O servidor MCP roda a mesma lógica do `rag:query`: se existir `.rag-index.json` e `OPENAI_API_KEY`, usa busca semântica; senão, busca por termos nos docs.
- O resultado (trechos relevantes) volta para o Agent e ele usa como contexto para responder.

**Não precisa de Ollama**: basta o Cursor com o MCP ativo. Para busca semântica no MCP, use **OpenAI** (rode `npm run rag:build` com `OPENAI_API_KEY` e deixe a variável disponível para o Cursor). Sem índice ou sem API, o MCP usa busca por termos.

---

## Onde o script busca

| Pasta                     | Conteúdo indexado                    |
|---------------------------|--------------------------------------|
| `.cursor/docs/ia/`                | Guardrails, playbooks, estratégia, prompts, **replicação músico como template** |
| `docs/decisoes/`          | ADRs e decision log                 |
| `docs/planejamento/`     | Até 2 níveis (ex.: north-star, OKRs) |
| `docs/fluxo/`             | Até 3 níveis: business-rules, user-flows, api-specifications (fe-*.md por perfil) |

Os arquivos são quebrados por **seções** (`##`); cada seção vira um "chunk" pontuado pela quantidade de termos da pergunta que aparecem nela.

---

## Embeddings e busca semântica (implementado)

### O que são embeddings?

**Embeddings** são representações numéricas (vetores) do **significado** de um texto. Dois trechos com sentido parecido ficam com vetores próximos; o modelo “entende” sinônimos e paráfrases.

### Busca por termos vs. busca semântica

| Busca por termos (sem índice) | Busca semântica (com índice) |
|-------------------------------|-------------------------------|
| A pergunta precisa **conter palavras** que existem nos docs. | A pergunta pode ser em **suas palavras**; o sistema busca por **significado**. |
| Ex.: "como priorizamos features?" → acha "prioriz" e "features". | Ex.: "como decidir o que fazer primeiro no sprint?" → acha o playbook de priorização. |
| Se você não souber "guardrails", pode não achar. | "o que nunca podemos fazer" → mapeia para as proibições dos guardrails. |

### RAG sem chamar um doc específico

**Sim.** Com o índice gerado (`npm run rag:build`), você pergunta em linguagem natural. O sistema converte a pergunta em vetor, compara com os vetores dos chunks e devolve os trechos **mais parecidos em significado**. Quem escolhe o doc é a **similaridade semântica**, não você.

### Como está implementado

1. **Gerar embeddings**: `npm run rag:build` — usa OpenAI (`text-embedding-3-small`) ou Ollama (`nomic-embed-text`).
2. **Índice**: `.rag-index.json` com chunks + vetores.
3. **Query**: `npm run rag:query -- "pergunta"` — se houver índice e API, usa busca semântica; senão, fallback por termos.

---

## Resumo

| Objetivo                         | Como fazer                                                                 |
|----------------------------------|----------------------------------------------------------------------------|
| Saber **quais docs** incluir     | Abrir `.cursor/rules/rag-docs-context.mdc` e usar a tabela intenção → docs |
| **Busca semântica** (suas palavras) | `npm run rag:build` (uma vez, com OPENAI_API_KEY ou Ollama) → depois `npm run rag:query -- "pergunta"` |
| **RAG no chat** (sem rodar script)   | Ativar servidor MCP (`.cursor/mcp.json`), reiniciar Cursor; perguntar no chat normalmente. Sem Ollama. |
| **Pergunta livre** (sem índice)  | `npm run rag:query -- "sua pergunta"` → colar saída no chat (busca por termos) |
| Garantir guardrails/north star   | Manter uso de `@.cursor/docs/ia/guardrails.md` e north-star no .cursorrules e na regra RAG |

---

**Criado em**: 2026  
**Relacionado**: [.cursor/docs/ia/README.md](./README.md), [guardrails.md](./guardrails.md), [.cursorrules](../../.cursorrules)
