#!/usr/bin/env python3
"""Auditoria de seguranca para plugins Cursor."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

SUSPECT_FILES = [".env", "credentials.json", "secrets.json", "id_rsa", ".pem"]
SUSPECT_PATTERNS = ["api_key", "secret", "token", "password", "private_key"]


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def is_unsafe_path(value: str) -> bool:
    return value.startswith("/") or ".." in Path(value).parts


def main() -> None:
    parser = argparse.ArgumentParser(description="Auditoria de seguranca para plugin Cursor.")
    parser.add_argument("--plugin-root", required=True)
    args = parser.parse_args()

    plugin_root = Path(args.plugin_root).resolve()
    issues = {"critical": [], "high": [], "medium": [], "low": []}

    manifest_path = plugin_root / ".cursor-plugin" / "plugin.json"
    if not manifest_path.exists():
        issues["critical"].append("Manifesto .cursor-plugin/plugin.json ausente.")
    else:
        manifest = read_json(manifest_path)
        for key in ("commands", "agents", "skills", "rules", "hooks"):
            value = manifest.get(key)
            if isinstance(value, str) and is_unsafe_path(value):
                issues["high"].append(f"Caminho inseguro em '{key}': {value}")
            if isinstance(value, list):
                for item in value:
                    if isinstance(item, str) and is_unsafe_path(item):
                        issues["high"].append(f"Caminho inseguro em '{key}': {item}")

    for suspect in SUSPECT_FILES:
        for found in plugin_root.rglob(suspect):
            if found.is_file():
                issues["high"].append(f"Arquivo sensivel encontrado: {found.relative_to(plugin_root)}")

    for path in plugin_root.rglob("*"):
        if not path.is_file():
            continue
        if path.suffix.lower() in {".png", ".jpg", ".jpeg", ".gif", ".webp", ".ico"}:
            continue
        try:
            content = path.read_text(encoding="utf-8").lower()
        except UnicodeDecodeError:
            continue
        for pattern in SUSPECT_PATTERNS:
            if pattern in content:
                issues["medium"].append(
                    f"Padrao sensivel '{pattern}' encontrado em {path.relative_to(plugin_root)}"
                )
                break

    block = bool(issues["critical"] or issues["high"])
    report = {
        "status": "fail" if block else "pass",
        "block_submission": block,
        "issues": issues,
    }
    print(json.dumps(report, indent=2, ensure_ascii=True))


if __name__ == "__main__":
    main()
