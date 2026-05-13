---
description: Gera configuração Harness para o contexto atual
---

Analise o projeto em $ARGUMENTS e gere configuração Harness completa:

## Pipeline sugerida
- Stages: Build → Test → Security Scan → Deploy
- Environments: dev, staging, production
- Rollback strategy automático

## Considere o stack:
- Java/Spring Boot: mvn clean package
- NestJS/Next.js: npm run build
- Terraform: plan → apply com approval gate em prod
- Docker: build + push para ECR

Inclua variáveis de ambiente, secrets references e health checks.
