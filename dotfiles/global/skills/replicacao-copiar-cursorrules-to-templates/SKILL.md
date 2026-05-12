---
name: replicacao-copiar-cursorrules-to-templates
description: Fluxo A apenas. Copia .cursorrules dos 5 projetos para docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/dev/cursorrules-templates/ no Modelo, renomeando por tipo de software (template-frontend, frontend, bff, api, infrastructure). Para reconhecimento da tecnologia por humanos e agents.
---

# Copiar .cursorrules dos 5 Projetos para Templates

## Quando Usar

- Apenas no **Fluxo A** (destino = Modelo), invocada pelo orquestrador após o planejamento-config-ia (ou quando o destino for o Modelo e os paths dos 5 projetos estiverem disponíveis).
- Objetivo: definir a tecnologia de cada arquivo para reconhecimento por humanos e agents. O conteúdo do .cursorrules reflete a stack do projeto e pode servir como base para renomear ou validar o nome em versões futuras.

## Princípio

Projetos fonte somente leitura. A skill apenas **lê** o .cursorrules de cada projeto e **escreve** no destino com nome que indica o tipo de software.

## Contrato

### Input

- **destinationPath** (obrigatório): path absoluto do Modelo (ex.: `/home/jesus/Projetos/Holding-STEC-Template`).
- **projectPaths** (opcional): mapa ou array projeto → path; se omitido, usar os paths canônicos de [projetos-plataforma-paths-jesus.md](../../docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/projetos-plataforma-paths-jesus.md).

### Mapeamento projeto → nome do arquivo no destino

| Projeto (repositório) | Tipo de software | Nome do arquivo |
|----------------------|------------------|-----------------|
| soundlink-template-frontend | template-frontend | cursorrules-template-frontend.md |
| soundlink-frontend | frontend | cursorrules-frontend.md |
| soundlink-bff | bff | cursorrules-bff.md |
| soundlink-api | api | cursorrules-api.md |
| soundlink-infrastructure | infrastructure | cursorrules-infrastructure.md |

Paths canônicos (exemplo): `/home/jesus/Projetos/soundlink-template-frontend`, `/home/jesus/Projetos/soundlink-frontend`, `/home/jesus/Projetos/soundlink-bff`, `/home/jesus/Projetos/soundlink-api`, `/home/jesus/Projetos/soundlink-infrastructure`. Ajustar o prefixo (ex.: `/home/jesus/Projetos/`) conforme o ambiente; o nome do repositório identifica o projeto.

### Processo

1. **Resolver pasta de destino**: `[destinationPath]/docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/dev/cursorrules-templates/`. Criar a pasta se não existir.
2. **Para cada um dos 5 projetos** (na ordem da tabela acima):
   - Ler o arquivo `.cursorrules` na raiz do projeto (ex.: `[projectPath]/.cursorrules`).
   - Se não existir: registrar aviso e pular esse projeto.
   - Gravar no destino com o nome correspondente (ex.: cursorrules-template-frontend.md). Conteúdo = conteúdo do .cursorrules de origem, sem alteração nesta skill (substitute-soundlink-in-destination roda depois no fluxo).
3. Retornar saída de sucesso.

### Saída

```json
{
  "success": true,
  "outputPath": "[destinationPath]/docs/gestao-ideias/04-referencia-tecnica/_templates/referencia/dev/cursorrules-templates/",
  "nextAgent": "planejamento-estrutura"
}
```

Em caso de erro (destino inacessível, falha de escrita): `{ "success": false, "error": "descrição" }`. Se algum projeto não tiver .cursorrules, registrar aviso mas não falhar (success true; listar projetos omitidos na saída se desejável).

## Ordem no fluxo

Executada **após** planejamento-config-ia e **antes** de planejamento-estrutura. Apenas no Fluxo A.

## Referência

- Paths dos 5 projetos: [docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/projetos-plataforma-paths-jesus.md](../../docs/gestao-ideias/04-referencia-tecnica/referencia/migracao/projetos-plataforma-paths-jesus.md)
- Fluxo A: [docs/gestao-ideias/00-governanca/ia/template-replication-flow.md](../../docs/gestao-ideias/00-governanca/ia/template-replication-flow.md)

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

