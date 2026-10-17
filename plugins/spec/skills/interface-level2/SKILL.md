---
name: interface-level2
description: "Trigger: /spec:interface-level2 or contract card, endpoint, schema, or tool risk request. Outcome: ASCII contract card under each Level 1 interface row, from spec and Interfaces Level 1, inline."
---
# Interface-Level2
Goal: Render spec as Interfaces Level 2 (OpenAPI Specification 3.1, OpenAPI Initiative 2021: one operation per card), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Interfaces Level 1 output required; absent = run `interface-level1` first. C4 Level 2 containers; Data Model Level 2 fields, keys; Data Access Level 1 agent scope; NFR Level 1 limits; Risks Level 1 fallbacks; Autonomy Level 1 calling actions. Sibling absent = derive from spec, tag Inferred, one gap.
Scope: Parties: C4 containers; auth: scheme and scope, agent = its `DA-NN`. Exchange: endpoint or channel, transport, sync or async with direction. Schema: typed fields, `*` required; one `e.g.` value each way from spec words; errors: code, then consumer move. Rules: version; idempotency key, retry, dedup; tool risk on agent rows: worst call, undo, calling `AU-NN`. Limits: rate, timeout, size, latency from `NF-NN`. Notes once.
Cut: New rows, parties, kinds, risk lines: Level 1. Entity shape: Data Model. Who may call: Data Access. Failure cause: Risks.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Interfaces`, Cross-Section Rules 1, 2, and 13.
Output: Element list, divider, register with cards, divider, gaps.

## Process
1. Bind: Row and risk line unchanged, one card under each; parties as C4 Level 2 boxes (Rule 1); auth from spec, agent consumer = its `DA-NN`; silent = `Unknown`.
2. Contract: Endpoint as verb-noun from the exchange; transport from spec, kind tool = MCP tool, else `Unknown`; API and tool sync, event async. Fields by Data Model Level 2 spelling; missing field = `Unknown` plus a gap (Rule 2). Errors: bad request, unavailable, limit, each with move and `RK-NN`. Version `v1` when new; key = Data Model key; no retry on a receipt-less send. Limits by `NF-NN`, else `Unknown`.
3. Render: Per legend, one rule-check line: cards, transports Unknown, auth Unknown, fields bound, limits bound, tool cards with `AU-NN`.
4. Gaps: One question per `Unknown`, grouped where one answer closes many; per field outside the Data Model; per receipt-less send; per tool card below its tier minimum (Rule 13). Order: transport, auth, schema, repeat, limits.

Requirements:
1. Level 2 creates no IDs; cites Level 1 `I-NN`; `Unknown` where silent, never blank or invented.
2. Register lines ≤ 110 characters: terminal pane. Card frame ≤ 104 wide: label 9, value ≤ 90; over = detail to a gap, never drop a line.
3. ≤ 20 cards, ≤ 8 lines each inside the frame; more = split as Level 1 splits.
4. `*` is the only field marker; a field outside Data Model Level 2 is a gap, not a new glyph.
5. Every error names a move; every limit `NF-NN` or `Unknown`; Risk line on agent-consumed cards only, tier minimum as Level 1.
6. Elements prose ≤ 12 lines; the register with cards is the artifact; a markdown table that duplicates it is not allowed.
