# Architecture Decision Gate

Use this before substantial WordPress implementation, review, or PR work when the wrong ownership, contract, branch, or validation choice could create enterprise/VIP risk. Keep the decision record short; the goal is drift prevention, not ceremony.

## Decision Record

Capture only the fields that affect the change:

```text
Goal:
Runtime surface:
Owner:
Source of truth:
Public contract:
Release state:
Security boundary:
Performance hot path:
Validation proof:
Backout path:
```

## Required Decisions

- Owner: plugin, theme, child theme, block, `theme.json`, template, pattern, post content, post meta, option, custom table, external service, or repo workflow.
- Source of truth: code, database content, synced pattern, page `post_content`, option/meta, API provider, build artifact, release branch, or product requirement.
- Public contract: hooks, filters, REST routes, AJAX actions, block names/attributes, shortcodes, WP-CLI commands, options, schemas, asset handles, template paths, CSS classes, package artifacts, and docs.
- Release state: internal draft, unreleased next version, private client preview, beta/RC, feature-flagged production, or stable release.
- Security boundary: actor, capability, object ownership, nonce/CSRF, schema validation, escaping, secret/PII redaction, and multisite tenant boundary.
- Performance boundary: page cacheability, REST/editor load, admin bootstrap, list tables, checkout/forms, query shape, cache invalidation, queue backpressure, and bundle scope.
- Validation proof: diff, syntax/static, build, unit/integration, runtime probe, editor proof, frontend proof, external proof, or release artifact proof.

## Project Policy Precedence

Repo-local policy wins when it is more specific and safe:

- Read `AGENTS.md`, `PRODUCT.md`, release docs, contribution docs, CI workflows, package scripts, and existing PR patterns when present.
- Use repo policy for branch naming, PR base, commit/push expectations, release cadence, generated files, and deployment gates.
- If repo policy conflicts with this skill and the conflict affects release safety, data, security, or public contracts, stop and ask.
- Do not promote one product's local policy into this shared skill unless it generalizes across WordPress projects.

## Hard Stop Conditions

Stop before coding or PR creation when:

- The implementation owner is unclear between plugin, theme, page content, Site Editor customization, or external service.
- The intended PR base branch is unproven and a wrong base could miss a release branch or milestone.
- The change would add compatibility for an unreleased draft shape without proof that real users/data depend on it.
- The change touches secrets, PII, payments, OAuth, uploads, destructive actions, migrations, custom tables, or public endpoints without a stated security boundary.
- The expected validation proof cannot reach the changed runtime/editor/frontend/external boundary.

## Minimal Output

For substantial work, summarize the gate in 3-7 bullets before implementation or in the PR body. For small direct edits, keep it mental but still apply the decisions.
