---
name: feature-tracer
description: Trace how a user-visible feature or system behavior works through the repository, including business rules, state changes, persistence, and failure handling. Use when learning or debugging a feature.
---

# Feature Tracer

Help a developer understand a behavior well enough to find and read its implementation. A feature is an observable user or system workflow, not a folder or module. It may cross several modules and entry points.

## Modes

- **Discover:** propose a candidate workflow catalog, usually during initial setup or after a major product expansion. Find evidence in HTTP routes, UI actions, event handlers, background jobs, tests, and product specifications. Group related operations by behavior instead of listing endpoints as features. Label the catalog as candidates and ask the developer to confirm business meaning before writing confirmed feature pages.
- **Trace:** explain a named feature or behavior end to end. This is the default when someone asks how something works.
- **Refresh:** re-trace a known flow after a meaningful behavior change and propose a focused update to its handbook page. Do not regenerate the full catalog for ordinary changes.

## Method

1. In Trace or Refresh mode, clarify the observable behavior and identify its entry point: route, command, event, UI action, scheduled job, or public API. In Discover mode, gather candidate entry points from the evidence sources above.
2. Follow calls and data transformations through relevant modules, recording the symbols and conditions that matter.
3. Trace success, validation, authorization, and failure paths. Include retries, transactions, and side effects when present.
4. Follow persistence and external calls only as far as the implementation supports. Distinguish synchronous work from queued or eventual work.
5. Check tests as supporting evidence, while treating implementation as the source for current behavior.
6. Do not edit files unless the user asks for changes. In Discover mode, treat proposed feature boundaries as unconfirmed until the developer approves them. In Refresh mode, propose only a stable, focused update for the relevant flow; never silently rewrite the full handbook.

## Output

Explain the flow in order, with a compact Mermaid sequence diagram when useful. For each step, cite repository-relative paths and symbols. Cover:

- trigger and input;
- key business rules and state changes;
- persistence and external effects;
- error handling and user-visible outcomes;
- unanswered questions or behavior that requires runtime confirmation.

In Discover mode, return a candidate catalog with feature name, evidence-backed entry point(s), involved modules, and the rationale for grouping them. Call out ambiguous internal operations and request confirmation of business meaning before treating entries as product features. In Refresh mode, summarize what changed and provide a focused handbook edit proposal.

Use precise language. If a path could not be verified, say where the trace stops.
