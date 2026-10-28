---
name: operation-level2
description: "Trigger: /spec:operation-level2 or cost formula, degrade order, trace fields, alert threshold, canary, rollback, incident request. Outcome: ASCII Level 2 line block under each Level 1 operation row, from Level 1, Evaluation, and NFR, inline."
---
# Operation-Level2
Goal: Render Operation Level 2, detail lines per agent row (Google SRE practice for alerting on symptoms, canarying, and incident management; FinOps unit economics for the cost formula and alarm share; OpenTelemetry GenAI semantic conventions as the mapping target for trace fields), ASCII, inline.
Target: Operation Level 1 output user points at; infer from full chat context. Non-Functional Requirements Level 2 supplies limit values and ceilings; Evaluation Level 1 supplies the `EV-NN` and bar that gate a release; Risks Level 1 supplies the `RK-NN` an incident maps to; Data Model Level 2 supplies the run entity; Autonomy Level 1 supplies the kill switch owner; `${CLAUDE_PLUGIN_ROOT}/references/agent-capabilities.md` supplies capability names; missing sibling = `Unknown`, never invented.
Scope: Six line kinds per `OP-NN`, plus one incident block per product. Cost formula: tokens in and out, tool calls, model class, price, per run; alarm at a share of the monthly cap, `Unknown` when the spec is silent. Limits and degrade: values per user tier matched to `NF-NN`; degrade order of smaller model, fewer tools, shorter context, refuse, with the user text at each step. Trace: fields per run in plain words, run id, agent, trigger, model and prompt version, tool calls, tokens, cost, latency, outcome, approvals, with retention; one note that the engineer maps them to the OpenTelemetry GenAI names. Alerts: metric, threshold, window, severity, who is paged. Release: `EV-NN` run against the bar, canary share and duration, promotion rule, rollback trigger and time. Incident: once per product, severity scale, on-call, user communication, review feeding Risks; per agent only the severity its failure maps to and the `RK-NN`. Capability: names from the reference only. Cut: dashboard layout, vendor names, runbook text.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Operation`, `### Level 2`; if absent, standard box-drawing glyphs.
Output: Element list, divider, Level 1 register verbatim with Level 2 lines under each row, divider, incident block, divider, gaps.
Args: `concise`: per contract Levels, Concise: Level 1 register verbatim with Level 2 lines under each row, divider, incident block, gap-count line.

## Process
1. Extract: Per `OP-NN`, list the six line kinds; once, the incident block. Tag each Verified, Inferred, or Unknown.
2. Bind: Limit values to `NF-NN`; release gate to `EV-NN`; incident severity to `RK-NN`; trace storage to the run entity; capability to a reference row. No match = `Unknown`, one gap line naming the owning section.
3. Threshold: Never invent a number; an alarm share, a canary share, or a rollback time the spec does not give is `Unknown` and a gap, because an invented threshold reads as a decision.
4. Render: ASCII per legend. Level 1 rows unchanged, six lines under each, `OP-NN` prefix on every line, then the incident block, ≤ 110 characters.
5. Gaps: List Unknown. One question each: cost with no price, a limit with no `NF-NN`, a release with no `EV-NN`, an alert with no pager, an agent whose failure maps to no `RK-NN`.

Requirements:
1. Creates no `OP-NN`, `NF-NN`, `EV-NN`, or `RK-NN`; a missing one is a gap for its section.
2. Every release line names an `EV-NN` and a rollback trigger; a model or prompt change that reaches users without both is a gap, because that is the regression nobody sees until a client does.
3. Every alert names a person or role to page; an alert with no pager is a dashboard, not an alert, and is stated as such.
4. Fits one screen: ≤ 10 rows, six lines each, one incident block, ≤ 110 characters per line.
