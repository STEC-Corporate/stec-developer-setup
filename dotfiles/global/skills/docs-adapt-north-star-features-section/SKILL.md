---
name: docs-adapt-north-star-features-section
description: Após a cópia da estrutura, altera somente o north-star.md no destino substituindo a seção "Como Todas as Features se Conectam" pelo formato template. Executada apenas pelo fluxo de replicação (Fluxo A/B), depois que template-estrutura tiver sido executado com sucesso.
---

# Adaptar Seção "Como Todas as Features se Conectam" no Destino

## Quando Usar

- Apenas pelo fluxo de replicação (Fluxo A ou B), **depois** que o template-estrutura (clone-template-structure) tiver sido executado com sucesso e o arquivo north-star.md já existir no destino.
- Nunca altera o arquivo north-star.md no repositório Template (origem); altera **somente** o arquivo duplicado no destino.

## Princípio

A alteração na seção ocorre **somente no arquivo duplicado (cópia)** e **somente após a duplicação ser executada com sucesso**. O Template permanece intacto.

## Contrato

### Input (obrigatório)

- **destinationPath**: path absoluto do projeto destino (ex.: `/home/jesus/Projetos/Holding-STEC-Template`).

### Processo

1. **Validar**: Garantir que `[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md` existe (a cópia já foi feita).
2. **Ler** o arquivo `[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`.
3. **Localizar** a seção "Como Todas as Features se Conectam": desde o heading `## 🔗 Como Todas as Features se Conectam` até o heading seguinte `## 🚫 O que NÃO é North Star` (excluindo esse segundo heading).
4. **Substituir** somente o conteúdo dessa seção (mantendo o heading `## 🔗 Como Todas as Features se Conectam`) pelo **Conteúdo da seção em formato template** (bloco abaixo).
5. **Gravar** o arquivo de volta em `[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md`.

### Saída

```json
{
  "success": true,
  "outputPath": "[destinationPath]/docs/gestao-ideias/02-execucao/planejamento/metrics/north-star.md",
  "nextAgent": "seguranca-adaptador-guardrails"
}
```

Em caso de erro (arquivo não existe, seção não encontrada, falha de escrita): `{ "success": false, "error": "descrição" }`.

---

## Conteúdo da seção em formato template (substituir no destino)

O bloco abaixo é o conteúdo que deve **substituir** a seção (a partir da linha após `## 🔗 Como Todas as Features se Conectam` até antes de `## 🚫 O que NÃO é North Star`). Incluir o heading da seção na substituição para manter o documento consistente; o que se substitui é todo o conteúdo desde o fim do heading da seção até o início do próximo `##`.

**Texto a inserir** (entre `## 🔗 Como Todas as Features se Conectam` e `## 🚫 O que NÃO é North Star`):

```markdown
Cada feature do produto deve ser listada abaixo em blocos padronizados. Use sempre os campos **Conexão**, **Impacto na North Star** e **KPI de validação** para manter um padrão reconhecível e permitir ajustes posteriores.

### Bloco padrão (repetir para cada feature)

- **Conexão**: (uma linha)
- **Impacto na North Star**: (lista ou parágrafo)
- **KPI de validação**: (métrica)

---

### [Exemplo: Sistema de Busca e Ranking]

**Conexão**: Ranking baseado em mérito → Melhores resultados aparecem primeiro.

**Impacto na North Star**:
- Bom ranking = Match adequado
- Match adequado = Resultado bem-sucedido
- Resultado bem-sucedido = Avaliação positiva ✅

**KPI de validação**: Taxa de conversão proposta→aceite

---

### [Nome da próxima feature]

**Conexão**: (descrever como esta feature se conecta à North Star)

**Impacto na North Star**: (listar elos de causa-efeito até a métrica)

**KPI de validação**: (métrica para validar)

---

(Adicionar novos blocos conforme as features do projeto, seguindo o padrão acima.)
```

## Ordem no fluxo

Este passo deve ser executado **logo após** o template-estrutura (após a duplicação ser concluída com sucesso) e **antes** do seguranca-adaptador-guardrails. O orquestrador invoca esta skill com `destinationPath` e só avança para seguranca-adaptador-guardrails se `success === true`.

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

