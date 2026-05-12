# Skills do projeto

Skills são instruções reutilizáveis que o agente do Cursor carrega como contexto para saber **como** executar uma tarefa (formato, passos, scripts).

## Estrutura de uma skill

Cada skill fica em uma **pasta** com o nome da skill (kebab-case). Arquivos:

```
nome-da-skill/
├── SKILL.md         # Obrigatório — frontmatter + instruções
├── README.md        # Obrigatório neste projeto — origem e rastreabilidade
├── reference.md     # Opcional — documentação detalhada
├── examples.md      # Opcional — exemplos de uso
└── scripts/         # Opcional — scripts auxiliares
```

## Como criar uma nova skill

1. Crie a pasta: `.cursor/skills/nome-da-skill/`
2. Crie o arquivo `SKILL.md` com:
   - **Frontmatter YAML:** `name` (kebab-case, máx. 64 caracteres) e `description` (terceira pessoa; O QUE faz e QUANDO usar; máx. 1024 caracteres)
   - **Corpo:** Instruções em Markdown (passos, exemplos, referências)
3. Mantenha o `SKILL.md` conciso (idealmente &lt; 500 linhas). Detalhes vão em `reference.md` ou `examples.md`.
4. Use a skill oficial do Cursor **create-skill** como referência para descrições e boas práticas.

## Descrição (description)

A descrição é usada pelo agente para decidir **quando** aplicar a skill. Inclua:

- **O quê** a skill faz (capacidades concretas)
- **Quando** usar (cenários, tipos de arquivo, palavras-chave que acionam)

Exemplo: *"Valida módulos Terraform com terraform fmt e validate. Use ao editar arquivos .tf ou criar módulos."*

## Modelo

Use a skill de exemplo em [code-example-skill/SKILL.md](code-example-skill/SKILL.md) como modelo mínimo para novas skills.

## Organização atual

As skills foram reorganizadas para padrão funcional `${prefixo}-${papel}` e consolidadas por função:

- **Agentes:** em [.cursor/agents/](../agents/) com prefixos funcionais.
- **Skills:** em `.cursor/skills/` com nomes canônicos (ex.: `code-consultar-regras-para-correcao`, `testes-executar-testes`, `seguranca-validar-guardrails`).
- **Rastreabilidade:** cada skill possui `README.md` com metadados de origem e status de migração.

## Gates de qualidade

Skills criadas para validação transversal:
- `gate-arquitetura`
- `gate-testes`
- `gate-seguranca`
- `gate-ci`

## Prefixos tecnologicos por stack

Skills tecnologicas devem usar prefixo de stack:
- `java-`, `kotlin-`, `python-`, `typescript-`, `react-`, `react-native-`, `nextjs-`, `nestjs-`

Exemplos MVP:
- `java-workflow-base`, `kotlin-workflow-base`, `python-workflow-base`, `typescript-workflow-base`
- `react-workflow-base`, `react-native-workflow-base`, `nextjs-workflow-base`, `nestjs-workflow-base`

---

## Conteúdo incorporado de AI-Develop-Resources

Material do **AI-Develop-Resources** que complementa este índice local (STEC) sem substituir as convenções acima.

**Índice mestre (origem):** [INDEX.md](INDEX.md)

### Estrutura típica (referência compacta)

```
skills/
  nome-da-skill/
    SKILL.md      # obrigatório (frontmatter + instruções)
    README.md     # opcional (metadados, origem)
    reference.md  # opcional
```

### Frontmatter mínimo em SKILL.md (origem)

```yaml
---
name: nome-da-skill
description: O que faz e quando usar (terceira pessoa, termos pesquisáveis).
---
```

Neste repositório-fonte, as skills vivem em `skills/`; quando consumido como submodule no projeto pai, ficam acessíveis em `.cursor/skills/`.
