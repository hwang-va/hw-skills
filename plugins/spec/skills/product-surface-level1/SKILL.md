---
name: product-surface-level1
description: "Trigger: /spec:product-surface-level1 or screen inventory request. Outcome: ASCII screen inventory and screen map from spec, inline."
---
# Product-Surface-Level1
Goal: Render spec as Product Surface Level 1, Screen Inventory and Map (Garrett visual vocabulary for information architecture), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. C4 Level 1 and Activity Level 1 output, if present, are additional input.
Scope: Four element types only. Screens: every screen or pane named, one-line purpose stating the job the user does there. Components: what sits on each screen, named from the vocabulary: AI component, table, list, form, chart, detail panel, control. Entry and Exit: how the user arrives at each screen and where they go next, verb on the arrow. Surface Type: where the screen lives: web app, chat pane, email, message, or document.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Product Surface`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec, list Screens + purpose, Components per screen, Entry and Exit, Surface Type. Tag each Verified (stated) or Inferred (implied).
2. Cut: Drop layout, regions, states, interactions, component detail, data binding, permission, copy, styling. Level 2 material.
3. Render: ASCII per legend. Inventory table first, one row per screen. Screen map below: one box per screen, entry point marked, verb on every arrow.
4. Gaps: List elements spec omits as Unknown. One question each.

Requirements:
1. Every screen a role in the spec can reach. No screen the spec never implies. No orphan screen: every screen has an entry.
2. Components named, never "various controls". Vocabulary words only.
3. A delivered surface counts: an email, message, or document is a screen carrying purpose and components.
4. Fits one screen: ≤ 10 screens. More = split by role.
