---
name: knowledge-level1
description: "Trigger: /spec:knowledge-level1 or knowledge base, corpus, retrieval, what the agent can search request. Outcome: ASCII corpus register and layer diagram, one row per corpus with layer, store, origin, search, consumer path, feedback, from spec and Data Model, inline."
---
# Knowledge-Level1
Goal: Render spec as Knowledge Level 1, Corpus Register and Layer Diagram (DIKW ladder, Ackoff, for the raw, catalog, distilled layers; retrieval-augmented generation for the search kinds), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Data Model Level 1 output, if present, supplies entity names for catalog and distilled rows; Agents Level 1, if present, supplies `AG-NN` for feedback arrows and agent consumers; Grounding Level 1, if present, supplies the sources that must appear as corpora; Interfaces and Product Surface Level 1, if present, supply tool rows and screens for the consumer columns; else infer, tag Inferred.
Scope: Four element types only. Corpora: every searchable body named, `KN-NN`, layer one of raw, catalog, distilled; store kind one of local file system, object store, relational table, vector index, never a vendor name; a folder of Markdown or JSONL on the user's machine is a raw corpus; a decision, memo, or review table is a corpus as soon as the spec says it feeds back. Origin and Unit: origin one of internal file, vendor feed, agent web search, human note, product decision; unit one of file, row, chunk, unit. Search and Consumer: search one of keyed, full-text, semantic, hybrid, agentic (the agent loops list, read, grep; a search kind, never a store); agent path as an `I-NN` tool or `load whole`, person path as a screen, `none` when a consumer has no path. Feedback: who writes new knowledge, into which layer, on what trigger. Cut: file format of the unit, schema, chunking, embedding model, search recipe order, context budget, promotion approval, freshness. Level 2 material.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Knowledge`; if absent, standard box-drawing glyphs.
Output: Element list, divider, register, divider, layer diagram, divider, gaps.

## Process
1. Extract: From spec and siblings, list every body of content an agent or a person searches, loads, or writes. Tag each Verified, Inferred, or Unknown.
2. Layer: Assign each corpus one layer by what a search returns: an original is raw, a row about an original is catalog, a unit loaded whole into context is distilled; an index is a search kind on the catalog, never a layer.
3. Render: ASCII per legend. Register first, one row per corpus, `KN-NN` from raw up. Rule check line: corpora, layers present, feedback arrows. Layer diagram below: three boxes raw at the bottom, link arrows from catalog to raw, one feedback arrow per writer with its trigger.
4. Gaps: List Unknown. One question each: a layer with no corpus, a corpus with no consumer path, an origin with no capture, a feedback the spec implies but names no writer.

Requirements:
1. Every row fills both consumer columns, with `none` when one has no path, so a corpus only agents can reach is a visible choice, not an omission.
2. Every origin the spec names appears on at least one raw row; agent web search and human notes count, because knowledge never captured is knowledge the product lacks.
3. Creates no `I-NN`, `AG-NN`, or Data Model entity: a missing tool, agent, or entity is one gap line for its own section.
4. Fits one screen: ≤ 12 corpora, rows ≤ 110 characters. More = split by domain.
