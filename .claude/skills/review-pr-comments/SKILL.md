---
name: review-pr-comments
description: Fetch unresolved PR review comments, validate each one against the actual codebase, and implement fixes for those that are correct. Use when asked to address, deal with, or fix PR review comments/feedback.
disable-model-invocation: true
argument-hint: "[pr-number]"
allowed-tools: Bash(.claude/skills/review-pr-comments/scripts/fetch-unresolved.sh*)
---

Review comments can be wrong or misguided — always verify a comment is valid before making any changes.

<context>
Unresolved review comments:
!`.claude/skills/review-pr-comments/scripts/fetch-unresolved.sh $ARGUMENTS`
</context>

<steps>
1. For each comment, read the exact file and line it references. Do not rely on the comment's description alone — check what the code actually does and what library versions are in use.
2. Assess validity. Common false positives to watch for:
   - A symbol or API claimed to be incorrect without verifying the actual installed package version
   - Suggestions to add guards or error handling that the code already performs
   - Style or pattern concerns that are consistent with the project's established conventions
3. For each valid comment, apply the minimal change that addresses the concern. Prefer editing existing files; do not restructure unnecessarily.
4. Summarize the results in a table with columns: comment, file, verdict (✅ valid / ❌ invalid), action taken.
</steps>
