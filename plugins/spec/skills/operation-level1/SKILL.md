---
name: operation-level1
description: "Trigger: /spec:operation-level1 or cost per run, rate limits, observability, model change control request. Outcome: ASCII operation register, one row per agent with cost, limits, traced, change owner, from spec and Agents, inline."
---
# Operation-Level1
Goal: Render spec as Operation Level 1, Operation Register (Google SRE practice for limits, paging, and change control; FinOps unit economics for cost per run; OpenTelemetry GenAI semantic conventions for what a run records), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Agents Level 1 output, if present, supplies the `AG-NN` rows; Non-Functional Requirements Level 1 supplies limit targets; Evaluation Level 1 supplies the `EV-NN` that gates a change; Autonomy Level 1 supplies the kill switch owner; else infer, tag Inferred.
Scope: Four element types only. Cost: `OP-NN`, one row per agent, dollars per run and per user per day, monthly cap; tokens only with a stated price, else `Unknown`. Limits: rate, concurrency, token budget per agent and per user, and the action at the limit: queue, refuse, degrade. Observability: traced one of run entity, logs only, none; where a person views it; the one signal that pages someone. Change Control: who may change model, prompt, or tool list; what runs before users see it; rollback. Cut: cost formula, limit values per tier, degrade order, trace fields, alert thresholds, canary share, incident process. Level 2 material.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Operation`; if absent, standard box-drawing glyphs.
Output: Element list, divider, register, divider, gaps.

## Process
1. Extract: Per `AG-NN`, list cost, limits, traced, change owner from spec and siblings. Tag each Verified, Inferred, or Unknown.
2. Price: Cost in dollars; a spec that gives tokens and a price is converted, one that gives tokens alone stays `Unknown`, because a cap nobody can read as money is not a cap.
3. Render: ASCII per legend. One register, one row per agent. Rule check line: rows, rows with a cap, change owners Unknown, the paging signal.
4. Gaps: List Unknown. One question each: an agent with no cap, a limit with no action, a traced `none`, a change with no owner or no `EV-NN`.

Requirements:
1. Every agent has a row, and every row has a monthly cap or `Unknown`; a scheduled or background agent with `Unknown` cap is also a gap line, because it spends with nobody watching.
2. Every change owner is a role, never "the team"; a prompt or model change with no `EV-NN` before release is a gap.
3. Creates no `AG-NN`, `NF-NN`, or `EV-NN`; a missing one is a gap for its section.
4. Fits one screen: ≤ 10 rows, ≤ 110 characters per row. More = split by surface.
