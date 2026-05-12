---
name: replicacao-substitute-soundlink-in-destination
description: Pós-processa arquivos no destino substituindo SoundLink/soundlink pelo nome do projeto. Usado pelo orquestrador ao final do fluxo de replicação (Fluxo A e B).
---

# Substituir SoundLink no Destino

## Quando Usar

- Apenas pelo **replicacao-orquestrador-template**, ao final do fluxo de replicação (após replicacao-verificador-template e, no Fluxo A, após generate-modelo-readme).
- Nunca invocar manualmente fora do contexto de replicação.

## Contrato

### Inputs (obrigatórios)

- **destinationPath**: path absoluto do projeto destino (ex.: `/home/jesus/Projetos/Holding-STEC-Template`).
- **projectName**: string que substituirá "SoundLink" (Fluxo A = "Modelo"; Fluxo B = nome informado pelo usuário ou perguntado na primeira ação).

### Processo

1. **Validar**: Garantir que `destinationPath` existe e contém `docs/` e `.cursor/` (ou pelo menos um deles).
2. **Percorrer** recursivamente:
   - `[destino]/docs/`
   - `[destino]/.cursor/`
   - Arquivo `[destino]/.cursorrules` (se existir).
3. **Para cada arquivo** com extensão `.md`, `.json`, `.ts`, `.tsx`, `.yml`, `.yaml`, `.txt`:
   - Ler conteúdo como texto (encoding UTF-8).
   - Substituir todas as ocorrências de `SoundLink` por `projectName`.
   - Substituir todas as ocorrências de `soundlink` por `projectName` em minúsculas (ex.: `projectName.toLowerCase()`).
   - Gravar o conteúdo de volta no mesmo arquivo (apenas se houve alteração).
4. **Ignorar**: pastas `node_modules`, `.git`, `_model` (e conteúdo dentro delas). Não processar binários.

### Saída

```json
{
  "success": true,
  "outputPath": "[destinationPath]",
  "nextAgent": null
}
```

Em caso de falha (path inválido, erro de leitura/escrita): `{ "success": false, "errors": ["descrição"] }`.

## Exemplo

**Entrada**: destinationPath = `/home/jesus/Projetos/Holding-STEC-Template`, projectName = `Modelo`  
**Resultado**: Todos os arquivos de texto em docs/, .cursor/ e .cursorrules no destino passam a exibir "Modelo" no lugar de "SoundLink" e "modelo" no lugar de "soundlink".

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

