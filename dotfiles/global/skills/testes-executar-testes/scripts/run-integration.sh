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

echo "Running integration tests..."
if npm run test:integration; then
  echo "Integration tests passed."
  exit 0
else
  echo "Integration tests failed."
  exit 1
fi
