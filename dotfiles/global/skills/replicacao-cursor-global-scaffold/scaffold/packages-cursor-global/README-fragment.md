# Pacote cursor-global (repo pai) — fragmento

Use este arquivo como README local no **projeto pai**, junto com `manifest.json` e `install.sh` copiados deste scaffold.

## O que configurar

1. **`source_root` em `manifest.json`**  
   Caminho **relativo** da pasta onde está o `manifest.json` até `.cursor` dentro do submodule **AI-ProjectDeveloper**.  
   Exemplo: se o submodule está em `vendor/AI-ProjectDeveloper` e o pacote no pai em `packages/cursor-global/`, use algo como `../../vendor/AI-ProjectDeveloper/.cursor`.

2. **Build do bundle**  
   O gerador oficial vive no submodule: `AI-ProjectDeveloper/scripts/build_cursor_global_bundle.py`.  
   Na prática, o caminho mais simples é rodar o build **na raiz do submodule** (onde já existe `packages/cursor-global/manifest.json` oficial).  
   Se o pai mantiver **só** cópia do manifest neste scaffold, alinhe o script Python ou use symlink para o submodule.

3. **Instalação**  
   Após existir `bundle/.cursor/`, execute `./install.sh` (ou `bash install.sh /outro/destino`).

## Fonte de verdade

- Submodule: repositório **AI-ProjectDeveloper** (catálogo `.cursor/` e script de build).
- Agentes Cursor neste monorepo: `replicacao-cursor-global-bundle`, `replicacao-classificacao-assets-cursor`.

Não versionar o conteúdo gerado de `bundle/.cursor/` se a política do time for build reproduzível no CI; caso contrário, documente exceção.
