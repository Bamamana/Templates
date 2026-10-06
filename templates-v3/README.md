# Templates V3 (Thin Core, Profiles, Single Sources of Truth)

This pack is a condensed template system for **solo + AI vibe coding**. It keeps
the full capability coverage of templates-v2 while cutting the applied file count
by removing duplicated rules and consolidating the meta-docs.

## What Changed From v2

- **One rule source.** Commands, test policy, workflow matrix, smoke catalog,
  review, Definition of Done, and file-size rules all live in
  `docs/ENGINEERING_PLAYBOOK.md`. Other docs point there instead of restating them.
- **One lifecycle doc.** The separate quickstart, apply checklist, adoption
  walkthrough, profile migration, placeholder reference, validation checklist, and
  upgrade guide are consolidated into `docs/TEMPLATE_LIFECYCLE.md`.
- **`COMMANDS.md` folded** into `ENGINEERING_PLAYBOOK.md` §1 (Command Index).
- **Orchestrator is a profile, not a fork.** `profiles/orchestrator/` ships only
  the delegation deltas (role map, packets, review, investigator, ledgers,
  dashboard). It no longer re-ships `PROJECT_CANVAS`, `ENGINEERING_PLAYBOOK`,
  `COMMANDS`, `MASTER_TRACEABILITY_TABLE`, smoke catalog, or workflow matrix.
- **Audit-only docs moved to `addons/`** (coverage matrix, manual audit
  instructions) so default adoption stays small.

Coverage is preserved: rules moved, none were dropped. Authoritative ledgers
(`MASTER_TRACEABILITY_TABLE`, `CHANGELOG`), the operator model
(`OPERATOR_PROFILE`), and the enforcement scripts stayed as single sources.

## Pack Layout

```
templates-v3/
  AI_AGENT.md.template                 -> AI_AGENT.md (canonical startup)
  OPERATOR_PROFILE.md.template         -> docs/OPERATOR_PROFILE.md
  AI_MEMORY.md.template                -> docs/AI_MEMORY.md
  PROJECT_CANVAS.md.template           -> docs/PROJECT_CANVAS.md
  TECH_STACK.md.template               -> docs/TECH_STACK.md
  ENGINEERING_PLAYBOOK.md.template     -> docs/ENGINEERING_PLAYBOOK.md (single rule source)
  OPS_SECURITY_RELEASE.md.template     -> docs/OPS_SECURITY_RELEASE.md
  MASTER_TRACEABILITY_TABLE.md.template-> docs/MASTER_TRACEABILITY_TABLE.md (Tier B/C)
  CHANGELOG.md.template                -> CHANGELOG.md
  TEMPLATE_LIFECYCLE.md.template       -> docs/TEMPLATE_LIFECYCLE.md (all meta)
  TEMPLATE_INDEX.yaml.template         -> docs/TEMPLATE_INDEX.yaml (machine index)
  .github/workflows/ci.yml.template    -> .github/workflows/ci.yml
  scripts/                             verification + apply engine
  profiles/lean/                       routed-startup overlay
  profiles/orchestrator/               cloud-orchestrator + local-worker deltas
  addons/                              optional project + audit assets
  tests-fixture/                       bootstrap regression fixtures
```

## Core Applied Docs (12)
`AI_AGENT.md`, `docs/OPERATOR_PROFILE.md`, `docs/AI_MEMORY.md`,
`docs/PROJECT_CANVAS.md`, `docs/TECH_STACK.md`, `docs/ENGINEERING_PLAYBOOK.md`,
`docs/OPS_SECURITY_RELEASE.md`, `docs/MASTER_TRACEABILITY_TABLE.md` (Tier B/C),
`CHANGELOG.md`, `docs/TEMPLATE_LIFECYCLE.md`, `docs/TEMPLATE_INDEX.yaml`,
`.github/workflows/ci.yml`.

## Profiles

- **Default**: core only.
- **Lean** (`--lean`): core plus slim `AI_AGENT.md`, `docs/SESSION_BRIEF.md`,
  `docs/CONTEXT_ROUTING.md`, and context-budget tooling.
- **Orchestrator** (`--orchestrator`): lean startup plus
  `docs/ORCHESTRATION_MAP.md` (role split + 9-step worker loop), packet templates,
  mandatory post-coding review, investigator protocol, state ledgers,
  local-worker health, test-bloat sweep, operator dashboard, scenario playbook,
  and closing checklist.

Profiles are overlays of one pack, never forks, so improvements cannot drift.

## One-Command Bootstrap

```bash
bash templates-v3/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project \
  --project-name "My Project" \
  --tier TIER_B_STANDARD \
  --tier-profile auto \
  --strict
```

Add `--lean` or `--orchestrator` for those profiles. Omit `--target` for
interactive mode. One run applies files, auto-fills placeholders, runs
`scripts/validate_templates.sh`, stamps `docs/TEMPLATE_VERSION.md`, and writes
`docs/TEMPLATE_READINESS_REPORT.md` plus an unresolved-placeholder report.

## Tier Profiles
- `--tier-profile A` trims advanced verification assets.
- `--tier-profile B` is the balanced default.
- `--tier-profile C` enforces full verification hardening (CI defaults to the predeploy-focused preset).
- `--tier-profile auto` derives the profile from `--tier`.

## Start Here
1. Read `TEMPLATE_LIFECYCLE.md` (the applied copy is `docs/TEMPLATE_LIFECYCLE.md`):
   §1 quickstart, §2 profiles, §4 adoption, §6 validation, §7 upgrade.
2. Run the bootstrap above.
3. Human startup prompt to the AI: "Read `AI_AGENT.md` and follow it strictly."

## Validation Assets
- `scripts/validate_templates.sh` — automated baseline validation.
- `scripts/check_template_drift.sh` — applied-vs-source version parity.
- `scripts/sync_templates_source.sh` — optional reference-only source mirror for audits.
- `TEMPLATE_INDEX.yaml.template` — machine-readable navigation and applicability.
- `tests-fixture/` — CI self-test bootstraps temporary projects and checks expected outputs.

## Orchestrator Profile Notes
- The base pack remains the canonical general-purpose template.
- The orchestrator profile preserves lean startup, validation, changelog, and
  traceability discipline while adding task packets, result packets, mandatory
  cloud review, investigator escalation, state ledgers, rollback fields, and
  token-saving rules.
- Role detail and the 9-step worker loop live in `docs/ORCHESTRATION_MAP.md`;
  packets in `docs/WORKER_TASK_PACKET.md` and `docs/WORKER_RESULT_PACKET.md`.
