#!/usr/bin/env bash
# Usage: ./commit-release.sh <VERSION> [MESSAGE]
# Example: ./commit-release.sh 0.3.0
# Example: ./commit-release.sh 0.3.0 "chore(release): v0.3.0 - atualiza changelog e versão"
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../../.." && pwd)"
cd "$PROJECT_ROOT"

VERSION="${1:-}"
MESSAGE="${2:-chore(release): v${VERSION}}"

if [ -z "$VERSION" ]; then
  echo "Error: VERSION required. Usage: $0 <VERSION> [MESSAGE]"
  exit 1
fi

if [ ! -d ".git" ]; then
  echo "Error: .git not found. Run from project root."
  exit 1
fi

if [ ! -f "CHANGELOG.md" ] || [ ! -f "package.json" ]; then
  echo "Error: CHANGELOG.md and package.json must exist."
  exit 1
fi

# Ensure version is in message if user provided custom message
if [ "$2" != "" ] && [[ "$MESSAGE" != *"$VERSION"* ]] && [[ "$MESSAGE" != *"v$VERSION"* ]]; then
  MESSAGE="$MESSAGE (v$VERSION)"
fi
if [ "$2" = "" ]; then
  MESSAGE="chore(release): v$VERSION"
fi

git add CHANGELOG.md package.json
if git diff --cached --quiet; then
  echo "Nothing to commit (CHANGELOG.md and package.json unchanged)."
  exit 1
fi

git commit -m "$MESSAGE"
echo "Commit created: $MESSAGE"
exit 0
