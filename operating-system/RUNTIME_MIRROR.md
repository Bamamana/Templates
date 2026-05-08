# Runtime Mirror Contract

Status: draft sandbox

This file defines how the Templates operating system should be packaged for LangGraph and other machines.

## Goal

We need two things at once:

1. one editable master Templates source, and
2. one portable runtime mirror that LangGraph can run from anywhere.

The mirror exists to make the system portable.
The master source exists to make the system maintainable.

## Required Behavior

### Development machine behavior

On the main development machine:

1. edit reusable workflow rules only in the master Templates repo,
2. refresh the runtime mirror before template-driven startup, verify, packaging, or release work,
3. validate the mirror immediately after refresh, and
4. stop if sync or validation fails.

### Other machine behavior

On a machine that does not have the master Templates repo:

1. LangGraph uses the packaged runtime mirror,
2. LangGraph reports that it is using the packaged mirror,
3. no template-driven work uses hidden mixed state, and
4. the user can still audit, orchestrate, and review safely from the packaged copy.

## Source Order

Recommended source order for LangGraph runtime:

1. validated runtime mirror,
2. live master Templates source only when building or refreshing the mirror,
3. hard fail if neither is valid.

This is intentionally different from the current live-first loader behavior.

Reason:

1. the runtime should execute from one validated source,
2. sync should be an explicit refresh step,
3. live and mirrored state should not be mixed at runtime.

## Sync Lifecycle

### Refresh triggers

Mirror refresh should happen before:

1. first template-audit run in a session,
2. first orchestrator packet generation that depends on Templates contracts,
3. verify,
4. VSIX packaging,
5. release packaging, and
6. any explicit `templates:update` or equivalent command.

### Refresh sequence

1. resolve master Templates source,
2. build or copy the operating-system runtime subset,
3. write it into LangGraph's runtime mirror,
4. validate presence, version, and hash consistency,
5. record mirror version and source, and
6. continue only if validation passes.

## Mirror Contents

The runtime mirror should include only the operating-system subset that LangGraph needs to execute correctly.

It should not need the whole historical template pack.

Phase 1 recommended contents:

1. startup contract templates,
2. routing template,
3. lifecycle template,
4. role contracts,
5. packet templates,
6. audit manifest,
7. template index,
8. state-ledger protocol,
9. traceability template,
10. engineering runbook,
11. required sync and validation scripts.

## Versioning

Every runtime mirror should record:

1. source path or source id,
2. source version,
3. sync timestamp,
4. mirror schema version, and
5. validation result.

LangGraph should surface this in plain language when needed.

## LangGraph Responsibilities

LangGraph should:

1. refresh and validate the mirror,
2. load role contracts from the mirror,
3. load packet templates from the mirror,
4. load audit inventory from the mirror,
5. keep project-local state separate from mirror state, and
6. tell the operator whether it is running from refreshed mirror or packaged fallback.

LangGraph should not:

1. silently mix live source and mirror content at runtime,
2. improvise role rules from memory if the mirror is invalid,
3. auto-copy templates into a target project before audit, or
4. hide mirror validation failures.

## Operator-Facing Rule

The operator should never need to think about any of this in technical terms.

The visible status can be simple:

1. `Templates runtime is current.`
2. `Templates runtime refreshed from source.`
3. `Templates runtime fallback in use.`
4. `Templates runtime invalid; audit/orchestration stopped.`

## Concrete Sandbox Outputs

This design note is now backed by:

1. `RUNTIME_MIRROR_POLICY.md.template`
2. `RUNTIME_MIRROR_MANIFEST.json.template`
3. `scripts/sync_runtime_mirror.sh.template`
4. `scripts/check_runtime_mirror.sh.template`

Those files should become the concrete handoff point before any LangGraph implementation change.