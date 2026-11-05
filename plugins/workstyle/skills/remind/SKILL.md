---
name: remind
description: Set a timer or an alarm that pops up a reminder window on Windows or macOS. Use when Hai invokes /remind, or says "remind me in 25m", "set a timer", "alarm at 14:30", "ping me when", "wake me at". Takes a time (25m, 1h30m, 90s, 14:30) and an optional message; with no message, writes one from the conversation context.
---

# /remind

`/remind <time> [message]`: a popup window shows the message at that time.

## Steps

1. **Time.** Normalize the time to one of these forms: `25m`, `1h30m`, `90s` (timer) or `HH:MM` in 24-hour local time (alarm). Convert phrases yourself, for example "half an hour" to `30m` and "2:30pm" to `14:30`. If no time is given, ask for one and stop.
2. **Message.** Use Hai's text verbatim. If there is none, write one short line from the conversation context saying what to come back to, for example `Back to the CR-2854 story split: review AC for story 3`. Never leave it empty.
3. **OS.** Read the platform from the environment block (`win32` or `darwin`). If it is unclear, run `uname`.
4. **Run** the script in this skill's base directory (shown as "Base directory for this skill" when the skill loads; call it `<dir>`). It detaches and returns at once:
   - Windows: `powershell -NoProfile -ExecutionPolicy Bypass -File "<dir>/remind.ps1" -When <time> -Message "<message>"`
   - macOS: `sh "<dir>/remind.sh" <time> "<message>"`
5. **Report** the script's one output line (`Reminder set for HH:MM:SS: <message>`). Nothing else.

## Notes

- Each reminder is a one-shot background process that exits after the popup. It is lost on reboot or logoff. It is not a recurring runner, so it does not go in `~/dev/schedulers/registry.yaml`.
- An alarm time already past today fires tomorrow.
- The process checks the clock every 5 s, so it still fires after the laptop wakes from sleep (late if the time passed while asleep).
- Cancel on Windows: `Get-CimInstance Win32_Process -Filter "CommandLine like '%remind.ps1%-Fire%'" | Invoke-CimMethod -MethodName Terminate`. On macOS: `pkill -f remind.sh`.
