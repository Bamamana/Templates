# Templates V2 (Fresh, AI-First, Minimal)

This pack is a clean-slate template system for **solo + AI vibe coding** with the fewest files possible while preserving industry-grade execution.
It is designed to cover the full intent of V1 with a smaller core and optional add-ons.

## Design Principles
- One canonical AI entrypoint for every session
- Minimal file count, maximal clarity
- Tiered controls (simple static projects to production-critical systems)
- CI/CD included by default
- Human and AI both follow explicit checklists

## Recommended Destination Paths
Copy and rename these templates into a project:
- `AI_AGENT.md.template` -> `AI_AGENT.md` (canonical)
- `AI_MEMORY.md.template` -> `docs/AI_MEMORY.md` (new context/memory)
- `PROJECT_CANVAS.md.template` -> `docs/PROJECT_CANVAS.md`
- `TECH_STACK.md.template` -> `docs/TECH_STACK.md` (new architecture/stack)
- `ENGINEERING_PLAYBOOK.md.template` -> `docs/ENGINEERING_PLAYBOOK.md`
- `OPS_SECURITY_RELEASE.md.template` -> `docs/OPS_SECURITY_RELEASE.md`
- `CHANGELOG.md.template` -> `CHANGELOG.md`
- `TEMPLATE_VALIDATION_CHECKLIST.md.template` -> `docs/TEMPLATE_VALIDATION_CHECKLIST.md`
- `TEMPLATE_INDEX.yaml.template` -> `docs/TEMPLATE_INDEX.yaml`
- `.github/workflows/ci.yml.template` -> `.github/workflows/ci.yml`

Default startup contract is only `AI_AGENT.md`.

## Optional Add-ons (Use When Needed)
- `addons/README.md.template` -> `README.md`
- `addons/.gitignore.template` -> `.gitignore`
- `addons/CONTRIBUTING.md.template` -> `CONTRIBUTING.md`
- `addons/LICENSE.template` -> `LICENSE`
- `addons/.github/PULL_REQUEST_TEMPLATE.md.template` -> `.github/PULL_REQUEST_TEMPLATE.md`
- `addons/.github/ISSUE_TEMPLATE/bug_report.md.template` -> `.github/ISSUE_TEMPLATE/bug_report.md`
- `addons/.github/ISSUE_TEMPLATE/feature_request.md.template` -> `.github/ISSUE_TEMPLATE/feature_request.md`
- `addons/.github/ISSUE_TEMPLATE/config.yml.template` -> `.github/ISSUE_TEMPLATE/config.yml`
- `addons/.github/workflows/ci.python.yml.template` -> `.github/workflows/ci.yml` (Python variant)
- `addons/.github/workflows/ci.node.yml.template` -> `.github/workflows/ci.yml` (Node variant)
- `addons/MULTI_APP_SERVER_BLUEPRINT.md.template` -> `docs/MULTI_APP_SERVER_BLUEPRINT.md`
- `addons/docker-compose.local.yml.template` -> `docker-compose.local.yml`
- `addons/FIRST_SESSION_PROMPT.txt.template` -> `docs/FIRST_SESSION_PROMPT.txt`
- `addons/ADR_TEMPLATE.md.template` -> `docs/ADR_TEMPLATE.md`
- `addons/SMOKE_PARITY_PLAYBOOK.md.template` -> `docs/SMOKE_PARITY_PLAYBOOK.md`
- `addons/FIXTURE_TESTING_PLAYBOOK.md.template` -> `docs/FIXTURE_TESTING_PLAYBOOK.md`
- `addons/RELEASE_CANARY_CHECKLIST.md.template` -> `docs/RELEASE_CANARY_CHECKLIST.md`
- `addons/AI_OPERATING_CONTRACT.md.template` -> `AI_OPERATING_CONTRACT.md` (legacy compatibility alias)

### Optional Script Starters (Verification Hardening)
- `scripts/apply_templates_wizard.sh.template` -> `scripts/apply_templates_wizard.sh`
- `scripts/predeploy_full_suite.sh.template` -> `scripts/predeploy_full_suite.sh`
- `scripts/parity_pathways_report.py.template` -> `scripts/parity_pathways_report.py`
- `scripts/parity-retired-pathways.json.template` -> `scripts/parity-retired-pathways.json`
- `scripts/refactor_smoke_contract.py.template` -> `scripts/refactor_smoke_contract.py`
- `scripts/smoke_masterapi_refactor.sh.template` -> `scripts/smoke_masterapi_refactor.sh`
- `scripts/smoke_enginepath_refactor.sh.template` -> `scripts/smoke_enginepath_refactor.sh`
- `scripts/refactor-contracts/masterapi-slice1.json.template` -> `scripts/refactor-contracts/masterapi-slice1.json`
- `scripts/refactor-contracts/enginepath-slice1.json.template` -> `scripts/refactor-contracts/enginepath-slice1.json`
- `scripts/run_fixture_suite.sh.template` -> `scripts/run_fixture_suite.sh`
- `scripts/refresh_snapshot_baseline.sh.template` -> `scripts/refresh_snapshot_baseline.sh`

### Optional CI Add-on
- `addons/.github/workflows/ci.predeploy.yml.template` -> `.github/workflows/ci.yml` (predeploy-gated variant)

## Fast Apply Workflow (Wizard)

```bash
cp templates-v2/scripts/apply_templates_wizard.sh.template scripts/apply_templates_wizard.sh
chmod +x scripts/apply_templates_wizard.sh
bash scripts/apply_templates_wizard.sh /path/to/target-project
```

The wizard supports profile selection, CI variant choice, and overwrite policy.

## Validation Assets
- `TEMPLATE_VALIDATION_CHECKLIST.md.template` defines manual checks.
- `scripts/validate_templates.sh.template` provides an automated baseline validation script.
- `TEMPLATE_INDEX.yaml.template` provides machine-readable navigation and applicability.
- `V1_TO_V2_TRACEABILITY.md` provides full legacy-to-v2 parity mapping.

## Startup Prompt for Human
Use this single prompt with any AI agent:

> Read `AI_AGENT.md` and follow it strictly. If uncertainty remains, ask clarifying questions before coding. Then execute the next unchecked item in the implementation checklist.

## Minimum Runtime Baseline
- Python: `ruff`, `black`, `mypy`, `pytest` (swap tools per language as needed)
- Verify command: `[VERIFY_COMMAND]`
- AI context command: `[AI_CONTEXT_COMMAND]`
- Core CI template is language-agnostic; runtime-specific CI variants are available in optional add-ons.

## Project Tiers
- **Tier A**: static/lightweight (single-page, no backend state)
- **Tier B**: standard app/API
- **Tier C**: production-critical/regulatory/high-availability

Advanced controls are optional for Tier A and become stricter in Tier B/C.

## V1 Parity Notes
- Size limits: soft target <= 400 lines, hard refactor trigger > 500 lines
- Includes commands, matrix, smoke/targeted test policy, changelog discipline, deployment, rollback, security, release, observability, and risk tracking
- Specialized V1 assets (multi-app and local compose) are preserved as optional add-ons
- ADR records are supported via optional add-on template
- Consolidation removes duplicate rule sources by keeping `AI_AGENT.md` as the single canonical AI contract
- Legacy `AI_OPERATING_CONTRACT.md` support is moved to an optional add-on only
