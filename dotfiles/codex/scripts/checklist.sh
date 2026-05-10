#!/bin/bash
# Checklist de Fim de Sessão para Codex CLI

cat << 'EOF'
✅ Sessão Codex encerrada — Checklist de Entrega:

  [ ] progress.md atualizado com o que foi feito?
  [ ] TaskLink/sistema de tarefas registrado?
  [ ] Commit dos arquivos relevantes feito?
  [ ] git push para o repositório remoto enviado?
  [ ] Harness do projeto completo (CLAUDE.md, progress.md, scripts/init.sh)?

📚 Referência: ~/.codex/HARNESS.md
EOF

exit 0
