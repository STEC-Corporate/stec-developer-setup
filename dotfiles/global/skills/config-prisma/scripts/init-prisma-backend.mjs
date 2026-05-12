#!/usr/bin/env node
/**
 * init-prisma-backend.mjs
 *
 * Inicializa estrutura base do Prisma no backend (template idempotente).
 * Não executa migrations automaticamente; prepara arquivos e diretórios.
 *
 * Uso:
 *   node skills/config-prisma/scripts/init-prisma-backend.mjs --backend apps/backend --dry-run
 */

import fs from 'node:fs';
import path from 'node:path';

function arg(name, fallback = undefined) {
  const idx = process.argv.indexOf(`--${name}`);
  if (idx === -1) return fallback;
  return process.argv[idx + 1] ?? fallback;
}

const backendDir = arg('backend', 'apps/backend');
const dryRun = process.argv.includes('--dry-run');

const prismaDir = path.join(backendDir, 'prisma');
const schemaPath = path.join(prismaDir, 'schema.prisma');
const envExamplePath = path.join(backendDir, '.env.example');

function writeFileIfMissing(filePath, contents) {
  if (fs.existsSync(filePath)) return false;
  if (dryRun) {
    console.log('[dry-run] write', filePath);
    return true;
  }
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
  fs.writeFileSync(filePath, contents);
  return true;
}

const schema = `generator client {\n  provider = \"prisma-client-js\"\n}\n\ndatasource db {\n  provider = \"postgresql\"\n  url      = env(\"DATABASE_URL\")\n}\n\nmodel User {\n  id    String @id @default(uuid())\n  email String @unique\n  name  String\n}\n`;

const envExample = `# Prisma\nDATABASE_URL=postgresql://postgres:postgres@localhost:5432/app\n`;

if (!dryRun) fs.mkdirSync(prismaDir, { recursive: true });
writeFileIfMissing(schemaPath, schema);
writeFileIfMissing(envExamplePath, envExample);

console.log('Prisma base preparado em:', prismaDir);
console.log('Proximos passos (no projeto pai):');
console.log('  - npm/pnpm: prisma generate');
console.log('  - prisma migrate dev --name init');

