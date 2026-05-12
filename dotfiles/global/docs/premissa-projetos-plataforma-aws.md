# Premissa: Template fora da AWS e sem estrutura Terraform

Este documento define a premissa que todos os agentes e fluxos de trabalho devem manter no contexto.

## Premissa

**O único projeto que não é provisionado na AWS é o Template (soundlink-template-frontend).**

- **Template (soundlink-template-frontend):**
  - Não é provisionado na AWS.
  - **Não deve conter estrutura Terraform.**
  - Não faz deploy para Dev, Hom ou Prd.
  - Papel: referência de fluxos, telas e specs; migração para o Frontend Oficial.

- **Demais projetos (Infrastructure, APIs, BFF, Frontend Oficial):**
  - São provisionados ou implantados na AWS.
  - **Infrastructure** contém e utiliza estrutura Terraform (este repositório).
  - APIs, BFF e Frontend Oficial não possuem Terraform; apenas CI/CD para build e deploy no EKS.

## Aplicação

- Não gerar Terraform nem workflows de deploy para a AWS no repositório Template.
- Ao sugerir ou gerar estrutura Terraform ou pipelines de deploy AWS, aplicar apenas aos repositórios: soundlink-infrastructure, soundlink-api, soundlink-bff, soundlink-frontend.

## Referência de paths

Paths dos projetos: ver arquivo de referência em  
`soundlink-template-frontend/docs/referencia/migracao/projetos-plataforma-paths-jesus.md`  
(path de exemplo: `/home/jesus/Projetos/soundlink-template-frontend/docs/referencia/migracao/projetos-plataforma-paths-jesus.md`).

Ver também: [mapeamento-projetos-plataforma.md](mapeamento-projetos-plataforma.md).
