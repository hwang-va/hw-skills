---
name: glossary-level1
description: "Trigger: /spec:glossary-level1 or glossary, definitions, which word wins request. Outcome: ASCII glossary register, one row per term, from spec and Level 0 harvest, inline."
---
# Glossary-Level1
Goal: Render spec as Glossary Level 1 (intensional definition, ISO 704:2022: superordinate concept plus delimiting characteristic), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. Glossary Level 0 output supplies terms, flags, `GL-NN`; Data Model Level 1, C4 Level 2, Activity Level 1 the box names Rule 15 binds; a sibling absent = derive from spec, tag Inferred, one gap. Every other output is swept for banned words.
Scope: Four elements, one row per term. Term: the word the team uses, Level 0 ID kept; a clash keeps the diagrams' word and bans the rest, an ambiguous row takes the diagrams' sense, both Inferred; no diagram = `Unknown`. Definition: one sentence, class plus trait, spec words. Not to Be Confused With: nearest look-alike in the register and the one difference; none = `none`. Owner or Source: the role the spec names, else the document (`spec`, `DM`, `C4`, `Activity`).
Cut: Binding, synonyms, examples, UI labels, code names, change control, borrowed terms: Level 2. Attributes, rules: Data Model.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Glossary`, Cross-Section Rule 15.
Output: Element list, divider, register and sweep, divider, gaps.
Args: `concise`: per contract Levels, Concise: register and sweep, gap-count line.

## Process
1. Terms: Every Level 0 row keeps its ID; every Data Model entity, C4 box, Activity lane or action noun with no row gets one, numbered after the last harvest ID (Rule 15).
2. Define: Class plus trait; sense `Unknown` lists the open senses, never a guess. Look-alike from the register, so the pair reads both ways.
3. Render: Per legend, one line per term, one `Banned:` line per winner with each loser and its hit count across outputs; one rule-check line: terms, Inferred, Unknown, Rule 15 boxes covered, banned words with hits.
4. Gaps: One question per `Unknown` sense, per Inferred winner (grouped when the diagrams decided them one way), per banned word with a hit (Rule 15), one for the owner when the spec names none. Order: Unknown, winners, sweep, owner.

Requirements:
1. Every Level 0 term and Rule 15 box name has one `GL-NN` row; Level 1 creates `GL-NN` only for box rows, continuing the Level 0 sequence, so Level 0 citations stay valid.
2. Register lines ≤ 110 characters, rule-check line included: terminal pane. Columns: Term ≤ 22, Definition ≤ 46, Confuse ≤ 22, Owner ≤ 10; over = shorten the definition, never wrap a row.
3. ≤ 36 terms; more = merge a look-alike into its parent and name the merge in a gap: a glossary nobody reads binds nothing.
4. Every row has class plus trait or `Unknown` with open senses, a look-alike or `none`, and an owner or a document.
5. Owner absent from the spec = one gap for all rows, not `Unknown` per row: thirty identical cells hide the one question.
6. Elements prose ≤ 12 lines; the register is the artifact, and a markdown table that duplicates it is not allowed.
