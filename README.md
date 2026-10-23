# hw-skills

General, reusable skills for working with AI agents. No company or domain content. Each folder under `plugins/` is one category.

## Install (Claude Code)

```
/plugin marketplace add hwang-va/hw-skills
/plugin install workstyle@hw-skills
/plugin install spec@hw-skills
/plugin install domain@hw-skills
```

## Plugins

### workstyle

- **pace** (`/workstyle:pace`): Restate the purpose in parts, one step and one decision per turn, short replies, working rules in a `PLAYBOOK.md`.
- **answer-concise** (`/workstyle:answer-concise`): Focus mode. One or two sentences, one point per reply, until turned off.
- **save-session** (`/workstyle:save-session`): Log the current session (date, machine, folder, session id, web link, brief, files) as one row in `~/work/sessions.md`, so it can be found and resumed later.
- **docs-map** (`/workstyle:docs-map`): Turn a large docs site into one interactive single-page HTML mental-model map: hub diagram, regions, clickable chips with rules and doc links, a six-card essence strip.
- **agent-framework-map** (`/workstyle:agent-framework-map`): Map an AI agent framework's docs onto one fixed page: products row, agent-loop diagram with plug-ins, multi-agent layer, run and ship, and a 10-row table to a framework you already know. Ships with `template.html`.

### spec

Turn a rough AI product brief into a spec, one skill per section and level (`/spec:plan-level0`, `/spec:c4-level1`, ...). Section contract: `plugins/spec/references/spec-sections.md`.

`plugins/spec/` is a copy, regenerated from a separate source repo on every change. Edits made here are overwritten: open an issue instead.

### domain

Turn a domain's scattered sources into one folder of sorted facts, the as-is a product spec then changes: harvest one source kind at a time (`/domain:harvest-doc-level0`, `/domain:harvest-record-level0`, `/domain:harvest-chat-level0`, `/domain:interview-level0`), sort into six bins (`/domain:sort-level1`), map roles (`/domain:roles-level1`), check the folder (`/domain:check-level1`), and close the loop from outcomes (`/domain:review-level1`). Bin contract: `plugins/domain/references/domain-bins.md`.

`plugins/domain/` is a copy, regenerated from a separate source repo on every change. Edits made here are overwritten: open an issue instead.

Each skill is a plain `SKILL.md` file: copy its folder into `~/.claude/skills/` to use it without the plugin.

## Add a category

1. Create `plugins/<category>/.claude-plugin/plugin.json` and `plugins/<category>/skills/<skill>/SKILL.md`.
2. Add one entry to `.claude-plugin/marketplace.json`.
