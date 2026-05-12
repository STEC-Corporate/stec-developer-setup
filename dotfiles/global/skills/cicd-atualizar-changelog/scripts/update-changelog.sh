#!/usr/bin/env bash
# Usage: ./update-changelog.sh <VERSION> [DATE]
# Example: ./update-changelog.sh 0.3.0
# Example: ./update-changelog.sh 0.3.0 2026-02-10
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../../../.." && pwd)"
cd "$PROJECT_ROOT"

VERSION="${1:-}"
DATE="${2:-$(date +%Y-%m-%d)}"

if [ -z "$VERSION" ]; then
  echo "Error: VERSION required. Usage: $0 <VERSION> [DATE]"
  exit 1
fi

CHANGELOG="CHANGELOG.md"
if [ ! -f "$CHANGELOG" ]; then
  echo "Error: $CHANGELOG not found."
  exit 1
fi

# Insert new section ## [X.Y.Z] - DATE after the first ## [Unreleased] block (after the first ---)
# We insert after the line "---" that follows [Unreleased] content
awk -v version="$VERSION" -v date="$DATE" '
  /^## \[Unreleased\]/ { unreleased=1; print; next }
  unreleased && /^---$/ { 
    print ""
    print "## [" version "] - " date
    print ""
    unreleased=0
    next
  }
  { print }
' "$CHANGELOG" > "$CHANGELOG.tmp" && mv "$CHANGELOG.tmp" "$CHANGELOG"

echo "CHANGELOG updated: ## [$VERSION] - $DATE"
exit 0
