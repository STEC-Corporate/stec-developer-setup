#!/usr/bin/env python3
"""Valida manifests plugin/marketplace usando jsonschema se disponivel."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def load(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> None:
    parser = argparse.ArgumentParser(description="Valida plugin.json e marketplace.json com schemas locais.")
    parser.add_argument("--plugin-json", required=True)
    parser.add_argument("--plugin-schema", required=True)
    parser.add_argument("--marketplace-json", default="")
    parser.add_argument("--marketplace-schema", default="")
    args = parser.parse_args()

    plugin = load(Path(args.plugin_json))
    plugin_schema = load(Path(args.plugin_schema))

    try:
        import jsonschema  # type: ignore
    except ImportError as exc:
        raise SystemExit(
            "Dependencia ausente: instale 'jsonschema' para validacao estrita de schema."
        ) from exc

    jsonschema.validate(plugin, plugin_schema)

    if args.marketplace_json and args.marketplace_schema:
        marketplace = load(Path(args.marketplace_json))
        marketplace_schema = load(Path(args.marketplace_schema))
        jsonschema.validate(marketplace, marketplace_schema)

    print("Schema validation: ok")


if __name__ == "__main__":
    main()
