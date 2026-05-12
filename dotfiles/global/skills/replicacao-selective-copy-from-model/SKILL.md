---
name: replicacao-selective-copy-from-model
description: Copia itens selecionados do Modelo para o projeto. Usada por replicacao-catalogo-modelo.
---

# Copiar Seletivamente do Modelo

## Quando Usar

- Quando replicacao-catalogo-modelo precisa copiar itens que o usuário escolheu
- Para projetos template trazerem apenas o que precisam do Modelo

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`.

## Princípio Invariável

**O Modelo é somente leitura.** Esta skill COPIA. Nunca modifica o Modelo.

## Processo

### 1. Validar paths

- **Origem**: Modelo (`/home/jesus/Projetos/Holding-STEC-Template`)
- **Destino**: projeto template (path informado)

### 2. Validar lista de itens

- Receber lista de itens selecionados (paths relativos no Modelo)
- Verificar que cada item existe no Modelo

### 3. Copiar cada item

- Para cada item na lista:
  - Copiar arquivo ou pasta do Modelo para o destino
  - Preservar estrutura de pastas relativa
- Não copiar node_modules, .git, .next, dist

### 4. Resolver conflitos

- Se arquivo já existe no destino: sobrescrever ou perguntar ao usuário (padrão: sobrescrever)
- Manter placeholders se necessário (domínio, paths)

### 5. Retornar saída

```json
{
  "success": true,
  "itemsCopied": ["agent1.md", "skills/skill1/SKILL.md"],
  "outputPath": "/path/to/projeto-template",
  "errors": []
}
```

## Exemplo

**Origem**: Modelo  
**Destino**: projeto template  
**Itens**: ["replicacao-atualizacoes-modelo.md", "fetch-from-model/SKILL.md"]  
**Resultado**: Arquivos copiados. Modelo intacto.

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

