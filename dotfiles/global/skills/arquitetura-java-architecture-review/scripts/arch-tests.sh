#!/usr/bin/env bash
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
cd "$PROJECT_ROOT"
# Roda testes ArchUnit quando existirem (*ArchTest). Sem testes, Maven não falha (failIfNoTests=false).
mvn test -Dtest='*ArchTest' -DfailIfNoTests=false
