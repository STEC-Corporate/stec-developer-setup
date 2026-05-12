#!/usr/bin/env python3
"""Consolida status de publicacao de PR a partir de um snapshot JSON."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser(description="Consolida status de publicacao.")
    parser.add_argument(
        "--snapshot-json",
        required=True,
        help="Arquivo JSON com estado atual do PR/checks/review vindo de MCP ou gh api.",
    )
    args = parser.parse_args()

    snapshot = json.loads(Path(args.snapshot_json).read_text(encoding="utf-8"))
    pr_state = snapshot.get("pr", {}).get("state", "unknown")
    checks = snapshot.get("checks", [])
    reviews = snapshot.get("reviews", [])

    failing = [c for c in checks if c.get("conclusion") not in ("success", "neutral", "skipped")]
    changes_requested = [r for r in reviews if r.get("state") == "CHANGES_REQUESTED"]

    recommendation = "apto_para_merge"
    if pr_state != "OPEN":
        recommendation = "revisar_estado_pr"
    if failing or changes_requested:
        recommendation = "acoes_pendentes"

    report = {
        "pr_state": pr_state,
        "total_checks": len(checks),
        "failing_checks": len(failing),
        "changes_requested": len(changes_requested),
        "recommendation": recommendation,
    }
    print(json.dumps(report, indent=2, ensure_ascii=True))


if __name__ == "__main__":
    main()
