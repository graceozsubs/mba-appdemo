# RULES_SUMMARY — Agent Quick Reference

Re-read this file at every phase boundary and after every ~30 tool calls.

## Iron Laws

| Rule | Detail |
|---|---|
| **Kraken never does work** | Orchestrator ONLY reads, plans, routes, reviews status, merges. All implementation → specialist agents. |
| **Worktree before implementation** | Every issue gets a sibling worktree. Validate `ENV_AI_WT_NAME` as step 0. |
| **Review before merge** | `code-quality-agent` ✅ + `security-agent` ✅ (if security-touching) required. |
| **Failed review → fix loop** | 🔴 CHANGES REQUESTED → Kraken re-dispatches implementation agents → re-review. |
| **Passed review → merge immediately** | ✅ APPROVED from all required agents → Kraken merges to main. |
| **Plans in docs/plans/** | All plans, PRDs, blueprints, walkthroughs live in `docs/plans/`. No internal-memory-only plans. |
| **GitHub issues for all work** | Every worktree maps to one issue. Open issue before creating worktree. |

## Agent Roster

| Agent | Nickname | Trigger |
|---|---|---|
| `orchestrator` | Kraken | All planning, implementation, multi-step work |
| `product-manager` | Compass | New features, requirements clarification |
| `architect` | Blueprint | Story ≥5 pts, multi-layer work |
| `designer` | Stitch | Any UI/UX design, DESIGN.md creation |
| `frontend-developer` | Antigravity | React/HTML/CSS/JS implementation |
| `backend-developer` | Backbone | API/service/database implementation |
| `code-quality-agent` | Linter | All PRs — final merge authority |
| `security-agent` | Sentinel | PRs touching auth, secrets, APIs, config |
| `project-manager` | Harbour | Issue/worktree lifecycle, walkthroughs |

## Worktree Convention

```
Path:    ~/source/MBAAppdemo-wt-<issue>
Branch:  feature/ai-#<issue>-<slug>
Env var: ENV_AI_WT_NAME=<absolute path>
```

## Commit / PR Convention

```
Author:        Agent Pond 007 <adam-pond-agent@users.noreply.github.com>
Co-authored:   Claude Sonnet 4.6 <adpond+anthropic@gmail.com>
PR labels:     agent:claude, ai-generated, story-points:N
Branch naming: feature/ai-#<N>-<slug> | bug/ai-#<N>-<slug> | refactor/ai-#<N>-<slug>
```

## Review Signature Format

```
[Agent: @Linter]    Verdict: ✅ APPROVED | ⚠️ CONDITIONAL | 🔴 CHANGES REQUESTED
[Agent: @Sentinel]  Verdict: ✅ APPROVED | ⚠️ CONDITIONAL | 🔴 CHANGES REQUESTED
```

## Human Escalation Format

```
🚨 HUMAN ACTION REQUIRED
Issue: <brief>
Why:   <one sentence>
Action: <what human does>
Urgency: LOW | MEDIUM | HIGH | CRITICAL
```

## Code Standards (quick check)

- 2-space indentation
- `//` comments only (no `/** */`)
- `Async` suffix on all async methods
- No generic `catch (Exception)` — catch specific types
- No queries inside loops
- No browser globals (`window`, `document`, `localStorage`)
- User-specific cache keys
- Australian spelling in docs

## Story Point Scale

| Points | Size |
|---|---|
| 1 | Trivial: config, copy, single line |
| 2 | Small: one component, clear scope |
| 3 | Medium: multiple files, one area |
| 5 | Moderate: cross-cutting, some unknowns |
| 8 | Large: architectural, new integration |
| 13 | Very large: multi-system, split candidates |
| 21 | Epic: must be split before starting |
