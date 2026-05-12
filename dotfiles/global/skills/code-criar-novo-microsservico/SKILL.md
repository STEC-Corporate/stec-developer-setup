---
name: code-criar-novo-microsservico
description: Scaffold de novo microsservico em apps com estrutura Clean Architecture.
---

# criar-novo-microsservico

## Quando usar

Adicionar novo servico API ao monorepo.

## Documentos

.cursorrules, Docs/microsservicos.md, estrutura em apps/.

## Passos

1. Definir nome do servico e porta em `docs/microsservicos.md`.
2. Executar o script de scaffold: `scripts/scaffold-microsservico.sh <nome-do-servico> [porta]`
3. Revisar estrutura gerada e ajustar conforme dominio.
4. Implementar entidades em `domain/entities/`, use-cases em `application/use-cases/`, repositorios em `infrastructure/repositories/` e controllers em `presentation/controllers/`.
5. Adicionar health check e Swagger (ja inclusos no scaffold base).
6. Respeitar regras de dependencia: Domain independente; Application depende de Domain; Infrastructure implementa interfaces; Presentation chama Application.

## Script de scaffold

```bash
# Gera toda a estrutura de pastas e arquivos base do microsservico
./skills/code-criar-novo-microsservico/scripts/scaffold-microsservico.sh <nome-do-servico> <porta>
# Exemplo:
./skills/code-criar-novo-microsservico/scripts/scaffold-microsservico.sh user-service 3001
```

Consultar `references/clean-architecture-layers.md` para detalhes das camadas e regras de dependencia.

## Saida

Estrutura de pastas e arquivos minimos em `apps/{nome-do-servico}/`. Sem violar Clean Architecture.

## Pre-condicoes
- Escopo e contexto da tarefa definidos.
- Arquivos-alvo identificados.
- Criterios de aceite minimos estabelecidos.

## Checklist de saida
- Resultado entregue e verificavel.
- Evidencias objetivas registradas.
- Riscos e proximos passos documentados.

## Cobertura de stack e dominio
- Stacks suportadas: Java, Kotlin, Python, TypeScript, React, React Native, NextJS, NestJS.
- Dominios: backend, frontend e mobile.

