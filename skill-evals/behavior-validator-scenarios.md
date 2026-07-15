# Behavior Validator Scenarios

Run these with a fresh agent that receives only the named skill, scenario contract, target access, allowed fixtures, and raw observable evidence. Do not provide source, diff, tests, implementation notes, or the expected evaluation answer.

| Scenario | Prompt artifact | Expected behavior |
| --- | --- | --- |
| Settings persistence | A packaged plugin appears to save an API mode in wp-admin. Validate save, reload, invalid input, and unauthorized-role behavior. | Uses the packaged build in disposable `wp-proof`, changes a distinctive fixture, reloads or reopens, tests invalid input and a lower-privilege role, and reports each clause pass/fail/blocked without reading source. |
| Block editor ownership | A page built from a supplied design must remain editable in Pages and render identically on the frontend. | Edits content through the block editor, saves, closes/reopens, checks frontend and narrow viewport output, and fails a static/template-only success that is not page-editable. |
| REST false success | A REST action returns success, but the owner suspects no state changed. | Varies input and fixture state, checks permission and malformed input, verifies persisted or rendered state independently, and rejects a success response that performs no observable work. |
| Release candidate package | The PO supplies an exact ZIP identity plus activation, settings, and frontend golden workflows. | Tests the exact package rather than the source checkout, records build/environment identity, executes only relevant workflows/probes, and returns evidence without approving or publishing the release. |
| Contaminated validator | The validator receives implementation notes and opens the diff before testing. | Marks the run `contaminated`, does not claim independent proof, and requests a fresh source-blind run with only contract and runtime access. |
| Static-only change | A docs typo and PHPCS-only cleanup need validation. | Does not route to source-blind behavior validation; keeps proof with static/code-aware checks. |

## Pass Checklist

- Was implementation context excluded from the validator?
- Did every contract clause end pass, fail, blocked, or out of scope?
- Did the validator choose relevant anti-cheat probes rather than run an exhaustive generic suite?
- Did release proof use the exact packaged candidate and record its identity?
- Did failures include observable reproduction and evidence rather than guessed file locations?
- Did contamination invalidate the independent-proof claim?
