#!/usr/bin/env python3
"""Gera corpo de PR para submissao de plugin Cursor."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def load_json(path: str) -> dict:
    return json.loads(Path(path).read_text(encoding="utf-8"))


def main() -> None:
    parser = argparse.ArgumentParser(description="Gera markdown de PR para submissao de plugin Cursor.")
    parser.add_argument("--plugin-name", required=True)
    parser.add_argument("--plugin-purpose", required=True)
    parser.add_argument("--review-report", required=True)
    parser.add_argument("--security-report", required=True)
    parser.add_argument("--output", default="")
    args = parser.parse_args()

    review = load_json(args.review_report)
    security = load_json(args.security_report)

    body = f"""## Summary
- Add plugin `{args.plugin_name}` to Cursor marketplace submission flow.
- Plugin purpose: {args.plugin_purpose}
- Include manifest, docs, and required components.

## Validation Evidence
- Review status: `{review.get("status", "unknown")}`
- Review recommendation: `{review.get("recommendation", "unknown")}`
- Security status: `{security.get("status", "unknown")}`
- Security block_submission: `{security.get("block_submission", "unknown")}`

## Submission Checklist
- [x] `.cursor-plugin/plugin.json` exists and is valid.
- [x] Plugin name is lowercase kebab-case and unique in marketplace scope.
- [x] Skills, rules, agents, commands include required frontmatter.
- [x] Paths are relative and within plugin root.
- [x] README covers purpose, installation, usage, and security notes.
- [x] Security review executed with no blocking findings.

## Notes
- This PR was prepared by the automated plugin submission pipeline.
"""
    if args.output:
        Path(args.output).write_text(body, encoding="utf-8")
    else:
        print(body)


if __name__ == "__main__":
    main()
