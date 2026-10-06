#!/bin/sh
# SessionStart hook: fetch and report upstream changes so Claude can offer to pull.
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0
branch=$(git branch --show-current)
[ -n "$branch" ] || exit 0
git fetch --quiet origin 2>/dev/null || { echo "Upstream check: git fetch failed (offline?). Tell the user the check was skipped."; exit 0; }
upstream=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null) || exit 0
behind=$(git rev-list --count "HEAD..$upstream")
ahead=$(git rev-list --count "$upstream..HEAD")
[ "$behind" -gt 0 ] || exit 0
echo "UPSTREAM CHANGES: branch '$branch' is $behind commit(s) behind $upstream (ahead by $ahead)."
[ "$ahead" -gt 0 ] && echo "The branch has diverged; pulling will need a merge or rebase."
echo "In your first response, tell the user and offer to pull. Do not pull until they agree."
git log --oneline "HEAD..$upstream" | head -10
