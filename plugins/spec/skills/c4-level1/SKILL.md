---
name: c4-level1
description: "Trigger: /spec:c4-level1 or C4 context request. Outcome: ASCII C4 System Context from spec, inline."
---
# C4-Level1
Goal: Render spec as C4 Level 1, System Context (Simon Brown, c4model.com), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context.
Scope: Four element types only. People: who uses the system, one box per role. System: the one box in focus, one-line purpose. External Systems: what it depends on or feeds, one box each. Relationships: labelled arrows saying what flows, not how.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## C4`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec, list People, System, External Systems, Relationships. Tag each Verified (stated) or Inferred (implied).
2. Cut: Drop containers, technologies, protocols, deployment, components. Level 2 material.
3. Render: ASCII per legend. System box centre, double border. People left. Externals right. Every arrow labelled with what flows.
4. Gaps: List elements spec omits as Unknown. One question each.

Requirements:
1. One system box only. Two systems in focus = two diagrams.
2. Fits one screen: ≤ 8 boxes, ≤ 12 arrows.
