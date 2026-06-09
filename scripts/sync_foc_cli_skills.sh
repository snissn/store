#!/usr/bin/env bash
set -euo pipefail

repo_url="${FOC_CLI_REPO_URL:-https://github.com/FIL-Builders/foc-cli.git}"
ref="${FOC_CLI_REF:-main}"
workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

git clone --depth 1 --branch "$ref" "$repo_url" "$workdir/foc-cli"

mkdir -p skills/foc-cli skills/foc-docs
cp "$workdir/foc-cli/skills/foc-cli/SKILL.md" skills/foc-cli/SKILL.md
cp "$workdir/foc-cli/skills/foc-docs/SKILL.md" skills/foc-docs/SKILL.md

python3 scripts/validate.py
