# Operating System Template

This folder is the editable source of truth for the reduced AI operating-system template used by LangGraph-Orchestrator-Runner.

## Source And Mirror

- Editable source: `/root/repos/Bamamana/Templates/operating-system`
- LangGraph runtime mirror: `/root/repos/Bamamana/LangGraph-Orchestrator-Runner/vendor/operating-system`
- Sync command from LangGraph: `npm run operating-system:sync`
- Check command from LangGraph: `npm run operating-system:check`

Do not edit the runtime mirror directly unless you are deliberately repairing a sync failure. Make source changes here, sync, then verify the runner.

## Core Artifacts

- `AI_AGENT.md.template`: startup contract
- `SESSION_BRIEF.md.template`: compact resume state
- `CONTEXT_ROUTING.md.template`: deeper-doc triggers
- `PROJECT_STATE.md.template`: current state, tier, profile, scope, risk, and validation
- `ORCHESTRATOR_PLAN.md.template`: reviewed execution plan
- `ENGINEERING_RUNBOOK.md.template`: commands, tests, scripts, CI, and verify rules
- `OPERATIONS_RUNBOOK.md.template`: deploy, rollback, security, release, and incident rules
- `TEMPLATE_LIFECYCLE.md.template`: adoption, validation, placeholder, and upgrade rules
- `AUDITOR_CONTRACT.md.template`, `ORCHESTRATOR_CONTRACT.md.template`, `WORKER_CONTRACT.md.template`, `REVIEWER_CONTRACT.md.template`: role boundaries
- `WORKER_TASK_PACKET.md.template`, `WORKER_RESULT_PACKET.md.template`, `REVIEW_CHECKLIST.md.template`: packet and review flow
- `RUNTIME_MIRROR_MANIFEST.json.template`: files copied into the runtime mirror
- `TEMPLATE_INDEX.yaml.template` and `TEMPLATE_AUDIT_MANIFEST.yaml.template`: machine-readable inventory and audit checklist

## Validation

From `/root/repos/Bamamana/LangGraph-Orchestrator-Runner`:

```bash
npm run operating-system:check
bash scripts/validate_operating_system.sh .
npm run verify
```

## Cleanup Rule

Legacy template packs and historical planning artifacts are not runtime inputs for this operating system. If a removed artifact is needed for archaeology, restore it from git in a temporary branch or scratch folder rather than reintroducing it as a current source file.