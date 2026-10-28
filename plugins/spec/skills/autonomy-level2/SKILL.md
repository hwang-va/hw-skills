---
name: autonomy-level2
description: "Trigger: /spec:autonomy-level2 or conditional tier, promotion, deadline, evidence pack, kill switch request. Outcome: ASCII Level 2 line block per Level 1 autonomy action, from Level 1 and siblings, inline."
---
# Autonomy-Level2
Goal: Render spec as Autonomy Level 2 (SAE J3016: a tier holds only inside a stated design domain, with a request to intervene outside it), ASCII, inline.
Target: Spec user points at; infer from chat context. Autonomy Level 1 output required: `AU-NN`, performers, tiers; absent = run `/spec:autonomy-level1` first. Siblings, Level 2 unless stated: Interfaces Level 1 tool ratings (Rule 13); Evaluation gating `EV-NN` (Rule 8); Data Model attributes, run entity (Rule 4); Product Surface approver screen; Risks fallback (Rule 9); NFR timeout, cost cap; Decision Log Level 1 existing `DEC-NN`. Sibling absent = derive from spec, tag Inferred, one gap.
Scope: Risk: `risk:` undo, blast radius, cost of error, `I-NN` tools with rating, volume per day. Conditional: `T3 if <domain>; else T2`, threshold stated. Promotion: `T2 ━━▶ T3 when EV-NN`, pointer only. Checkpoint: `approve ≤ deadline │ timeout: default │ load per approver`. Evidence: `◆ Entity.attribute` plus one `PS N` screen. Escalation: triggers with thresholds. Override: undo, `stop:` kill switch scope, accountable owner. `Audit:` run entity, retention. `Notes:` out of scope.
Cut: New actions, tiers, IDs: a wrong tier is a Level 1 gap. Bars: Evaluation. Tool contracts: Interfaces. Causes: Risks. Layout: Product Surface.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Autonomy`, Cross-Section Rules 4, 8, 9, 13, 14.
Output: Element list, divider, map with line blocks, divider, gaps.
Args: `concise`: per contract Levels, Concise: map with line blocks, gap-count line.

## Process
1. Bind: Per `AU-NN` in Level 1 order, pull each field from its named sibling; a value none holds = `Unknown`, with an existing `DEC-NN` or none.
2. Domain: Condition and threshold from spec words; a T3 target on a T2-minimum tool is a Rule 13 conflict, flagged, never resolved here.
3. Render: Level 1 map, then per action: risk, promotion, conditional, checkpoint, evidence, escalation; T0 risk only; T4 risk, promotion, escalation. Then `Audit:`, `Notes:`. One rule-check line: actions, full blocks, `EV-NN` pointers, Rule 13 conflicts, T3 and T4 with `RK-NN`, run entity.
4. Gaps: One question per `Unknown`, per Rule 13 conflict, per missing deadline, screen, kill switch, owner, or run entity. Order: threshold, deadline, evidence, override, audit.

Requirements:
1. Level 2 creates no IDs; cites Level 1 `AU-NN` and sibling IDs as spelled. No existing `DEC-NN` = bare `Unknown`: the Decision Log numbers it (Rule 14).
2. Register lines ≤ 110 characters: terminal pane; over = split at a `│`, indent under the ID, never drop a field.
3. ≤ 12 actions, ≤ 6 lines each after the Level 1 row; more = one gap: one screen per action.
4. Every promotion line names one `EV-NN`, or `AC-NN` when deterministic, never the bar restated (Rule 8); every T3 and T4 action names one `RK-NN` (Rule 9).
5. Evidence lines use Data Model spelling and one `PS N` screen; absent attribute `?`, absent screen `Unknown`.
6. Elements prose ≤ 12 lines; the line blocks are the artifact; no duplicating markdown table.
