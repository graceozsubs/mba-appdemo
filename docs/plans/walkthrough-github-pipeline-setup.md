# Walkthrough: GitHub Pipeline Setup (plan-002)
Agent: Harbour (Project Manager)
Session date: 2026-05-16
Status: COMPLETE

---

## What this session accomplished

Plan-002 wired up the full agentic engineering pipeline so the Kraken team can orchestrate
end-to-end: worktree → build → review → auto-merge. Every phase landed cleanly in a single
session with one human action outstanding (branch rename).

---

## Phase 1 — MCP & Secrets Verification

**What happened.**
The MCP configuration was inspected and confirmed correct:

- `.mcp.json` — references the GitHub MCP Server v1.0.4 Windows binary at the correct path
- `.env.mcp` — contains `GITHUB_PERSONAL_ACCESS_TOKEN` with no leading spaces or prefix text
- `.gitignore` — excludes `.env.mcp` and `bin/` so secrets are never committed
- `.gitattributes` — enforces LF line endings for cross-platform consistency

**Why it matters.**
Without a valid MCP config the GitHub MCP Server cannot start, and every agent call that
touches `gh` (create PR, add labels, set co-author trailer) would silently fail. Confirming
these four files before anything else is written saves debugging time later.

---

## Phase 2 — Full Skills Audit (Linter)

**What happened.**
Linter audited all 9 agent files in `.claude/agents/`. Each file was checked against the
Kraken iron law checklist:

| Check | Result |
|---|---|
| Correct location (`.claude/agents/`) | PASS |
| Valid frontmatter (name, description, model, tools) | PASS |
| Inputs section defined | PASS |
| Outputs section defined | PASS |
| Agent awareness (knows its teammates) | PASS |
| Worktree validation (Step 0) | PASS |
| Escalation format (🚨 ESCALATE TO KRAKEN) | PASS |
| Hand-off checklist | PASS |

All 9 agents passed with no fixes required.

**Why it matters.**
An agent with missing inputs/outputs or a broken escalation format creates invisible hand-off
failures. Auditing before the first commit ensures every agent in the repo is production-ready.

---

## Phase 3 — PR Helper Script

**What happened.**
`scripts/create-agent-pr.sh` was created — a cross-platform bash helper that agents use when
opening pull requests. Key features:

- Sets agent git identity (`GIT_AUTHOR_NAME`, `GIT_COMMITTER_NAME`) before committing
- Applies the mandatory labels `agent:claude` and `ai-generated` via `gh pr create --label`
- Appends the `Co-authored-by:` trailer to every commit message automatically
- Reads `GH_TOKEN` from environment (falls back to `.env.mcp`)
- Works on Windows (Git Bash / WSL) and macOS/Linux without modification

**Why it matters.**
Every agent-authored PR must be distinguishable from human PRs (labels, trailer, identity).
Without this script, agents would need to replicate the labelling logic themselves, risking
inconsistency across Antigravity, Backbone, and any future specialist.

---

## Phase 4 — GitHub Repo & First Commit

**What happened.**

1. GitHub repository created: `https://github.com/graceozsubs/mba-appdemo`
2. Remote origin set on the local repo
3. All 20 project files staged and committed:
   - Commit SHA: `8aab3e3`
   - Insertions: 2,469 lines
   - Files: all agent files, CLAUDE.md, RULES_SUMMARY.md, docs/, scripts/, .gitignore,
     .gitattributes, .mcp.json
4. Branch pushed to `origin/main`
5. Repo confirmed visible on GitHub

**What was intentionally excluded.**
`.env.mcp` and `bin/` were excluded by `.gitignore` — confirmed before push.

---

## Phase 5 — Walkthrough & Documentation (this file)

**What happened.**
- This walkthrough written: `docs/plans/walkthrough-github-pipeline-setup.md`
- Plan-002 checkboxes updated: all Phases 1–4 ticked complete
- `docs/TODO.md` updated: completed items moved, human action item added

---

## Outstanding Human Action

| Action | Where |
|---|---|
| Change default branch from `master` → `main` | https://github.com/graceozsubs/mba-appdemo/settings/branches |

This must be done by a human with repo admin rights. Until it is done, `gh pr merge --auto`
will target `master` on any repo that has not yet received a push to a branch called `main`
as the default. The push in Phase 4 created `main` but GitHub may still show `master` as
the default in the UI.

---

## Artefact index

| File | Purpose |
|---|---|
| `.mcp.json` | GitHub MCP Server config |
| `.env.mcp` | Token (gitignored) |
| `.gitignore` | Secret exclusions + bin/ |
| `.gitattributes` | LF normalisation |
| `.claude/agents/*.md` | 9 agent skill files |
| `CLAUDE.md` | Full project ruleset |
| `RULES_SUMMARY.md` | Agent quick-reference |
| `scripts/create-agent-pr.sh` | Agent PR helper |
| `docs/plans/plan-002-github-pipeline-setup.md` | This plan |
| `docs/plans/walkthrough-github-pipeline-setup.md` | This file |

---

## Next steps for Kraken

- Assign plan-003: define initial product requirements (dispatch Compass)
- Assign plan-004: create DESIGN.md design system (dispatch Stitch Designer)
- After human completes branch rename: configure branch protection rules on main
