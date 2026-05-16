# TODO — MBA Appdemo

## In Progress
_None_

## Human Action Required
- 🚨 Change GitHub default branch from `master` → `main` at https://github.com/graceozsubs/mba-appdemo/settings/branches (requires repo admin access)

## Backlog
- [ ] Create `DESIGN.md` design system for the product (dispatch: Stitch Designer)
- [ ] Define initial product requirements (dispatch: Compass)
- [ ] Set up CI/CD pipeline (dispatch: Backbone + human for cloud provider access)
- [ ] Configure branch protection rules on main — do after human completes branch rename (human action required)

## Completed

### plan-002 — GitHub Pipeline Setup (2026-05-16)
- [x] Verified .mcp.json (GitHub MCP Server v1.0.4 Windows binary)
- [x] Verified .env.mcp (GITHUB_PERSONAL_ACCESS_TOKEN, no spaces)
- [x] Verified .gitignore excludes .env.mcp and bin/
- [x] Verified .gitattributes enforces LF normalisation
- [x] Full skills audit by Linter — all 9 agents in .claude/agents/ passed
- [x] Created scripts/create-agent-pr.sh (cross-platform PR helper with labels + co-author trailer)
- [x] Created GitHub repo: https://github.com/graceozsubs/mba-appdemo
- [x] Made first commit (SHA: 8aab3e3) — 20 files, 2469 insertions
- [x] Pushed to origin/main
- [x] Generated walkthrough artefact: docs/plans/walkthrough-github-pipeline-setup.md

### plan-001 — Agent Team Bootstrap (2026-05-16)
- [x] CLAUDE.md with full ruleset
- [x] RULES_SUMMARY.md
- [x] 9 agent files (orchestrator + 8 specialists)
- [x] docs/ directory structure
- [x] docs/plans/plan-001-agent-team-setup.md
