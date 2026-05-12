#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
cd "$PROJECT_ROOT"

if [ ! -f "package.json" ]; then
  echo "Error: package.json not found. Run from BFF project root."
  exit 1
fi

if [ ! -d "node_modules" ]; then
  echo "Running ensure-deps: installing dependencies..."
  "$SCRIPT_DIR/ensure-deps.sh"
fi

echo "Running E2E tests..."
if npm run test:e2e; then
  echo "E2E tests passed."
  exit 0
else
  echo "E2E tests failed."
  exit 1
fi
