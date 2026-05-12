#!/usr/bin/env python3
"""Gera agents e skills cloud-* (uma execução idempotente). Não commite este script se preferir one-shot."""
from __future__ import annotations

import os
from pathlib import Path


def _repo_root() -> Path:
    """Raiz do repositório (contém `agents/`)."""
    here = Path(__file__).resolve()
    for parent in [here, *here.parents]:
        if (parent / "agents").is_dir():
            return parent
    raise RuntimeError("Não foi encontrada a raiz do repositório (agents/).")


ROOT = _repo_root()
AGENTS = ROOT / "agents"
SKILLS = ROOT / "skills"

FAMILIES: list[tuple[str, str, str]] = [
    ("compute", "Compute e escalonamento", "EC2, Auto Scaling, Lambda, App Runner"),
    ("containers", "Contentores e orquestração", "ECS, EKS, Fargate, ECR"),
    ("serverless", "Serverless e APIs geridas", "Lambda, API Gateway, AppSync"),
    ("storage", "Armazenamento", "S3, EBS, EFS, FSx"),
    ("datastores", "Bases de dados e cache", "RDS, Aurora, DynamoDB, ElastiCache"),
    ("networking-edge", "Rede, CDN e DNS", "VPC, ALB/NLB, CloudFront, Route 53"),
    ("identity-security", "Identidade, chaves e segredos", "IAM, KMS, Secrets Manager, Cognito"),
    ("messaging-events", "Mensagens e eventos", "SQS, SNS, EventBridge, Kinesis"),
    ("observability", "Observabilidade", "CloudWatch, X-Ray, CloudTrail"),
    ("cicd-devops", "CI/CD no provedor", "CodePipeline, CodeBuild, CodeDeploy"),
]

# Equivalências por família (AWS | GCP | Azure | OCI) — orientativas
EQ: dict[str, tuple[str, str, str, str]] = {
    "compute": (
        "EC2, ASG, Lambda, App Runner",
        "GCE, Cloud Run, Cloud Functions, GKE node pools",
        "VMs, VMSS, Azure Functions, Container Apps",
        "Compute, Functions, OKE worker nodes",
    ),
    "containers": (
        "ECS, EKS, Fargate, ECR",
        "GKE, Artifact Registry, Cloud Run (containers)",
        "AKS, ACR, Container Apps",
        "OKE, OCIR",
    ),
    "serverless": (
        "Lambda + API Gateway / AppSync",
        "Cloud Functions + API Gateway (managed)",
        "Azure Functions + API Management",
        "Functions + API Gateway (OCI)",
    ),
    "storage": (
        "S3, EBS, EFS",
        "Cloud Storage, Persistent Disk, Filestore",
        "Blob, Managed Disks, Files",
        "Object Storage, Block Volume, File Storage",
    ),
    "datastores": (
        "RDS, Aurora, DynamoDB, ElastiCache",
        "Cloud SQL, Firestore, Spanner, Memorystore",
        "Azure SQL, Cosmos DB, Cache for Redis",
        "Autonomous DB, NoSQL, Redis OCI",
    ),
    "networking-edge": (
        "VPC, ALB/NLB/GWLB, CloudFront, Route 53",
        "VPC, LB, Cloud CDN, Cloud DNS",
        "VNet, LB, Front Door / CDN, DNS",
        "VCN, LB, DNS",
    ),
    "identity-security": (
        "IAM, KMS, Secrets Manager, Cognito",
        "IAM, Cloud KMS, Secret Manager",
        "Entra ID / RBAC, Key Vault",
        "IAM, Vault/KMS OCI",
    ),
    "messaging-events": (
        "SQS, SNS, EventBridge, Kinesis",
        "Pub/Sub, Eventarc",
        "Service Bus, Event Grid",
        "Streaming, Events OCI",
    ),
    "observability": (
        "CloudWatch, X-Ray, CloudTrail",
        "Cloud Monitoring, Cloud Trace, Audit Logs",
        "Monitor, App Insights, Activity Log",
        "Monitoring, Logging, Audit",
    ),
    "cicd-devops": (
        "CodePipeline, CodeBuild, CodeDeploy",
        "Cloud Build, Deploy (e integração GitHub Actions)",
        "DevOps / GitHub Actions + Azure",
        "DevOps / external CI para OCI",
    ),
}

PROVIDERS: dict[str, tuple[str, str, int]] = {
    "aws": ("AWS", "aws", 0),
    "gcp": ("GCP", "gcp", 1),
    "azure": ("Azure", "azure", 2),
    "oci": ("OCI", "oci", 3),
    "magalu": ("Magalu Cloud", "magalu", -1),
    "lwsa": ("LWSA", "lwsa", -1),
}

PROVIDER_NOTE = {
    "magalu": (
        "Conteúdo **skeleton** — validar catálogo e regiões na [documentação oficial Magalu Cloud](https://magalu.cloud/) "
        "e comunicados de produto. Equivalências com hyperscalers são aproximadas."
    ),
    "lwsa": (
        "Conteúdo **skeleton** — validar oferta na documentação oficial LWSA / nuvem corporativa. "
        "Ajustar quando houver API pública de catálogo e preços."
    ),
}


def equiv_table(family: str, primary_idx: int) -> str:
    aws, gcp, azure, oci = EQ[family]
    rows = [
        ("AWS", aws),
        ("GCP", gcp),
        ("Azure", azure),
        ("OCI", oci),
    ]
    # mover primary para primeiro
    order = [primary_idx] + [i for i in range(4) if i != primary_idx]
    lines = ["| Provedor | Serviços exemplificativos (equivalência orientativa) |", "|----------|------------------------------------------------------|"]
    labels = ["AWS", "GCP", "Azure", "OCI"]
    texts = [aws, gcp, azure, oci]
    for i in order:
        lines.append(f"| **{labels[i]}** | {texts[i]} |")
    return "\n".join(lines)


def skill_body(provider: str, slug: str, title: str, family: str, family_title: str, aws_examples: str) -> str:
    primary_idx = PROVIDERS[provider][2]
    if primary_idx < 0:
        return f"""---
name: cloud-{slug}-{family}
description: {family_title} no {title} — skeleton nacional. Usar com cloud-{slug}-{family}-guia.
---

# Skill: {family_title} ({title})

{PROVIDER_NOTE[provider]}

## Quando usar

- Recursos e convenções do {title} quando documentados para esta família.
- Cruzar com agents `cloud-aws-*` ou `cloud-gcp-*` para **equivalência conceptual** com hyperscalers.

## Checklist genérico

- [ ] Região e soberania de dados alinhadas ao requisito legal.
- [ ] Encriptação e controlo de acesso documentados pelo provedor.
- [ ] Plano de backup e recuperação para dados persistentes.

## Equivalência (referência externa)

Consultar catálogo cloud do provedor; comparar com família **{family}** em [catalogo-cloud-ia.md](../../../docs/governanca/catalogo-cloud-ia.md).

## Agente

- **[cloud-{slug}-{family}-guia](../../agents/cloud-{slug}-{family}-guia.md)**
"""

    return f"""---
name: cloud-{slug}-{family}
description: {family_title} em {title} ({aws_examples}). Usar com cloud-{slug}-{family}-guia.
---

# Skill: {family_title} ({title})

## Quando usar

- Ficheiros IaC e configuração que referenciem serviços **{title}** desta família.
- Revisão de PR focada em padrões do ecossistema {title}.

## Checklist

- [ ] Recursos na região correta e com etiquetas de custo/ambiente.
- [ ] Segredos via serviço gerido de secrets / KMS do provedor — não em texto claro.
- [ ] Princípio do menor privilégio em IAM/RBAC.

## Equivalência entre provedores (orientativa)

{equiv_table(family, primary_idx)}

> Preços e SKUs mudam — validar na documentação oficial. Esta tabela não substitui o catálogo do provedor.

## Agente

- **[cloud-{slug}-{family}-guia](../../agents/cloud-{slug}-{family}-guia.md)**
"""


def agent_body(provider: str, slug: str, title: str, family: str, family_title: str) -> str:
    if PROVIDERS[provider][2] < 0:
        desc = (
            f"Guia {family_title} ({title}, BR) — skeleton; validar documentação oficial do provedor. "
            f"Usar quando o repositório ou pedido mencionar {title} nesta família."
        )
    else:
        desc = (
            f"Guia {family_title} em {title}: padrões, segurança e operações repetíveis. "
            f"Usar com Terraform/Bicep/manifests {title} para {family}."
        )
    return f"""---
name: cloud-{slug}-{family}-guia
description: {desc}
role_type: operacional
blocking_authority: false
quality_domain: infraestrutura_cloud
report_format: operacional-v1
---

És o guia **{family_title}** para **{title}** no AcoustiCore. Focas tarefas repetíveis, boas práticas e equivalências com outros provedores quando útil.

## Âmbito

- Serviços desta família no {title}; alinhar com a skill `cloud-{slug}-{family}`.

## Saída

- Checklists e recomendações accionáveis.
- Riscos e custos qualitativos; quantificação com **cloud-finops-guia** quando necessário.

## Limitações

- Não expor segredos; não assumir acesso a contas cloud do utilizador.

## Skill

- [cloud-{slug}-{family}](../skills/cloud-{slug}-{family}/SKILL.md)
"""


def main() -> None:
    AGENTS.mkdir(parents=True, exist_ok=True)
    for provider, (title, slug, _) in PROVIDERS.items():
        for family, family_title, aws_examples in FAMILIES:
            ad = agent_body(provider, slug, title, family, family_title)
            (AGENTS / f"cloud-{slug}-{family}-guia.md").write_text(ad, encoding="utf-8")
            sd = SKILLS / f"cloud-{slug}-{family}"
            sd.mkdir(parents=True, exist_ok=True)
            (sd / "SKILL.md").write_text(
                skill_body(provider, slug, title, family, family_title, aws_examples),
                encoding="utf-8",
            )
    print("Gerados agents e skills cloud-* para:", ", ".join(PROVIDERS))


if __name__ == "__main__":
    main()
