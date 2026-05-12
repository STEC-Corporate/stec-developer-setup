---
name: docker-security-policies-docker
description: Applies and validates policies in docker/policies/ and Dockerfile best practices for Modelo. Use when creating or changing Dockerfiles or container security policies.
---

# Security Policies Docker

## Policy location

Project policies: `docker/policies/` (e.g. `security-policies.yaml`). Read and apply these when editing Dockerfiles or CI that builds images.

## Dockerfile best practices (align with .cursorrules)

- Prefer multi-stage builds to reduce image size and surface.
- Run as non-root: use `USER` and ensure base supports it.
- Drop all capabilities when not needed; avoid running as root.
- Prefer explicit base image tags (no `latest` in production).
- Do not embed secrets in layers; use build args or runtime secrets.
- Use `.dockerignore` to exclude unnecessary files.

## Validation

If the project has `docker/scripts/validate-containers.sh` or similar, run it after changes. Integrate Trivy/Snyk in CI when required by `.cursorrules`.

## References

- `docker/templates/` — project Dockerfile templates
- `docker/policies/`
- `.cursorrules` (Security & DevSecOps, container security)

## Quando usar
- Use quando a tarefa estiver alinhada ao objetivo da skill.
- Use quando for necessario padrao tecnico e repetibilidade.

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
