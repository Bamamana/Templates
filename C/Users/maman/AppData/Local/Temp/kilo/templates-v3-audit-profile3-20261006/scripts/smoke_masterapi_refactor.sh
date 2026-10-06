#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[masterapi-smoke] Running Master API contract checks"
python3 scripts/refactor_smoke_contract.py scripts/refactor-contracts/masterapi-slice1.json

echo "[masterapi-smoke] Contract checks passed"
