# Adding a person to this repo

This repo started as one persona (Benjamin Chay). It is designed to hold several.
This is the procedure for adding yourself: a `consult-as-<you>` skill backed by
your own Slack history, refreshing itself weekly like Benjamin's does.

Read the whole file before starting. The **Traps** section at the bottom lists
things that have already cost real time — none of them are guessable.

## Ground rules

- **Never touch another person's files.** `consult-as-benjamin/`,
  `update-benjamin-kb/`, `STATE.json`, and `scripts/weekly-update.ps1` are live
  and scheduled. Everything you create is suffixed with your own name.
- **Channels only, never DMs.** Every Slack search must pass
  `channel_types="public_channel,private_channel"`. This repo's standing
  guarantee is that no private 1:1 content is in it. Do not weaken it.
- **Filter out** financial/pricing/invoice detail, HR-sensitive material, and
  anything personal about a named third party.
- **Binary attachments are filenames only.** You cannot read images, PDFs, CAD
  or spreadsheets through Slack — reference them by name, never describe
  contents you have not seen.
- **Never fabricate.** No invented quotes, dates, or decisions. A thin channel
  is recorded as thin.
- Be aware this puts your Slack-derived work content into a repo your
  collaborators can read. That is the point, but decide deliberately.

## Prerequisites

Check these first and stop if any is missing:

1. **Slack MCP connected and authenticated** in your Claude Code. Verify with a
   real call — `slack_search_users` for your own name should return your user ID.
2. **`claude` CLI on PATH** (`claude --version`). The weekly job shells out to it.
3. **Push access** to this repo.

## Steps

### 1. Get your Slack user ID

`slack_search_users` on your own name. Everything keys off the **ID**, never a
name string — names collide (this repo already has one: "Benjamin Ang Zi Jian"
`U02E5QUGGNL` is a different person from Benjamin Chay `U01BJHTFR70`).

### 2. Seed the knowledge base

Work from your channel list. For each channel, pull your own substantive
messages and enough surrounding thread to make them meaningful — a one-line
reply is often meaningless without the question.

Write one file per channel to
`.claude/skills/consult-as-<you>/knowledge-base/channels/<channel>.md`, following
the template the existing files use (open
`consult-as-benjamin/knowledge-base/channels/s3-handlebar.md` — a rich one — and
match its structure): Purpose / Decisions & Reasoning / Notable Exchanges /
Recurring Themes / Referenced Files.

Record thin and empty channels honestly. "He was tagged here but never posted"
is useful signal: it marks where the persona would otherwise fabricate.

This is the expensive step. Parallelise across channels if you have the tooling.

### 3. Synthesize `principles.md`

Cross-channel patterns, grouped into sections that fit *you* — Benjamin's seven
(engineering judgment, risk & quality tolerance, communication style, leadership
& people, supplier/vendor management, prioritization & trade-offs, tooling &
process) are a reasonable starting set, not a requirement.

Every principle needs at least one concrete dated example from a channel file.
Where evidence is thin, say so in the text rather than smoothing it over.

### 4. Write `index.md`

Scope, method, date range, and a per-channel substantiveness rating
(rich / moderate / thin / empty). This is what stops the persona from treating
silence as opinion later. Copy the shape of Benjamin's.

### 5. Create your consult skill

Copy `.claude/skills/consult-as-benjamin/SKILL.md` to
`.claude/skills/consult-as-<you>/SKILL.md` and adapt it. **Keep these
behaviours** — they were arrived at deliberately:

- Intake before advice, capped at one or two rounds, with an escape hatch when
  the user says "just tell me".
- BLUF: the call in the first sentence or two, reasoning below it, ~200 words
  unless the trade-off earns more.
- No sourcing narration — no channel citations or coverage commentary unless the
  user explicitly asks where it came from.
- Silent grounding: read the knowledge base every time regardless.

Adapt the register section to how *you* actually communicate — that is the part
that must not be copied from Benjamin.

### 6. Create your updater skill

Copy `.claude/skills/update-benjamin-kb/` to `.claude/skills/update-<you>-kb/`
and swap: your user ID, your knowledge-base path, your state file, your consult
skill path.

The duplication is deliberate — isolation between people beats DRY here, since
one person's broken updater must not stop anyone else's. Consolidating into one
parameterised updater is a fine later cleanup, not a launch requirement.

### 7. Your own state file

`STATE-<you>.json`, alongside Benjamin's `STATE.json`. Same shape: your user ID,
`watermark_date` (the date of the newest message you seeded), `last_run_utc`,
`runs`.

The watermark, not the calendar, defines each run's window. It advances only on
success, so a missed week self-heals into a wider window. **Never hand-advance
it past unread messages** — that is the one unrecoverable failure.

### 8. Schedule it

Copy `scripts/weekly-update.ps1` to `scripts/weekly-update-<you>.ps1`, pointing
at your skill and state file. Read it before adapting; its comments explain
failure modes that are not obvious.

**Windows:** copy `scripts/scheduled-task.xml`, change the name, command and
`StartBoundary`, register with
`schtasks /Create /TN "<name>" /XML <file> /F`.

**macOS / Linux:** the PowerShell runner will not work — port it to bash. Keep
its structure: pull with autostash, invoke `claude -p` with an explicit tool
allowlist, deny git on dry runs, assert HEAD did not move, mirror the skill to
`~/.claude/skills/`, rotate logs. Schedule with `launchd` or `cron`. Pick a
different weekday or hour from other people's jobs so pushes do not collide.

### 9. Branch and PR

Seed on a branch (`add-<you>`) and open a PR — the initial dump is large and
worth a look before it lands on `main`. Once merged, your weekly job pushes
straight to `main` like Benjamin's; the runner's `pull --rebase --autostash`
handles two people's jobs landing in the same week.

## Traps

Every one of these has already bitten someone here.

- **A prompt instruction is not a guard.** A dry run told explicitly not to
  commit committed anyway. Unattended guarantees must be mechanical.
- **`--allowedTools` ADDS permissions, it does not restrict them.** Omitting
  `Bash` from it does not deny Bash — the second dry run committed too. Only
  `--disallowedTools` denies. Keep the HEAD-unmoved assertion as a backstop.
- **Slack's `after:YYYY-MM-DD` is exclusive** of the named date. Search from
  `watermark − 1 day` and dedupe, or you will silently lose a day.
- **PowerShell 5.1 turns a native exe's stderr into ErrorRecords.** With
  `$ErrorActionPreference='Stop'`, git writing its ordinary "From \<url\>"
  progress aborts the script even though git exited 0. Check `$LASTEXITCODE`
  explicitly instead.
- **Pull with `--autostash`.** Any stray uncommitted file otherwise aborts the
  rebase and wedges the weekly job permanently — failing every week, silently.
- **`New-ScheduledTask*` cmdlets may fail with "Invalid class"** on a locked-down
  Windows box. Use `schtasks /Create /XML`, and write the XML as **UTF-16**
  (`[IO.File]::WriteAllText(path, text, [Text.Encoding]::Unicode)`).
- **Don't log empty weeks.** A changelog that records its own idleness buries
  the entries that matter. No changes means no entry and no commit; the run log
  is proof the job fired.
- **The channel list is never closed.** Benjamin's original 50-channel sweep
  had already missed four active channels by the time the automation ran. Let
  the weekly search discover channels rather than assuming a fixed list.
