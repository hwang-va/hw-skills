---
name: state-level1
description: "Trigger: /spec:state-level1 or state machine, lifecycle, status transitions request. Outcome: ASCII UML state machine, one entity, states, events, forbidden transitions, from spec and Data Model, inline."
---
# State-Level1
Goal: Render one entity's lifecycle from spec as UML State Machine Level 1, scope and behavior (UML 2.5 ch. 14: states, transitions, initial and final pseudostates), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Entity: the one user names; none named = the entity with the most states in Data Model Level 2, say so. Data Model Level 2 supplies state names and spelling; absent = derive from spec, tag Inferred, one gap.
Scope: Four element types only. States: each named condition the entity rests in, one box each. Events and Transitions: the business event that moves the entity from one state to another, one arrow each, `event` label, no guard. Initial and Final: where the lifecycle starts and every state it can end in. Forbidden: transitions the spec says must never happen, listed under the diagram with the reason.
Cut: Guards, entry and exit actions, composite and parallel states, timeouts, who may fire each event, audit per transition: Level 2 material. Attributes: Data Model. Process steps across entities: Activity.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## UML State Machine`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, forbidden list, divider, gaps.
Args: `concise`: per contract Levels, Concise: diagram, divider, forbidden list, gap-count line.

## Process
1. Extract: From spec and Data Model Level 2, list States, Events with from and to state, Initial, Finals, Forbidden with reason. Tag each Verified, Inferred, or Unknown.
2. Cut: Drop Level 2 material per Scope.
3. Render: ASCII per legend. States as boxes, initial glyph top, finals marked, events on arrows. Flow top to bottom, forward moves down, reverse moves drawn right.
4. Forbidden: One line each under the diagram: `From ✗▶ To: reason`.
5. Gaps: List Unknown. One question each. A state with no exit and not final = one gap.

Requirements:
1. One entity per run; states match Data Model Level 2 spelling when it exists.
2. Every state reachable from initial; every non-final state has at least one exit.
3. Fits one screen: ≤ 8 states, ≤ 14 transitions.
4. Creates no IDs.
