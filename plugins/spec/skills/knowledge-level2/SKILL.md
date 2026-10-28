---
name: knowledge-level2
description: "Trigger: /spec:knowledge-level2 or search recipe, context pack, embedding, deployment shape, knowledge schema request. Outcome: ASCII Level 2 line block under each Level 1 corpus row plus context pack per agent task, from Level 1, Data Model, and Agents, inline."
---
# Knowledge-Level2
Goal: Render Knowledge Level 2, detail lines per corpus and context pack per task (Anthropic contextual retrieval and context engineering for find by catalog, read whole, chunk only above the ceiling; reciprocal rank fusion for the hybrid merge; Unix list, read, grep as the agentic loop), ASCII, inline.
Target: Knowledge Level 1 output user points at; infer from full chat context. Data Model Level 2 supplies the catalog and distilled entities and their attributes; Agents Level 1 supplies the `AG-NN` rows that load knowledge; Interfaces Level 1 supplies `I-NN` search tools and the sandbox sync row; Data Access Level 1 supplies the access pointer; missing sibling = `Unknown`, never invented.
Scope: Deployment shape once per product, one of local, hosted, hosted-sandbox: local keeps raw as files and the three indexes in one embedded database file, agentic search default; hosted keeps raw in an object store and the indexes in one relational store, agentic search through `I-NN` tools over the catalog; hosted-sandbox syncs raw per user into a file system with the local stack inside, the sync an Interfaces row. Eight line kinds per `KN-NN`. Schema: `◆ Entity.attributes` with the link field to raw. Capture: who or what writes the row per origin, and what is lost when skipped. Embedding: summary per catalog row by default; chunked full text only where a passage must be quoted; model class; size and overlap when chunked. Search recipe: filters, then full-text, then semantic, merge, cap. Primitives: list, read, grep, query, fulltext, vector, each ms, s, or none. Order: question shape to primitive, exact to grep, structured to catalog query, vague to vector, next only on empty. Promotion: when a decision, review, or memo becomes a distilled unit, who approves, owner. Freshness: age limit, re-embed trigger, retirement, three fields. Access: one pointer to the Data Access row. Context pack: one per `AG-NN` that loads knowledge, keyed by subject, each corpus with detail level whole, summary, index, or count, load order, token ceiling, upload capture path. Cut: vendor names, index tuning, prompt text.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## Knowledge`, `### Level 2`; if absent, standard box-drawing glyphs.
Output: Element list, divider, shape line, Level 1 register verbatim with Level 2 lines under each row, divider, context packs, divider, gaps.
Args: `concise`: per contract Levels, Concise: shape line, Level 1 register verbatim with Level 2 lines under each row, divider, context packs, gap-count line.

## Process
1. Extract: Shape, then per `KN-NN` the eight line kinds, then per knowledge-loading `AG-NN` the pack, from spec and siblings. Tag each Verified, Inferred, or Unknown.
2. Bind: Schema to a Data Model Level 2 entity; search tools and sync to `I-NN`; packs to `AG-NN`. No match = `Unknown`, one gap line naming the owning section.
3. Shape: Pick one from the spec's hosting and user count; indexes are derived and rebuildable from raw, so a shape never changes which corpus is the source of truth.
4. Render: ASCII per legend. Shape line, Level 1 rows unchanged with eight lines under each, then one pack block per agent, `KN-NN` or pack name on every line, ≤ 110 characters.
5. Gaps: List Unknown. One question each: a corpus with no capture, a pack over its ceiling, a vague question with no vector path, a feedback with no promotion rule.

Requirements:
1. Creates no `KN-NN`, `AG-NN`, `I-NN`, or entity; a missing one is a gap for its section.
2. Every pack has a ceiling and every corpus in it a detail level; raw loads whole only inside the ceiling, because a pack without a ceiling is the context overflow the layering exists to prevent.
3. Order lines name the cheapest primitive first and stop at the first non-empty result; a line that starts at vector is a gap unless the corpus has no grep or query.
4. Fits one screen: ≤ 12 corpora, eight lines each, ≤ 6 packs, ≤ 110 characters per line. More = split by domain.
