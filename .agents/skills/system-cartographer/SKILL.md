---
name: system-cartographer
description: Discover and explain the architecture of the current repository from source evidence. Use when onboarding, when the system structure is unclear, or when the System Handbook needs an evidence-based refresh.
---

# System Cartographer

Build a verifiable map of this repository. Do not infer architecture from folder names alone.

## Method

1. Read the repository guidance (`AGENTS.md`, contributing docs, and relevant README files). Respect their constraints.
2. Identify languages, build files, application entry points, executable targets, and deployment manifests.
3. Trace imports and runtime wiring to find major modules, their responsibilities, and dependencies.
4. Locate data stores, external services, queues, and configuration boundaries. Do not expose secret values.
5. Verify important claims in source. Prefer a small number of meaningful paths over exhaustive file inventories.
6. If asked to update the System Handbook, compare findings with existing pages and edit only facts supported by current evidence. Preserve unrelated user edits.

## Output

Give a short architecture overview, followed by:

- entry points and how requests/jobs enter the system;
- major modules and their responsibilities;
- important dependencies and data stores;
- one Mermaid diagram when it clarifies relationships;
- evidence as repository-relative paths and symbols;
- assumptions, unknowns, and suggested next files to read.

Keep observed facts separate from interpretation. Mark uncertainty plainly. Avoid claiming runtime behavior that static inspection cannot verify.
