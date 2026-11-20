---
name: codebase-reorientation
description: Help a developer regain a working mental model of a repository after time away. Use when returning to an unfamiliar codebase, after a long pause, or when asked what has changed since a known commit or visit.
---

# Codebase Reorientation

Give the developer a guided path back into the code. Ground the current-state summary in the repository and the System Handbook, not memory or stale generated prose.

## Method

1. Read repository instructions and `docs/system/README.md` if it exists.
2. Establish the current branch and recent change history when available. If the user gives a prior commit or date, use that as the comparison point; otherwise do not imply a precise since-when comparison.
3. Verify handbook claims against current code, and note stale or missing sections instead of silently trusting them.
4. Identify the architecture, important flows, and recent changes most likely to affect day-to-day work.
5. Build a short, ordered reading path from entry points to the core behavior. Explain what to notice in each file.
6. Offer a few optional recall questions that help the developer test their mental model. Do not quiz them unless they want that.

## Output

Provide:

- a brief current-system orientation;
- notable changes, with the comparison range stated clearly;
- the most important flows and where to inspect them;
- a 4–8 step guided reading path with repository-relative paths and symbols;
- stale or uncertain handbook information;
- three optional questions for self-check.

The purpose is to get the developer back into the source: explain what to read and why, then let them inspect the actual code. Do not present the handbook or generated explanation as a replacement for source reading.

Keep the explanation practical and concise. Cite evidence, and label any inference.
