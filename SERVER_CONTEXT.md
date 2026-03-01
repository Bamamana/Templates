# Shared Server Context (Cross-Project Baseline)

Purpose: maintain one stable server operations profile that can be reused across multiple project repositories so AI sessions start with the same infrastructure facts.

## How to Use
- Keep this file updated whenever server access, deployment paths, or edge routing changes.
- Mirror this content (or a sanitized version) into each project as `docs/SERVER_CONTEXT.md`.
- Treat this as infrastructure truth; app-specific docs should reference it.

Sync command (run from this repository):
```bash
python3 scripts/sync_shared_server_context.py --dry-run
python3 scripts/sync_shared_server_context.py
```

## Server Identity
- Server label: Home server
- Active SSH alias: `plex-tailscale`
- Hostname: `plexserver`
- SSH user: `steven`

Fallback aliases (as configured on operator machine):
- `plex-lan` -> `192.168.68.120`
- `plex-legacy` -> `136.59.15.115:2222`

## Core Platform Runtime
- Container runtime: Docker + Docker Compose
- Existing non-SmartCampus services coexist on host (verified)
- Ingress model: Cloudflare Tunnel (outbound connector)

## SmartCampus Deployment Slot (App A)
- Remote path: `/home/steven/SmartCampusSystemServer`
- Compose services: `scss-app`, `scss-db`, `scss-cloudflared`
- Public hostname: `app.classprepped.com`
- Tunnel service mapping: `http://app:8000`

## Standard Remote Ops Commands
```bash
# Connectivity
ssh -o BatchMode=yes plex-tailscale 'hostname && whoami && pwd'

# Deploy/update
rsync -az --delete --exclude '.git' --exclude '__pycache__' --exclude '.pytest_cache' --exclude '.mypy_cache' --exclude '.ruff_cache' --exclude 'backups' /home/steve/Documents/projects/SmartCampusSystemServer/ plex-tailscale:/home/steven/SmartCampusSystemServer/
ssh -o BatchMode=yes plex-tailscale 'cd /home/steven/SmartCampusSystemServer && docker compose up -d --build && docker compose ps'

# Post-deploy checks
ssh -o BatchMode=yes plex-tailscale 'cd /home/steven/SmartCampusSystemServer && python3 scripts/validate_env.py --env-file .env --require-cloudflare-token'
ssh -o BatchMode=yes plex-tailscale 'cd /home/steven/SmartCampusSystemServer && python3 scripts/security_posture_check.py --base-url https://app.classprepped.com'
```

## Multi-Project Expansion Pattern
For each additional app/project:
1. Use dedicated remote directory (e.g., `/home/steven/apps/<project-name>`)
2. Use isolated compose project/network/db/secret set
3. Add dedicated hostname route in Cloudflare Tunnel
4. Maintain project-local AI docs plus shared server context copy

## Last Verified Snapshot
- Remote SSH access: working via `plex-tailscale`
- SmartCampus remote stack: running
- Public hostname route: reachable
- Env/security posture checks: passing
- Remote program import pilot: validated
