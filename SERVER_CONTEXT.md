# Shared Server Context Baseline

Purpose: provide a reusable, sanitized infrastructure profile that can be copied into project repositories as `docs/SERVER_CONTEXT.md` without leaking environment-specific details.

## Usage Rules
- Keep this file generic and reusable.
- Store real aliases, hostnames, public URLs, remote paths, and secrets in a private operator document outside the shared template pack.
- Copy this file into a project, then fill in project-local values during deployment setup.

## Recommended Split
Use two sources of truth:
- Shared baseline: this file, for platform shape and operating expectations.
- Private operator overlay: a non-repo document with the actual environment values.

## Server Identity Template
- Server label: `<SERVER_LABEL>`
- Active SSH alias: `<SSH_ALIAS>`
- Hostname: `<HOSTNAME>`
- SSH user: `<SSH_USER>`

Optional fallback aliases:
- `<SSH_ALIAS_LAN>` -> `<LAN_HOST_OR_IP>`
- `<SSH_ALIAS_FALLBACK>` -> `<FALLBACK_HOST_OR_IP[:PORT]>`

## Core Platform Runtime
- Container runtime: Docker and Docker Compose, unless the project defines another baseline.
- Existing services may coexist on the host; isolate project names, networks, volumes, and secrets.
- Ingress should be documented explicitly per project, for example Cloudflare Tunnel, reverse proxy, or direct LAN access.

## Per-Project Deployment Slot Template
For each deployed project, document:
- Remote path: `<REMOTE_PROJECT_PATH>`
- Compose services: `<COMPOSE_SERVICE_NAMES>`
- Public hostname or route: `<PUBLIC_HOSTNAME_OR_ROUTE>`
- Internal upstream mapping: `<UPSTREAM_MAPPING>`

## Standard Remote Ops Command Pattern
Replace placeholders with project-local values before use.

```bash
# Connectivity
ssh -o BatchMode=yes <SSH_ALIAS> 'hostname && whoami && pwd'

# Deploy or update
rsync -az --delete \
	--exclude '.git' \
	--exclude '__pycache__' \
	--exclude '.pytest_cache' \
	--exclude '.mypy_cache' \
	--exclude '.ruff_cache' \
	--exclude 'backups' \
	/local/project/path/ <SSH_ALIAS>:<REMOTE_PROJECT_PATH>/

ssh -o BatchMode=yes <SSH_ALIAS> \
	'cd <REMOTE_PROJECT_PATH> && docker compose up -d --build && docker compose ps'

# Post-deploy checks
ssh -o BatchMode=yes <SSH_ALIAS> \
	'cd <REMOTE_PROJECT_PATH> && <ENV_VALIDATION_COMMAND>'

ssh -o BatchMode=yes <SSH_ALIAS> \
	'cd <REMOTE_PROJECT_PATH> && <POST_DEPLOY_SECURITY_OR_HEALTHCHECK_COMMAND>'
```

## Multi-Project Expansion Pattern
For each additional app or service:
1. Use a dedicated remote directory.
2. Isolate compose project name, network, database, volumes, and secrets.
3. Add a dedicated ingress route or hostname.
4. Keep project-local AI docs in sync with the deployment slot.

## Project Copy Checklist
When copying this file into a target project:
1. Fill in the server identity values.
2. Fill in the deployment slot values.
3. Replace command placeholders with tested commands.
4. Remove any sections that do not apply.
5. Add a last-verified date and operator initials.

## Verification Snapshot Template
- Last verified date: `<YYYY-MM-DD>`
- Connectivity status: `<PASS_OR_FAIL>`
- Deploy status: `<PASS_OR_FAIL>`
- Public route status: `<PASS_OR_FAIL>`
- Post-deploy checks: `<PASS_OR_FAIL>`
- Notes: `<NOTES>`
