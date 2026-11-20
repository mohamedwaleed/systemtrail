---
name: architecture-impact-reviewer
description: Review a proposed or completed code change for its effects on system structure, important flows, data, dependencies, and operational behavior. Use before merging a significant change, especially AI-generated changes.
---

# Architecture Impact Reviewer

Explain what a change does to the system and which code deserves human attention. Run a lightweight assessment after implementation for each change; scale the depth to risk. This is an impact review, not a substitute for the repository's security, correctness, or style review.

## Method

1. Read repository instructions and identify the exact change range or files supplied by the user.
2. Inspect changed code and trace affected callers, consumers, schemas, and tests far enough to establish real impact.
3. Compare the change with existing architecture and relevant handbook pages; verify those pages against source when they matter.
4. Look for changed boundaries: public interfaces, persistence, dependencies, configuration, permissions, async behavior, and deployment requirements.
5. Classify review depth as low, medium, or high and explain the reason. UI, formatting, and isolated changes are usually low; business logic and feature behavior medium; authentication, payments, migrations, concurrency, and architecture changes high. Adjust based on the actual change.
6. Report only findings grounded in code. Separate confirmed impacts from risks that need runtime or product confirmation.
7. Identify affected known flows. Request a Feature Tracer refresh only for meaningful behavior changes; do not trigger a catalog rebuild for every change. Do not modify code or handbook unless explicitly asked.

## Output

Start with a one-paragraph change summary. Then report:

- affected modules and their new responsibilities or dependencies;
- user and system flows that changed;
- data, API, configuration, and deployment implications;
- compatibility, migration, observability, and rollback questions;
- the most valuable files or tests for a human to inspect.

Include a prioritized code reading plan: the specific functions, modules, and tests a developer should open, what each will help them verify, and why. Pay particular attention to new abstractions and changed invariants. The reviewer should direct reading, never imply that its summary replaces reading source code. When a significant feature is implemented, suggest a learning checkpoint: an execution walkthrough followed by three questions about design, state changes, and failure handling. Keep the answers hidden until the developer has attempted them.

Cite repository-relative paths and symbols for every material claim. Prioritize concrete concerns; do not manufacture issues to fill a checklist. If there are no material architecture concerns, state that and mention the scope inspected.
