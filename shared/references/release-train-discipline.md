# Release Train Discipline

Use this reference before beta, prerelease, stable, deploy, version, tag, WordPress.org, milestone, release-branch, or post-release closure decisions.

## Production Gate

Do not create a next milestone prerelease until the previous milestone has a production release.

Example: if `0.6.0` is not production-released, do not create `0.6.1-beta-*`; fold work into the current train or queue it later.

Never infer prerelease readiness from milestone closure alone.

`main` is production release space only. Release branches merge to it only after explicit owner approval and testing. Milestone release work must target `release/<release-version>`: the version string, never the GitHub milestone ID; `develop` is only unmilestoned integration or a verified release-branch source.

## Production Mainline Reconciliation

Treat a production release as incomplete until its exact release tag is an ancestor of `origin/main`. Never advance `main` for a beta or prerelease.

- Live-verify the release, tag, matching `release/<version>` branch, and `origin/main`.
- Use `release/<version>` to `main` only when its head is the tag; otherwise use a narrow branch at the tag. Require owner approval; never push directly to `main`.
- Before deployment and after release, prove `git merge-base --is-ancestor <release-tag-commit> origin/main` plus matching tag and main metadata. On failure, stop and record `mainline sync missing` before another prerelease.

## Required Release Checks

Before any beta, prerelease, or stable action, verify:

- Latest production release.
- Latest prerelease.
- Current target release train.
- Whether the previous milestone has a production release.
- Whether the owner explicitly authorized production/beta release creation in context.
- Whether owner testing confirmation exists for production readiness.
- For WordPress.org plugins, whether `Tested up to` matches the live-verified release target.
- Whether release metadata matches the target version: plugin header/version file, `readme.txt` stable tag and changelog, package metadata, and release notes.
- Whether `readme.txt` and changelog/release notes are release-current: stable tag/version, `Tested up to`, Requires WP/PHP if present, changelog section, upgrade notice when applicable, feature descriptions, FAQ/screenshots/tags where relevant, and no overclaiming unmerged future milestone work.
- Whether any admin UI, frontend UI, consent/setup flow, editor surface, or visual output has release-candidate visual proof from the packaged ZIP/build or release branch build.
- Whether the product's golden workflow regression matrix has been smoke-tested against the release candidate package/build.
- Whether package/readme/Plugin Check validation is current after metadata changes.
- Whether the compact quality gate matrix below is complete, with every gate marked pass/fail/risk or `Not applicable - reason`.

Use the source of truth hierarchy from `cto-orchestration-operating-model.md`: GitHub production releases/tags first, then prereleases/tags, then milestones/issues/PRs, then repo docs, then local state, then memory/chat.

Release-ready recommendations and owner approval requests require fresh live verification. If GitHub releases/tags, milestones, issues, PRs, labels/comments, CI, package state, or WordPress.org state cannot be verified live, stop with `live check unavailable` plus the exact missing signal and fallback evidence; do not request beta/production approval.

## Active Release Train Execution

An active train is quiet only with no eligible work: every scoped PR/issue is merged, owner-gated, failing, draft, wrong-base with recovery, blocked, or deferred.

Action a clean, correctly based non-production PR or state its concrete blocker. Compare the prior `Next action`; on repetition, execute, delegate, or report the exact tool failure. Keep an implementation-ready/merge-ready/owner-gated/wrong-base/blocked/deferred burn-down, and escalate repeated executable work to the portfolio CTO.

## Milestone Discipline

Milestones need due dates: recommend one only from current-train and sequence evidence, ask if ambiguous, and do not treat the missing due date alone as an implementation blocker.

For milestone work, create or use `release/<release-version>` from the verified development base; use the version string, not the GitHub milestone ID or sequence number. If it is not a version, use repo evidence or a decision brief. Do not retarget ambiguous milestones or change due dates without evidence.

If a wrong milestone-ID branch such as `release/3` exists, preserve and replay/reconcile commits to `release/<release-version>`, retarget PRs, and do not delete it without owner approval.

## Release Stop Conditions

Stop before release or prerelease creation when:

- Production release state is unclear.
- The previous release train is not production-released.
- Plugin header, readme stable tag/changelog, package metadata, or release notes do not match the target version.
- `readme.txt` or changelog/release notes are stale, incomplete, or overclaim unmerged future milestone work.
- CI or package validation is not current.
- Package/readme/Plugin Check validation is not current.
- WordPress.org, marketplace, or deploy credentials are missing.
- The owner did not explicitly authorize the production/beta release action.

If release metadata, `readme.txt`, or changelog/release notes are stale, do not ask for production/beta approval yet. Create or delegate a focused release-readiness issue/PR against the active `release/<version>` branch, validate package/readme/Plugin Check from the release branch build after changes, then regenerate the release-ready brief. If current, include explicit readme/changelog audit evidence in the brief.

Normal product orchestration, issue intake, implementation, hardening PRs, branch creation for milestone work, good non-production PR review/merge, dependency/tooling work, docs work, and validation do not require explicit release approval when they avoid production/beta releases, tags, deploys, and public release approval claims.

## Release Quality Gate Matrix

Every release-ready brief must include a compact quality gate matrix. Keep pass cases to one short line each. Expand only failed or risky gates. Do not omit a gate; use `Not applicable - reason` when the product/change shape justifies exclusion.

Before a worker PR is treated as merge-ready or counted in release-ready evidence, confirm the implementation also satisfies `enterprise-code-quality-gate.md` or state the exact exception and residual risk.

- Security/privacy: capabilities, nonces/auth, sanitization/escaping, secrets, data handling, dependency/vulnerability signals, and no public exploitable detail.
- Performance: admin/frontend load, queries, assets/enqueues, package footprint, cache/async behavior, and realistic regression risk for the product.
- Modularity/architecture: boundaries, excessive coupling, public API/schema/contracts, and migration/rollback notes when relevant.
- Maintainability: code clarity, useful comments vs stale/noisy comments, duplication pressure, and whether the change stays supportable by a new engineer.
- Test coverage: unit/integration/e2e/browser coverage where relevant, release-branch CI, packaged release-candidate proof, and golden workflow regression proof for critical user-facing flows.
- Documentation/release notes: `readme.txt`, changelog, upgrade notice, docs, screenshots/assets, WordPress.org metadata/tags/`Tested up to`, support/release notes, and no overclaiming future work.
- Commented-code/dead-code hygiene: commented-out code, debug helpers, stray `var_dump`/`console.log`, stale TODOs, unused paths, and dead compatibility shims that should not ship.
- Compatibility: launched backwards-compatibility commitments, supported WordPress/PHP/browser/runtime versions, editor/classic behavior when relevant, and integration contract compatibility.
- Packaging/version metadata: plugin header/version file, package metadata, runtime-only Composer/npm payload, release ZIP/build contents, and target-version alignment across release surfaces.
- UI/browser proof: required when admin, editor, frontend, consent/setup, or user-facing UI changes. Use packaged/release-candidate screenshots or Playwright/browser evidence, cover constrained widths when relevant, add design audit evidence when workflow/onboarding/settings quality changed materially, and keep the default path simple.

When the train is release-ready, request exact production/beta release approval with evidence: merged PRs, remaining open issues, compact quality gate matrix, CI/package validation, package/build used, exact environment, visual proof status, golden workflow regression status, readme/changelog audit status, docs/release notes/readme/WordPress.org status, risks, rollback notes, failed or skipped proof gaps, and whether skipped proof is acceptable for release.

## Post-Release Verification

After the owner approves and the product thread completes a beta, production release, deploy, or WordPress.org publish, do not call the release train closed until the product thread returns a compact post-release check:

- Approved commit, GitHub release/tag or prerelease, and published package/artifact align.
- For a production release, the exact release tag is an ancestor of `origin/main`, `main` reports the same release version, and beta/prerelease tags have not advanced `main`.
- Public version signal matches the intended version: WordPress.org, marketplace, product site, package download, or installable ZIP as applicable.
- `readme.txt`, changelog, release notes, docs links, screenshots/assets, banners/icons, and `Tested up to` metadata are current where applicable.
- Installed-package smoke check passes for the critical golden workflow, or the skipped proof gap is explicitly accepted.
- Immediate support/forum/error signals are checked where available.
- Rollback/backout notes are documented for the shipped artifact.
- Next milestone/release train is started, confirmed, or intentionally deferred.
- Temporary release/CI heartbeat, worker worktrees, and release evidence threads are reconciled or left with a documented reason.

If any post-release proof fails, stop normal release closure and route recovery to the product thread or prepare an owner decision brief.
