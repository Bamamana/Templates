# LangGraph Adoption Notes

Status: draft sandbox

This file is a forward-looking implementation note only.

It does not authorize any changes to the LangGraph repo yet.
It exists so we can design the migration path now and avoid rethinking the same decisions later.

## Rule

Do not change `LangGraph-Orchestrator-Runner` until the operating system is defined clearly enough that it is at least as safe and effective as the current Templates flow.

This means:

1. reduced operating-system artifact set is defined,
2. role contracts are explicit,
3. runtime mirror model is explicit,
4. scripts and CI/CD are first-class,
5. LangGraph hardcoded behavior to be externalized is identified, and
6. the compatibility path is clear.

## What LangGraph Should Eventually Consume

LangGraph should eventually consume these operating-system layers from its runtime mirror:

1. startup contract family,
2. routing rules,
3. auditor contract,
4. orchestrator contract,
5. worker contract,
6. reviewer contract,
7. packet templates,
8. audit manifest and template index,
9. engineering runbook and traceability structure,
10. required sync, verify, and validation scripts,
11. CI/CD contract or CI templates that define the expected gates.

## What Should Stay In LangGraph

LangGraph should continue owning:

1. UI and chat surfaces,
2. provider configuration and model-role routing,
3. packet ledger/state storage,
4. file and command enforcement,
5. persisted artifacts,
6. mirror refresh and validation execution,
7. local packaging and extension installation flow.

## What Should Leave LangGraph Prompt Code

These behaviors should eventually be loaded from the operating system instead of being hardcoded in prompt strings or scattered runtime rules:

1. auditor role instructions,
2. orchestrator role instructions,
3. worker boundary instructions,
4. reviewer decision checklist,
5. packet content expectations,
6. startup read policy,
7. audit artifact structure,
8. lifecycle routing rules.

## Recommended Migration Order

### Phase 1: stabilize the operating system

1. finalize reduced doc architecture,
2. finalize role contracts,
3. finalize runtime mirror contract,
4. finalize scripts and CI/CD surface,
5. define compatibility aliases.

### Phase 2: mirror and validation first

1. update LangGraph to build or sync the operating-system runtime mirror,
2. make verify fail if the mirror is stale or invalid,
3. make packaging use the validated mirror,
4. keep current runtime behavior unchanged otherwise.

### Phase 3: role-contract loading

1. move auditor prompts to the operating-system contract,
2. move orchestrator prompts to the operating-system contract,
3. move worker and reviewer instructions to the operating-system contract,
4. keep deterministic host guards in LangGraph.

### Phase 4: carryover and target-project flow

1. make audit compare projects against the runtime mirror,
2. make orchestrator packet generation depend on accepted audit facts,
3. keep project changes bounded and reviewed,
4. do not auto-copy into target repos before audit.

## Scripts And CI/CD Requirement

When LangGraph adopts this operating system, it should not load only the markdown contracts.

It should also rely on the operating-system automation surface:

1. verify gate,
2. runtime mirror sync/check,
3. context-budget validation,
4. documentation-update enforcement,
5. predeploy gate,
6. CI templates or CI contract for the same gates.

The operating system is incomplete if it provides role rules without the automation that enforces them.

## Success Condition For The Future Move

The LangGraph migration is ready only when these are true:

1. changing a reusable rule in Templates updates the runtime mirror path cleanly,
2. LangGraph can explain whether it is using refreshed mirror or packaged fallback,
3. auditor, orchestrator, worker, and reviewer all read the same operating-system contracts,
4. no critical role behavior depends on stale hardcoded prompt text,
5. scripts and CI/CD enforce the same safeguards the docs describe.