#!/usr/bin/env python3
"""Checklist de submissao para plugins Cursor."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Iterable

NAME_RE = re.compile(r"^[a-z0-9](?:[a-z0-9.-]*[a-z0-9])?$")


def read_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def has_frontmatter(path: Path, required: Iterable[str]) -> tuple[bool, list[str]]:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        return False, [f"{path}: frontmatter ausente"]
    end = text.find("\n---", 4)
    if end == -1:
        return False, [f"{path}: delimitador de frontmatter invalido"]
    frontmatter = text[4:end]
    missing = [key for key in required if f"{key}:" not in frontmatter]
    if missing:
        return False, [f"{path}: faltando {', '.join(missing)}"]
    return True, []


def collect_files(root: Path, pattern: str) -> list[Path]:
    return sorted(p for p in root.glob(pattern) if p.is_file())


def main() -> None:
    parser = argparse.ArgumentParser(description="Review de submissao para plugin Cursor.")
    parser.add_argument("--plugin-root", required=True)
    parser.add_argument("--marketplace-root", default="")
    parser.add_argument("--output", default="")
    args = parser.parse_args()

    plugin_root = Path(args.plugin_root).resolve()
    errors: list[str] = []
    warnings: list[str] = []
    checks: dict[str, str] = {}

    manifest_path = plugin_root / ".cursor-plugin" / "plugin.json"
    if not manifest_path.exists():
        errors.append("Manifesto .cursor-plugin/plugin.json nao encontrado.")
        checks["manifest"] = "fail"
    else:
        manifest = read_json(manifest_path)
        name = manifest.get("name", "")
        if not name or not NAME_RE.match(name):
            errors.append("Campo 'name' invalido no plugin.json.")
        for field in ("description", "version", "author", "license"):
            if field not in manifest:
                warnings.append(f"Campo recomendado ausente no plugin.json: {field}")
        checks["manifest"] = "pass" if not errors else "fail"

    for skill in collect_files(plugin_root, "skills/**/SKILL.md"):
        ok, msgs = has_frontmatter(skill, ("name", "description"))
        if not ok:
            errors.extend(msgs)
    for agent in collect_files(plugin_root, "agents/*.md"):
        ok, msgs = has_frontmatter(agent, ("name", "description"))
        if not ok:
            errors.extend(msgs)
    for rule in collect_files(plugin_root, "rules/*.mdc"):
        ok, msgs = has_frontmatter(rule, ("description", "alwaysApply"))
        if not ok:
            errors.extend(msgs)
    for cmd in collect_files(plugin_root, "commands/*.md") + collect_files(plugin_root, "commands/*.txt"):
        ok, msgs = has_frontmatter(cmd, ("name", "description"))
        if not ok:
            errors.extend(msgs)
    checks["frontmatter"] = "fail" if any("frontmatter" in e or "faltando" in e for e in errors) else "pass"

    readme = plugin_root / "README.md"
    if not readme.exists():
        errors.append("README.md ausente.")
        checks["documentation"] = "fail"
    else:
        readme_text = readme.read_text(encoding="utf-8").lower()
        for required_topic in ("instal", "uso", "segur"):
            if required_topic not in readme_text:
                warnings.append(f"README sem secao esperada para: {required_topic}")
        checks["documentation"] = "pass"

    if args.marketplace_root:
        marketplace_path = Path(args.marketplace_root).resolve() / ".cursor-plugin" / "marketplace.json"
        if marketplace_path.exists() and manifest_path.exists():
            marketplace = read_json(marketplace_path)
            manifest = read_json(manifest_path)
            plugin_name = manifest.get("name")
            listed = any(p.get("name") == plugin_name for p in marketplace.get("plugins", []))
            if not listed:
                errors.append("Plugin nao registrado em .cursor-plugin/marketplace.json.")
            checks["marketplace"] = "pass" if listed else "fail"
        else:
            warnings.append("Marketplace root nao encontrado ou manifesto ausente.")
            checks["marketplace"] = "warn"

    status = "pass" if not errors else "fail"
    recommendation = "apto" if status == "pass" else "nao_apto"
    report = {
        "status": status,
        "recommendation": recommendation,
        "checks": checks,
        "errors": errors,
        "warnings": warnings,
    }

    output = json.dumps(report, indent=2, ensure_ascii=True)
    if args.output:
        Path(args.output).write_text(output + "\n", encoding="utf-8")
    print(output)


if __name__ == "__main__":
    main()
