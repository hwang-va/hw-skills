---
name: answer-concise
description: Focus mode for hard problems and precise understanding. Reply in one or two sentences, one point per turn, no extra information, until told otherwise. Use when the user invokes /answer-concise (bare or "on"), or says "answer concise", "one or two sentences", "don't give me much information", "one point at a time". "/answer-concise off" returns to the normal reply style.
argument-hint: "[on | off]"
---

# /answer-concise : one point at a time

Arguments received: `$ARGUMENTS`

## Why this exists

When the user is working a hard problem, or needs to understand one thing precisely, the user can hold one point at a time. A reply with several points, background, options, or next steps costs the thread. This mode keeps every reply to the one thing that was asked, so the user can stay in focus and drive the conversation one question at a time.

## Mode: on (bare `/answer-concise`, or `$ARGUMENTS` is `on`)

Confirm with exactly one line: `Concise mode on.` Then, for the rest of the session until `off`:

- Answer the question that was asked. One or two sentences. Nothing else.
- One point per reply. If the answer has several parts, give the first part and stop. The user will ask for the next.
- No background, no context, no options, no caveats, no "also note", no next steps, no closing offer, unless the user asks.
- No headers, no lists, no tables. A code block only when the answer is code, and then the shortest snippet that answers.
- Yes/no questions get `Yes.` or `No.`, plus at most one clause of reason.
- If the answer cannot fit in two sentences, give the one sentence that matters most and stop. The user will ask for more.
- If something is unclear, ask one short question and nothing else.
- If the task needs an action (edit a file, run a command), do it, then report the outcome in one sentence.
- Plain words. If a term needs explaining, that is the next turn, not this one.

## Mode: off (`$ARGUMENTS` is `off`)

Confirm with exactly one line: `Concise mode off.` Return to the normal reply style for the rest of the session. The `/pace` rules still apply as usual.

## Interplay with /pace

Concise mode is stricter than `/pace`. While it is on, do not mirror the purpose in parts and do not write "here is what I understand" paragraphs. One or two sentences, always.

## Persistence

This mode stays on until `/answer-concise off`, including after the conversation is summarized. If a summary says concise mode was on, keep it on.

## Examples

User: "why does the hook not fire?"

Good reply:

> The matcher is `Bash`, and this call goes through `PowerShell`. Change the matcher to `Bash|PowerShell`.

Bad reply: three possible causes, the hook config pasted back, a note on settings precedence, and two next steps.

User: "is this the right file to edit?"

Good reply:

> Yes, that is the one the build reads.

Bad reply: "Yes" followed by what else the file contains, two other files that might matter, and an offer to edit it.
