# Plan: Agent Team Setup ✅
Issue: N/A (bootstrap)
Created: 2026-05-16
Status: COMPLETE

## Summary

Bootstrap the MBA Appdemo project with a complete multi-agent development environment: the Kraken orchestrator team (9 agents), CLAUDE.md ruleset, directory structure, and supporting documentation.

## Checklist

### Phase 1 — Infrastructure
- [x] Initialise git repository
- [x] Create `.claude/agents/` directory
- [x] Create `docs/plans/`, `docs/plans/archive/`, `docs/risks/`, `docs/runbooks/`, `docs/architecture/` directories

### Phase 2 — Configuration
- [x] Write `CLAUDE.md` with full ruleset (routing rules, Kraken iron law, agent roster, git rules, review pipeline, worktree isolation)
- [x] Write `RULES_SUMMARY.md` agent quick-reference card

### Phase 3 — Orchestrator Agent
- [x] Create `orchestrator.md` (Kraken) — delegation workflow, dispatch templates, human escalation, hand-off checklist

### Phase 4 — Specialist Agents
- [x] Create `frontend-developer.md` (Antigravity)
- [x] Create `backend-developer.md` (Backbone)
- [x] Create `designer.md` (Stitch Designer)
- [x] Create `code-quality-agent.md` (Linter)
- [x] Create `security-agent.md` (Sentinel)
- [x] Create `architect.md` (Blueprint)
- [x] Create `project-manager.md` (Harbour)
- [x] Create `product-manager.md` (Compass)

### Phase 5 — Documentation & Memory
- [x] Create `docs/plans/plan-001-agent-team-setup.md` (this file)
- [x] Create `docs/TODO.md`
- [x] Save project memory for future sessions

### Phase 6 — Skill Validation
- [x] Run skill-creator validation against all nine agent files
- [x] Verify: inputs/outputs defined, agent awareness, cross-agent calling, worktree conventions
- [x] Fix: 5 agent-awareness gaps patched (code-quality, security, architect, project-manager, product-manager)

## Agent Integration Map

```
User Request
    │
    ▼
Kraken (Orchestrator) ──────────────────────────────────┐
    │                                                    │
    ├──► Compass (Product Manager)                       │
    │         └── PRD → Kraken                           │
    │                                                    │
    ├──► Blueprint (Architect)                           │
    │         └── Blueprint doc → Kraken                 │
    │                                                    │
    ├──► Stitch Designer (Designer)                      │
    │         └── DESIGN.md + screens → Kraken           │
    │                                                    │
    ├──► Antigravity (Frontend Dev) ◄── DESIGN.md        │
    │         └── UI code in worktree → Kraken           │
    │                                                    │
    ├──► Backbone (Backend Dev)                          │
    │         └── API code in worktree → Kraken          │
    │                                                    │
    ├──► Linter (Code Quality) [review gate]             │
    │         └── ✅/🔴 verdict → Kraken                 │
    │                                                    │
    ├──► Sentinel (Security) [review gate]               │
    │         └── ✅/🔴 verdict → Kraken                 │
    │                                                    │
    └──► Harbour (Project Manager) ◄────────────────────┘
              └── issues/worktrees/walkthroughs
```

## Notes

- Template sources: `~/skills/`, `~/claude-plugins-official/`, `~/stitch-skills/`
- All agents include worktree validation (step 0), structured inputs/outputs, hand-off checklists
- Review pipeline: failed reviews loop back through Kraken → implementation → re-review
- Human escalation format standardised across all agents
