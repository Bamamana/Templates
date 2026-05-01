# Starter Prompts

## Hybrid Local Mode

Use for small, obvious, low-risk changes.

```text
Hybrid local mode. This is a small change.
Read AI_AGENT.md first and follow the project rules.
Use the relevant routing docs only as needed.
Make the smallest safe change.
Run the relevant smoke or verify check if available.
Update docs only if this changes tracked behavior, workflow, or instructions.
If the task becomes broad, risky, or unclear, stop and tell me it should move to orchestrator mode.
```

Example:

```text
Hybrid local mode. This is a small UI fix.
Read AI_AGENT.md first and follow the project rules.
The submit button is not clicking. Find the likely cause, fix it if it is local and low-risk, run the relevant check, and update docs only if needed.
Stop if this touches auth, data, security, deployment, or a broad refactor.
```

## Orchestrator Mode

Use for big changes, migrations, refactors, or work that needs planning and review.

```text
Orchestrator mode.
Read AI_AGENT.md first and follow the project rules.
Detect the active Templates profile.
Use the relevant Templates migration/adoption checklist.
Make a plan, break the work into safe packets, and process one packet at a time.
Use local worker models for bounded implementation.
Use cloud review before accepting completed packets.
Stop and ask me before touching auth, data, security, deployment, destructive operations, or unclear decisions.
```

## Template Carryover Mode

Use when Templates was updated and a project needs to receive the new rules or checklist changes.

```text
Template carryover mode.
Read AI_AGENT.md first.
Compare this project against the current Templates source of truth.
Use the Templates profile migration and adoption checklist.
Tell me the current profile, target profile, and carryover pathway.
Audit what is missing or outdated.
Apply only the relevant template updates for this project's profile.
Run validation if available.
Update required docs and summarize exactly what changed.
Stop if the project needs a decision before continuing.
```

## Review-Only Mode

Use when you want the AI to inspect without editing.

```text
Review-only mode.
Read AI_AGENT.md first and follow the project rules.
Do not edit files.
Audit the requested area against the active Templates checklist.
Report findings, missing checklist items, stale docs, and recommended next steps.
```
