# Follow-Up Prompts

Use these after the AI says it is done.

## Standard Done Check

```text
Before we call this done, verify that you followed AI_AGENT.md and the active Templates checklist.
Confirm:
- what checklist or post-coding checks you used
- what files you changed
- what docs needed updates
- what docs did not need updates and why
- what tests, smoke checks, or validation commands you ran
- whether anything should move to orchestrator mode
```

## Documentation Update Check

```text
Check whether this change requires updates to project docs.
Review AI_AGENT.md, the active routing docs, post-coding checks, traceability docs, and any relevant game plan/checklist.
Update required docs now.
If no docs need updates, say why.
```

## Template Carryover Completion Check

```text
Before closing the carryover, verify against the Templates adoption/profile migration checklist.
Confirm:
- current profile
- target profile
- migration pathway used
- checklist items completed
- checklist items intentionally skipped and why
- files copied or updated from Templates
- validation commands run
- remaining operator decisions
```

## Orchestrator Packet Completion Check

```text
Before accepting this packet, verify the worker result against the task packet and post-coding checklist.
Confirm:
- packet ID
- acceptance criteria status
- allowed files respected
- allowed commands respected
- tests or smoke checks run
- docs and traceability updates completed
- whether review should ACCEPT, REPAIR, REJECT, or ESCALATE
```

## Small Local Change Check

```text
This was hybrid local mode. Before we call it done, confirm it stayed small and low-risk.
Confirm:
- AI_AGENT.md was read
- the change stayed in the expected files
- no auth, data, security, deployment, or broad refactor was touched
- relevant smoke/verify check was run or explain why not
- docs were updated if needed
```

## If The AI Gives A Vague Summary

```text
Make that concrete.
List the exact files changed, checks run, checklist used, docs updated, and any remaining risks or skipped items.
Do not call it done until the Templates checklist is satisfied or you clearly mark what is blocked.
```
