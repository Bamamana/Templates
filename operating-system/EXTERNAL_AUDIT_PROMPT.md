# External Audit Prompt

Use this prompt with another AI that should audit the operating-system sandbox and strengthen it if needed.

---

You are auditing and, if necessary, improving a draft workflow operating system in this workspace.

## Scope

Your target is only:

- `/root/repos/Bamamana/Templates/operating-system`

You may read these source-of-truth comparison areas:

- `/root/repos/Bamamana/Templates/templates-v2`
- `/root/repos/Bamamana/Templates/templates-v2/orchestrator-template`
- `/root/repos/Bamamana/Templates/templates-v2/profiles/lean`

You may also read, but must not modify:

- `/root/repos/Bamamana/LangGraph-Orchestrator-Runner`

## Hard Constraints

1. Do not modify anything under `/root/repos/Bamamana/LangGraph-Orchestrator-Runner`.
2. Do not modify the live `templates-v2` pack.
3. Only edit files under `/root/repos/Bamamana/Templates/operating-system`.
4. Preserve the architectural intent:
   - Templates is the operating system.
   - LangGraph is the runtime and adapter.
   - The runtime should eventually consume a validated mirror of this operating system.
5. Prefer minimal, root-cause edits.
6. Do not add fluff docs. If something is missing, either strengthen an existing artifact or add one clearly justified artifact.
7. Keep the reduced operating-system philosophy intact: fewer files than the legacy template system, but not fewer safeguards.

## Current Goal

Audit the operating-system sandbox for:

1. missing safeguards,
2. contradictory rules,
3. weak or vague contracts,
4. migration-risk gaps versus the current orchestrator template,
5. runtime-mirror gaps,
6. profile gaps,
7. duplicated or unnecessary artifacts,
8. places where the reduced OS may have accidentally weakened an important guardrail.

If you find issues, fix them directly in `/root/repos/Bamamana/Templates/operating-system`.

## Important Context

This sandbox already includes:

- core startup docs,
- role contracts,
- packet and review artifacts,
- engineering and operations runbooks,
- runtime mirror policy and manifest,
- audit manifest,
- validator / verify / doc-guard / predeploy scripts,
- CI templates,
- operator / closeout / investigator / worker-health artifacts,
- lean and orchestrator profile variants.

Key status files to read first:

1. `/root/repos/Bamamana/Templates/operating-system/README.md`
2. `/root/repos/Bamamana/Templates/operating-system/FILE_MAP.md`
3. `/root/repos/Bamamana/Templates/operating-system/SAFEGUARD_GAP_REPORT.md`
4. `/root/repos/Bamamana/Templates/operating-system/TEMPLATE_INDEX.yaml.template`
5. `/root/repos/Bamamana/Templates/operating-system/TEMPLATE_AUDIT_MANIFEST.yaml.template`
6. `/root/repos/Bamamana/Templates/operating-system/RUNTIME_MIRROR_POLICY.md.template`
7. `/root/repos/Bamamana/Templates/operating-system/RUNTIME_MIRROR_MANIFEST.json.template`

Then compare those against the legacy source material in:

1. `/root/repos/Bamamana/Templates/templates-v2`
2. `/root/repos/Bamamana/Templates/templates-v2/orchestrator-template`
3. `/root/repos/Bamamana/Templates/templates-v2/profiles/lean`

## What A Good Audit Should Check

Check whether the sandbox fully and coherently covers these surfaces:

1. startup contract behavior,
2. project-state and routing behavior,
3. audit lane behavior,
4. orchestrator lane behavior,
5. worker lane behavior,
6. reviewer and acceptance behavior,
7. escalation behavior,
8. operator handoff behavior,
9. final closeout behavior,
10. worker readiness behavior,
11. traceability and evidence rules,
12. lifecycle, migration, and placeholder rules,
13. scripts and CI/CD enforcement,
14. runtime mirror contents, source order, and validation,
15. profile fidelity for lean vs orchestrator,
16. whether any legacy safeguard still exists only in old files.

Also check for internal quality:

1. naming consistency,
2. document overlap,
3. contradictions between contracts and checklists,
4. whether the mirror manifest actually covers what the sandbox says is required,
5. whether any file map or gap report claim is stale after recent edits.

## How To Act

1. Read enough to find concrete gaps.
2. If you find a real issue, make the smallest edit that closes it.
3. Validate after changes.
4. Do not reopen scope into LangGraph implementation.
5. If the sandbox is already solid, say so explicitly instead of making cosmetic edits.

## Preferred Output Format

Respond in this order:

### 1. Findings

List only real findings first, ordered by severity.
Use file references.
If there are no findings, say `No material findings.`

### 2. Changes Made

Briefly list what you changed in `/root/repos/Bamamana/Templates/operating-system`, if anything.

### 3. Residual Risks

List any remaining concerns that are outside this sandbox phase.

### 4. Validation

State exactly what validation you ran.

## Standard For Findings

A real finding should be something like:

- a missing safeguard that exists in legacy templates but not in the reduced OS,
- a contradiction between two sandbox artifacts,
- a mirror manifest mismatch,
- a profile mismatch,
- a validator or CI rule that no longer matches the docs,
- a weakened closeout, escalation, or review requirement.

Do not report cosmetic preferences as findings.

## Standard For Edits

If you edit anything, keep changes focused and local.

Good edits:

- tighten an ambiguous rule,
- add a truly missing artifact,
- fix stale mapping or manifest entries,
- strengthen a checklist or contract,
- close a real legacy-to-sandbox gap.

Bad edits:

- renaming files for style alone,
- broad rewriting without a concrete gap,
- changing LangGraph,
- changing live templates-v2,
- adding redundant docs.

## Final Instruction

Treat this as a real audit, not a brainstorming session.

If the sandbox is already strong, the correct result is a short audit with no material findings and no edits.
If it is not strong enough, improve only the sandbox and explain exactly why.