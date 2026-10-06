# Lean Profile

Lean is a **load profile of `templates-v3`**, not a separate pack. It keeps every
core doc, script, and CI workflow. It changes only one thing: **what the AI reads
by default at session start.**

## What it changes
- Replaces the core `AI_AGENT.md` with a slim version that does **not** read the
  full governance chain at startup.
- Adds `docs/SESSION_BRIEF.md` (current execution state) and
  `docs/CONTEXT_ROUTING.md` (load-on-trigger map).
- Default startup: 3 small docs instead of the full navigation chain.

## What it does NOT change
- All core docs remain (`PROJECT_CANVAS`, `ENGINEERING_PLAYBOOK`, `TECH_STACK`,
  `OPS_SECURITY_RELEASE`, `MASTER_TRACEABILITY_TABLE`, `CHANGELOG`, `AI_MEMORY`, …).
- All scripts, validators, drift checks, and CI workflows remain.
- Tier A/B/C governance and the Definition of Done are unchanged.
- Verify gate, changelog discipline, and traceability rules are unchanged.

## Apply
```bash
bash templates-v3/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/project \
  --project-name "My Project" \
  --tier TIER_B_STANDARD \
  --lean
```

The bootstrap applies the core pack normally, then overlays the 3 lean files and
installs `validate_context_budget.sh`, `report_context_size.sh`, and
`sync_session_brief.sh` so CI can keep the always-on layer small.

## Retrofit an existing v3 project
Safe to run on any project already standardized with templates-v3. The `--lean`
overlay force-overwrites only the three startup-context files; every other doc
you have already filled in is left untouched because the bootstrap skips existing
files by default.

```bash
bash /path/to/Templates/templates-v3/scripts/bootstrap_agent_ready.sh.template \
  --target /path/to/existing-project --tier TIER_B_STANDARD --lean
```

Post-retrofit checklist:
- [ ] `bash scripts/validate_context_budget.sh` passes (always-on under budget)
- [ ] `docs/SESSION_BRIEF.md` reflects current phase / milestone / next command
- [ ] `docs/CONTEXT_ROUTING.md` triggers match this project's reality
- [ ] First session prompt to the AI is just: "Read `AI_AGENT.md` and follow it."
- [ ] `CHANGELOG.md` `[Unreleased]` notes the lean migration

## Files in this profile
- `AI_AGENT.md.template` → `AI_AGENT.md` (overlay, replaces core)
- `SESSION_BRIEF.md.template` → `docs/SESSION_BRIEF.md`
- `CONTEXT_ROUTING.md.template` → `docs/CONTEXT_ROUTING.md`

## Why a profile, not a fork
A separate pack drifts from the core. A profile cannot — it inherits every core
improvement automatically and only overrides the three startup-context files.
