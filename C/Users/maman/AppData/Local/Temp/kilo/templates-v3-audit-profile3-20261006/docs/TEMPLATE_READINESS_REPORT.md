# Template Readiness Report

- Generated (UTC): 2026-10-06T21:07:19Z
- Template version: v3.0
- Template root: /mnt/c/Users/maman/OneDrive/Documents/Projects/Templates/templates-v3
- Target project: /mnt/c/Users/maman/OneDrive/Documents/Projects/Templates/C:/Users/maman/AppData/Local/Temp/kilo/templates-v3-audit-profile3-20261006
- Apply profile: 3
- CI option: 1
- Overwrite policy: overwrite
- Strict mode: 1
- Tier profile: B
- Files copied: 37
- Paths pruned: 0
- Validation status: pass
- Unresolved placeholder lines: 0

## Commands Run
- Apply templates + placeholder fill via:   bash scripts/bootstrap_agent_ready.sh --target "/mnt/c/Users/maman/OneDrive/Documents/Projects/Templates/C:/Users/maman/AppData/Local/Temp/kilo/templates-v3-audit-profile3-20261006"
- Validation command: bash scripts/validate_templates.sh .
- Drift check command: bash scripts/check_template_drift.sh . "/mnt/c/Users/maman/OneDrive/Documents/Projects/Templates/templates-v3"

## Outputs
- Validation log: scripts/template_validation.log
- Placeholder scan: docs/TEMPLATE_UNRESOLVED_PLACEHOLDERS.txt
- Version stamp: docs/TEMPLATE_VERSION.md
- Allowlist file: scripts/placeholder_allowlist.txt

## Next Actions
- If validation failed, review scripts/template_validation.log and correct required files/placeholders.
- Resolve remaining entries in docs/TEMPLATE_UNRESOLVED_PLACEHOLDERS.txt.
- Run project verify gate and commit once report is clean.
