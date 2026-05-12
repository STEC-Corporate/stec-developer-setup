---
name: kubernetes-validar-kubernetes-manifests
description: Validates Kubernetes manifests with dry-run or kubeconform and checks resources/limits and probes. Use when editing YAML in local/kubernetes or modules/*/manifests in modelo-infrastructure.
---

# Validate Kubernetes Manifests

## Quick start

When editing manifests under `local/kubernetes/` or `modules/*/manifests/`:

1. **Dry-run:** `kubectl apply -f <file> --dry-run=client` (or `server` with cluster access).
2. **Schema (optional):** Use kubeconform if available: `kubeconform -summary <files>`.
3. **Content checks:** Ensure Deployments/StatefulSets have:
   - `resources.requests` and `resources.limits` (memory, cpu)
   - `livenessProbe` and `readinessProbe` (or startupProbe where needed)
   - `securityContext` (e.g. runAsNonRoot, readOnlyRootFilesystem, drop ALL capabilities)

## Checklist

- [ ] Resources and limits defined for all containers.
- [ ] Health probes configured.
- [ ] Security context aligned with .cursorrules (non-root, capability drop).

## References

- Project: `.cursorrules` (Kubernetes YAML section)
- Manifests: `local/kubernetes/`, `modules/*/manifests/`

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
