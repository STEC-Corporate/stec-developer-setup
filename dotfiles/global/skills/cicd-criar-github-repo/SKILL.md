---
name: cicd-criar-github-repo
description: Cria repositório na organização GitHub via API/CLI; inicializa pasta local com git e remote. Use quando for necessário criar um novo repositório para um projeto de negócio.
---

# Criar Repositório GitHub

## Quando Usar

- Ao criar um novo repositório para ideia de negócio da holding
- Quando o fluxo de replicação precisa de um destino novo (não existente)
- Integração com cicd-repo-github agent

## Pré-requisitos

- GitHub CLI (`gh`) instalado e autenticado, OU token de API com permissões
- Permissões para criar repositórios na organização
- Nome do projeto e organização GitHub

## Processo

### 1. Validar inputs

- **Nome do projeto**: único, sem espaços, kebab-case ou PascalCase
- **Organização**: existente e com permissão
- **Path local (opcional)**: pasta onde clonar/inicializar

### 2. Criar repositório via GitHub

```bash
gh repo create [org]/[nome-projeto] --private --source=. --remote=origin
```

Ou via API: `POST /orgs/[org]/repos` com body `{ "name": "[nome-projeto]", "private": true }`

### 3. Inicializar pasta local (se não existir)

```bash
mkdir -p [path-local]
cd [path-local]
git init
git remote add origin https://github.com/[org]/[nome-projeto].git
```

### 4. Retornar saída estruturada

```json
{
  "success": true,
  "outputPath": "/path/to/local/repo",
  "repoUrl": "https://github.com/[org]/[nome-projeto]",
  "nextAgent": "template-estrutura"
}
```

## Exemplo

**Entrada**: `{ "projectName": "marketplace-tech", "org": "ITSoundLink", "pathLocal": "/home/user/Projetos/marketplace-tech" }`

**Saída**: Repositório criado em github.com/ITSoundLink/marketplace-tech; pasta local com git init e remote configurado.

## Regras

- Nunca sobrescrever repositório existente sem confirmação
- Verificar se `gh` está autenticado antes de executar
- Origens (projetos fonte) nunca são modificadas

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

