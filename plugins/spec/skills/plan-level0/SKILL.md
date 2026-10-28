---
name: plan-level0
description: "Trigger: /spec:plan-level0 or which sections, plan spec, pick skills request. Outcome: ASCII run plan: Skip/L1/L2 per Catalog section, risk reason, run order; inline and plan.md."
---
# Plan-Level0
Goal: Plan spec sections through risk-driven model (Fairbanks 2010, Just Enough Software Architecture): depth in proportion to failure risk for this goal.
Target: Spec folder user points at (`brief.md`, `research.md`, `raw\`); infer from full chat context. Two questions first, one line each: spec goal; reader, stakeholder or engineer.
Scope: One row per Catalog section. Depth: `Skip`, `L1`, `L2`; reader sets default (stakeholder L1, engineer L2); risk moves row up or down. Reason: one phrase naming risk in this spec, or Catalog trigger that did not fire. Order: run position.
Cut: Rendering sections, running skills, numeric risk scores, effort estimates: section skills own output; user runs one skill per turn.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, Catalog (Trigger column, AI Sections); each skill's `Target:` line for inputs.
Output: Goal and reader line, divider, run plan, divider, gaps.
Args: `concise`: fewest sections that still serve the goal: `Always` rows plus one section per goal heading or named risk; depth `L1` only, `L2` only where money moves, data leaves, or an action is irreversible; one behaviour diagram, Sequence or Activity, not both; AI Sections `Skip` when the brief names no AI actor, even where the Catalog says `Always`, reason `no AI actor`; every other row `Skip`, reason `concise`; rule-check line ends `concise`; file `plan-concise.md`.

## Process
1. Ask: Goal, reader; wait for both. Answer already in chat = skip that question.
2. Trigger: Per Catalog section, Trigger column against folder; not fired = `Skip`, reason names absent trigger. Trigger `Always` never Skip.
3. Depth: Reader default; `L2` where vagueness fails this goal (money moves, data leaves, action irreversible, AI acts alone); `L1` where reader needs scope only. AI Sections switch on together. `L2` = run L1 then L2: Level 2 cites Level 1 IDs.
4. Order: From each chosen skill's `Target:`: inputs before consumer; `glossary-level0` first; L1 before L2; Autonomy before Grounding, Evaluation, Risks; `decision-log` last.
5. Save: Same plan block to `<folder>\plan.md`; existing `plan.md` = write `plan-<date>.md` beside it.

Requirements:
1. 22 rows, one per Catalog section; Glossary row covers Level 0.
2. Every row: depth, reason, order; lines ≤ 110 characters.
3. Order respects every chosen skill's `Target:` inputs; no skill before a sibling it reads.
4. Creates no IDs.
5. One rule-check line: sections, L2, L1, Skip, gaps.
6. Row whose depth turns on an unanswered fact = one `Unknown` gap, one question.
