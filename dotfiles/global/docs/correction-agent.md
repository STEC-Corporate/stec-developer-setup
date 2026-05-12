# Correção automática pós-falha de testes

Este documento define o fluxo de **correção automática** quando a validação (type-check, lint:strict, audit, unit, e2e) falha: diagnóstico alinhado às regras do projeto e **aplicação de correções** no código pelo agent dedicado, com revalidação até passar ou até um limite de iterações.

## Objetivo

Sempre que a execução de testes/validação falhar, o fluxo de correção deve:

1. **Diagnosticar** — produzir relatório alinhado às regras do projeto (quality-guide-on-test-failure).
2. **Aplicar correções** no código quando possível — via agent **apply-fixes-after-quality-guide**.
3. **Revalidar** até passar ou até um limite de iterações.

Meta: **correção automática** de erros de código, mantendo a política de qualidade (zero bugs, zero code smells, zero vulnerabilidades, respeitando allowlist).

## Start (quando o fluxo de correção inicia)

O fluxo de correção inicia quando **qualquer** um destes agents detecta falha em algum passo de validação/teste:

- **commit-and-release** — ao rodar validate + test e algum passo falhar.
- **test-runner** — ao rodar type-check, lint:strict, audit, unit ou e2e e falhar.
- **verifier** — ao rodar as mesmas checagens e falhar.

Ou quando o **usuário** invoca explicitamente o agent de correção (ex.: "corrija os erros de type-check" ou "aplique as correções do quality-guide").

## Agentes envolvidos

- **quality-guide-on-test-failure** — diagnóstico e relatório (causa provável, regras aplicáveis, sugestões). Não aplica correções; apenas orienta.
- **apply-fixes-after-quality-guide** — aplicação de correções. Recebe tipo da falha, saída do comando e relatório do quality-guide; consulta `docs/dev/BASE-CONHECIMENTO-ERROS.md`; aplica soluções documentadas ou, se o erro não estiver na base, busca a correção, analisa, executa e mapeia erro e correção na base; re-executa a validação e reporta.

## Fluxo

1. **Produzir relatório** — quality-guide-on-test-failure (na mesma resposta do agent que detectou a falha).
2. **Invocar o agent de correção** — apply-fixes-after-quality-guide com o tipo da falha, a saída do comando e o relatório do quality-guide.
3. **Agent de correção** — consulta BASE-CONHECIMENTO-ERROS; para cada erro: se na base, aplica a solução; se não, busca → analisa → corrige → mapeia na base. Re-executa a validação.
4. **Se passou** — o caller segue o fluxo normal (commit-and-release segue para changelog/commit/push; test-runner/verifier reportam sucesso).
5. **Se falhou de novo** — o caller repete (relatório + apply-fixes). **A cada N iterações** (ver abaixo), o agente **pergunta ao usuário se deseja continuar**; se não, para e reporta o que restou.

## Parâmetro N e pergunta a cada N iterações

- **N = 10** (número de iterações por bloco; único lugar de verdade; alterar aqui ou no orquestrador). Os agents que fazem o loop (validate-fix-release, commit-and-release, test-runner, verifier) referenciam este valor.
- **Regra:** A cada **N iterações** sem a validação passar, o agente **pergunta ao usuário: "Deseja continuar o fluxo até zero erros?"** Se **sim** → o fluxo continua (próximo bloco de até N iterações ou até passar). Se **não** → para e reporta o que restou; não invoca commit-and-release nem push. Ao parar sem push, o agente **deve** informar: **"Para retomar: invoque o agent validate-fix-release ou commit-and-release."**

## Procedimento de loop (passo a passo)

1. Inicializar **contador de iterações** = 0.
2. Enquanto a **validação completa** (`npm run validate && npm test`) falhar:
   - **Passo 1:** Produzir relatório **quality-guide-on-test-failure** para o tipo de falha atual (type-check | lint:strict | audit | unit | e2e). Passar ao quality-guide a **saída completa** do comando que falhou (stdout + stderr).
   - **Passo 2:** Executar o workflow do **apply-fixes-after-quality-guide** (aplicar correções nos arquivos; reexecutar validação completa; obter resultado passou/falhou).
   - **Passo 3:** Se validação **passou** → sair do loop e seguir para release (commit-and-release passo 3: versão, CHANGELOG, commit, push).
   - **Passo 4:** Se validação **falhou** → incrementar contador. Se contador for **múltiplo de N**, perguntar ao usuário: "Deseja continuar o fluxo até zero erros?" Se **não** → parar e reportar; não fazer commit nem push; incluir a frase de retomada (acima). Se **sim** (ou se ainda não é múltiplo de N) → voltar ao Passo 1.
3. **Qualquer** falha (type-check, lint, audit, test) conta como "validação falhou" e dispara nova iteração. Não parar após corrigir apenas um tipo de falha; se a revalidação falhar de novo (ex.: antes type-check, agora lint), tratar como nova iteração e repetir o procedimento.

## Fluxo automático (obrigatório)

O agente que detecta falha (validate-fix-release, commit-and-release, test-runner ou verifier) deve seguir o **Procedimento de loop** acima (contador, a cada N iterações perguntar, repetir até passar ou usuário dizer não). Na prática, **na mesma execução**:

1. Produzir o relatório do quality-guide (com a **saída completa** do passo que falhou).
2. Executar apply-fixes-after-quality-guide (correções + reexecutar validação completa); obter resultado passou/falhou.
3. Com base no resultado: se **passou** → seguir para envio ao remoto; se **falhou** → incrementar contador, a cada N perguntar ao usuário; se não quiser continuar → parar e reportar **incluindo a frase de retomada**: "Para retomar: invoque o agent validate-fix-release ou commit-and-release."

**Quando a meta for release ou envio ao remoto:** não parar apenas com "sugestão" ao usuário. O agente principal ou o orquestrador deve **concluir o fluxo até o push** quando a validação passar (com perguntas a cada N iterações enquanto falhar).

- **Ponto de entrada recomendado** para "validar, corrigir até zero erros e enviar": **validate-fix-release** (orquestrador). Ele roda testes → guia → correções em loop (com pergunta a cada N iterações) até passar e então invoca commit-and-release para versão, commit e push.
- **commit-and-release**: quando invocado diretamente, faz o mesmo loop com pergunta a cada N; quando invocado pelo orquestrador com validação já aprovada, pula validação e vai direto para versão → commit → push.
- **test-runner** e **verifier**: ao obterem sucesso (inclusive após correções), devem **invocar commit-and-release** para fechar o fluxo com push; em falha usam o mesmo critério (N iterações por bloco, pergunta a cada N).

## Referências

- **Orquestrador (ponto de entrada recomendado):** `.cursor/agents/validate-fix-release.md`
- **Agent de correção:** `.cursor/agents/apply-fixes-after-quality-guide.md`
- **Quality-guide:** `.cursor/agents/quality-guide-on-test-failure.md`
- **Base de conhecimento:** `docs/dev/BASE-CONHECIMENTO-ERROS.md`
- **Política de qualidade:** `.cursor/docs/quality-policy.md`
