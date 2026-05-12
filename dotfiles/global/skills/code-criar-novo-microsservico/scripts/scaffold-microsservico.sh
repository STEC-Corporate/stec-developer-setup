#!/usr/bin/env bash
# scaffold-microsservico.sh
# Gera a estrutura de pastas e arquivos base para um novo microsserviço NestJS
# seguindo Clean Architecture (Domain / Application / Infrastructure / Presentation).
#
# Uso: ./scaffold-microsservico.sh <nome-do-servico> [porta]
# Exemplo: ./scaffold-microsservico.sh user-service 3001

set -euo pipefail

SERVICE_NAME="${1:-}"
PORT="${2:-3000}"

if [[ -z "$SERVICE_NAME" ]]; then
  echo "Erro: informe o nome do servico."
  echo "Uso: $0 <nome-do-servico> [porta]"
  exit 1
fi

BASE="apps/${SERVICE_NAME}/src"

echo "Criando estrutura Clean Architecture para '${SERVICE_NAME}' na porta ${PORT}..."

# --- Camadas ---
mkdir -p \
  "${BASE}/domain/entities" \
  "${BASE}/domain/value-objects" \
  "${BASE}/domain/interfaces" \
  "${BASE}/domain/errors" \
  "${BASE}/application/use-cases" \
  "${BASE}/application/dtos" \
  "${BASE}/application/interfaces" \
  "${BASE}/infrastructure/repositories" \
  "${BASE}/infrastructure/database" \
  "${BASE}/infrastructure/guards" \
  "${BASE}/presentation/controllers" \
  "${BASE}/presentation/dtos" \
  "apps/${SERVICE_NAME}/test"

# --- Arquivos base ---

# main.ts
cat > "apps/${SERVICE_NAME}/src/main.ts" << 'EOF'
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));

  const config = new DocumentBuilder()
    .setTitle('SERVICE_NAME')
    .setVersion('1.0')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  await app.listen(process.env.PORT ?? PORT_PLACEHOLDER);
}

bootstrap();
EOF
sed -i "s/SERVICE_NAME/${SERVICE_NAME}/g" "apps/${SERVICE_NAME}/src/main.ts"
sed -i "s/PORT_PLACEHOLDER/${PORT}/g" "apps/${SERVICE_NAME}/src/main.ts"

# app.module.ts
cat > "apps/${SERVICE_NAME}/src/app.module.ts" << 'EOF'
import { Module } from '@nestjs/common';
import { HealthModule } from './health/health.module';

@Module({
  imports: [HealthModule],
})
export class AppModule {}
EOF

# health check
mkdir -p "${BASE}/health"
cat > "${BASE}/health/health.module.ts" << 'EOF'
import { Module } from '@nestjs/common';
import { TerminusModule } from '@nestjs/terminus';
import { HealthController } from './health.controller';

@Module({
  imports: [TerminusModule],
  controllers: [HealthController],
})
export class HealthModule {}
EOF

cat > "${BASE}/health/health.controller.ts" << 'EOF'
import { Controller, Get } from '@nestjs/common';
import { HealthCheck, HealthCheckService } from '@nestjs/terminus';

@Controller('health')
export class HealthController {
  constructor(private health: HealthCheckService) {}

  @Get()
  @HealthCheck()
  check() {
    return this.health.check([]);
  }
}
EOF

# package.json
cat > "apps/${SERVICE_NAME}/package.json" << EOF
{
  "name": "@repo/${SERVICE_NAME}",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "build": "nest build",
    "dev": "nest start --watch",
    "start": "node dist/main",
    "test": "jest",
    "test:e2e": "jest --config ./test/jest-e2e.json"
  }
}
EOF

# tsconfig.json
cat > "apps/${SERVICE_NAME}/tsconfig.json" << 'EOF'
{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "outDir": "./dist"
  },
  "include": ["src/**/*", "test/**/*"]
}
EOF

echo ""
echo "Estrutura criada com sucesso:"
find "apps/${SERVICE_NAME}" -type f | sort

echo ""
echo "Proximos passos:"
echo "  1. Adicionar '${SERVICE_NAME}' em docs/microsservicos.md com porta ${PORT}"
echo "  2. Implementar entidades em ${BASE}/domain/entities/"
echo "  3. Criar use-cases em ${BASE}/application/use-cases/"
echo "  4. Registrar repositorios em ${BASE}/infrastructure/repositories/"
echo "  5. Adicionar controllers em ${BASE}/presentation/controllers/"
