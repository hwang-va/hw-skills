---
name: activity-level1
description: "Trigger: /spec:activity-level1 or process flow request. Outcome: ASCII UML activity, scope and behavior, from spec, inline."
---
# Activity-Level1
Goal: Render process from spec as UML Activity Level 1, scope and behavior (UML 2.5 activity, swimlane flowchart), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context.
Scope: Four element types only. Start and End: what triggers the process, what state it ends in. Actions: the steps, one verb phrase each, in order. Decisions: branches that change the path, one question each. Owners: who or what performs each action, one swimlane each.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## UML Activity`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec, list Trigger, End state, Actions in order, Decisions, Owners. Tag each Verified or Inferred.
2. Cut: Drop guard conditions, object flow, fork / join, exceptions. Level 2 material.
3. Render: ASCII per legend. Swimlanes as columns, one per owner. Flow top to bottom. Start and end glyphs per legend.
4. Gaps: List Unknown. One question each.

Requirements:
1. Every action sits in exactly one lane.
2. Fits one screen: ≤ 4 lanes, ≤ 12 actions.
