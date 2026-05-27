# WordPress AI Contribution Guidelines

Use this when AI tools assist WordPress project contributions, including Core, Gutenberg, Meta, docs, tests, issues, support, triage, PR descriptions, patches, assets, screenshots, or communication.

## Current Official Anchor

- AI Guidelines: https://make.wordpress.org/ai/handbook/ai-guidelines/

The AI guidelines are explicitly evolving. Recheck the handbook before giving exact policy guidance or submitting AI-assisted contributions.

## Core Rules

- The human contributor is responsible for the contribution. AI tools assist; they are not contributors.
- Understand every line of AI-assisted code, test, documentation, issue text, or review comment before submitting it.
- Meaningful AI assistance should be disclosed in the PR description, Trac comment, or equivalent contribution context.
- AI output must be compatible with GPLv2 or later and must not introduce additional redistribution restrictions.
- Do not use AI to launder incompatible licenses, copy proprietary/unknown code, or remove existing license headers or attribution.
- Quality matters more than volume. Avoid large unreviewed code dumps, generic PR descriptions, hallucinated APIs/hooks/tickets, fabricated links, and over-architected solutions.

## Code Contributions

Acceptable AI use:

- Scaffold initial code that the contributor then understands, edits, and validates.
- Suggest refactors or alternatives that fit WordPress standards.
- Generate boilerplate tests or data providers that are reviewed and corrected.
- Draft inline docs/comments that are edited for accuracy and project style.

Required before submission:

- Read every line and remove anything the contributor cannot explain.
- Align with WordPress coding standards, security patterns, performance expectations, and project conventions.
- Add or update tests for the actual behavior.
- Run the relevant test suites and document exact commands.
- Be ready to explain what AI produced, what was edited, and why the final approach is correct.

Avoid:

- Submitting code that is not understood.
- Introducing dependencies, APIs, or patterns that do not match WordPress standards.
- Submitting output that resembles non-GPL-compatible or proprietary code.

## Tests And QA

- Use AI to expand coverage and think through edge cases, not to justify untested code.
- Verify AI-suggested tests use real APIs, realistic WordPress environments, deterministic inputs, and project-supported tools.
- Remove or rewrite tests that depend on imagined functions, hooks, selectors, labels, fixtures, or package scripts.
- Manual test steps must be real, reproducible, and tied to the actual patch or PR.

## Docs, Issues, And Communication

- AI can draft documentation, dev notes, issue descriptions, PR summaries, reproduction steps, and support responses, but the contributor must correct and extend them.
- Click and verify every link before publishing.
- Confirm function names, hooks, options, package names, tickets, issues, and commands.
- Do not publish fabricated citations, generic issue templates without real reproduction, or text that does not reflect the implemented change.
- For documentation, screenshots, diagrams, lessons, and media, verify GPL-compatible licensing or public-domain-compatible status before submission.

## Disclosure Pattern

Use a concise disclosure when AI meaningfully contributed:

```text
AI assistance: Yes
Tool(s): Codex, Claude Code, ChatGPT, GitHub Copilot, or other tool
Used for: Initial code skeleton, test ideas, documentation draft, or review suggestions.
Human review: Final implementation, tests, links, and behavior were reviewed and edited before submission.
```

For trivial assistance such as a variable-name suggestion or mechanical reordering, disclosure may be unnecessary unless the official guidance changes.

## Reviewer And Maintainer Expectations

- AI is not a substitute for human review.
- Be prepared to clarify provenance, testing, license compatibility, and implementation rationale.
- Maintainers may request more tests, simplification, or explanation for heavily AI-assisted work.
- Maintainers may reject or close contributions that have unclear provenance, insufficient testing, license risk, or obvious AI-generated slop.

## Output Expectations

- For AI-assisted contribution work, state whether AI was used meaningfully, what it helped with, what was human-reviewed, what tests ran, and whether license/provenance concerns exist.
- For reviews, flag undisclosed AI use only when there is concrete risk or project-process impact; otherwise focus on quality, tests, provenance, and maintainer burden.
