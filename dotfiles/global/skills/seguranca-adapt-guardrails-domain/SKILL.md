---
name: seguranca-adapt-guardrails-domain
description: Adapta guardrails.md ao novo domínio. Remove referências SoundLink, injeta princípios do negócio. Use ao replicar template para outro domínio/negócio.
---

# Adaptar Guardrails ao Domínio

## Quando Usar

- Ao replicar template para Holding-STEC-Template ou novo negócio
- Quando seguranca-adaptador-guardrails agent precisa adaptar princípios
- Sempre que o destino tiver domínio diferente do SoundLink

## Processo

### 1. Ler guardrails da origem

- Arquivo docs/gestao-ideias/00-governanca/ia/guardrails.md do Template

### 2. Coletar inputs do novo domínio

- **projectName** (obrigatório): passado pelo seguranca-adaptador-guardrails/orquestrador. Valor que substituirá "SoundLink" no conteúdo (Fluxo A = "Modelo"; Fluxo B = nome do projeto).
- Descrição do negócio
- Princípios invioláveis específicos
- Proibições do domínio

### 3. Adaptar conteúdo

- Substituir SoundLink por **projectName** (recebido no passo 2)
- Injetar princípios fornecidos
- Manter estrutura de seções

### 4. Escrever no destino

- docs/gestao-ideias/00-governanca/ia/guardrails.md no path do destino

### 5. Retornar saída

```json
{
  "success": true,
  "outputPath": "/path/to/destino/docs/gestao-ideias/00-governanca/ia/guardrails.md",
  "nextAgent": "template-copiador"
}
```

## Exemplo

**Entrada**: projectName=Modelo (ou nome do projeto), domain=Marketplace Tech, principles=[Transparência, Sem manipulação]  
**Saída**: guardrails.md adaptado. Referências SoundLink substituídas por projectName.

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

