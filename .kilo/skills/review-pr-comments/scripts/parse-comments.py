#!/usr/bin/env python3
"""Reads GraphQL reviewThreads JSON from stdin, prints unresolved comments."""
import json
import sys

data = json.load(sys.stdin)
pr = data["data"]["repository"]["pullRequest"]
threads = pr["reviewThreads"]["nodes"]
unresolved = [t for t in threads if not t["isResolved"]]

print(f"PR: {pr['title']}")
print()

if not unresolved:
    print("No unresolved review comments.")
    sys.exit(0)

print(f"{len(unresolved)} unresolved comment(s):\n")

for i, t in enumerate(unresolved, 1):
    c = t["comments"]["nodes"][0]
    line = c["line"] if c["line"] else "?"
    print(f"[{i}] {c['path']}:{line}  (by {c['author']['login']})")
    print(c["body"])
    print()
