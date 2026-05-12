#!/usr/bin/env node
/**
 * project-init.mjs
 *
 * Cria uma estrutura mínima de monorepo (template) no projeto pai.
 * Não assume package manager específico. Ideal para bootstrap rápido.
 *
 * Uso:
 *   node skills/config-project/scripts/project-init.mjs --dry-run
 */

import fs from 'node:fs';
import path from 'node:path';

const dryRun = process.argv.includes('--dry-run');

function ensureDir(dir) {
  if (fs.existsSync(dir)) return;
  if (dryRun) return console.log('[dry-run] mkdir', dir);
  fs.mkdirSync(dir, { recursive: true });
}

function writeIfMissing(file, contents) {
  if (fs.existsSync(file)) return;
  if (dryRun) return console.log('[dry-run] write', file);
  fs.mkdirSync(path.dirname(file), { recursive: true });
  fs.writeFileSync(file, contents);
}

ensureDir('apps/backend/src');
ensureDir('apps/web/src');
ensureDir('packages/shared/src');

writeIfMissing(
  'turbo.json',
  JSON.stringify(
    {
      $schema: 'https://turbo.build/schema.json',
      pipeline: {
        build: { dependsOn: ['^build'], outputs: ['dist/**', '.next/**'] },
        dev: { cache: false, persistent: true },
        lint: {},
        test: { cache: false },
        'check-types': {},
      },
    },
    null,
    2,
  ) + '\n',
);

writeIfMissing(
  'README.md',
  `# Projeto STEC (bootstrap)\n\nGerado via submodule AI-ProjectDeveloper.\n\n## Estrutura\n- apps/backend\n- apps/web\n- packages/shared\n\n`,
);

console.log('Estrutura base preparada.');
console.log('Dica: agora rode create-turbo/create-next-app/nest conforme stack e requisitos.');

