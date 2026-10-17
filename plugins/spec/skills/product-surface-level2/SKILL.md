---
name: product-surface-level2
description: "Trigger: /spec:product-surface-level2 or wireframe request. Outcome: ASCII wireframe per screen with states and interactions, detailed design, from spec, inline."
---
# Product-Surface-Level2
Goal: Render spec as Product Surface Level 2, Wireframe per Screen (skeleton plane of Garrett's Elements of User Experience; Hurff five states of UI), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Level 1 output and Data Model Level 2 output, if present, are additional input.
Scope: Six element types. Screens: layout as regions in order, top to bottom, with what the user sees first; states carrying the text the user sees, covering empty, loading, populated, and error on every screen that loads data. Components: detail per component, such as columns for a table, fields for a form, streaming or static for an AI component; binding naming the Data Model entity and attributes shown. Entry and Exit: interactions as control, trigger, and result; navigation naming the exact target of every exit. Surface Type: constraints the surface imposes, such as no interaction inside an email; permission as one pointer line to the Data Access section. Accessibility: keyboard path and screen-reader labels. Notes: assumptions, out of scope.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Product Surface`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec, list Screens + regions + states, Components + detail, Binding, Interactions, Navigation, Surface constraints, Permission, Accessibility, Notes. Tag each Verified, Inferred, or Unknown.
2. Bind: Every component names the Data Model entity and attributes it shows; `Unknown` if spec silent. A component with no binding is decoration or a missing entity: say which.
3. State: Every data screen carries empty, loading, populated, error, each with the text the user sees.
4. Render: ASCII per legend. One wireframe per screen, regions top to bottom. States line and interactions list under each wireframe.
5. Gaps: List Unknown. One question each.

Requirements:
1. Every interaction is control, trigger, result. Missing trigger or result = incomplete.
2. Every exit names a screen on the Level 1 map.
3. No colors, pixel sizes, fonts, or responsive breakpoints. Level 3 material.
4. Fits one screen per wireframe: ≤ 24 rows, ≤ 104 columns. ≤ 4 screens per run; name the screens deferred.
