# Catálogo cloud — agents, skills e rules

> **Estado:** ATIVO | **Data:** 2026-04-07  
> **Prefixo de agents:** `cloud-{provedor}-{familia}-guia` (provedores transversais: `cloud-architecture-*-guia`, `cloud-finops-guia`)  
> **Prefixo de skills:** `skills/cloud-{provedor}-{familia}/`  
> **Prefixo de rules:** `rules/cloud-*.mdc`

Agents `cloud-*` tratam **provedor concreto, família de serviços e tarefas repetíveis** em IaC e operações. Para decisões macro de forma do sistema (monólito, eventos, etc.), usar `arch-*-guia`. Matriz de arquitetura abstrata: [catalogo-arch-agents-ia.md](catalogo-arch-agents-ia.md).

## Legenda de estado

| Estado        | Significado                                      |
|---------------|--------------------------------------------------|
| experimental  | Primeira onda; revisar equivalências trimestralmente |
| skeleton      | Provedor nacional / doc limitada — validar na fonte |

## Provedores (`{provedor}`)

| Slug   | Nome / notas |
|--------|----------------|
| `aws`  | Amazon Web Services |
| `gcp`  | Google Cloud Platform |
| `azure`| Microsoft Azure |
| `oci`  | Oracle Cloud Infrastructure |
| `magalu` | Magalu Cloud (BR) |
| `lwsa` | Nuvem LWSA (BR) |

## Famílias canônicas (`{familia}`)

| Família | Âmbito resumido |
|---------|-----------------|
| `compute` | VMs, auto scaling, funções geridas, App Runner / equivalentes |
| `containers` | Orquestração de contentores, registries |
| `serverless` | FaaS + integração API/eventos |
| `storage` | Objeto, bloco, arquivos |
| `datastores` | SQL, NoSQL, cache |
| `networking-edge` | Rede, LB, CDN, DNS |
| `identity-security` | IAM, KMS, segredos, identidade de cargas |
| `messaging-events` | Filas, tópicos, barramento de eventos |
| `observability` | Métricas, logs, traces |
| `cicd-devops` | Pipelines e automação de deploy no provedor |

## Agents transversais (sem `provedor` no nome)

| Agent | Skill | Função |
|-------|-------|--------|
| [cloud-architecture-discover-guia](../../agents/cloud-architecture-discover-guia.md) | `cloud-architecture-discover` | Inventário a partir de IaC, K8s, código |
| [cloud-architecture-diagram-guia](../../agents/cloud-architecture-diagram-guia.md) | `cloud-architecture-diagram` | Diagramas (Mermaid / C4) |
| [cloud-architecture-optimize-guia](../../agents/cloud-architecture-optimize-guia.md) | `cloud-architecture-optimize` | Custo, segurança, performance, operação |
| [cloud-finops-guia](../../agents/cloud-finops-guia.md) | `cloud-finops` | Estimativas, etiquetas, reservas vs on-demand |

## Matriz (provedor × família)

Cada célula: `agents/cloud-{p}-{f}-guia.md` + `skills/cloud-{p}-{f}/SKILL.md`.

| Família / Provedor | aws | gcp | azure | oci | magalu | lwsa |
|--------------------|-----|-----|-------|-----|--------|------|
| compute | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| containers | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| serverless | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| storage | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| datastores | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| networking-edge | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| identity-security | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| messaging-events | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| observability | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |
| cicd-devops | ✓ | ✓ | ✓ | ✓ | skeleton | skeleton |

## Rules

| Rule | Tema |
|------|------|
| [cloud-finops.mdc](../../rules/cloud-finops.mdc) | Custos, etiquetas, revisão FinOps |
| [cloud-security-baseline.mdc](../../rules/cloud-security-baseline.mdc) | Segredos, encryption, IAM mínimo |
| [cloud-performance.mdc](../../rules/cloud-performance.mdc) | Latência, escala, caching |
| [cloud-architecture-review.mdc](../../rules/cloud-architecture-review.mdc) | PRs de infra — uso dos agents transversais |

## Automação opcional (FinOps / custo)

- **Infracost:** CLI e integração CI — ver [infracost.io](https://www.infracost.io/); a skill [cloud-finops](../../skills/cloud-finops/SKILL.md) descreve `infracost breakdown`.
- **Pricing APIs:** AWS Price List API, Azure Retail Prices API, GCP Cloud Billing API — uso típico em **scripts ou pipeline** com credenciais de leitura; não fazem parte do agente em chat sem MCP/ferramenta.
- **MCP:** se o projeto consumidor tiver `mcp-fleet-routing` ou MCP dedicado a billing, registrar o endpoint e política de secrets no repositório da aplicação (arquivo típico: `rules/mcp-fleet-routing.mdc` quando existir).

## Notas

- Equivalências entre provedores são **orientativas**; validar sempre na documentação oficial na data do projeto.
- Preços: separar **estimativa** de **valor validado** (calculadora oficial, Infracost, ou Pricing API com credenciais).
- Provedores `magalu` e `lwsa`: conteúdo incremental; citar fontes oficiais ao atualizar.
- Regeneração em massa dos pares provedor×família: skill [catalogo-cloud-providers-ia](../../skills/catalogo-cloud-providers-ia/SKILL.md) — script [`generate-cloud-agents-skills.py`](../../skills/catalogo-cloud-providers-ia/scripts/generate-cloud-agents-skills.py) (opcional).
