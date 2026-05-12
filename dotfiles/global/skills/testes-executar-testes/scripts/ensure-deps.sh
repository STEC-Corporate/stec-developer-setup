#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
cd "$PROJECT_ROOT"

if [ ! -f "package.json" ]; then
  echo "Error: package.json not found. Run this script from the BFF project root or ensure the skill is in .cursor/skills/executar-testes/."
  exit 1
fi

if [ ! -d "node_modules" ]; then
  echo "Installing dependencies (npm ci)..."
  npm ci
  echo "Dependencies installed."
else
  echo "node_modules present. Skipping install. Use 'npm ci' manually to refresh."
fi
exit 0
