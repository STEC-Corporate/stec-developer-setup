---
name: replicacao-buscar-from-model
description: Busca documentos/itens do Modelo para o projeto atual (definições de negócio, padrões de mercado, processos internos da holding). Usada por replicacao-atualizacoes-modelo.
---

# Buscar do Modelo

## Quando Usar

- Quando replicacao-atualizacoes-modelo precisa buscar documentos ou itens do Modelo
- Quando o projeto precisa de atualizações ou documentos do Modelo
- Todo projeto deve ter capacidade de buscar do Modelo

**Modelo** (path canônico): `/home/jesus/Projetos/Holding-STEC-Template`. Ao mencionar "o modelo", usar este path.

## Princípio Invariável

**O Modelo é somente leitura.** Esta skill COPIA. Nunca modifica o Modelo.

## Processo

### 1. Validar paths

- **Origem**: Modelo (`/home/jesus/Projetos/Holding-STEC-Template`)
- **Destino**: projeto atual (path do workspace)

### 2. Identificar o que buscar

- Atualizações gerais: comparar estrutura e copiar itens novos ou alterados
- Documento específico: copiar arquivo ou pasta indicada
- Por categoria: definições de negócio, padrões de mercado, processos internos

### 3. Copiar

- LER do Modelo
- ESCREVER no projeto atual
- Preservar estrutura relativa
- Não copiar node_modules, .git, .next, dist

### 4. Retornar saída

```json
{
  "success": true,
  "itemsCopied": ["path/to/item1", "path/to/item2"],
  "outputPath": "/path/to/projeto-atual"
}
```

## Exemplo

**Origem**: Modelo (Holding-STEC-Template)  
**Destino**: Projeto atual  
**Resultado**: Documentos copiados para o projeto. Modelo intacto.

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

