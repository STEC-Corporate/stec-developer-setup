# Build do bundle (referência)

O script está versionado em:

- Canônico (raiz do **AI-ProjectDeveloper**): `scripts/build_cursor_global_bundle.py`
- Cópia no scaffold (para levar ao repo pai): `scaffold/scripts/build_cursor_global_bundle.py` (manter em sync com o canônico)

## Comportamento do manifest

- **Padrão:** lê `packages/cursor-global/manifest.json` relativo à raiz do repositório onde o script vive em `scripts/` (ou, se o script estiver só em `scaffold/scripts/`, o default relativo usa `scaffold/packages-cursor-global/manifest.json` — layout do template).
- **Override:** variável de ambiente **`CURSOR_GLOBAL_MANIFEST`** — caminho absoluto ou relativo ao **diretório de trabalho atual** (`cwd`).

## Comando típico (na raiz do submodule AI-ProjectDeveloper)

```bash
cd /caminho/para/AI-ProjectDeveloper
python3 scripts/build_cursor_global_bundle.py
```

Saída esperada: `packages/cursor-global/bundle/.cursor/` e `packages/cursor-global/bundle/summary.json`.

## Repo pai (manifest em outro lugar)

Após copiar `scaffold/packages-cursor-global/` e `scaffold/scripts/build_cursor_global_bundle.py` para o pai:

```bash
cd /caminho/do/repo-pai
export CURSOR_GLOBAL_MANIFEST=packages/cursor-global/manifest.json
python3 scripts/build_cursor_global_bundle.py
```

Ajuste `CURSOR_GLOBAL_MANIFEST` para o caminho real do `manifest.json`. O `source_root` dentro do JSON deve apontar para o `.cursor` do submodule (caminho relativo ao diretório do `manifest.json`).

## Uma linha (Linux/macOS)

```bash
CURSOR_GLOBAL_MANIFEST=packages/cursor-global/manifest.json python3 scripts/build_cursor_global_bundle.py
```
