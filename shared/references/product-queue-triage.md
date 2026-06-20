# Product Queue Triage

Use this reference for GitHub issue/PR triage in WordPress product/plugin/theme repositories.

## Goal

Convert an open queue into clear action: autonomous work, owner decisions, release blockers, deferrals, or closure candidates. Do not leave the user with opaque issue numbers or vague priorities.

## Start With Repo State

Run cheap checks first:

```bash
git status --short --branch
git remote -v
git branch --show-current
git branch -a --list '*release*' '*hotfix*' '*support*' '*maintenance*' '*develop*'
gh repo view --json nameWithOwner,defaultBranchRef,url
```

Read repo policy before judging fit:

- `AGENTS.md`, `CLAUDE.md`, `README.md`, `CONTRIBUTING.md`.
- `PRODUCT.md`, `VISION.md`, roadmap docs, support docs.
- `RELEASE.md`, changelog, version file, package metadata, WordPress.org `readme.txt`.
- Existing labels, milestones, projects, and release branches.

## Queue Discovery

For the current repo:

```bash
gh issue list --state open --limit 100 --json number,title,author,labels,milestone,updatedAt,url
gh pr list --state open --limit 100 --json number,title,author,isDraft,reviewDecision,mergeStateStatus,baseRefName,headRefName,labels,milestone,updatedAt,url
```

Inspect details before recommending action:

```bash
gh issue view <number-or-url> --json number,title,state,author,body,comments,labels,milestone,url
gh pr view <number-or-url> --json number,title,state,author,body,comments,reviews,files,commits,statusCheckRollup,mergeStateStatus,baseRefName,headRefName,isDraft,url
gh pr diff <number-or-url> --patch
```

## Issue Intake

User requests become GitHub issues first unless the user explicitly says not to. Product-idea issues require web research before filing. Competitor names may inform private research, but do not put competitor names in public GitHub issue titles or bodies.

Before creating an issue:

- Search open issues, recently closed issues, open PRs, milestones, roadmap docs, product docs, and release docs.
- Avoid broad umbrella issues; prefer one issue per PR.
- Assign to `@mehul0810`.
- Reuse existing labels and milestones when evidence supports them.
- Include acceptance criteria, non-goals, branch/base plan, validation expectations, risk, and owner decisions.
- Use `develop` for normal development integration; create or use `release/<milestone-number>` from the verified development base when the repo has adopted that workflow and milestone evidence supports it.
- Missing milestone due dates require an owner decision brief, but they are not by themselves blockers to implementation delegation for existing issues with clear scope and safe branch/base evidence.
- Dirty or behind primary checkouts block direct edits, not fresh scoped worktree delegation from a clean upstream branch.
- If delegation is deferred, report the exact blocker: issue number, missing branch/base, missing owner decision, missing tool/project, or unsafe checkout state.

## Design Contract Intake

Create focused GitHub issues to add or adapt `DESIGN.md` when a real durable product design gap exists. Duplicate-screen first, assign to `@mehul0810`, reuse labels/milestones when supported, and include acceptance criteria, non-goals, validation, and branch/base plan. Do not create generic design-doc churn.

Priority order: CleanLinks and Aculect high priority; OneSMTP early enough to shape UI; PreviewShare and WP Distraction Free View lightweight unless the product surface grows.

## Dependency And Stale PR Triage

During rehydration, check open Dependabot/dependency/tooling PRs and stale PRs.

- Do not merge Dependabot or dependency PRs directly into `main`.
- Consolidate relevant dependency/tooling updates into one duplicate-screened GitHub issue assigned to `@mehul0810` with labels/milestone where supported, acceptance criteria, validation, and branch/base plan.
- Prefer one planned tooling/dependency update issue/PR over scattered Dependabot PRs.
- Dependabot PRs should target the active development/release branch when supported; never accept GitHub default `main` without explicit release approval.
- For stale, superseded, wrong-base, abandoned, or release-misaligned PRs, close with a durable GitHub comment explaining why and link the replacement issue/PR when available.
- Do not close active owner-directed, release-critical, or ambiguous PRs without checking comments and owner `Codex:` instructions first.
- Routine status stays in chat; stale-PR closure comments are durable repo-visible state transitions.

## Classification

Classify each item:

- `Autonomous`: bounded, aligned with product docs, clear validation path, no sensitive decision.
- `Needs owner`: product choice, paid/free boundary, privacy/security, untestable live provider, ambiguous UX/brand/SEO, or release/deploy decision.
- `Release blocker`: must land or be explicitly deferred before the target milestone/release.
- `Blocked`: missing access, failing environment, stale/conflicted branch, unknown base, unclear reproduction.
- `Defer/close`: duplicate, superseded, stale without evidence, support-only, or poor product fit.

## WordPress Product Signals

Raise priority when an item affects:

- Activation/deactivation, upgrade, uninstall, migrations, or rollback.
- Admin lockout, capability checks, nonces, REST permissions, or data integrity.
- Checkout, payments, subscriptions, lead forms, user registration, or email delivery.
- Block editor save/render parity, template hierarchy, frontend layout, accessibility, or Core Web Vitals.
- WordPress.org guideline compliance, release artifact contents, production dependencies, or `readme.txt` accuracy.
- Multisite, object cache, cron/background jobs, import/export, privacy export/erase, or high-traffic paths.

Lower priority when the item is cosmetic without acceptance criteria, stale without reproduction, unsupported environment, or conflicts with product direction.

## Autonomous Work Loop

Work one item at a time:

1. Verify issue/PR details, milestone, labels, branch, and product fit.
2. Reproduce or establish root cause where feasible.
3. Choose the smallest enterprise-grade fix that preserves launched contracts.
4. Create/update branch from the correct release/default base.
5. Implement with `wp-expert` lane-specific guidance.
6. Add/update tests when behavior risk warrants it.
7. Validate with syntax/lint/static/runtime/live proof appropriate to risk.
8. Commit focused changes; push/PR only if authorized.
9. Update PR/issue with proof when authorized.
10. Return local repo to a clean, expected branch state before selecting the next item.

## Owner-Facing Triage Output

Use this compact format:

```text
Autonomous candidates
- <url> <title>: why it qualifies; validation needed; risk.

Needs owner
- <url> <title>: exact decision/access needed; recommendation.

Release blockers
- <url> <title>: target milestone/base branch; must land/defer reason.

Defer/close
- <url> <title>: duplicate/superseded/stale reason; suggested action.
```

For implementation-ready items, include the intended base branch and whether a release branch was found from the milestone. Never surface only `#123`; include canonical URLs.
