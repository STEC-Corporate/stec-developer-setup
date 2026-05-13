# 🎣 Hooks Documentation

## Hooks Disponíveis

### task-completion.sh

**Evento:** `PostToolUse` (quando TodoWrite é executado)

**Função:** Detecta quando uma tarefa é marcada como "completed" e automaticamente:
1. **Git Commit Automático:** Adiciona arquivos modificados e faz commit com mensagem baseada nas tarefas completadas
2. **Atualização do CHANGELOG.md:** Adiciona entradas na seção [Unreleased] para cada tarefa completada
3. **Push Automático:** Envia commits para repositório remoto (se configurado)
4. **Identificação da Próxima Tarefa:** Encontra próxima tarefa pendente na lista
5. **Recomendação de LLM:** Detecta domínio da próxima tarefa e recomenda modelo adequado via LLM Advisor
6. **Mensagem Informativa:** Exibe próximos passos com recomendações

#### Configuração

Adicione ao `settings.json`:

```json
{
  "hooks": [
    {
      "event": "PostToolUse",
      "matcher": {
        "tool": "TodoWrite"
      },
      "command": "bash ~/.claude/hooks/task-completion.sh"
    }
  ]
}
```

#### Variáveis de Ambiente

- `LLM_DOCS_ROOT`: Caminho para docs de LLM (padrão: `$HOME/.claude/docs/llm`)
- `TOOL_NAME`: Nome da ferramenta que acionou o hook (fornecido pelo Claude Code)
- `TOOL_INPUT`: Entrada JSON da ferramenta (fornecido pelo Claude Code)
- `TOOL_OUTPUT`: Saída da ferramenta (fornecido pelo Claude Code)

#### Exemplo de Saída

**Com tarefa completada e próxima tarefa:**
```
✅ Tarefa(s) commitada(s) e enviada(s) | 🎯 Próxima tarefa (high): Update dotfiles/global/settings.json to add PostToolUse hook | 💡 LLM recomendado [software-development]: claude-sonnet-4 — Melhor para implementação complexa | Budget: $$
```

**Todas as tarefas completadas:**
```
✅ Tarefa(s) completada(s) e commitada(s)! Todas as tarefas pendentes foram finalizadas.
```

#### Commit Messages

**Uma tarefa:**
```
feat: Create dotfiles/global/hooks/task-completion.sh script

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Múltiplas tarefas:**
```
feat: complete multiple tasks

- Create dotfiles/global/hooks/task-completion.sh script
- Update dotfiles/global/settings.json to add PostToolUse hook

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

#### CHANGELOG.md Format

O hook automaticamente adiciona entradas na seção `[Unreleased]`:

```markdown
## [Unreleased]

### Changed
- Create dotfiles/global/hooks/task-completion.sh script

### Changed  
- Update dotfiles/global/settings.json to add PostToolUse hook
```

#### Dependências

- Python 3 (para parsing JSON das tarefas)
- Git configurado e inicializado no diretório do projeto
- Estrutura de docs LLM com arquivos por domínio em `docs/llm/by-domain/`
- Função `detect_domain()` compatível com llm-advisor.sh
- Permissões de escrita no CHANGELOG.md (criado automaticamente se não existir)

#### Detecção de Domínios

O hook utiliza a mesma lógica de detecção de domínios do `llm-advisor.sh`, incluindo:

- **fintech**: termos financeiros, B3, BACEN, CVM
- **legal-compliance**: LGPD, GDPR, contratos jurídicos
- **architecture**: DDD, CQRS, microserviços, design patterns
- **security**: vulnerabilidades, OWASP, pentesting
- **frontend**: React, Vue, CSS, componentes
- **devops**: Docker, Kubernetes, CI/CD, infraestrutura
- **database**: SQL, schemas, migrações
- **api-design**: REST, GraphQL, OpenAPI
- **mobile**: iOS, Android, React Native, Flutter
- **testing**: TDD, BDD, cobertura de testes
- E outros domínios...

#### Fluxo de Execução

1. Hook é acionado quando TodoWrite é executado
2. Verifica se estamos em um repositório git válido
3. Identifica tarefas marcadas como "completed" e próxima tarefa pendente
4. **Se há tarefas completadas:**
   - Atualiza CHANGELOG.md com entradas das tarefas completadas
   - Adiciona arquivos modificados ao git (`git add .`)
   - Faz commit com mensagem apropriada
   - Tenta fazer push para repositório remoto (se configurado)
5. **Para próxima tarefa:**
   - Detecta domínio baseado no conteúdo da próxima tarefa
   - Consulta arquivo de domínio para recomendação de LLM
6. Retorna mensagem JSON com systemMessage informando status do commit e próximos passos

#### Comportamento do Git

- **Apenas git repositories:** Hook só executa se `.git` estiver presente
- **Commit silencioso:** Operações git são feitas com output redirecionado (`> /dev/null 2>&1`)
- **Push seguro:** Push falha silenciosamente se não há remote configurado (`|| true`)
- **Auto-add:** Todos os arquivos modificados e novos são automaticamente adicionados

#### Integração com LLM Advisor

Utiliza a mesma estrutura de documentação LLM:
- `docs/llm/_index.yaml`: índice de modelos
- `docs/llm/by-domain/*.md`: especificações por domínio
- Formato de resposta compatível com padrão do LLM Advisor

#### Segurança e Boas Práticas

- **Verificação de Repository:** Hook só executa em diretórios com `.git`
- **Commits Limpos:** Usa heredoc para preservar formatação da mensagem de commit
- **Error Handling:** Operações git são protegidas contra falhas
- **Formato Padrão:** Segue convenção de commits com prefixo `feat:`
- **Co-Authoring:** Inclui assinatura do Claude Code em todos os commits

---

**Criado:** 2026-05-13  
**Última Atualização:** 2026-05-13  
**Versão:** 2.0 (com git automation)  
**Compatibilidade:** Claude Code hooks v2+