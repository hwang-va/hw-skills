---
name: sequence-level1
description: "Trigger: /spec:sequence-level1 or sequence scenario request. Outcome: ASCII UML sequence, scope and behavior, from spec, inline."
---
# Sequence-Level1
Goal: Render one scenario from spec as UML Sequence Level 1, scope and behavior (UML 2.5 interaction, story form), ASCII, inline.
Target: Descriptive spec plus one named scenario; infer from full chat context. No scenario named = ask one line.
Scope: Four element types only. Participants: one lifeline per actor or system. Messages: what happens, in order, one plain sentence each. Outcome: what the scenario ends with, one line. Trigger and Boundary: what starts it, what is out of scope.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## UML Sequence`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec, list Participants, Messages in order, Outcome, Trigger, out-of-scope items. Tag each Verified or Inferred.
2. Cut: Drop sync / async typing, return arrows, parameters, fragments. Level 2 material.
3. Render: ASCII per legend. Lifelines across top. Messages numbered, top to bottom, solid arrow only. Trigger line above first message; outcome line below last.
4. Gaps: List Unknown. One question each.

Requirements:
1. One scenario per diagram; happy path only.
2. Fits one screen: ≤ 6 lifelines, ≤ 12 messages.
