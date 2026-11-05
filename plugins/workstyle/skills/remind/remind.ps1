# Usage: remind.ps1 -When <25m|1h30m|90s|14:30> [-Message <text>]
# Detaches a hidden process that shows a topmost popup at the target time.
param([Parameter(Mandatory)][string]$When, [string]$Message = 'Time is up', [switch]$Fire)

if ($Fire) {
    $target = [datetime]::Parse($When)
    while ((Get-Date) -lt $target) { Start-Sleep -Seconds 5 }
    Add-Type -AssemblyName System.Windows.Forms
    1..3 | ForEach-Object { [console]::Beep(1000, 300); Start-Sleep -Milliseconds 150 }
    [System.Windows.Forms.MessageBox]::Show($env:REMIND_MSG, "Reminder ($($target.ToString('HH:mm')))", 'OK', 'Information',
        'Button1', 'ServiceNotification') | Out-Null
    return
}

$now = Get-Date
if ($When -match '^(\d{1,2}):(\d{2})$') {
    $target = $now.Date.AddHours([int]$Matches[1]).AddMinutes([int]$Matches[2])
    if ($target -le $now) { $target = $target.AddDays(1) }
} elseif ($When -and $When -match '^(?:(\d+)h)?(?:(\d+)m)?(?:(\d+)s)?$') {
    $target = $now.AddSeconds(3600 * [int]$Matches[1] + 60 * [int]$Matches[2] + [int]$Matches[3])
} else {
    throw "Bad time '$When'. Use 25m, 1h30m, 90s, or HH:MM."
}

# Message travels by environment variable, so quotes in it cannot break the command line.
$env:REMIND_MSG = $Message
Start-Process powershell.exe -WindowStyle Hidden -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass',
    '-File', "`"$PSCommandPath`"", '-When', $target.ToString('s'), '-Fire'
"Reminder set for $($target.ToString('HH:mm:ss')): $Message"
