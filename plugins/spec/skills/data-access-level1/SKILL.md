---
name: data-access-level1
description: "Trigger: /spec:data-access-level1 or data access, permissions, who-may-read-write request. Outcome: ASCII access matrix, one line per role, from spec, C4, and Data Model, inline."
---
# Data-Access-Level1
Goal: Render spec as Data Access Level 1 (access matrix, Lampson 1971: subjects by objects, rights in the cells), ASCII, inline.
Target: Descriptive spec user points at; infer from full chat context. C4 Level 1 supplies the people; Autonomy Level 1 the agents at T1 or above and what triggers each run; Data Model Level 1 the entities; Activity Level 1 which lane creates, changes, or reads each; Grounding Level 1 each agent's scope (Rule 12). Absent = derive from spec, Inferred, one gap.
Scope: Four elements. Roles: one line per C4 person and per agent as its own principal (RBAC role), `DA-NN` per line. Entities: every Data Model entity, one column each. Rights: one cell per pair, `RW`, `R`, `W`, `·` none, `?` Unknown. Rule Source: org chart, contract, entitlement record, `delegated: DA-NN`, or `service identity`; absent = `Unknown`.
Cut: Gate and filter, masks, never-holds, delegation terms, rule store, revocation: Level 2. What an output cites: Grounding. Auth per call: Interfaces.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, `## Data Access`, Cross-Section Rules 12 to 15.
Output: Element list, divider, matrix, divider, gaps.
Args: `concise`: per contract Levels, Concise: matrix, gap-count line.

## Process
1. Roles: One line per C4 person; one per agent at T1 or above, never the user by proxy, since a proxy hides who acted; a folded person keeps a `?` line.
2. Rights: Per cell from Activity: a lane that creates or changes writes, one that reads reads, else `·`; silent = `?`, never a likely value, since a hedge never becomes a `DEC-NN` (Rule 14). Agent Source: `delegated: DA-NN` when a person triggers the run; a feed, queue, or clock trigger has no session to borrow: `service identity`, Inferred.
3. Render: Per legend as a grid: line per role, column per entity, Source last, cell key below. Rule-check line: roles, entities, cells with a right, `?` cells, agents as principal, scope entries with a row.
4. Gaps: One question per role with `?` cells, per `Unknown` source, per agent with no triggering user, per Grounding scope entry with no row (Rule 12), per name not in the Glossary (Rule 15). Order: right, identity, source, scope.

Requirements:
1. Every cell holds `RW`, `R`, `W`, `·`, or `?`: five states, no blank, no `R?`, since a hedge hides a gap.
2. Every agent that reads or writes has its own `DA-NN` line; creates `DA-NN` only, one per role line.
3. Register lines ≤ 110 characters: terminal pane. Columns, gap included: # ≤ 6, Role ≤ 18, each entity ≤ 7, Source ≤ 24; over = shorten a heading.
4. ≤ 8 roles, ≤ 7 entity columns; more = split by boundary.
5. Elements prose ≤ 12 lines; the matrix is the artifact, and a markdown table that duplicates it is not allowed.
6. Every column is a Data Model entity, every line a C4 person or Autonomy performer; nothing new here.
