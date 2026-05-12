#!/usr/bin/env node
/**
 * create-module.mjs
 *
 * Gera package compartilhado + esqueleto backend/frontend para um módulo.
 *
 * Uso:
 *   node skills/config-new-module/scripts/create-module.mjs --name billing --scope @stec --dry-run
 */

import fs from 'node:fs';
import path from 'node:path';

function arg(name, fallback = undefined) {
  const idx = process.argv.indexOf(`--${name}`);
  if (idx === -1) return fallback;
  return process.argv[idx + 1] ?? fallback;
}

const name = arg('name');
const scope = arg('scope', '@repo');
const dryRun = process.argv.includes('--dry-run');

if (!name) {
  console.error('Uso: --name <modulo> [--scope <scope>] [--dry-run]');
  process.exit(1);
}

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

// Package compartilhado
const pkgDir = `packages/${name}`;
ensureDir(`${pkgDir}/src`);
writeIfMissing(
  `${pkgDir}/package.json`,
  JSON.stringify({ name: `${scope}/${name}`, version: '0.1.0', private: true }, null, 2) + '\n',
);
writeIfMissing(`${pkgDir}/src/index.ts`, `export const ${name} = '${name}';\n`);

// Backend esqueleto (ajustar conforme estrutura do projeto pai)
ensureDir(`apps/backend/src/modules/${name}`);
writeIfMissing(
  `apps/backend/src/modules/${name}/${name}.module.ts`,
  `import { Module } from '@nestjs/common';\n\n@Module({})\nexport class ${name[0].toUpperCase()}${name.slice(1)}Module {}\n`,
);

// Frontend esqueleto (ajustar conforme estrutura do projeto pai)
ensureDir(`apps/web/src/modules/${name}`);
writeIfMissing(
  `apps/web/src/modules/${name}/page.tsx`,
  `export default function ${name[0].toUpperCase()}${name.slice(1)}Page() {\n  return <div>${name} (TODO)</div>;\n}\n`,
);

console.log('Modulo criado (template):', name);
console.log('Revise integrações no projeto pai (imports, rotas, menus, exports).');

