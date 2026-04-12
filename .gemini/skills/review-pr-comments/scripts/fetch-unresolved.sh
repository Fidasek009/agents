#!/usr/bin/env bash
# Fetches unresolved PR review threads and prints them in a structured format.
# Usage: fetch-unresolved.sh [pr-number]
set -euo pipefail

# Derive owner/name from the origin remote so we target the right repo
# even when gh's default points to an upstream fork parent.
ORIGIN_URL=$(git remote get-url origin 2>/dev/null || true)
if [[ "$ORIGIN_URL" =~ github\.com[:/]([^/]+)/([^/]+) ]]; then
  OWNER="${BASH_REMATCH[1]}"
  NAME="${BASH_REMATCH[2]%.git}"
else
  REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
  OWNER=$(echo "$REPO" | cut -d/ -f1)
  NAME=$(echo "$REPO" | cut -d/ -f2)
fi

if [ -n "${1:-}" ]; then
  PR_NUMBER="$1"
else
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  PR_NUMBER=$(gh pr list --repo "$OWNER/$NAME" --head "$BRANCH" --json number -q '.[0].number' 2>/dev/null || true)
  if [ -z "$PR_NUMBER" ]; then
    echo "ERROR: No open PR found for branch '$BRANCH' on $OWNER/$NAME. Pass a PR number as argument." >&2
    exit 1
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

gh api graphql -f query="
{
  repository(owner: \"$OWNER\", name: \"$NAME\") {
    pullRequest(number: $PR_NUMBER) {
      title
      reviewThreads(first: 50) {
        nodes {
          isResolved
          comments(first: 1) {
            nodes {
              author { login }
              body
              path
              line
            }
          }
        }
      }
    }
  }
}" | python3 "$SCRIPT_DIR/parse-comments.py"
