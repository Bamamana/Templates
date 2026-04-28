# Orchestrator Template Roadmap

This file is the working map for evolving the `orchestrator-template` draft into a usable template pack.

## Goal

Create a template variant that lets a premium cloud model keep the whole-project mental model while delegating narrow coding and test loops to a local model, with less token burn and less code drift.

## What This Variant Must Preserve From V2

- One canonical startup contract
- Tier-aware guardrails
- Test and verify discipline
- Changelog and docs updates in the same change
- Traceability and smoke coverage for Tier B and C projects
- Small-slice execution as the default behavior

## New Behavior This Variant Must Add

- Explicit role split between orchestrator and worker
- Structured handoff packet for delegated subtasks
- Structured result packet for review and acceptance
- Token-saving policy that discourages repeated full-repo rereads
- Clear escalation triggers when work stops being a bounded slice

## Current Draft Contents

- `AI_AGENT.md.template`
- `PROJECT_CANVAS.md.template`
- `ENGINEERING_PLAYBOOK.md.template`
- `ORCHESTRATION_MAP.md.template`
- `WORKER_TASK_PACKET.md.template`
- `WORKER_RESULT_PACKET.md.template`
- `TEMPLATE_INDEX.yaml.template`

## Next Build Steps

1. Decide whether this stays a separate variant pack or folds back into `templates-v2` as an optional profile.
2. Add orchestrator-aware versions of `AI_MEMORY`, `TECH_STACK`, and `OPS_SECURITY_RELEASE` only if they need role-specific rules.
3. Define bootstrap behavior for applying this variant into real projects.
4. Add a validation script that checks for required orchestration docs and packet structure.
5. Add one worked example based on a real project like the law firm app or Visual Planner server.
6. Decide how much of the result packet should be human-facing versus agent-facing.

## Open Questions

1. Should the worker packet live as a persistent doc in the repo, or as an ephemeral prompt artifact generated per task?
2. Should the orchestrator be required to approve every worker result, or only risky slices?
3. Should bootstrap stamp different defaults for local-only, hybrid, and privacy-sensitive projects?
4. Should Tier C projects require stronger worker restrictions by default?

## Initial Success Criteria

- A project can apply this variant without ambiguity.
- The orchestrator can issue bounded work without re-reading the full repo each time.
- The worker can execute common tasks like smoke tests, narrow refactors, and routine feature slices.
- The final review still respects the existing V2 quality and documentation standards.