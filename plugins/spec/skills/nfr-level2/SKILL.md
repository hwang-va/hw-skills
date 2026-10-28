---
name: nfr-level2
description: "Trigger: /spec:nfr-level2 or load, ceiling, breach action, measuring tool, or trade-off per quality. Outcome: ASCII Level 2 line pair under each Level 1 quality row, plus trade-off lines, inline."
---
# Nfr-Level2
Goal: Render spec as Non-Functional Requirements Level 2, detailed design (Quality Attribute Scenario, Bass, Clements, Kazman 2012; error budget policy, Google SRE 2016), Level 1 register plus two lines per row, ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. NFR Level 1 output required, it fixes rows and `NF-NN`; absent = run it first. Interfaces Level 1 supplies the `I-NN` per quality; C4 Level 2 the container otherwise; Data Model Level 2 the attributes a tool reads; Autonomy Level 1 the `AU-NN` and its tier; Decision Log Level 1 the `DEC-NN` per open value. Sibling absent = derive from spec, tag Inferred, one gap.
Scope: Five refinements plus trade-offs, IDs kept. Applies: the artifact, one `I-NN` or C4 container. Load: the environment, a rate with unit. Ceiling: monthly or per-client cap and at-cap action; none natural = `none`. Tool: log, dashboard, or test, and the attributes it reads. Breach: the response, alert, degrade, or stop, plus pager; AI rows degrade by Autonomy tier. Trade-off: two qualities, one lever.
Cut: New rows or targets: a missing number is a Level 1 gap. Failure modes: Risks. Test steps: Acceptance.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Non-Functional Requirements`, Cross-Section Rules 5 and 6.
Output: Element list, divider, register with Level 2 lines, divider, gaps.
Args: `concise`: per contract Levels, Concise: register with Level 2 lines, gap-count line.

## Process
1. Bind: Per `NF-NN`, the `I-NN` from the Level 1 measure, else its C4 container; load, cap, pager from spec, else `Unknown` plus `DEC-NN` where one exists, since a guessed rate sizes the wrong system.
2. Tool and breach: Tool names a subtraction or count of Data Model Level 2 attributes; breach names action and pager; an AI degrade names its `AU-NN` and target tier, or `stop` when no lower tier exists.
3. Render: Level 1 register unchanged; under each row `applies: … │ at: … │ cap: …` then `tool: … │ breach: …, page …`; then `Trade-off:` and `Note:` lines. One rule-check line: rows, applies, load numbers, caps, tools, pagers, tier drops, trade-offs.
4. Gaps: One question per `Unknown` cell, naming the number or role; one confirm per Inferred degrade or tool. Order: ceiling, load, pager, degrade, tool.

Requirements:
1. Level 2 creates no IDs; cites Level 1 `NF-NN` and sibling `I-NN`, `AU-NN`, `DEC-NN`; trade-off lines start with `Trade-off:`, no number, since an ID here collides with the Decision Log.
2. Register lines ≤ 110 characters: terminal pane; an overlong cell moves detail to a gap, never wraps.
3. ≤ 12 rows, ≤ 3 lines each counting the Level 1 row; `Unknown` or `none` where spec is silent, never blank or invented.
4. Every breach names one action and one pager or `Unknown`; every AI degrade names `AU-NN` and target tier.
5. ≤ 4 trade-off lines, each naming two `NF-NN` and one lever; ≤ 3 `Note:` lines.
6. Elements prose ≤ 12 lines; the register is the artifact and a markdown table that duplicates it is not allowed.
