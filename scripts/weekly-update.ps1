<#
  Weekly incremental refresh of the consult-as-benjamin knowledge base.

  Invoked unattended by the Windows Scheduled Task "LB-Benchy-Consult Weekly KB Update".
  Can also be run by hand at any time -- it is idempotent, because the watermark
  in STATE.json (not the calendar) defines the window.

    powershell -ExecutionPolicy Bypass -File scripts\weekly-update.ps1
    powershell -ExecutionPolicy Bypass -File scripts\weekly-update.ps1 -DryRun

  -DryRun does everything except let Claude commit or push.
#>
[CmdletBinding()]
param(
    [switch]$DryRun,
    [int]$TimeoutMinutes = 45
)

$ErrorActionPreference = 'Stop'

$Repo      = Split-Path -Parent $PSScriptRoot
$LogDir    = Join-Path $Repo 'logs'
$Stamp     = Get-Date -Format 'yyyy-MM-dd_HHmm'
$LogFile   = Join-Path $LogDir "update-$Stamp.log"
$ClaudeExe = Join-Path $env:APPDATA 'npm\claude.cmd'
$InstallTo = Join-Path $env:USERPROFILE '.claude\skills\consult-as-benjamin'
$SkillSrc  = Join-Path $Repo '.claude\skills\consult-as-benjamin'

New-Item -ItemType Directory -Force $LogDir | Out-Null

function Log($msg) {
    $line = "[{0}] {1}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $msg
    $line | Tee-Object -FilePath $LogFile -Append
}

Log "=== weekly KB update starting (DryRun=$DryRun) ==="

if (-not (Test-Path $ClaudeExe)) {
    Log "FATAL: claude CLI not found at $ClaudeExe"
    exit 1
}

Set-Location $Repo

# --- Sync with remote before doing any work -------------------------------
# Another machine (or a manual edit on GitHub) may have moved main.
try {
    git pull --rebase origin main 2>&1 | ForEach-Object { Log "git: $_" }
    if ($LASTEXITCODE -ne 0) { throw "git pull --rebase exited $LASTEXITCODE" }
} catch {
    Log "FATAL: could not sync with origin/main -- $_"
    Log "Resolve the working tree by hand; the watermark was not advanced, so no data is lost."
    exit 1
}

# --- Run the update -------------------------------------------------------
$commitClause = if ($DryRun) {
    "DRY RUN: make all the file edits, but do NOT run git add, git commit, or git push. End by printing the diffstat you would have committed."
} else {
    "Commit and push as the skill describes."
}

$prompt = @"
Use the update-benjamin-kb skill in this repository and follow it exactly.

This is an unattended scheduled run. There is no human to ask, so make the
conservative choice at every fork: when unsure whether something is a genuine
evolution in his style, record the evidence in the channel file and leave
principles.md alone.

$commitClause

Finish with a short plain-text summary: messages reviewed, channels touched,
new channels created, and whether principles.md or the consult skill changed.
"@

$allowed = @(
    'Read','Write','Edit','Glob','Grep','TodoWrite'
    'Bash(git:*)'
    'mcp__slack__slack_search_public_and_private'
    'mcp__slack__slack_read_thread'
    'mcp__slack__slack_read_channel'
    'mcp__slack__slack_search_channels'
    'mcp__slack__slack_search_users'
    'mcp__slack__slack_read_user_profile'
) -join ','

Log "invoking claude (timeout ${TimeoutMinutes}m)..."

$job = Start-Job -ScriptBlock {
    param($exe, $repo, $prompt, $allowed)
    Set-Location $repo
    & $exe -p $prompt --allowedTools $allowed --permission-mode acceptEdits 2>&1
} -ArgumentList $ClaudeExe, $Repo, $prompt, $allowed

if (Wait-Job $job -Timeout ($TimeoutMinutes * 60)) {
    Receive-Job $job | ForEach-Object { Log "claude: $_" }
    $claudeOk = ($job.State -eq 'Completed')
} else {
    Stop-Job $job
    Log "FATAL: claude run exceeded ${TimeoutMinutes} minutes and was killed."
    Log "Watermark not advanced -- next run will cover the wider window."
    Remove-Job $job -Force
    exit 1
}
Remove-Job $job -Force

if (-not $claudeOk) {
    Log "FATAL: claude run did not complete cleanly. Watermark not advanced."
    exit 1
}

# --- Verify the run actually landed --------------------------------------
$state = Get-Content (Join-Path $Repo 'STATE.json') -Raw | ConvertFrom-Json
Log "STATE.json now: watermark=$($state.watermark_date) runs=$($state.runs)"

if (-not $DryRun) {
    $unpushed = git log origin/main..HEAD --oneline 2>$null
    if ($unpushed) {
        Log "WARNING: local commits were not pushed:"
        $unpushed | ForEach-Object { Log "  $_" }
    }

    # --- Sync the installed skill so the local persona reflects the update ---
    Log "syncing installed skill -> $InstallTo"
    robocopy $SkillSrc $InstallTo /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
    if ($LASTEXITCODE -ge 8) {
        Log "WARNING: robocopy reported failure code $LASTEXITCODE; installed skill may be stale."
    } else {
        Log "installed skill synced."
    }
    $global:LASTEXITCODE = 0
}

# --- Prune old logs -------------------------------------------------------
Get-ChildItem $LogDir -Filter 'update-*.log' |
    Sort-Object LastWriteTime -Descending |
    Select-Object -Skip 12 |
    Remove-Item -Force -ErrorAction SilentlyContinue

Log "=== done ==="
exit 0
