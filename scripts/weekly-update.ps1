<#
  Weekly incremental refresh of the consult-as-benjamin knowledge base.

  Invoked unattended by the Windows Scheduled Task "LB-Benchy-Consult Weekly KB Update".
  Can also be run by hand at any time -- it is idempotent, because the watermark
  in STATE.json (not the calendar) defines the window.

    powershell -ExecutionPolicy Bypass -File scripts\weekly-update.ps1
    powershell -ExecutionPolicy Bypass -File scripts\weekly-update.ps1 -DryRun

  -DryRun does everything except let Claude commit or push.

  NOTE ON ERROR HANDLING: this script deliberately runs with
  $ErrorActionPreference = 'Continue' and checks $LASTEXITCODE by hand. Under
  Windows PowerShell 5.1, piping a native exe's stderr (git writes ordinary
  progress there) wraps each line in an ErrorRecord, which an 'Stop' preference
  turns into a fatal error even when the exe exited 0. Explicit exit-code checks
  are the only reliable way to tell real git failures from git being chatty.
#>
[CmdletBinding()]
param(
    [switch]$DryRun,
    [int]$TimeoutMinutes = 45
)

$ErrorActionPreference = 'Continue'

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
    Write-Host $line
    Add-Content -Path $LogFile -Value $line -Encoding utf8
}

# Run git, returning its exit code and text output without letting stderr
# masquerade as a failure. See the note in the header.
function Invoke-Git {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]]$GitArgs)
    $text = & git $GitArgs 2>&1 | ForEach-Object { $_.ToString() }
    return [pscustomobject]@{ Code = $LASTEXITCODE; Lines = @($text) }
}

Log "=== weekly KB update starting (DryRun=$DryRun) ==="

if (-not (Test-Path $ClaudeExe)) {
    Log "FATAL: claude CLI not found at $ClaudeExe"
    exit 1
}

Set-Location $Repo

# --- Sync with remote before doing any work -------------------------------
# Another machine (or an edit made on GitHub) may have moved main.
# --autostash matters for an unattended job: without it, any stray uncommitted
# change (including one left behind by a half-finished earlier run) aborts the
# pull and would wedge the weekly job permanently, failing silently every week.
$pull = Invoke-Git pull --rebase --autostash origin main
$pull.Lines | ForEach-Object { Log "git: $_" }
if ($pull.Code -ne 0) {
    Log "FATAL: git pull --rebase exited $($pull.Code)."
    Log "Resolve the working tree by hand. The watermark was not advanced, so no data is lost."
    exit 1
}

# --- Run the update -------------------------------------------------------
$commitClause = if ($DryRun) {
    "DRY RUN: make all the file edits, but do not commit or push. Git is not available to you on this run -- the tool is withheld, so do not attempt it. Finish by describing what you would have committed."
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

$allowedList = @(
    'Read', 'Write', 'Edit', 'Glob', 'Grep', 'TodoWrite'
    'mcp__slack__slack_search_public_and_private'
    'mcp__slack__slack_read_thread'
    'mcp__slack__slack_read_channel'
    'mcp__slack__slack_search_channels'
    'mcp__slack__slack_search_users'
    'mcp__slack__slack_read_user_profile'
)

# Grant git ONLY on a real run. Two escalating lessons from 2026-07-26:
#   1. A prompt saying "do not commit" is not a guarantee -- the first dry run
#      committed anyway despite being told not to.
#   2. Merely leaving Bash out of --allowedTools is ALSO not a guarantee --
#      that flag ADDS permissions, it does not restrict them, so the second dry
#      run committed too. Only --disallowedTools actually denies.
# Hence: allowlist for the real run, explicit denylist for the dry run, plus the
# HEAD assertion below as a third line of defence.
if (-not $DryRun) { $allowedList += 'Bash(git:*)' }
$allowed = $allowedList -join ','
$denied = if ($DryRun) { 'Bash' } else { '' }

$headBefore = (Invoke-Git rev-parse HEAD).Lines[0]

Log "invoking claude (timeout ${TimeoutMinutes}m, git $(if($DryRun){'WITHHELD'}else{'granted'}))..."

$job = Start-Job -ScriptBlock {
    param($exe, $repo, $prompt, $allowed, $denied)
    $ErrorActionPreference = 'Continue'
    Set-Location $repo
    $cliArgs = @('-p', $prompt, '--allowedTools', $allowed, '--permission-mode', 'acceptEdits')
    if ($denied) { $cliArgs += @('--disallowedTools', $denied) }
    & $exe $cliArgs 2>&1 | ForEach-Object { $_.ToString() }
    "___CLAUDE_EXIT___$LASTEXITCODE"
} -ArgumentList $ClaudeExe, $Repo, $prompt, $allowed, $denied

if (-not (Wait-Job $job -Timeout ($TimeoutMinutes * 60))) {
    Stop-Job $job
    Remove-Job $job -Force
    Log "FATAL: claude run exceeded $TimeoutMinutes minutes and was killed."
    Log "Watermark not advanced -- the next run will simply cover a wider window."
    exit 1
}

$claudeExit = $null
Receive-Job $job | ForEach-Object {
    if ($_ -like '___CLAUDE_EXIT___*') {
        $claudeExit = [int]($_ -replace '___CLAUDE_EXIT___', '')
    } else {
        Log "claude: $_"
    }
}
Remove-Job $job -Force

if ($claudeExit -ne 0) {
    Log "FATAL: claude exited $claudeExit. Watermark not advanced; repo left as-is."
    exit 1
}

# --- Report what landed ---------------------------------------------------
$statePath = Join-Path $Repo 'STATE.json'
if (Test-Path $statePath) {
    $state = Get-Content $statePath -Raw | ConvertFrom-Json
    Log "STATE.json now: watermark=$($state.watermark_date) runs=$($state.runs)"
}

if ($DryRun) {
    $diff = Invoke-Git diff --stat
    $diff.Lines | ForEach-Object { Log "dryrun-diff: $_" }

    # Belt and braces: prove HEAD did not move, so a future regression in the
    # permission plumbing surfaces here instead of silently committing.
    $headAfter = (Invoke-Git rev-parse HEAD).Lines[0]
    if ($headAfter -ne $headBefore) {
        Log "ERROR: dry run moved HEAD $headBefore -> $headAfter. It committed despite git being withheld."
        Log "Inspect and undo with: git reset --soft $headBefore"
        exit 1
    }
    Log "=== dry run complete; HEAD unmoved, nothing committed, nothing synced ==="
    exit 0
}

$unpushed = Invoke-Git log 'origin/main..HEAD' --oneline
if ($unpushed.Code -eq 0 -and $unpushed.Lines.Count -gt 0 -and $unpushed.Lines[0]) {
    Log "WARNING: local commits were not pushed:"
    $unpushed.Lines | ForEach-Object { Log "  $_" }
}

# --- Mirror the skill so the locally installed persona reflects the update ---
Log "syncing installed skill -> $InstallTo"
robocopy $SkillSrc $InstallTo /MIR /NFL /NDL /NJH /NJS /NP | Out-Null
if ($LASTEXITCODE -ge 8) {
    Log "WARNING: robocopy failure code $LASTEXITCODE; the installed skill may be stale."
} else {
    Log "installed skill synced."
}

# --- Prune old logs -------------------------------------------------------
Get-ChildItem $LogDir -Filter 'update-*.log' |
    Sort-Object LastWriteTime -Descending |
    Select-Object -Skip 12 |
    Remove-Item -Force -ErrorAction SilentlyContinue

Log "=== done ==="
exit 0
