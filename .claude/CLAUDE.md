# stec-developer-setup — Harness STEC

## Fórmula
Agent = Model + Harness
Tarefa só está 100% quando: testes ✅ lint ✅ build ✅ sem secrets ✅

## Stack
- Backend: Java 21/Spring, Python, NestJS
- Frontend: Next.js 14, Angular, TypeScript
- Infra: Terraform AWS, Docker local
- CI/CD: GitHub Actions
- Gateway: LLM gateway próprio (MCP + REST)

## Estrutura de agents
- Global: dotfiles/global/agents/ (200+ agents catalogados)
- Skills: dotfiles/global/skills/ (200+ skills)
- Hooks: dotfiles/claude/hooks/
- Scripts: dotfiles/claude/scripts/

## Regras não negociáveis
- Nunca alterar .env, *.production.*, terraform/state/*
- Ideia registrada no TaskLink antes de codificar
- progress.md atualizado ao final de cada sessão
- Um commit por decisão (Conventional Commits)
- HARNESS.md é a referência central: dotfiles/claude/HARNESS.md

## Agents principais (carregar conforme contexto)
- Orquestrador SDD: dotfiles/global/agents/sdd-orquestrador.md
- Java: dotfiles/global/agents/stack-java-guia.md
- NestJS: dotfiles/global/agents/nestjs-especialista.md
- Next.js: dotfiles/global/agents/nextjs-especialista.md
- Arquitetura: dotfiles/global/agents/arquitetura-padroes-ddd.md
- Testes: dotfiles/global/agents/testes-executor.md
- Segurança: dotfiles/global/agents/seguranca-auditor.md
- Debug: dotfiles/global/agents/debug-depurador.md
- CI/CD: dotfiles/global/agents/cicd-quality-gates-advisor.md
- Terraform: dotfiles/global/agents/terraform-arquiteto.md

## Inicialização
1. Leia dotfiles/claude/HARNESS.md
2. Verifique progress.md (se existir)
3. Consulte INDEX.md dos agents: dotfiles/global/agents/INDEX.md
