# Project Standardization Kit (SmartCampusSystemServer)

Use this kit to normalize any existing or new repository into the same AI-first professional format used here.

## Target Outcome
Every project should have:
- A single AI entrypoint contract (`AI_AGENT.md`)
- Canonical governance (`docs/constitution/AI_SOURCE_OF_TRUTH.md`)
- Generated project map (`AI_CONTEXT.md`)
- Explicit plan/status tracking (`docs/GAME_PLAN.md`)
- Change history (`CHANGELOG.md`)
- Local smoke workflow + automated verify gate

## Template Pack
Copy the following templates into the destination project and replace placeholders:

### Root-level templates
- `templates/AI_AGENT.md.template`
- `templates/CHANGELOG.md.template`

### Core docs templates
- `templates/INSTRUCTIONS_INDEX.md.template`
- `templates/GAME_PLAN.md.template`
- `templates/WORKFLOW_COMMANDS.md.template`
- `templates/WORKFLOW_TEST_MATRIX.md.template`
- `templates/SMOKE_TEST_CATALOG.md.template`
- `templates/POST_CODING_CHECKS.md.template`
- `templates/MANUAL_SMOKE_RUNBOOK.md.template`
- `templates/FEATURE_SPEC_TEMPLATE.md.template`
- `templates/DEPLOYMENT_RUNBOOK.md.template`
- `templates/MULTI_APP_SERVER_BLUEPRINT.md.template`
- `templates/SECRETS_POLICY.md.template`
- `templates/PROJECT_TIER_POLICY.md.template`
- `templates/ADR_TEMPLATE.md.template`
- `templates/RISK_REGISTER.md.template`
- `templates/RELEASE_POLICY.md.template`
- `templates/SECURITY_AUTOMATION_BASELINE.md.template`
- `templates/OBSERVABILITY_RUNBOOK.md.template`
- `templates/TEMPLATE_LINT_CHECKLIST.md.template`
- `templates/REFRACTOR_PLAYBOOK.md.template`
- `templates/FIRST_SESSION_PROMPT.txt`

### Constitution templates
- `templates/AI_SOURCE_OF_TRUTH.md.template`

### Architecture templates
- `templates/repository-map.md.template`

### Runtime templates
- `templates/docker-compose.local.yml.template`

## Bootstrap Sequence (Per Project)
1. Apply template files and replace placeholders.
2. Create/verify scripts:
	- `scripts/verify.sh`
	- `scripts/update_ai_map.py`
	- `scripts/enforce_limits.py`
	- `scripts/test_smoke.sh`
	- targeted workflow scripts
3. Add toolchain baseline:
	- `pyproject.toml` (`ruff`, `black`, `mypy`, `pytest`, coverage)
	- `.pre-commit-config.yaml`
	- `.github/workflows/ci.yml`
4. Add minimal tests:
	- one smoke test
	- one targeted workflow test
5. Generate `AI_CONTEXT.md` and run verify gate.

## Phase Model (Apply to all projects)
- Phase 0: governance baseline
- Phase 1: modularization (no behavior changes)
- Phase 2: feature implementation with tests
- Phase 3: deployment readiness/hardening
- Phase 4: production rollout

## Applicability by Project Size (Solo + AI Included)
- Every project (including solo + AI) uses the same core governance baseline.
- Use `docs/PROJECT_TIER_POLICY.md` to select Tier A/B/C and determine required vs optional controls.
- For optional controls in the selected tier, keep the doc as `N/A` with a one-line rationale rather than deleting standards.
- Re-tier when complexity increases (auth, persistence, multi-service, production users, compliance scope).

## Hard Standards
- `AI_AGENT.md` is always the mandatory AI session entrypoint.
- Behavior changes require targeted tests and changelog updates.
- Docs are updated in the same change as code/path/command changes.
- Soft limit: new files <= 400 lines. Hard trigger: refactor at > 500 lines.
- Verify gate must pass before handoff.

## Recommended Migration Order for Existing Projects
1. Install governance/docs/templates first.
2. Add verify tooling and CI.
3. Normalize tests and workflow matrix.
4. Refactor oversized modules in isolated passes.
5. Start feature work only after Phases 0 and 1 are complete.
