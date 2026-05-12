#!/usr/bin/env node
/**
 * generate-controller.mjs
 * Gerador simples (template) de controller NestJS + DTO HTTP.
 *
 * Uso:
 *   node skills/backend-controller/scripts/generate-controller.mjs \
 *     --out apps/backend/src/presentation/controllers \
 *     --name users \
 *     --route users
 *
 * Observação: este script é um template do submodule. Ajuste paths e padrões
 * no projeto pai conforme sua estrutura.
 */

import fs from 'node:fs';
import path from 'node:path';

function arg(name, fallback = undefined) {
  const idx = process.argv.indexOf(`--${name}`);
  if (idx === -1) return fallback;
  return process.argv[idx + 1] ?? fallback;
}

const outDir = arg('out');
const name = arg('name');
const route = arg('route', name);
const dryRun = process.argv.includes('--dry-run');

if (!outDir || !name) {
  console.error('Uso: --out <dir> --name <feature> [--route <route>] [--dry-run]');
  process.exit(1);
}

const className = `${name[0].toUpperCase()}${name.slice(1)}Controller`;
const dtoName = `${name[0].toUpperCase()}${name.slice(1)}CreateHttpDto`;

const controller = `import { Body, Controller, Post, BadRequestException } from '@nestjs/common';\nimport { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';\nimport { ${dtoName} } from './${name}.dto';\n\n@ApiTags('${route}')\n@Controller('${route}')\nexport class ${className} {\n  constructor(\n    // private readonly useCase: Create${name[0].toUpperCase()}${name.slice(1)}UseCase,\n+  ) {}\n\n  @Post()\n  @ApiOperation({ summary: 'Create ${name}' })\n  @ApiResponse({ status: 201 })\n  async create(@Body() body: ${dtoName}) {\n    // const result = await this.useCase.execute(body);\n    // if (!result.ok) throw new BadRequestException(result.error);\n    // return result.value;\n    return body;\n  }\n}\n`;

const dto = `import { ApiProperty } from '@nestjs/swagger';\nimport { IsString } from 'class-validator';\n\nexport class ${dtoName} {\n  @ApiProperty()\n  @IsString()\n  example!: string;\n}\n`;

const controllerPath = path.join(outDir, `${name}.controller.ts`);
const dtoPath = path.join(outDir, `${name}.dto.ts`);

if (dryRun) {
  console.log('[dry-run] write', controllerPath);
  console.log('[dry-run] write', dtoPath);
  process.exit(0);
}

fs.mkdirSync(outDir, { recursive: true });
fs.writeFileSync(controllerPath, controller);
fs.writeFileSync(dtoPath, dto);

console.log('Gerado:', controllerPath);
console.log('Gerado:', dtoPath);

