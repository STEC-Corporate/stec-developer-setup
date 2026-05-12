#!/usr/bin/env bash
# Template: mesmo comportamento do pacote oficial em AI-ProjectDeveloper.
# Ajuste apenas se bundle_root ou layout do repo pai forem diferentes.
set -euo pipefail

PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="$PACKAGE_DIR/bundle/.cursor"
TARGET_ROOT="${1:-$HOME/.cursor}"

if [[ ! -d "$BUNDLE_DIR" ]]; then
  echo "Bundle not found at $BUNDLE_DIR"
  echo "Run build from submodule root (see scaffold/scripts/build_bundle_snippet.md)."
  exit 1
fi

mkdir -p "$TARGET_ROOT/agents" "$TARGET_ROOT/skills"

for agent_file in "$BUNDLE_DIR/agents"/*.md; do
  [[ -e "$agent_file" ]] || continue
  cp "$agent_file" "$TARGET_ROOT/agents/"
done

for skill_dir in "$BUNDLE_DIR/skills"/*; do
  [[ -d "$skill_dir" ]] || continue
  rm -rf "$TARGET_ROOT/skills/$(basename "$skill_dir")"
  cp -R "$skill_dir" "$TARGET_ROOT/skills/"
done

echo "Installed cursor-global bundle into $TARGET_ROOT"
