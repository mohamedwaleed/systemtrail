# SystemTrail

Understand the software your agents build.

SystemTrail is a small, repository-first toolkit for keeping an accurate mental model of a codebase as AI agents change it. It provides four reusable agent skills and a shared System Handbook that lives beside the code.

## Included

- `system-cartographer`: map modules, entry points, dependencies, and data stores.
- `feature-tracer`: follow a feature through its actual execution path, including errors and state changes.
- `architecture-impact-reviewer`: explain architectural and flow impact from a proposed change.
- `codebase-reorientation`: rebuild your understanding after time away.
- `docs/system/`: a concise handbook structure for preserving verified knowledge.

## Install once for all your local repos

1. On your Git server, open the SystemTrail repository and copy its SSH or HTTPS clone URL. Use your normal Git credentials if the repository is private.
2. Open Terminal. Replace `PASTE_CLONE_URL_HERE` with the URL you copied, then run these commands:

   ```sh
   mkdir -p "$HOME/projects"
   git clone "PASTE_CLONE_URL_HERE" "$HOME/projects/systemtrail"
   ```

   If you already have the checkout, use its existing path in the next command.
3. Install the skills for Codex, Cursor, and Claude Code:

   ```sh
   bash "$HOME/projects/systemtrail/install.sh" global all
   ```

4. Look for `Linked:` next to each skill path. If you run the command again, matching entries show `Already installed:`.
5. Open the repo you want to understand in your agent and start a new session. Restart the agent if the skill is missing. Try this prompt in the target repo:

   > Use the feature-tracer skill in Discover mode. Show me the main workflows and where each starts in the code.

| Agent | Where the installer puts personal skills | How to select Feature Tracer |
| --- | --- | --- |
| Codex | `~/.agents/skills/` | In the CLI or IDE extension, type `$feature-tracer`. |
| Cursor | `~/.agents/skills/` | In Agent chat, type `/` and select `feature-tracer`. |
| Claude Code | `~/.claude/skills/` | Type `/feature-tracer` in the session. |

Use `global codex` or `global cursor` to install into the shared Codex and Cursor folder. Use `global claude` for Claude Code only. The installed skills link to your checkout, so keep it in place. To pick up changes from the Git server, run:

```sh
git -C "$HOME/projects/systemtrail" pull --ff-only
```

Updates to the linked skills take effect from that checkout. Run the installer again if a release adds skills.

### Share the skills in one repo

Open Terminal in the target repo's root and run:

```sh
bash "$HOME/projects/systemtrail/install.sh" repo . all
```

The `.` means the current folder. Review and commit the four SystemTrail skill folders copied into each of `.agents/skills/` and `.claude/skills/`. If the installer reports an existing skill that differs, inspect that folder and merge the changes you want to keep or move it aside before rerunning.

The System Handbook is optional and can be added separately in each target repo.

## Development workflow

Use the skills to direct your attention to the code; they do not replace reading it.

1. **Before coding:** use System Cartographer and Feature Tracer when the area is unfamiliar or critical. Confirm intended behavior, invariants, and design choices before implementation.
2. **Implement:** make the change and its tests.
3. **After coding:** run Architecture Impact Reviewer for a lightweight impact assessment on each change. It should identify affected flows and give a risk based code reading plan.
4. **Before merging:** read the recommended code yourself. Spend more time on business logic, new abstractions, authentication, payments, migrations, concurrency, and architecture changes. For low risk isolated changes, a brief review may be enough.
5. **After important flow changes:** use Feature Tracer in refresh mode and review its proposed handbook update. Skip documentation updates when behavior and system structure did not meaningfully change.
6. **When returning after time away:** run Codebase Reorientation and follow its reading path through the source.

### Feature Tracer modes

- **Discover:** propose candidate user and system workflows from routes, UI actions, event handlers, jobs, tests, and product specifications. It must distinguish candidates from confirmed product features; a developer confirms the business meaning before they become handbook entries.
- **Trace:** explain one named behavior end to end, starting from an observable entry point and following the implementation across modules.
- **Refresh:** trace an important changed behavior and propose a focused update to its flow page. Do not regenerate the full catalog for ordinary changes.

The impact reviewer should connect a change to relevant known flows and request a focused refresh only when warranted. For significant features, use a learning checkpoint: ask for an execution walkthrough and three questions about design, state changes, and failure handling; reveal answers after the developer has tried.

## Principles

1. Inspect the repository before making claims. Treat existing documentation as a lead, not proof.
2. Separate observed facts from assumptions and unresolved questions.
3. Cite paths and symbols so a developer can verify each important statement.
4. Keep the handbook short, useful, and updated only when evidence supports a change.
5. Never write secrets, personal data, or speculative details into handbook files.

## Handbook

Start at [`docs/system/README.md`](docs/system/README.md). Record stable system knowledge there; keep change-specific analysis in the relevant pull request or review.

## License

No license has been selected yet.
