# hw-skills

General, reusable skills for working with AI agents. No company or domain content. Each folder under `plugins/` is one category.

## Install (Claude Code)

```
/plugin marketplace add hwang-va/hw-skills
/plugin install workstyle@hw-skills
/plugin install spec@hw-skills
```

## Plugins

### workstyle

- **pace** (`/workstyle:pace`): Restate the purpose in parts, one step and one decision per turn, short replies, working rules in a `PLAYBOOK.md`.
- **answer-concise** (`/workstyle:answer-concise`): Focus mode. One or two sentences, one point per reply, until turned off.

### spec

Turn a rough AI product brief into a spec, one skill per section and level (`/spec:plan-level0`, `/spec:c4-level1`, ...). Section contract: `plugins/spec/references/spec-sections.md`.

`plugins/spec/` is a copy, regenerated from a separate source repo on every change. Edits made here are overwritten: open an issue instead.

Each skill is a plain `SKILL.md` file: copy its folder into `~/.claude/skills/` to use it without the plugin.

## Add a category

1. Create `plugins/<category>/.claude-plugin/plugin.json` and `plugins/<category>/skills/<skill>/SKILL.md`.
2. Add one entry to `.claude-plugin/marketplace.json`.
