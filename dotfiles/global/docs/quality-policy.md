# Política de qualidade – SoundLink Frontend

Objetivo: **zero bugs, zero code smells, zero vulnerabilidades** na validação que antecede release (e, quando aplicável, nas execuções dos agents test-runner e verifier).

## Definição

- **Zero bugs:** type-check sem erros (`tsc --noEmit`); testes unit e e2e passando (sem falhas).
- **Zero code smells:** lint em modo estrito sem erros e sem warnings (`npm run lint:strict` com `--max-warnings 0`).
- **Zero vulnerabilidades:** `npm audit` sem falhas no nível configurado (atualmente `--audit-level=moderate`).

A validação completa usa: `npm run validate && npm test` (type-check, lint:strict, audit, unit tests). Ver skill **executar-testes** e agents **commit-and-release**, **test-runner**, **verifier**.

## Exceções permitidas

1. **Severity low (vulnerabilidades)**  
   Vulnerabilidades de severidade **low** não bloqueiam o release. O script `npm run audit` está configurado com `--audit-level=moderate` no `package.json`, portanto apenas moderate (e superiores) fazem o audit falhar; low é aceito por política.

2. **Allowlist para forçar passagem**  
   Quando existir uma lista de itens conhecidos (ainda não corrigidos) que não devem bloquear a validação, o arquivo de configuração **validation-allowlist** define essa lista. O agent que avalia o resultado da validação (commit-and-release e, quando aplicável, test-runner/verifier) consulta a allowlist; se todos os itens que falharam estiverem na allowlist, a validação pode ser considerada **pass por exceção** (com aviso ao usuário). Caso contrário, a validação falha e o relatório do quality-guide-on-test-failure deve ser produzido.  
   Formato e uso: ver `.cursor/validation-allowlist.json` (ou `docs/dev/validation-allowlist.md`).

## Referências

- **Skill:** `.cursor/skills/executar-testes/SKILL.md`
- **Agents:** `.cursor/agents/commit-and-release.md`, `.cursor/agents/test-runner.md`, `.cursor/agents/verifier.md`
- **Allowlist:** `.cursor/validation-allowlist.json`
