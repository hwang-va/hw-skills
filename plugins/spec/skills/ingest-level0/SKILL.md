---
name: ingest-level0
description: "Trigger: /spec:ingest-level0 or ingest, gather sources, spec folder request, more info for existing folder. Outcome: spec folder: verbatim brief, raw sources, graded research, provenance README, on disk."
---
# Ingest-Level0
Goal: Build spec folder through intelligence cycle (JP 2-0); claims graded per Admiralty Code (STANAG 2511), written as house tags.
Target: Idea, link, file, or repo introduction user points at; infer from full chat context. Folder: `<parent>\<name>\`; parent as user names, else `specs\`; name kebab-case, broad part first (`acme-chat-pane`).
Scope: Four files. `brief.md`: source text verbatim. `raw\`: what user handed over, as published. `research.md`: collected claims, one tag and one link each, Unknowns last. `README.md`: layout, provenance per source (URL, version, author, method, fetch date), section skills' target = `brief.md` + `research.md`.
Cut: Section rendering, term harvest, definitions, recommendations, whole web pages in `raw\`: section skills own the first four; pages bloat and raise copyright.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels, Catalog.
Output: Files written, divider, coverage table, divider, Unknowns.

## Process
1. Direction: Read source; mark each Catalog section `covered`, `thin`, or `n/a`; thin sections are the collection requirements. Bare idea, no text: `brief.md` = user's words verbatim.
2. Collection: One search round per thin section; owner's own statements first, then press, then analysis. `source-only` argument: skip; claims come from brief and `raw\` only; README notes the mode.
3. Processing: One claim per line, its link, the passage it rests on; fetched summaries marked as summaries.
4. Analysis: Tag each claim `Verified` (owner states it), `Reported` (third party), `Contested` (sources disagree, both named), `Inferred` (from comparison). Cross-check brief claims against sources: confirmed or unconfirmed.
5. Dissemination: Write folder; coverage table in chat: section, status, sources used.
Rerun: Existing folder or material added mid-chat: new dated section in `research.md`, one README provenance row; handed-over items added to `raw\`; `brief.md`, earlier `raw\` files, earlier sections untouched; `output-*.md`, `plan.md` older than new section listed stale.

Requirements:
1. `brief.md` byte-identical to the source given; `cmp` proves it.
2. ≤ 10 web sources per run, 0 under `source-only`; every claim one tag, one link.
3. Creates no IDs; section skills create them.
4. Never overwrites `brief.md`, `raw\`, or an earlier `research.md` section.
5. Each thin section still unanswered = one `Unknown` line, one question.
6. Coverage table lines ≤ 110 characters; one row per Catalog section.
