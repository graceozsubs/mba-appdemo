# Plan: GitHub Pipeline Setup
Status: COMPLETE
Created: 2026-05-16

## Summary
Wire up the full agentic engineering pipeline: verify MCP/gitignore, audit all agent skills,
create the PR helper script, and land the first commit to GitHub. After this plan is complete,
Kraken can orchestrate end-to-end: worktree → build → review → auto-merge.

## Checklist

### Phase 1 — Verify MCP & Secrets
- [x] Confirm .mcp.json exists and references the binary correctly
- [x] Confirm .env.mcp has GITHUB_PERSONAL_ACCESS_TOKEN (no spaces, no prefix text)
- [x] Confirm .gitignore excludes .env.mcp and bin/
- [x] Confirm gh CLI can authenticate with the token

### Phase 2 — Skills Audit
- [x] Verify all 9 agent files are in .claude/agents/ with correct frontmatter
- [x] Verify each agent has: inputs, outputs, agent awareness, worktree validation, escalation format, hand-off checklist
- [x] Fix any formatting or integration gaps found

### Phase 3 — Auto-Merge Pipeline & PR Script
- [x] Create scripts/create-agent-pr.sh (cross-platform bash, uses GH_TOKEN)
- [x] Verify orchestrator.md Step 6/7 clearly documents auto-merge on full approval
- [x] Add GITHUB_HOST / repo defaults to .env.mcp if needed

### Phase 4 — GitHub Repo & First Commit
- [x] Create GitHub repository (graceozsubs/mba-appdemo)
- [x] Set remote origin
- [x] Stage and commit all project files (excluding secrets)
- [x] Push main branch to remote
- [x] Verify repo visible on GitHub

### Phase 5 — Walkthrough
- [x] Generate walkthrough artefact
- [x] Update docs/TODO.md
