#!/usr/bin/env bash
# Cross-platform helper for agent-authored PRs — keeps label and identity rules DRY
# across every specialist agent so Kraken never has to repeat this boilerplate.
set -euo pipefail

# ---------------------------------------------------------------------------
# Defaults — callers may override via CLI args
# ---------------------------------------------------------------------------
TITLE=""
BODY=""
BRANCH=""
BASE="main"
LABELS="agent:claude,ai-generated"
STORY_POINTS=""

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --title)        TITLE="$2";         shift 2 ;;
    --body)         BODY="$2";          shift 2 ;;
    --branch)       BRANCH="$2";        shift 2 ;;
    --base)         BASE="$2";          shift 2 ;;
    --labels)       LABELS="$2";        shift 2 ;;
    --story-points) STORY_POINTS="$2";  shift 2 ;;
    *)
      echo "[create-agent-pr] Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

# ---------------------------------------------------------------------------
# Token resolution — prefer GH_TOKEN, fall back to AGENT_GITHUB_PAT
# Fail loudly rather than silently auth as the wrong identity or produce
# a misleading 401 from gh CLI with no context.
# ---------------------------------------------------------------------------
if [[ -z "${GH_TOKEN:-}" ]]; then
  if [[ -n "${AGENT_GITHUB_PAT:-}" ]]; then
    export GH_TOKEN="$AGENT_GITHUB_PAT"
  else
    echo "[create-agent-pr] FATAL: GH_TOKEN is not set." >&2
    echo "  Set GH_TOKEN (or AGENT_GITHUB_PAT as a fallback) before calling this script." >&2
    echo "  Example: GH_TOKEN=\$AGENT_GITHUB_PAT scripts/create-agent-pr.sh ..." >&2
    exit 1
  fi
fi

# ---------------------------------------------------------------------------
# Required-arg guard clauses — surface early rather than letting gh CLI
# produce a confusing error message mid-flight.
# ---------------------------------------------------------------------------
if [[ -z "$TITLE" ]]; then
  echo "[create-agent-pr] FATAL: --title is required." >&2
  exit 1
fi

if [[ -z "$BRANCH" ]]; then
  echo "[create-agent-pr] FATAL: --branch is required." >&2
  exit 1
fi

# ---------------------------------------------------------------------------
# Append story-points label when the caller provides an estimate so the
# GitHub issue board always reflects current Fibonacci sizing.
# ---------------------------------------------------------------------------
if [[ -n "$STORY_POINTS" ]]; then
  LABELS="${LABELS},story-points:${STORY_POINTS}"
fi

# ---------------------------------------------------------------------------
# Append the mandatory co-author trailer so every agent PR is attributable
# back to the Claude Sonnet model that authored it (Section 11 of CLAUDE.md).
# ---------------------------------------------------------------------------
CO_AUTHOR_TRAILER="Co-authored-by: Claude Sonnet 4.6 <adpond+anthropic@gmail.com>"
if [[ -n "$BODY" ]]; then
  BODY="${BODY}

${CO_AUTHOR_TRAILER}"
else
  BODY="${CO_AUTHOR_TRAILER}"
fi

# ---------------------------------------------------------------------------
# Change to the git repo root so gh CLI can locate the remote regardless of
# which worktree subdirectory the agent was launched from.
# ---------------------------------------------------------------------------
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || {
  echo "[create-agent-pr] FATAL: Not inside a git repository." >&2
  exit 1
}
cd "$REPO_ROOT"

# ---------------------------------------------------------------------------
# Set agent git identity for this invocation — ensures commits and PR author
# match the Agent Pond 007 identity required by Section 11 of CLAUDE.md.
# ---------------------------------------------------------------------------
export GIT_AUTHOR_NAME="Agent Pond 007"
export GIT_AUTHOR_EMAIL="adam-pond-agent@users.noreply.github.com"
export GIT_COMMITTER_NAME="Agent Pond 007"
export GIT_COMMITTER_EMAIL="adam-pond-agent@users.noreply.github.com"

# ---------------------------------------------------------------------------
# Create the PR — capture URL so callers can surface it in their output.
# ---------------------------------------------------------------------------
PR_URL="$(gh pr create \
  --title "$TITLE" \
  --body "$BODY" \
  --head "$BRANCH" \
  --base "$BASE" \
  --label "$LABELS")"

echo "$PR_URL"
