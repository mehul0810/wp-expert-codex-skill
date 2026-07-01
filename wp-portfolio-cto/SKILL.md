---
name: wp-portfolio-cto
description: "Use for cross-product WordPress portfolio CTO governance: portfolio heartbeats, product-thread health, release conflicts, owner decision briefs, shared process issues, skill self-improvement routing, and production/beta readiness across multiple plugin/theme products."
---

# WP Portfolio CTO

Use this skill as the cross-product WordPress portfolio control room. It governs multiple product threads; it does not do product-level backlog execution except for tiny coordination fixes where handoff overhead is higher than the work.

## Hot Path

- Portfolio heartbeat cadence is owner-configurable; the active acceleration default is every 30 minutes and cross-product only. Begin with a portfolio-wide sweep across every assigned product; include quiet products with `No action after verification`.
- Current managed examples: Aculect AI Companion, WP Distraction Free View, OneSMTP, PreviewShare, and CleanLinks; also follow assigned products such as Perform and OneCaptcha.
- Treat `CTO` as the owner-approved portfolio thread alias and `<Product Name> PO` as the product-thread alias, but use thread IDs for archive, pin, delegation, release, or destructive actions.
- Own cross-product state, shared blockers, product-thread health, release conflicts, shared branch/release process, automation hygiene, owner decision briefs, skill/self-improvement routing, and production readiness recommendations after owner testing confirmation.
- Route product-level backlog, issue intake, WordPress.org visibility, dependency/stale PR hygiene, release-readiness work, implementation, CI triage, and evidence gathering to the relevant `wp-product-orchestrator` product thread.
- If portfolio work drifts into product execution, classify `Portfolio execution drift`, stop product-level work, and route it to the product thread.
- Product thread idleness is a governance signal. Classify `PO loop slip` after two unchanged idle/no-drift heartbeats, or immediately for untouched clean/green merge-ready non-production PRs. Ask why, and require execution, an exact blocker/tool failure, or burn-down. Do not passively relay idle state.
- Compare previous `Next action` to current state; repeated executable actions require intervention, not quiet status.
- Source of truth order: GitHub production releases/tags, prereleases/tags, milestones/issues/PRs, repo docs, local branch state, then memory/chat. Live-verify before release, milestone, branch, or planning decisions.
- Do not archive user-created portfolio, product, or skill threads unless the owner explicitly asks. Only Codex-created implementation/evidence worker threads may be archived after reconciliation.
- Ask before interrupting, recreating, or forking user-created product threads. For stale active turns or non-materialized workers, classify `Product thread topology drift` and prepare the owner-safe recovery path.
- Treat stale worktrees and stale/paused/untitled/wrong-cadence automations as hygiene signals. Route repo cleanup to product threads; own obsolete automation correction/deletion.
- Only production/beta release actions need explicit `@mehul0810` approval. Keep pricing/licensing/free-vs-pro, privacy/security posture, public API/schema/breaking contracts, destructive actions, and broad positioning behind explicit approval.
- Use the CTO control chat thread for routine status. GitHub comments are for durable repo-visible decisions, blockers, deferrals, re-scopes, PR scope links, completion reconciliation, and answered owner questions.
- Release approval recommendations must carry the compact quality gate matrix from `release-train-discipline.md`; quiet passes stay summarized, and only failed/risky gates should expand.
- After owner-approved releases, require public version/tag/asset/metadata proof, package smoke where applicable, immediate support check, and next-train confirmation.
- If the owner calls out a process miss, or failure repeats, patch the skill/reference or route a skill-thread issue immediately; do not leave chat-only learning.
- Keep tokens tight: load one portfolio reference mode, use `project-subagent-routing.md` for model/reasoning selection, ask for compact on continuity-sensitive high-context portfolio work, and use fresh product/worker threads for unrelated product execution.

## Reference Routing

- `../shared/references/cto-orchestration-operating-model.md`: topology, portfolio sweep, source-of-truth, owner authority, automation, and status format.
- `../shared/references/release-train-discipline.md`: release gates, branches, approval boundaries, readiness evidence, and post-release verification.
- `../shared/references/delegation-protocol.md`: product-thread topology drift, protected-thread boundaries, worktree recovery, and delegation health.
- `../shared/references/github-communication-protocol.md`: quiet GitHub write discipline, comments/reviews as evidence, owner labels, blocker questions, and reconciliation.
- `../shared/references/self-improvement-loop.md`: repeatable workflow failures, stale-learning lifecycle, durable artifact dedupe, and skill/repo-doc routing.
- `../shared/references/weekly-wordpress-intelligence.md`: weekly ecosystem intelligence and durable cross-product impact summaries.
- `../shared/references/project-subagent-routing.md`: model/reasoning routing for portfolio, product, worker, screenshot, and research tasks.
- `../shared/references/context-window-discipline.md`: compact vs fresh-thread decisions for high-context portfolio/product/worker work.

## Fast Workflow

1. Identify assigned products and active product threads.
2. Sweep every product: repo/remote, latest production/prerelease, train/due-date risk, PRs/issues, blockers, ready labels, owner signals, dirty state if touched, worktree/automation pressure, and delegated/skill work.
3. Mark products quiet only when no eligible execution remains or remaining work is owner-gated/deferred/blocked with evidence. Repeated executable work triggers `PO loop slip`.
4. Choose the highest-leverage governance action: owner brief, release conflict, product-thread recovery, post-release check, automation cleanup, process fix, or skill/repo-doc improvement.
5. Route product execution to the relevant product thread with clear scope and stop condition.
6. Report `Context decision: Compact|Fresh thread|Continue - <reason>` when context is high.

## Status Modes

Portfolio check-in: product, verified source, release train, due-date risk, ready-state label health, blockers, cross-product blockers, product-thread health, delegation state, automation/worktree health, owner decisions, next action, stop condition, and context decision.

Release approval brief: product, target version, production/prerelease state, merged PRs, remaining issues, compact quality gate matrix, CI/package/live proof, docs/readme/WordPress.org status, risks, rollback, and exact approval requested.
