# Orchestrator Template Roadmap

This file is the working map for evolving the `orchestrator-template` draft into a usable template pack.

## Goal

Create a template variant that lets a premium cloud model act as mastermind/checker while a local LLM performs most bounded code creation, test loops, refactors, docs work, and validation.

## What This Variant Must Preserve From V2

- One canonical startup contract
- Tier-aware guardrails
- Test and verify discipline
- Changelog and docs updates in the same change
- Traceability and smoke coverage for Tier B and C projects
- Small-slice execution as the default behavior

## New Behavior This Variant Must Add

- Explicit three-role split: cloud orchestrator, local worker, cloud investigator
- Structured handoff packet for delegated subtasks
- Structured result packet for review and acceptance
- 9-step local test-first loop with Packet Class iteration ceilings
- Mandatory cloud review of every DONE packet
- Traceability, smoke catalog, workflow matrix, and rollback evidence
- Test bloat prevention with per-packet justification and periodic sweep rules
- Token-saving policy that discourages repeated full-repo rereads
- Clear halt/escalation triggers when work stops being a bounded slice

## Current Draft Contents

- `AI_AGENT.md.template`
- `SESSION_BRIEF.md.template`
- `CONTEXT_ROUTING.md.template`
- `GAME_PLAN.md.template`
- `ORCHESTRATOR_CARRYOVER_EXAMPLE.md.template`
- `PROJECT_CANVAS.md.template`
- `ENGINEERING_PLAYBOOK.md.template`
- `ORCHESTRATION_MAP.md.template`
- `WORKER_TASK_PACKET.md.template`
- `WORKER_RESULT_PACKET.md.template`
- `APPLY_CHECKLIST.md.template`
- `POST_CODING_CHECKS.md.template`
- `INVESTIGATOR_PROTOCOL.md.template`
- `TEST_BLOAT_SWEEP.md.template`
- `MASTER_TRACEABILITY_TABLE.md.template`
- `SMOKE_TEST_CATALOG.md.template`
- `WORKFLOW_TEST_MATRIX.md.template`
- `FEATURE_SPEC_TEMPLATE.md.template`
- `STATE_LEDGER_PROTOCOL.md.template`
- `LOCAL_WORKER_HEALTH.md.template`
- `packet_ledger.json.template`
- `session_budget.json.template`
- `OPERATOR_DASHBOARD.md.template`
- `TEMPLATE_INDEX.yaml.template`

## Next Build Steps

1. Prove the ASUS/local-worker flow with real packets before making this the default bootstrap path for all projects.
2. Keep `--orchestrator` bootstrap behavior aligned with this folder as the source of authority.
3. Add a fixture test for `--orchestrator` bootstrap in CI.
4. Expand CLI helpers only if real packet work shows more lifecycle operations are needed.
6. Decide whether this becomes `templates-v3/orchestrator` or remains a `templates-v2` variant.

## Open Questions

1. What provider-side budget mechanism should backstop the session budget JSON?
2. Should bootstrap stamp different defaults for local-only, hybrid, and privacy-sensitive projects?
3. Should Tier C projects require stricter worker sandboxing by default?

## Initial Success Criteria

- A project can apply this variant without ambiguity.
- The orchestrator can issue bounded work without re-reading the full repo each time.
- The worker can execute smoke tests, narrow refactors, docs updates, and routine feature slices.
- The cloud review catches weak tests, scope creep, and fake evidence before the operator approves.
- The operator dashboard exposes safe choices without requiring code-reading skill.