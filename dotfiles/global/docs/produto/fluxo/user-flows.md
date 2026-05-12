# Fluxos de Usuário - Plugins Cursor

## Fluxo 1 - Criar plugin novo com automacao

1. Usuário informa nome, objetivo e estilo de repositorio (`single` ou `multi`).
2. Pipeline executa scaffold e cria estrutura inicial.
3. Pipeline roda review de submissao.
4. Pipeline roda auditoria de seguranca.
5. Pipeline gera artefatos de PR (resumo e checklist).
6. Usuário aprova submissao remota.
7. Pipeline abre PR e acompanha checks.

### Resultado esperado

- Plugin estruturado, validado e pronto para revisao no repositorio oficial.

## Fluxo 2 - Revisar plugin existente para marketplace

1. Usuário aponta diretorio de plugin existente.
2. Pipeline roda review de submissao e auditoria de seguranca.
3. Pipeline emite relatorio de gaps e recomendacao.
4. Opcionalmente, pipeline prepara PR de ajustes.

### Resultado esperado

- Diagnostico claro de conformidade e plano de correcao.

## Fluxo 3 - Publicacao assistida com acompanhamento

1. PR de submissao e aberto no fork.
2. Pipeline consulta checks e status de reviews.
3. Pipeline consolida pendencias e proxima acao.
4. Com checks verdes e sem bloqueios, recomenda merge/publicacao.

### Resultado esperado

- Processo de submissao rastreavel ate recomendacao final.
