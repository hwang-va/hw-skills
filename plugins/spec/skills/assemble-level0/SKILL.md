---
name: assemble-level0
description: "Trigger: /spec:assemble-level0 or assemble, compile, one spec document request. Outcome: spec.md: section outputs verbatim, Catalog order, status per section."
---
# Assemble-Level0
Goal: Build one spec document as DITA map (OASIS DITA 1.3): map orders, topics stay unchanged.
Target: Spec folder user points at: `output-*.md`, `plan.md`, `research.md`; infer from full chat context.
Scope: One file, `<folder>\spec.md`. Header: goal and reader from `plan.md`; contents; status line per Catalog section. Body: each output's template part verbatim: title, Source, Elements, block, Reading Key, Gaps.
Cut: Rewriting, merging, gap dedup, new IDs, chat lines outside template: section skills own content; Decision Log owns Unknown roll-up.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Catalog order.
Output: File written, divider, status table, divider, gaps.
Args: `concise`: per contract Levels, Concise, applied at assembly: per included output keep the title line, the core block(s), and one line `Gaps: N open; see output-<section>-level<N>.md` counted from its Gaps list; an `output-*-concise.md` beside a full output is used as is; file `spec-concise.md`, Requirement 1 then applies to the kept lines. `figma <url>`: after writing, draw the assembled spec on that FigJam board through the Figma MCP (`create_session` on the board file key, then `/figma-use-figjam`): one FigJam section per spec section in Catalog order, each with the title as text, registers as tables with a dark header row, cards as rectangle shapes, ASCII diagrams, trees and wide registers as non-wrapping monospace text (`Source Code Pro`, FigJam code blocks wrap at 576 px and cannot be resized), the gap line as text; report the board link; the md stays the source; without `concise`, draw the concise form and link the full md.

## Process
1. Map: Catalog order; per section L1 then L2; `glossary-level0` before `glossary-level1`.
2. Status: Per section: `included`; `skipped` (plan says Skip); `missing` (plan row, no output); `stale` (output older than `research.md`); `failed` (harness result says fail, when present). Flags stack.
3. Strip: Drop lines outside each output's template; keep every line inside.
4. Write: `spec.md`; existing `spec.md` = write `spec-<date>.md` beside it.

Requirements:
1. Template part of each output byte-identical in `spec.md`.
2. 22 status lines, one per Catalog section; lines ≤ 110 characters.
3. Creates no IDs; changes none.
4. Never edits an `output-*.md`.
5. Skipped or missing section = status line only, no placeholder body.
