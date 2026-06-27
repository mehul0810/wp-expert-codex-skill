# WP Portfolio CTO Evaluation Scenarios

Use these lightweight scenarios to verify cross-product portfolio governance without product-level execution.

## Scenarios

| Scenario | Prompt | Expected primary reference | Pass signals |
| --- | --- | --- | --- |
| Portfolio heartbeat | "Run the portfolio CTO heartbeat." | `cto-orchestration-operating-model.md` | Sweeps every assigned product, includes quiet products with `No action after verification`, reports product-thread health, cross-product blockers, owner decisions, and next governance action without executing product backlog work. |
| Product execution drift | "Fix CleanLinks CI from the portfolio heartbeat." | `cto-orchestration-operating-model.md` | Classifies product-level work as `Portfolio execution drift`, routes scope to the CleanLinks product thread, and keeps portfolio thread focused on governance. |
| Release conflict | "Aculect and OneSMTP both look ready; what should ship first?" | `release-train-discipline.md` | Verifies production/prerelease state, release train gates, owner testing confirmation, risks, and exact approval needed before recommending sequence. |
| Product thread topology drift | "PreviewShare product thread has a stale active turn and a worker did not materialize." | `delegation-protocol.md` | Classifies `Product thread topology drift`, avoids launching more work into the stuck thread, and asks before interrupting/recreating/forking user-created threads. |
| Skill improvement routing | "The product orchestration workflow drifted again." | `self-improvement-loop.md` | Classifies the failure, dedupes existing durable artifacts, routes cross-product behavior to `wp-portfolio-cto` or shared references, and adds audit coverage when repeatable. |

## Regression Questions

- Did the portfolio thread avoid product-level backlog execution?
- Did every assigned product appear in the final check-in, including quiet products?
- Did it report product-thread health and topology drift separately from product backlog status?
- Did it keep production/beta release actions behind explicit owner approval?
- Did it route product execution to `wp-product-orchestrator` and implementation to specialist workers?
- Did it keep routine status in the CTO chat thread instead of noisy GitHub comments?
- Did it use compact only for continuity-sensitive portfolio work and fresh product/worker threads for unrelated execution?
