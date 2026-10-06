#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DATE_TAG="${1:-$(date +%F)}"
SNAPSHOT_DIR="snapshots/deployed-${DATE_TAG}"

mkdir -p "$SNAPSHOT_DIR"
echo "[snapshot] Created baseline folder: $SNAPSHOT_DIR"

echo "[snapshot] Run your project-specific pull commands now (clasp/git/api export)."
echo "[snapshot] Then run structural diff and parity:"
echo "           python3 scripts/parity_pathways_report.py"

if [[ -f scripts/parity_pathways_report.py ]]; then
  python3 scripts/parity_pathways_report.py
else
  echo "[snapshot] parity_pathways_report.py not found; skipping auto parity run."
fi
