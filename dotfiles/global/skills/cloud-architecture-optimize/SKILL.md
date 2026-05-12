---
name: cloud-architecture-optimize
description: Otimização multi-pilar (custo, segurança, performance, operação) para arquiteturas cloud. Usar com o agent cloud-architecture-optimize-guia.
---

# Skill: Otimização de arquitetura cloud

## Pilares (checklist)

| Pilar | Perguntas |
|-------|-----------|
| **Custo** | Recursos ociosos? Reservas possíveis? Dados em tier errado? |
| **Segurança** | Menor privilégio? Dados encriptados em repouso e em trânsito? Superfície pública mínima? |
| **Performance** | Latência entre AZ/região? Cache e CDN? Limites de quota? |
| **Operação** | Backup, DR, observabilidade, runbooks implícitos? |

## Saída

- Lista priorizada `P0` / `P1` / `P2` com **trade-off** por item.
- Custos quantitativos: delegar ou combinar com **cloud-finops-guia**.

## Agente

- **[cloud-architecture-optimize-guia](../../agents/cloud-architecture-optimize-guia.md)**
