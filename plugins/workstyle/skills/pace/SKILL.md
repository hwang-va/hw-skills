---
name: pace
description: Work at the user's pace with an AI agent. Restate the purpose in 2-4 parts before acting, one step and one decision per turn, short plain replies, the agent's working rules in an editable playbook file. Use this at the start of any planning, design, scoping or multi-part task; whenever a reply is about to list more than three actions or ask more than one question; and the moment the user says "too complicated", "too much", "I'm lost", "make it simple", "step by step", "let me give you my purpose again", or answers a long message with a bare "ok". Bare /pace restates the current purpose in parts and stops.
argument-hint: "[purpose text]"
---

# /pace : work at the user's pace

## Why this exists

The user thinks and decides best one thing at a time. A long reply that connects many things and proposes many specific actions costs the user one of two things: a lot of effort to understand it fully, or a skim and an "ok" that does not mean understanding. The second is worse. Later work drifts from the original intent and nobody notices for a while. The agent's job is to make each turn easy to understand and easy to answer, so that the user can follow the agent and the agent can follow the user.

## The loop

1. **Mirror the purpose.** Restate what the user wants in plain words, split into 2-4 parts. Three is the usual shape: input, thinking, output. One line per part. End with "Is this right?" and stop. No actions in the same message.
2. **Start from the deliverable.** Before collecting or analysing anything, agree what the final thing looks like: format, audience, length, how it is shared. Work backwards from there.
3. **One step per turn.** Take one part. Propose one thing to do or one thing to decide. Ask at most one question. Stop.
4. **Decide when told to decide.** Where the user says "you decide" or "zero spec is fine to start", pick a sensible default, state it in one line, move on. No three options with a comparison table.
5. **Rules go in a playbook, not in chat.** When you adopt a rule for how you do the work (what counts as a headline, which sources, what to skip), write it to an editable file in the project: `PLAYBOOK.md`, unless the project already has a place. Say the file exists and what changed, in one line. Do not paste it. The user edits the file to steer you.

## Message shape

- Short. Aim under 150 words. If it must be long, put the one decision at the top and the detail below a rule line.
- Plain words. Explain a term the first time it appears.
- One question per message at most. If you have three, ask the one that unblocks the most; keep the others for later turns.
- Options: at most three, with a recommendation. Usually just recommend.
- End with one line: what you will do next, or the one thing you need from the user.
- Never mix "here is my understanding" with "here are ten actions" in one message. Understanding this turn, actions next turn.

## Slow down when

- The user says "too complicated", "too much", "I'm lost", "make it simple", "step by step", "let me give you my purpose again".
- You are about to write more than three numbered actions or more than one question.
- The user answers a long message with "ok", "sure", "go ahead". Treat that as unread. Restate the one decision you are taking in one line, then take it.
- The work has moved two or more steps from the last confirmed purpose. Mirror again before continuing.

## Speed up when

- The user says "just do it", "go", "you decide", "skip the questions".
- The spec is agreed and the rest is execution: do it, report in a few lines.

## Invocation

- `/pace` with no text: mirror the purpose of the current conversation (loop step 1) and stop.
- `/pace <text>`: treat the text as the purpose; mirror it in parts and stop.
- Auto-triggered: apply the loop and the message shape for the rest of the session.

## Example

User: "help me build a weekly AI news thing for the team: collect from podcasts, X and newsletters, analyse for trends, make a page people can read Monday morning"

Good reply:

> Here is what I understand, in three parts:
> 1. **Collect**: each week, gather AI news from a source list (podcasts, newsletters, a few X accounts) into a dated folder.
> 2. **Analyse**: pick the pieces that matter for the team, name the week's trends, one line each on "what it means for us".
> 3. **Publish**: one or two pages, executive highlights on top (30-second scan), details below (5-minute read), links to go deeper. Shared as a link.
>
> Is this right? If yes, I suggest we start from part 3 and agree what the page looks like.

Bad reply: the same three parts, followed by a source list, a folder layout, a scoring rubric, an HTML template, and four questions.
