# Plan: GitHub Pipeline Setup
Status: IN PROGRESS
Created: 2026-05-16

## Summary
Wire up the full agentic engineering pipeline: verify MCP/gitignore, audit all agent skills,
create the PR helper script, and land the first commit to GitHub. After this plan is complete,
Kraken can orchestrate end-to-end: worktree → build → review → auto-merge.

## Checklist

### Phase 1 — Verify MCP & Secrets
- [ ] Confirm .mcp.json exists and references the binary correctly
- [ ] Confirm .env.mcp has GITHUB_PERSONAL_ACCESS_TOKEN (no spaces, no prefix text)
- [ ] Confirm .gitignore excludes .env.mcp and bin/
- [ ] Confirm gh CLI can authenticate with the token

### Phase 2 — Skills Audit
- [ ] Verify all 9 agent files are in .claude/agents/ with correct frontmatter
- [ ] Verify each agent has: inputs, outputs, agent awareness, worktree validation, escalation format, hand-off checklist
- [ ] Fix any formatting or integration gaps found

### Phase 3 — Auto-Merge Pipeline & PR Script
- [ ] Create scripts/create-agent-pr.sh (cross-platform bash, uses GH_TOKEN)
- [ ] Verify orchestrator.md Step 6/7 clearly documents auto-merge on full approval
- [ ] Add GITHUB_HOST / repo defaults to .env.mcp if needed

### Phase 4 — GitHub Repo & First Commit
- [ ] Create GitHub repository (graceozsubs/mba-appdemo)
- [ ] Set remote origin
- [ ] Stage and commit all project files (excluding secrets)
- [ ] Push main branch to remote
- [ ] Verify repo visible on GitHub

### Phase 5 — Walkthrough
- [ ] Generate walkthrough artefact
- [ ] Update docs/TODO.md
