---
name: glossary-level0
description: "Trigger: /spec:glossary-level0 or term harvest request. Outcome: ASCII term list, one flagged row per noun phrase, from raw spec, inline."
---
# Glossary-Level0
Goal: Render spec as Glossary Level 0, term harvest (noun-phrase analysis, Abbott 1983, CACM 26(11)), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Raw prose only, no sibling output: the words come from the author, not from a box a later skill drew.
Scope: Three fields per row. Term: the noun phrase as the spec writes it, singular, spelling corrected; one row when it names an actor, system, store, artifact, data item, event, or domain concept; jargon kept. Flag: `clear` (one referent, one use), `ambiguous` (two senses or an open referent), `clash` (two or more words for one thing, joined with `~` in one row). ID: `GL-NN` in order of first appearance; Level 1 and 2 keep it, so a renumber breaks every citation.
Cut: Definitions, look-alikes, owners, the winner among clashing words, bindings, synonym lists, examples, usage rules, change control: Level 1 and 2 material.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Glossary`, Cross-Section Rule 15.
Output: Element list, divider, term list, divider, gaps.

## Process
1. Harvest: Walk the spec sentence by sentence; lift every noun phrase in Scope in its own words, never renamed, never defined. An example after e.g. or such as stays under its parent unless ambiguous on its own. A generic noun with no referent (data, list) is dropped and the drop named in the Elements prose.
2. Merge: Words the spec uses for one thing join in one row with `~`; the first word's position sets the ID. An abbreviation beside its expansion is one term, `term (ABBR)`.
3. Render: Per legend, columns #, Term, Flag, in order of first appearance; one count line: clear, ambiguous, clash, total; one rule-check line: terms, rows joined, generic nouns dropped, gaps.
4. Gaps: One question per clash row (`GL-NN word: Unknown`: which word wins) and per ambiguous row (`GL-NN sense: Unknown`: which sense). Order: clash, then ambiguous, in ID order.

Requirements:
1. Every term appears in the spec verbatim or as its singular; Level 0 defines none, since a definition here fixes a sense before the owner answers. Level 0 creates `GL-NN`; Level 1 extends the sequence, Level 2 creates none.
2. Register lines ≤ 110 characters, title and count line included: terminal pane. Columns: ID 6, Term ≤ 80, Flag ≤ 10.
3. ≤ 30 terms; more = keep actors, systems, stores, artifacts, data items, events; drop generic nouns first, then fold examples under their parent.
4. One row per word: two senses = one row flagged `ambiguous`, never two rows; a joined row is one row flagged `clash`.
5. Every ambiguous and clash row is one gap with one question; a clear row is none, since a question with no open choice is padding.
6. Elements prose ≤ 12 lines; the term list is the artifact, and a markdown table that duplicates it is not allowed.
