# Project Standardization Kit

Use this repository to standardize existing or new projects around the `templates-v2` pack.

`templates-v2` is the canonical source. If this file and `templates-v2/README.md` ever disagree, follow `templates-v2/README.md` and update this guide.

## Apply Profiles
The pack supports two startup-context profiles. Both share the same docs, scripts, CI, and governance:

- **default** — v2 startup behavior. The agent is instructed to read the full navigation chain at session start. Best when token cost is not a constraint.
- **lean** — same docs in the repo, but the agent reads only `AI_AGENT.md`, `docs/SESSION_BRIEF.md`, and `docs/CONTEXT_ROUTING.md` by default. Deeper docs load only on triggers defined in `CONTEXT_ROUTING.md`. Apply with `--lean`. Adds `scripts/validate_context_budget.sh` to keep the always-on layer under budget in CI.

The lean profile lives at `templates-v2/profiles/lean/` and is applied as an overlay by the same bootstrap script. The previous `templates-lean/` pack has been retired to prevent drift.

## Target Outcome
Every standardized project should have:
- One canonical AI startup contract: `AI_AGENT.md`
- A small core docs set under `docs/`
- A tier-appropriate verification baseline
- CI wired to the same project rules and commands
- Placeholder resolution tracked and validated
- Changelog discipline for behavior changes

## Canonical Pack Layout
The active template pack lives under `templates-v2/`.

Core templates:
- `templates-v2/AI_AGENT.md.template` -> `AI_AGENT.md`
- `templates-v2/AI_MEMORY.md.template` -> `docs/AI_MEMORY.md`
- `templates-v2/MASTER_TRACEABILITY_TABLE.md.template` -> `docs/MASTER_TRACEABILITY_TABLE.md` (Tier B/C)
- `templates-v2/PROJECT_CANVAS.md.template` -> `docs/PROJECT_CANVAS.md`
- `templates-v2/TECH_STACK.md.template` -> `docs/TECH_STACK.md`
- `templates-v2/ENGINEERING_PLAYBOOK.md.template` -> `docs/ENGINEERING_PLAYBOOK.md`
- `templates-v2/OPS_SECURITY_RELEASE.md.template` -> `docs/OPS_SECURITY_RELEASE.md`
- `templates-v2/CHANGELOG.md.template` -> `CHANGELOG.md`
- `templates-v2/QUICKSTART_5_MIN.md.template` -> `docs/QUICKSTART_5_MIN.md`
- `templates-v2/PLACEHOLDER_REFERENCE.md.template` -> `docs/PLACEHOLDER_REFERENCE.md`
- `templates-v2/UPGRADE_GUIDE.md.template` -> `docs/UPGRADE_GUIDE.md`
- `templates-v2/TEMPLATE_VALIDATION_CHECKLIST.md.template` -> `docs/TEMPLATE_VALIDATION_CHECKLIST.md`
- `templates-v2/APPLY_CHECKLIST.md.template` -> `docs/APPLY_CHECKLIST.md`
- `templates-v2/TEMPLATE_INDEX.yaml.template` -> `docs/TEMPLATE_INDEX.yaml`
- `templates-v2/.github/workflows/ci.yml.template` -> `.github/workflows/ci.yml`

Optional add-ons:
- `templates-v2/addons/README.md.template` -> `README.md`
- `templates-v2/addons/.gitignore.template` -> `.gitignore`
- `templates-v2/addons/CONTRIBUTING.md.template` -> `CONTRIBUTING.md`
- `templates-v2/addons/LICENSE.template` -> `LICENSE`
- `templates-v2/addons/.github/PULL_REQUEST_TEMPLATE.md.template` -> `.github/PULL_REQUEST_TEMPLATE.md`
- `templates-v2/addons/.github/ISSUE_TEMPLATE/bug_report.md.template` -> `.github/ISSUE_TEMPLATE/bug_report.md`
- `templates-v2/addons/.github/ISSUE_TEMPLATE/feature_request.md.template` -> `.github/ISSUE_TEMPLATE/feature_request.md`
- `templates-v2/addons/.github/ISSUE_TEMPLATE/config.yml.template` -> `.github/ISSUE_TEMPLATE/config.yml`
- `templates-v2/addons/.github/workflows/ci.predeploy.yml.template` -> `.github/workflows/ci.yml`
- `templates-v2/addons/MULTI_APP_SERVER_BLUEPRINT.md.template` -> `docs/MULTI_APP_SERVER_BLUEPRINT.md`
- `templates-v2/addons/docker-compose.local.yml.template` -> `docker-compose.local.yml`
- `templates-v2/addons/FIRST_SESSION_PROMPT.txt.template` -> `docs/FIRST_SESSION_PROMPT.txt`
- `templates-v2/addons/ADR_TEMPLATE.md.template` -> `docs/ADR_TEMPLATE.md`
- `templates-v2/addons/ADVANCED_VERIFICATION_PLAYBOOK.md.template` -> `docs/ADVANCED_VERIFICATION_PLAYBOOK.md`
- `templates-v2/addons/AI_OPERATING_CONTRACT.md.template` -> `AI_OPERATING_CONTRACT.md`

Orchestrator variant:
- `templates-v2/orchestrator-template/` -> reusable cloud-mastermind/local-worker pattern for projects where a local LLM does most bounded code creation and a premium model plans, reviews, and escalates. This variant is separate from the default bootstrap path until proven and wired into automation.

Verification and bootstrap scripts:
- `templates-v2/scripts/bootstrap_agent_ready.sh.template`
- `templates-v2/scripts/validate_templates.sh.template`
- `templates-v2/scripts/check_template_drift.sh.template`
- `templates-v2/scripts/placeholder_allowlist.txt.template`
- `templates-v2/scripts/predeploy_full_suite.sh.template`
- `templates-v2/scripts/parity_pathways_report.py.template`
- `templates-v2/scripts/parity-retired-pathways.json.template`
- `templates-v2/scripts/refactor_smoke_contract.py.template`
- `templates-v2/scripts/enforce_doc_updates.sh.template`
- `templates-v2/scripts/smoke_masterapi_refactor.sh.template`
- `templates-v2/scripts/smoke_enginepath_refactor.sh.template`
- `templates-v2/scripts/run_fixture_suite.sh.template`
- `templates-v2/scripts/refresh_snapshot_baseline.sh.template`
- `templates-v2/scripts/refactor-contracts/masterapi-slice1.json.template`
- `templates-v2/scripts/refactor-contracts/enginepath-slice1.json.template`
- `templates-v2/scripts/validate_context_budget.sh.template` (lean budget gate)
- `templates-v2/scripts/report_context_size.sh.template` (lean size report)

Lean profile overlay:
- `templates-v2/profiles/lean/AI_AGENT.md.template` -> `AI_AGENT.md` (replaces default)
- `templates-v2/profiles/lean/SESSION_BRIEF.md.template` -> `docs/SESSION_BRIEF.md`
- `templates-v2/profiles/lean/CONTEXT_ROUTING.md.template` -> `docs/CONTEXT_ROUTING.md`

## Recommended Apply Path
Use the bootstrap script instead of manually copying files whenever possible.

Non-interactive example (default profile):

```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project \
  --project-name "My Project" \
  --tier TIER_B_STANDARD \
  --tier-profile auto \
  --strict
```

Non-interactive example (lean profile):

```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project \
  --project-name "My Project" \
  --tier TIER_B_STANDARD \
  --lean \
  --strict
```

## Retrofit An Existing v2 Project To Lean

Safe on any project already standardized with v2 (e.g. Carlson Law, Visual Planner). The `--lean` overlay only force-overwrites the three startup-context files; everything else you have already filled in is preserved.

```bash
bash /home/mamana/private-repos/Templates/templates-v2/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/existing-project \
  --tier TIER_B_STANDARD \
  --lean
```

What changes: `AI_AGENT.md` is replaced; `docs/SESSION_BRIEF.md`, `docs/CONTEXT_ROUTING.md`, `scripts/validate_context_budget.sh`, and `scripts/report_context_size.sh` are added.

What does not change: every other v2 doc, every script, every addon, all your filled-in placeholders and history.

Copy-paste AI prompt to perform the retrofit autonomously in an existing v2 project:

> "This project uses `templates-v2`. Apply the lean profile from `Templates/templates-v2/profiles/lean/` by running:
> `bash /home/mamana/private-repos/Templates/templates-v2/scripts/bootstrap_agent_ready.sh.template --target . --tier <tier> --lean`
> Then populate `docs/SESSION_BRIEF.md` from the current state of `docs/PROJECT_CANVAS.md` and `CHANGELOG.md`.
> Then run `bash scripts/validate_context_budget.sh` and confirm it passes.
> Then update `CHANGELOG.md` under `[Unreleased]` to record the migration to the lean startup profile.
> Do not modify any other v2 files."

After retrofit, the human startup prompt becomes simply: *"Read `AI_AGENT.md` and follow it."*

Interactive mode:

```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template
```

What bootstrap handles:
1. Applies the core template set.
2. Adds optional verification assets based on profile.
3. Prunes assets by tier.
4. Replaces common placeholders.
5. Runs the template validator.
6. Writes readiness and unresolved-placeholder reports.

## Migration Sequence For Existing Projects
1. Choose a tier and tier profile.
2. Run bootstrap into the target project.
3. Resolve remaining placeholders and set real commands.
4. Wire project-native verify, smoke, lint, and CI commands.
5. Add or map traceability coverage for Tier B/C projects.
6. Run validation and fix drift before feature work continues.

## Hard Standards
- `AI_AGENT.md` is the canonical AI session entrypoint.
- Tier B/C projects require `docs/MASTER_TRACEABILITY_TABLE.md` with smoke coverage per active Path ID.
- Behavior changes require tests and changelog updates in the same change.
- Docs must change with commands, runtime paths, workflows, or architecture.
- Prefer files under 400 lines; refactor aggressively after 500 lines.
- The verification gate must pass before handoff.

## Repository Notes
- `SERVER_CONTEXT.md` is intentionally sanitized so the repository remains reusable.
- Keep project-specific hostnames, aliases, remote paths, and secrets in a private operator doc, not in the shared template baseline.
