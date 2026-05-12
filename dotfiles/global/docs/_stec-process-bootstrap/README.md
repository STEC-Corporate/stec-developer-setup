# STEC — pacote neutro de `docs/gestao-*` (bootstrap)

Conteúdo versionado no **AI-ProjectDeveloper** para criar, noutro projeto, apenas **estrutura**, **templates** genéricos e Markdown **neutro** de processo/TaskLink — sem especificação de produto de um repo concreto.

## Conteúdo

| Item | Descrição |
|------|-----------|
| [`gestao-docs.manifest.schema.json`](./gestao-docs.manifest.schema.json) | JSON Schema do manifest. |
| [`gestao-docs.manifest.example.json`](./gestao-docs.manifest.example.json) | Exemplo com campos P0 opcionais. |
| [`neutral-pack/docs/`](./neutral-pack/docs/) | Árvore a aplicar sob `docs/` do repo destino. |
| [`scripts/apply-stec-neutral-pack.sh`](./scripts/apply-stec-neutral-pack.sh) | Aplica o pacote (rsync); valida `.cursor/` mínimo. |
| [`scripts/export-stec-docs-skeleton.sh`](./scripts/export-stec-docs-skeleton.sh) | Regenera `neutral-pack/docs` a partir de `docs/` live com allow/deny (ver seção Manutenção). |

## Pré-requisito

Submodule **AI-ProjectDeveloper** em `.cursor/`, conforme [`.cursor/SUBMODULES.md`](../../SUBMODULES.md).

## Orquestração

- Agent: `tasklink-docs-scaffold-orchestrator`
- Skills: `tasklink-docs-verify-submodule-cursor`, `tasklink-docs-manifest-schema`, `tasklink-docs-scaffold-from-template`, `tasklink-docs-validate-structure`, `tasklink-docs-inventory`, `docs-criar-doc-structure` (opcional)

## Manutenção: regenerar o pacote neutro (`neutral-pack/docs`)

A partir de um repositório com `docs/gestao-*` “live” (ex.: referência interna), é possível **atualizar** arquivos permitidos pelo filtro allow/deny — **não** substitui o fluxo P0 nem o `apply-stec-neutral-pack.sh` nos consumidores.

1. Rever e, se necessário, apertar as listas em [`scripts/export-allow.txt`](./scripts/export-allow.txt) e [`scripts/export-deny.txt`](./scripts/export-deny.txt) (alinhadas ao conceito de `forbidden_globs` no manifest).
2. Pré-visualizar o que seria copiado:

   ```bash
   .cursor/docs/_stec-process-bootstrap/scripts/export-stec-docs-skeleton.sh --dry-run /caminho/absoluto/para/repo-live
   ```

3. Aplicar (sobrescreve no destino apenas os arquivos da lista incluída; arquivos no destino que não vêm do live para essa lista **não** são apagados):

   ```bash
   .cursor/docs/_stec-process-bootstrap/scripts/export-stec-docs-skeleton.sh /caminho/absoluto/para/repo-live
   ```

   Destino por defeito: `neutral-pack/docs` neste bootstrap. Opcional: `--out /outro/dir`.

4. **Revisão humana obrigatória** (`git diff` no submodule) antes de commit — evitar vazar especificação de produto ou quadros vivos.

## O que não fazer

- Não copiar `docs/` completo de um produto (ex.: SoundLink) para outro repo.
- Não duplicar `.cursor` no repo pai — vem só do submodule.
