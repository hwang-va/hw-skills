---
name: sequence-level2
description: "Trigger: /spec:sequence-level2 or detailed sequence request. Outcome: ASCII UML sequence, detailed design, from spec, inline."
---
# Sequence-Level2
Goal: Render one scenario from spec as UML Sequence Level 2, detailed design (UML 2.5 interaction, full notation), ASCII, inline.
Target: Descriptive spec plus one named scenario; infer from full chat context. Level 1 output, if present, is additional input.
Scope: Six element types. Participants: Actors (people, roles) and Systems (each with technology). Messages: each typed sync, async, or return, with parameters or payload. Outcome: happy-path result plus alternatives and errors as `alt` / `opt` fragments. Preconditions: what must hold before the first message, plus explicit out-of-scope list. Repetition and Concurrency: `loop` / `par` fragments. Notes: assumptions attached to steps.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## UML Sequence`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.
Args: `concise`: per contract Levels, Concise: diagram, gap-count line.

## Process
1. Extract: From spec, list Actors, Systems + technology, Messages + parameters, Returns, Preconditions, Alternatives + errors, Loops, Parallel paths, Notes. Tag each Verified, Inferred, or Unknown.
2. Type: Mark each message sync (solid), async (dashed), return (dashed back). Parameters in label.
3. Branch: Wrap alternatives in `alt`, optional in `opt`, repeats in `loop`, concurrent in `par`.
4. Render: ASCII per legend. Activation bars on busy lifelines. Notes right of lifelines.
5. Gaps: List Unknown. One question each.

Requirements:
1. Every alternative path names its guard.
2. Fits one screen: ≤ 8 lifelines. More = split by fragment.
