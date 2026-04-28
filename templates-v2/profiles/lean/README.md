# Lean Profile

Lean is a **load profile of `templates-v2`**, not a separate pack. It keeps every v2 doc, script, and CI workflow. It changes only one thing: **what the AI reads by default at session start.**

## What it changes
- Replaces v2's `AI_AGENT.md` with a slim version that does **not** instruct the agent to read 9 docs.
- Adds `docs/SESSION_BRIEF.md` (current execution state) and `docs/CONTEXT_ROUTING.md` (load-on-trigger map).
- Default startup: 3 small docs (~100 lines) instead of v2's full navigation chain.

## What it does NOT change
- All v2 docs remain in the project (`PROJECT_CANVAS`, `ENGINEERING_PLAYBOOK`, `TECH_STACK`, `OPS_SECURITY_RELEASE`, `MASTER_TRACEABILITY_TABLE`, `CHANGELOG`, `AI_MEMORY`, etc.).
- All v2 scripts, validators, drift checks, and CI workflows remain.
- Tier A/B/C governance and Definition of Done are unchanged.
- Verify gate, changelog discipline, and traceability rules are unchanged.

## Apply
Use the v2 bootstrap with `--lean`:

```bash
bash templates-v2/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project \
  --project-name "My Project" \
  --tier TIER_B_STANDARD \
  --lean
```

The bootstrap applies v2 normally, then overlays the 3 lean files on top, and copies `validate_context_budget.sh` so CI can keep the always-on layer small.

## Retrofit An Existing templates-v2 Project

Safe to run on any project already standardized with v2 (e.g. Carlson Law, Visual Planner). The `--lean` overlay **force-overwrites only** the three startup-context files; every other v2 doc you have already filled in (`PROJECT_CANVAS.md`, `ENGINEERING_PLAYBOOK.md`, `CHANGELOG.md`, traceability table, etc.) is left untouched because the bootstrap skips existing files by default.

### One-line retrofit
```bash
bash /path/to/Templates/templates-v2/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/existing-project \
  --tier TIER_B_STANDARD \
  --lean
```

### What gets written
- `AI_AGENT.md` — **replaced** with the lean version (the slim startup contract).
- `docs/SESSION_BRIEF.md` — **created** (you fill in current phase / next command).
- `docs/CONTEXT_ROUTING.md` — **created** (load-on-trigger map).
- `scripts/validate_context_budget.sh` — **created**.
- `scripts/report_context_size.sh` — **created**.

### What stays unchanged
- Every other v2 doc, script, addon, and CI workflow.
- All your filled-in placeholders, project canvas state, traceability rows, and changelog history.

### Copy-paste AI prompt for retrofit
Use this verbatim in any AI session inside a v2-standardized project:

> "This project uses `templates-v2`. Apply the lean profile from `Templates/templates-v2/profiles/lean/` by running:
> `bash /home/mamana/private-repos/Templates/templates-v2/scripts/bootstrap_agent_ready.sh.template --target . --tier <tier> --lean`
> Then fill in `docs/SESSION_BRIEF.md` from the current state of `docs/PROJECT_CANVAS.md` and `CHANGELOG.md`.
> Then run `bash scripts/validate_context_budget.sh` and confirm it passes.
> Then update `CHANGELOG.md` under `[Unreleased]` to record the migration to the lean startup profile.
> Do not touch any other v2 files."

### Post-retrofit checklist
- [ ] `bash scripts/validate_context_budget.sh` passes (always-on under 6KB).
- [ ] `docs/SESSION_BRIEF.md` reflects current phase / milestone / next command.
- [ ] `docs/CONTEXT_ROUTING.md` triggers match this project's reality.
- [ ] First session prompt to the AI is just: *"Read `AI_AGENT.md` and follow it."*
- [ ] `CHANGELOG.md` `[Unreleased]` notes the lean migration.

## Files in this profile
- `AI_AGENT.md.template` → `AI_AGENT.md` (overlay, replaces v2's)
- `SESSION_BRIEF.md.template` → `docs/SESSION_BRIEF.md`
- `CONTEXT_ROUTING.md.template` → `docs/CONTEXT_ROUTING.md`

## Why a profile, not a fork
A separate pack drifts from v2. A profile cannot — it inherits every v2 improvement automatically and only overrides the three startup-context files.
