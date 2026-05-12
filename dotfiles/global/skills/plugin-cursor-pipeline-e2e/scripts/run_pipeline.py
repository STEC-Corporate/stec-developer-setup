#!/usr/bin/env python3
"""Pipeline local E2E para plugins Cursor."""

from __future__ import annotations

import argparse
import json
import subprocess
from pathlib import Path


def run(cmd: list[str], cwd: Path) -> tuple[int, str]:
    proc = subprocess.run(cmd, cwd=cwd, text=True, capture_output=True)
    output = (proc.stdout or "") + ("\n" + proc.stderr if proc.stderr else "")
    return proc.returncode, output.strip()


def main() -> None:
    parser = argparse.ArgumentParser(description="Pipeline E2E de plugin Cursor.")
    parser.add_argument("--plugin-root", required=True)
    parser.add_argument("--plugin-name", required=True)
    parser.add_argument("--plugin-purpose", required=True)
    parser.add_argument("--mode", choices=["dry-run", "apply"], default="dry-run")
    parser.add_argument("--marketplace-root", default="")
    args = parser.parse_args()

    root = Path(__file__).resolve().parents[3]
    plugin_root = Path(args.plugin_root).resolve()
    reports_dir = plugin_root / ".cursor-plugin" / "reports"
    reports_dir.mkdir(parents=True, exist_ok=True)

    steps = []
    if args.mode == "dry-run":
        steps = [
            "scaffold_plugin.py",
            "review_submission.py",
            "security_audit.py",
            "prepare_pr_body.py",
            "track_publication.py",
        ]
        print(json.dumps({"mode": "dry-run", "planned_steps": steps}, indent=2, ensure_ascii=True))
        return

    review_out = reports_dir / "review.json"
    security_out = reports_dir / "security.json"
    pr_body_out = reports_dir / "pr_body.md"

    review_cmd = [
        "python3",
        str(root / "plugin-cursor-review-submission" / "scripts" / "review_submission.py"),
        "--plugin-root",
        str(plugin_root),
        "--output",
        str(review_out),
    ]
    if args.marketplace_root:
        review_cmd.extend(["--marketplace-root", args.marketplace_root])
    rc_review, out_review = run(review_cmd, root)

    rc_sec, out_sec = run(
        [
            "python3",
            str(root / "plugin-cursor-security-audit" / "scripts" / "security_audit.py"),
            "--plugin-root",
            str(plugin_root),
        ],
        root,
    )
    security_out.write_text(out_sec + "\n", encoding="utf-8")

    rc_pr, out_pr = run(
        [
            "python3",
            str(root / "plugin-cursor-prepare-pr" / "scripts" / "prepare_pr_body.py"),
            "--plugin-name",
            args.plugin_name,
            "--plugin-purpose",
            args.plugin_purpose,
            "--review-report",
            str(review_out),
            "--security-report",
            str(security_out),
            "--output",
            str(pr_body_out),
        ],
        root,
    )

    summary = {
        "review_exit_code": rc_review,
        "security_exit_code": rc_sec,
        "prepare_pr_exit_code": rc_pr,
        "review_output": out_review,
        "prepare_pr_output": out_pr,
        "reports": {
            "review": str(review_out),
            "security": str(security_out),
            "pr_body": str(pr_body_out),
        },
    }
    print(json.dumps(summary, indent=2, ensure_ascii=True))


if __name__ == "__main__":
    main()
