---
name: save-session
description: 'Record the current Claude Code session in ~/work/sessions.md so the user can find and resume it later: date, working folder, local session id, web link, one-line brief, files produced. Use when the user invokes /save-session, says "save this session", "remember this session", "log this session", "where do I come back to", or at the end of a session that produced files they will reopen.'
argument-hint: "[brief]"
---

# /save-session : one row per session worth returning to

## Why this exists

A session is the user working with an agent inside one folder. After it closes they cannot remember which folder or which session id to resume. `~/work/sessions.md` is the bird's-eye list. This skill appends or updates one row there.

## Steps

1. **Session id.** The local id is the newest transcript file for this folder:
   ```powershell
   Get-ChildItem "$env:USERPROFILE\.claude\projects\<mangled-cwd>\*.jsonl" | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty BaseName
   ```
   `<mangled-cwd>` is the working directory with `:` and `\` replaced by `-` (for example `C--Users-alex-projects-my-app`). The scratchpad path in the environment block also contains this id.
2. **Web link.** Use the `https://claude.ai/code/session_...` URL from the system attribution block when present. Omit if absent.
3. **Machine and folder.** Machine is a short name from the platform in the environment block: `Win` on Windows, `Mac` on macOS, `Linux` on Linux. Edit these names to your own (for example `WorkWin`, `HomeMac`) so rows from several computers stay apart. Folder is the primary working directory, written with `~` for the home folder.
4. **Brief.** From the argument if given, otherwise one sentence from the conversation: what was learned, built or decided. No more than 25 words.
5. **Produced.** Files created or materially changed in this session, repo-relative, as backtick names. Up to eight; if more, name the folder.
6. **Write.** Read `~/work/sessions.md`. If a row with this session id exists, replace it. Otherwise append a row to the table:
   ```
   | <YYYY-MM-DD> | <machine> | `<folder>` | `<id>` ([web](<url>)) | <brief> | <produced> |
   ```
   If the file does not exist, create it with the header below, then add the row.
7. **Confirm** in one line: the id and the resume command `claude --resume <id>` from the folder. Nothing else.

## File header (only when creating the file)

```
# Sessions

One row per Claude Code session worth returning to. Resume from the folder with `claude --resume <id>`, or open the claude.ai link. Add a row at the end of any session that produced files you will reopen.

| Date | Machine | Folder | Session id | Brief | Produced |
|---|---|---|---|---|---|
```

## Rules

- Never rewrite other rows. Append or replace the one row for this session id.
- Date is the session's start date if known from the transcript, otherwise today.
- Plain prose in the brief, no markdown except the backticks around file names.
- Do not open the file after writing unless asked.
