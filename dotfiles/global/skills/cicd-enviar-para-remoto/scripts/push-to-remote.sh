#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../../.." && pwd)"
cd "$PROJECT_ROOT"

if [ ! -d ".git" ]; then
  echo "Error: .git not found. Run from project root."
  exit 1
fi

BRANCH=$(git branch --show-current)
if [ -z "$BRANCH" ]; then
  echo "Error: Could not determine current branch."
  exit 1
fi

echo "Pushing branch '$BRANCH' to origin..."
if git push origin "$BRANCH"; then
  echo "Push succeeded."
  exit 0
else
  echo "Push failed."
  exit 1
fi
