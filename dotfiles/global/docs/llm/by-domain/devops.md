---
domain: devops
keywords: Docker, Kubernetes, CI/CD, Terraform, pipeline, deploy, Helm, infra, GitOps, Ansible, ArgoCD, observabilidade
complexity: medium
---

## Recomendação por IDE

### Claude Code
- **Primary:** claude-sonnet-4-6
- **Razão:** Excelente para Dockerfiles, manifestos Kubernetes, pipelines CI/CD e IaC Terraform

### Cursor IDE
- **Primary:** claude-sonnet-4-6
- **Budget Cursor:** claude-haiku-4-5 (para scripts shell simples, ajustes de YAML)
- **Quando Haiku:** Formatação de YAML, geração de Makefiles, scripts de deploy simples

### Codex (gpt-5.5)
- **Atual:** gpt-5.5 ✅ adequado — bem afinado com Docker e Kubernetes
- **Upgrade recomendado:** — (gpt-5.5 já é excelente para DevOps padrão)
- **Migração sugerida:** → Claude Code para infraestruturas complexas multi-cloud

---

## Alternativas por Tier

### Equivalent (mesma qualidade, outro provedor)
| Modelo | Custo/M | Por que usar |
|--------|---------|-------------|
| gpt-5.4 | $8.75 | Alta precisão para pipelines críticos de produção |
| gemini-2.5-pro | $5.63 | Integração com Google Cloud/GKE |

### Budget
| Modelo | Custo/M | Quando usar |
|--------|---------|-------------|
| kimi-k2 | ~$0.15 | Geração de configurações IaC em volume |
| qwen3-235b | $1.72 | Review de manifestos e pipelines |

### Open-source
| Modelo | Licença | Notas |
|--------|---------|-------|
| deepseek-r1 | MIT | DevOps on-premise para ambientes air-gapped |
| mistral-large-2 | Apache 2.0 | Boa para scripts de automação |
