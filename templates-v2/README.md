# Templates V2 (Fresh, AI-First, Minimal)

This pack is a clean-slate template system for **solo + AI vibe coding** with the fewest files possible while preserving industry-grade execution.
It is designed to cover the full intent of V1 with a smaller core and optional add-ons.

## Variant Packs
- `orchestrator-template/` is the v3-style draft variant for cloud-orchestrator plus local-worker workflows. Use it when you want a premium model to act as planner/checker/mastermind while a local LLM performs most bounded code creation, test loops, refactors, and docs work.

## Design Principles
- One canonical AI entrypoint for every session
- Minimal file count, maximal clarity
- Tiered controls (simple static projects to production-critical systems)
- CI/CD included by default
- Human and AI both follow explicit checklists

## First-Time Adoption
Before copying anything, open `TEMPLATE_ADOPTION_WALKTHROUGH.md.template` (destination: `docs/TEMPLATE_ADOPTION_WALKTHROUGH.md`). It is a capability-by-capability checklist (core docs, scripts, CI/CD, testing, worker/orchestrator pattern, version management) that prevents the most common failure mode: partially adopting the template, skipping the scripts and CI, then having the AI silently ignore capabilities that exist but were never wired up. For routed startup profiles such as lean, it also tells you which **event triggers** to register in `docs/CONTEXT_ROUTING.md` so future sessions auto-discover capabilities without burning startup tokens.

`APPLY_CHECKLIST.md` (file copy) and `TEMPLATE_VALIDATION_CHECKLIST.md` (post-validation) are still used; the adoption walkthrough is the umbrella.

## Recommended Destination Paths
Copy and rename these templates into a project:
- `TEMPLATE_ADOPTION_WALKTHROUGH.md.template` -> `docs/TEMPLATE_ADOPTION_WALKTHROUGH.md` (run first)
- `AI_AGENT.md.template` -> `AI_AGENT.md` (canonical)
- `AI_MEMORY.md.template` -> `docs/AI_MEMORY.md` (new context/memory)
- `MASTER_TRACEABILITY_TABLE.md.template` -> `docs/MASTER_TRACEABILITY_TABLE.md` (required for Tier B/C)
- `PROJECT_CANVAS.md.template` -> `docs/PROJECT_CANVAS.md`
- `TECH_STACK.md.template` -> `docs/TECH_STACK.md` (new architecture/stack)
- `ENGINEERING_PLAYBOOK.md.template` -> `docs/ENGINEERING_PLAYBOOK.md`
- `OPS_SECURITY_RELEASE.md.template` -> `docs/OPS_SECURITY_RELEASE.md`
- `CHANGELOG.md.template` -> `CHANGELOG.md`
- `QUICKSTART_5_MIN.md.template` -> `docs/QUICKSTART_5_MIN.md`
- `PLACEHOLDER_REFERENCE.md.template` -> `docs/PLACEHOLDER_REFERENCE.md`
- `UPGRADE_GUIDE.md.template` -> `docs/UPGRADE_GUIDE.md`
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
- `addons/MULTI_APP_SERVER_BLUEPRINT.md.template` -> `docs/MULTI_APP_SERVER_BLUEPRINT.md`
- `addons/docker-compose.local.yml.template` -> `docker-compose.local.yml`
- `addons/FIRST_SESSION_PROMPT.txt.template` -> `docs/FIRST_SESSION_PROMPT.txt`
- `addons/ADR_TEMPLATE.md.template` -> `docs/ADR_TEMPLATE.md`
- `addons/ADVANCED_VERIFICATION_PLAYBOOK.md.template` -> `docs/ADVANCED_VERIFICATION_PLAYBOOK.md`
- `addons/AI_OPERATING_CONTRACT.md.template` -> `AI_OPERATING_CONTRACT.md` (legacy compatibility alias)

### Optional Script Starters (Verification Hardening)
- `scripts/bootstrap_agent_ready.sh.template` -> `scripts/bootstrap_agent_ready.sh`
- `scripts/check_template_drift.sh.template` -> `scripts/check_template_drift.sh`
- `scripts/placeholder_allowlist.txt.template` -> `scripts/placeholder_allowlist.txt`
- `scripts/predeploy_full_suite.sh.template` -> `scripts/predeploy_full_suite.sh`
- `scripts/parity_pathways_report.py.template` -> `scripts/parity_pathways_report.py`
- `scripts/parity-retired-pathways.json.template` -> `scripts/parity-retired-pathways.json`
- `scripts/refactor_smoke_contract.py.template` -> `scripts/refactor_smoke_contract.py`
- `scripts/enforce_doc_updates.sh.template` -> `scripts/enforce_doc_updates.sh`
- `scripts/smoke_masterapi_refactor.sh.template` -> `scripts/smoke_masterapi_refactor.sh`
- `scripts/smoke_enginepath_refactor.sh.template` -> `scripts/smoke_enginepath_refactor.sh`
- `scripts/refactor-contracts/masterapi-slice1.json.template` -> `scripts/refactor-contracts/masterapi-slice1.json`
- `scripts/refactor-contracts/enginepath-slice1.json.template` -> `scripts/refactor-contracts/enginepath-slice1.json`
- `scripts/run_fixture_suite.sh.template` -> `scripts/run_fixture_suite.sh`
- `scripts/refresh_snapshot_baseline.sh.template` -> `scripts/refresh_snapshot_baseline.sh`

Traceability coverage standard:
- For Tier B/C projects, maintain `docs/MASTER_TRACEABILITY_TABLE.md`.
- Every active Path ID must include smoke/contract coverage status (`Automated`, `Manual`, or `N/A` with rationale).

### Optional CI Add-on
- `addons/.github/workflows/ci.predeploy.yml.template` -> `.github/workflows/ci.yml` (predeploy-gated variant)

## Fast Apply Workflow

Use `bootstrap_agent_ready` as the single apply engine (non-interactive or interactive).

For the orchestrator variant, use the same engine with `--orchestrator`:

```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template \
	--target /path/to/target-project \
	--project-name "My Project" \
	--tier TIER_B_STANDARD \
	--tier-profile auto \
	--orchestrator \
	--strict
```

## One-Command Bootstrap (Biggest Upgrade)

```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template \
	--target /path/to/target-project \
	--project-name "My Project" \
	--tier TIER_B_STANDARD \
	--tier-profile auto \
	--strict
```

What it does in one run:
- applies core templates (+ selected profile/CI options),
- auto-fills common placeholders,
- runs `scripts/validate_templates.sh`,
- stamps `docs/TEMPLATE_VERSION.md`,
- generates `docs/TEMPLATE_READINESS_REPORT.md` and unresolved placeholder report.

Interactive mode:
- Run without `--target` and it prompts for target/profile/CI/overwrite.

Strict mode behavior:
- `--strict` exits non-zero when unresolved placeholders remain after allowlist filtering.
- Allowlist file: `scripts/placeholder_allowlist.txt`.

Tier profile pruning:
- `--tier-profile A` trims advanced verification assets for lightweight projects.
- `--tier-profile B` keeps the balanced default setup.
- `--tier-profile C` enforces full verification hardening (and defaults CI option to predeploy-focused when not explicitly set).
- `--tier-profile auto` derives profile from `--tier`.

## 5-Minute Start + Placeholder Guide

- Use `docs/QUICKSTART_5_MIN.md` in each applied project for exact Tier A/B/C one-command examples.
- Use `docs/PLACEHOLDER_REFERENCE.md` to resolve or intentionally allowlist placeholders.

## Template Versioning + Drift Detection

- Bootstrap writes `docs/TEMPLATE_VERSION.md` with the applied template pack version.
- Use `docs/UPGRADE_GUIDE.md` for old -> new template version upgrades.
- Run drift check:

```bash
bash scripts/check_template_drift.sh . /path/to/templates-v2
```

- Drift check fails if target version differs from source template version.

## Template Regression Fixture

- Fixture assets live under `templates-v2/tests-fixture/`.
- CI self-test bootstraps a temporary fixture project and validates expected outputs.
- Update `templates-v2/tests-fixture/expected_files_tier_b_profile2.txt` when intentional bootstrap outputs change.

## Migration Guidance

- Use **bootstrap** for both deterministic and interactive setup (omit `--target` for prompts).
- For large-scale rollout, set `--tier-profile auto` and let bootstrap prune/enforce by tier.
- Promote Tier A -> Tier B/C when project scope adds persistent state, multi-step workflows, or deploy-critical pathways; at promotion time, require `docs/MASTER_TRACEABILITY_TABLE.md` and per-Path-ID smoke coverage.

## Validation Assets
- `TEMPLATE_VALIDATION_CHECKLIST.md.template` defines manual checks.
- `scripts/validate_templates.sh.template` provides an automated baseline validation script.
- `TEMPLATE_INDEX.yaml.template` provides machine-readable navigation and applicability.
- `MASTER_TRACEABILITY_TABLE.md.template` provides pathway-level traceability and smoke coverage mapping baseline.

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

## Orchestrator Variant Notes

- The base `templates-v2` pack remains the canonical general-purpose template system.
- The `orchestrator-template` variant is intentionally separate while the delegation protocol is proven in real projects.
- It preserves V2 lean startup, validation, changelog, traceability, and adoption discipline while adding worker task packets, result packets, mandatory cloud review, investigator escalation, state ledgers, rollback fields, test-bloat safeguards, and token-saving orchestration rules.

## V1 Parity Notes
- Size limits: soft target <= 400 lines, hard refactor trigger > 500 lines
- Includes commands, matrix, smoke/targeted test policy, changelog discipline, deployment, rollback, security, release, observability, and risk tracking
- Specialized V1 assets (multi-app and local compose) are preserved as optional add-ons
- ADR records are supported via optional add-on template
- Consolidation removes duplicate rule sources by keeping `AI_AGENT.md` as the single canonical AI contract
- Legacy `AI_OPERATING_CONTRACT.md` support is moved to an optional add-on only
