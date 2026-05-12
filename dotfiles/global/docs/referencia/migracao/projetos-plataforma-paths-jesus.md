# Projetos da plataforma SoundLink – paths

Lista dos 5 repositórios da plataforma com path de exemplo (ambiente local). Os paths podem variar por máquina.

---

## Modelo (Path Canônico)

| Papel | Projeto | Path | Descrição |
| ----- | ------- | ---- | --------- |
| **Modelo** | Holding-STEC-Template | `/home/jesus/Projetos/Holding-STEC-Template` | Agrega agents, skills e documentação de todos os projetos da plataforma. Base para projetos template. |

**Regra para agents**: Ao mencionar "Modelo" ou "o modelo", usar sempre o path acima. O Modelo é alimentado pelos 5 projetos da plataforma; projetos template copiam do Modelo (não dos 5 projetos).

---

## Projetos da Plataforma (5 projetos)

| Projeto | Repositório | Path (exemplo local) |
|---------|-------------|------------------------|
| Template | soundlink-template-frontend | `/home/jesus/Projetos/soundlink-template-frontend` |
| Frontend Oficial | soundlink-frontend | `/home/jesus/Projetos/soundlink-frontend` |
| BFF | soundlink-bff | `/home/jesus/Projetos/soundlink-bff` |
| APIs | soundlink-api | `/home/jesus/Projetos/soundlink-api` |
| Infrastructure | soundlink-infrastructure | `/home/jesus/Projetos/soundlink-infrastructure` |

**Nota:** O Template é este repositório; os demais paths seguem a convenção do planejamento de migração. Os 5 projetos alimentam o **Modelo**; o Modelo é a base para projetos template. Projetos com `template-frontend` no nome definem o modelo de negócio. Projetos técnicos consultam o template-frontend para implementação.
