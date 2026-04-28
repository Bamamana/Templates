# Templates Lean (Reliability With Lower Token Burn)

This pack is a lean alternative to `templates-v2`.

It is for projects that want to keep the same strengths that have been reducing drift and debugging:

- one canonical startup contract,
- explicit verify and doc-update rules,
- current execution state,
- traceability for Tier B/C projects,
- changelog discipline,
- strong CI and validation habits.

The difference is context strategy.

`templates-v2` is a fuller documentation-first pack.
`templates-lean` keeps the governance but changes how AI should read the docs:

- a very small always-on contract,
- a compact session brief,
- an explicit routing map,
- deeper docs loaded only when the task requires them.

## Design Goal

Preserve reliability while reducing repeated cloud-token usage.

The pack assumes the cost problem is caused more by repeated large-context reads than by the existence of the docs themselves.

## Core Idea

Keep the docs.
Stop reading all of them every time.

## Lean Context Layers

### 1. Always-On Layer
- `AI_AGENT.md`
- `docs/SESSION_BRIEF.md`
- `docs/CONTEXT_ROUTING.md`

These should be enough to start most tasks.

### 2. Task Layer
- nearby code
- exact task or ticket
- `docs/PROJECT_CANVAS.md` when current state matters
- `docs/ENGINEERING_PLAYBOOK.md` when commands or validation matter

### 3. Conditional Audit Layer
- `docs/TECH_STACK.md`
- `docs/OPS_SECURITY_RELEASE.md`
- `docs/MASTER_TRACEABILITY_TABLE.md`
- `CHANGELOG.md`

These stay in the repo for quality and governance, but are not default startup reads for every task.

## Pack Layout

- `AI_AGENT.md.template` -> `AI_AGENT.md`
- `SESSION_BRIEF.md.template` -> `docs/SESSION_BRIEF.md`
- `CONTEXT_ROUTING.md.template` -> `docs/CONTEXT_ROUTING.md`
- `PROJECT_CANVAS.md.template` -> `docs/PROJECT_CANVAS.md`
- `ENGINEERING_PLAYBOOK.md.template` -> `docs/ENGINEERING_PLAYBOOK.md`
- `TECH_STACK.md.template` -> `docs/TECH_STACK.md`
- `OPS_SECURITY_RELEASE.md.template` -> `docs/OPS_SECURITY_RELEASE.md`
- `MASTER_TRACEABILITY_TABLE.md.template` -> `docs/MASTER_TRACEABILITY_TABLE.md` (Tier B/C)
- `CHANGELOG.md.template` -> `CHANGELOG.md`
- `MIGRATION_GUIDE.md.template` -> `docs/MIGRATION_GUIDE.md`
- `APPLY_CHECKLIST.md.template` -> `docs/APPLY_CHECKLIST.md`
- `TEMPLATE_INDEX.yaml.template` -> `docs/TEMPLATE_INDEX.yaml`

## Best Use Cases

- Cloud-only workflows that need lower token usage.
- Projects already benefiting from the V2 governance model but paying too much for repeated context loads.
- Teams preparing for a later orchestrator-worker model but wanting immediate savings now.

## What This Pack Does Not Do

- It does not remove governance.
- It does not remove traceability for higher-tier projects.
- It does not weaken test or verify requirements.
- It does not replace careful task scoping.

## Migration Paths

- New project: apply the lean pack directly.
- Existing non-template project: add the lean pack and backfill commands, docs, and tier choice.
- Existing `templates-v2` project: keep the audit docs, shrink the startup path, add the session brief and routing map, and update the AI contract to stop loading every doc by default.

See `docs/MIGRATION_GUIDE.md` after applying the pack.