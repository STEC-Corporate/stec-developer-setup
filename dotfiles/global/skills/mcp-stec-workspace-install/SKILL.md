---
name: mcp-stec-workspace-install
description: Instala venvs e dependencias dos MCPs STEC locais e gera ou funde .cursor/mcp.json no projeto consumidor. Use com STEC_MCP_ROOT e CONSUMER_WORKSPACE absolutos; alinhado a docs/mcp-fleet-contract no RAG-Orchestrator.
---

# MCP STEC — instalação no workspace consumidor

## Quando usar

- O usuario quer **habilitar** no Cursor os servidores MCP da STEC (fleet + RAG Memories) a partir de clones locais.
- Paths dos repositorios estao sob um diretorio configuravel (padrao de maquina de desenvolvimento).

## Variaveis

| Variavel | Obrigatorio | Padrao | Significado |
|----------|-------------|--------|-------------|
| `CONSUMER_WORKSPACE` | sim | — | Raiz **absoluta** do projeto onde o usuario trabalha (onde ficara `.cursor/mcp.json`). |
| `STEC_MCP_ROOT` | nao | `/home/jesus/Projetos` | Diretorio pai que contem pastas `MCP-*` e `RAG-*`. |
| `DRY_RUN` | nao | `false` | Se `true`, apenas listar acoes e JSON proposto sem escrever arquivo nem rodar pip. |
| `OLLAMA_BASE_URL` | nao | `http://localhost:11434` | URL do Ollama (porta de saida dos MCPs, nao porta MCP). |
| `OLLAMA_MODEL` | nao | `llama3.2:1b` | Modelo Ollama para code-inspector, product-inspector, project-inspector. |
| `RAG_API_BASE_URL` | nao | — | URL da API REST do RAG-Memories (ex.: `http://localhost:8000`); usada pelo `mcp_remote.py`. |
| `RAG_REPOSITORY_BACKEND` | nao | `memory` | Backend do RAG-Memories: `memory` (leve, sem Postgres) ou `postgres`. |

Outras maquinas: exportar `STEC_MCP_ROOT` para o caminho real (ex.: outro usuario Linux, nao hardcodar so WSL).

## Repositorios canonicos (nomes exatos de pasta)

Incluir **somente** estes diretorios sob `STEC_MCP_ROOT` se existirem:

| Pasta | Chave `mcpServers` | Observacao |
|-------|------------------|------------|
| `RAG-Orchestrator` | `workspace-rag` | `args`: `server.py`; `env`: `RAG_WORKSPACE_ROOT` = `CONSUMER_WORKSPACE`; opcional `RAG_EXTRA_ROOTS` com Inspectors. |
| `MCP-Code-Inspector` | `quality-ollama` | `args`: `-m`, `quality_mcp.server` |
| `MCP-Product-Inspector` | `product-inspector` | `args`: `-m`, `product_mcp.server` |
| `MCP-Project-Inspector` | `project-inspector` | `args`: `-m`, `project_mcp.server` |
| `RAG-Memories` | `rag-memories` | Apos `pip install -e .`, usar `command`: `<repo>/.venv/bin/rag-memories-mcp`, `args`: `[]`; `env`: `RAG_REPOSITORY_BACKEND=memory` para modo leve. |

**Ignorar** pasta `MCP-Product-Instpector` (typo comum): nao usar como `MCP-Product-Inspector`; avisar o usuario para renomear ou remover duplicata.

Nao inventar entradas para outros diretorios `MCP-*` / `RAG-*` nao listados acima sem confirmacao.

## Passos (ordem)

1. Resolver `CONSUMER_WORKSPACE` e `STEC_MCP_ROOT`; validar que `CONSUMER_WORKSPACE` existe e e diretorio.
2. Para cada repositorio canonico existente:
   - Se houver `pyproject.toml` ou `requirements.txt`: garantir `.venv` (`python3 -m venv .venv` se nao existir).
   - `pip install -e .` na raiz do repo (preferencial) ou `pip install -r requirements.txt` conforme o projeto.
3. Montar objeto JSON `mcpServers` com paths **absolutos** para `.venv/bin/python` ou `rag-memories-mcp` conforme tabela.
4. `RAG_WORKSPACE_ROOT` no servidor `workspace-rag` deve ser exatamente `CONSUMER_WORKSPACE`.
5. Opcional `RAG_EXTRA_ROOTS` (uma string com virgulas): paths dos tres Inspectors e/ou READMEs, alinhado ao [README do RAG-Orchestrator](https://github.com/STEC-Corporate/RAG-Orchestrator) (secao Fleet MCP).
6. Criar `CONSUMER_WORKSPACE/.cursor/` se necessario; **fundir** com `mcp.json` existente se o usuario pedir preservacao — senao, backup (`mcp.json.bak`) antes de sobrescrever.
7. Orientar reinicio do Cursor ou recarregar MCPs.

## Transporte MCP: stdio (sem portas TCP)

Todos os servidores da fleet usam transporte **stdio** — o Cursor (ou outra IDE) os inicia como **subprocessos filhos** e se comunica via stdin/stdout. **Nao ha porta TCP envolvida**; por isso o `mcp.json` usa `command` + `args` e nao `url`.

A unica porta de rede presente na configuracao e a do **Ollama** (`OLLAMA_BASE_URL`, padrao `http://localhost:11434`), que os MCPs usam como **cliente de saida** para embeddings e chat — nao e uma porta em que os MCPs escutam.

### Transporte alternativo: SSE / Streamable HTTP (opcional, futuro)

Se quiser rodar os MCPs como **servidores HTTP** em vez de subprocessos stdio (ex.: acesso remoto, Docker), cada um precisa de uma porta distinta. Portas reservadas sugeridas para a fleet STEC:

| Chave `mcpServers` | Porta sugerida | Uso |
|--------------------|----------------|-----|
| `workspace-rag` | 8100 | MCP RAG Orchestrator |
| `quality-ollama` | 8101 | MCP Code Inspector |
| `product-inspector` | 8102 | MCP Product Inspector |
| `project-inspector` | 8103 | MCP Project Inspector |
| `rag-memories` (MCP) | 8104 | MCP RAG-Memories (mcp_server.py) |
| `rag-memories` (API REST) | 8000 | FastAPI / Uvicorn — RAG-Memories main.py |
| Ollama | 11434 | Servidor Ollama (embedding + chat) |

No modo SSE, a entrada em `mcp.json` troca `command`/`args` por `url: "http://localhost:<porta>/sse"`.

## Pre-requisitos

- **Ollama** rodando na porta **11434** (padrao) para `workspace-rag`, `quality-ollama`, `product-inspector`, `project-inspector`; modelos conforme README de cada repo (ex.: `nomic-embed-text`, `llama3.2`).
- **RAG-Memories**: modo `memory` dispensa Postgres; para Postgres compartilhar `DATABASE_URL` com a API se aplicavel.
- **RAG-Memories API REST** (opcional): se o usuario quiser a API FastAPI alem do servidor MCP, subir com `uvicorn rag_memories.main:app --port 8000`; configurar `RAG_MCP_API_BASE_URL=http://localhost:8000` ou `RAG_API_BASE_URL=http://localhost:8000` para o `mcp_remote.py` encontrar a API.

## Template JSON (gerar sem comentarios — valido para `.cursor/mcp.json`)

Estrutura esperada (substituir PREFIX pelos paths reais):

```json
{
  "mcpServers": {
    "workspace-rag": {
      "command": "PREFIX/RAG-Orchestrator/.venv/bin/python",
      "args": ["PREFIX/RAG-Orchestrator/server.py"],
      "env": {
        "RAG_WORKSPACE_ROOT": "CONSUMER_WORKSPACE_ABS",
        "RAG_EXTRA_ROOTS": "PREFIX/MCP-Code-Inspector,PREFIX/MCP-Product-Inspector,PREFIX/MCP-Project-Inspector"
      }
    },
    "quality-ollama": {
      "command": "PREFIX/MCP-Code-Inspector/.venv/bin/python",
      "args": ["-m", "quality_mcp.server"],
      "env": {
        "OLLAMA_BASE_URL": "http://localhost:11434",
        "OLLAMA_MODEL": "llama3.2:1b"
      }
    },
    "product-inspector": {
      "command": "PREFIX/MCP-Product-Inspector/.venv/bin/python",
      "args": ["-m", "product_mcp.server"],
      "env": {
        "OLLAMA_BASE_URL": "http://localhost:11434",
        "OLLAMA_MODEL": "llama3.2:1b"
      }
    },
    "project-inspector": {
      "command": "PREFIX/MCP-Project-Inspector/.venv/bin/python",
      "args": ["-m", "project_mcp.server"],
      "env": {
        "OLLAMA_BASE_URL": "http://localhost:11434",
        "OLLAMA_MODEL": "llama3.2:1b"
      }
    },
    "rag-memories": {
      "command": "PREFIX/RAG-Memories/.venv/bin/rag-memories-mcp",
      "args": [],
      "env": {
        "RAG_REPOSITORY_BACKEND": "memory"
      }
    }
  }
}
```

Remover chaves cujo diretorio de repo nao existir apos o passo 2.

## Referencias cruzadas

- Contrato de nomes e ordem: repositorio **RAG-Orchestrator** — `docs/mcp-fleet-contract.md`.
- Script no clone do **RAG-Orchestrator**: `scripts/bootstrap-mcp-stec-workspace.sh` (executar a partir da raiz desse repositório; passa `CONSUMER_WORKSPACE` como primeiro argumento; `STEC_MCP_ROOT` opcional).

## Checklist de saida

- Lista de repos processados e skips (inexistentes).
- Aviso se `MCP-Product-Instpector` (typo) existir ao lado do nome correto.
- Caminho final de `.cursor/mcp.json` e lembrete de reiniciar MCPs / `rag_status` para smoke.

## Cobertura

- Automacao: shell/Python no projeto consumidor; esta skill e procedural para o agente seguir.
- Domínio: MCP STEC + Cursor IDE.
