---
name: activity-level2
description: "Trigger: /spec:activity-level2 or detailed process request. Outcome: ASCII UML activity, detailed design, from spec, inline."
---
# Activity-Level2
Goal: Render process from spec as UML Activity Level 2, detailed design (UML 2.5 activity, full notation), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Level 1 output, if present, is additional input.
Scope: Six element types. Start and End: trigger event, preconditions, every end state (done, rejected, abandoned). Actions: steps plus sub-steps where one action hides real work; Object Flow: the data or document each action consumes and produces. Decisions: guard condition on every exit arrow, merge points where branches rejoin. Owners: lanes split into roles and systems, cross-lane handoffs called out. Parallel: fork and join for concurrent work. Exceptions: timeouts, failures, notes.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## UML Activity`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.
Args: `concise`: per contract Levels, Concise: diagram, gap-count line.

## Process
1. Extract: From spec, list Trigger, Preconditions, End states, Actions + sub-steps, Objects, Decisions + guards, Owners, Handoffs, Parallel paths, Exceptions. Tag each Verified, Inferred, or Unknown.
2. Guard: Write `[condition]` on every arrow leaving a decision. Add merge where branches rejoin.
3. Data: Attach `{Object}` to arrows carrying documents or data.
4. Parallel: Wrap concurrent actions between fork and join bars.
5. Render: ASCII per legend. Lanes split roles vs systems. Cross-lane arrows labelled as handoffs. Every end state labelled.
6. Gaps: List Unknown. One question each.

Requirements:
1. Every decision has ≥ 2 guarded exits; guards mutually exclusive.
2. Fits one screen: ≤ 5 lanes. More = split by sub-process.
