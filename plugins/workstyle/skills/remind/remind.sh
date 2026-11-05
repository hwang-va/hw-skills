#!/bin/sh
# Usage: remind.sh <25m|1h30m|90s|14:30> [message]   (macOS)
# Detaches a background process that shows a dialog at the target time.
when=$1
msg=${2:-Time is up}
now=$(date +%s)

case $when in
  [0-9]:[0-9][0-9] | [0-9][0-9]:[0-9][0-9])
    target=$(date -j -f %H:%M:%S "$when:00" +%s) || exit 1
    [ "$target" -le "$now" ] && target=$((target + 86400)) ;;
  *)
    if [ -z "$when" ] || ! echo "$when" | grep -Eq '^([0-9]+h)?([0-9]+m)?([0-9]+s)?$'; then
      echo "Bad time '$when'. Use 25m, 1h30m, 90s, or HH:MM." >&2; exit 1
    fi
    # 1h30m -> 1*3600+30*60 (input validated above, so arithmetic is safe)
    target=$((now + $(echo "$when" | sed 's/h/*3600+/; s/m/*60+/; s/s/+/; s/+$//')))
esac

nohup sh -c '
  while [ "$(date +%s)" -lt "$1" ]; do sleep 5; done
  osascript -e "beep 3" &
  osascript -e "on run argv" -e "display dialog (item 1 of argv) with title \"Reminder\" buttons {\"OK\"} default button 1 with icon note" -e "end run" "$2"
' _ "$target" "$msg" >/dev/null 2>&1 &

echo "Reminder set for $(date -r "$target" +%H:%M:%S): $msg"
