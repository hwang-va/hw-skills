---
name: lessons-level0
description: "Trigger: /spec:lessons-level0 or lessons, learn from, apply to our product request. Outcome: lessons-<target>.md: ≤15 source patterns, Adopt/Adapt/Avoid per target forces."
---
# Lessons-Level0
Goal: Transfer patterns from studied spec to target product through pattern language (Alexander 1977): pattern applies where its forces recur.
Target: Source spec folder user points at (`output-*.md`, `research.md`); target product user describes in chat. Three force questions first, one line each: money moves or data leaves; output is regulated advice or a binding decision; agent acts without approval. Answer already in chat = skip that question.
Scope: Register, ≤ 15 rows, ranked by target loss if lesson wrong. Row: pattern, cite (section ID or `research §N`), verdict, force reason. Verdict: `Adopt` (target shares forces), `Adapt` (forces partly differ; name the change), `Avoid` (forces absent or opposite, or source incident shows failure).
Cut: Section rendering, target spec, effort estimates, surface copying (structure-mapping, Gentner 1983: relations, not features): section skills own sections; target folder owns design.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Catalog, AI Sections.
Output: Target and forces line, divider, lessons register, divider, gaps.

## Process
1. Ask: Three force questions; wait for answers.
2. Harvest: Per source output and research section, patterns with their forces: problem solved, constraint answered.
3. Match: Per pattern, source forces against target forces; verdict; reason names the force.
4. Rank: Target loss if wrong; money, regulated output, irreversible act first; keep 15; rest named in one cut line.
5. Save: Same register to `<folder>\lessons-<target>.md`, target kebab-case; existing file = `lessons-<target>-<date>.md` beside it.

Requirements:
1. ≤ 15 rows; each: pattern, cite, verdict, reason; lines ≤ 110 characters.
2. Every cite resolves to an ID in an `output-*.md` or a `research.md` section number.
3. Creates no IDs; changes none.
4. Every `Adapt` names what changes.
5. One rule-check line: rows, Adopt, Adapt, Avoid, cut, gaps.
6. Verdict turning on an unanswered target fact = one `Unknown` gap, one question.
