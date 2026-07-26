# LB-Benchy-Consult

Uses the principles of Ben Chay's experience in LB for consulting various
design/company/department/timeline decisions.

The knowledge base **refreshes itself weekly** from new Slack activity, so the
persona tracks how he actually works now rather than freezing at the day it was
built.

## Structure

- `.claude/skills/consult-as-benjamin/` — the consult skill, self-contained. Its
  `knowledge-base/` holds:
  - `principles.md` — synthesized, evidence-backed patterns in Benjamin's
    engineering judgment, risk tolerance, communication style, leadership,
    supplier management, prioritization, and tooling/process habits.
  - `channels/*.md` — raw per-Slack-channel extracts that back every claim in
    `principles.md`. This is the evidence layer.
  - `index.md` — how this was built, scope, known gaps, per-channel signal rating.
- `.claude/skills/update-benjamin-kb/` — the weekly refresh procedure.
- `scripts/weekly-update.ps1` — unattended runner invoked by the scheduler.
- `STATE.json` — watermark: the date of the newest Slack message already folded in.
- `CHANGELOG.md` — one entry per weekly refresh, newest first.

Opening this repo in Claude Code makes both skills available automatically.
A copy of the consult skill is also installed at
`~/.claude/skills/consult-as-benjamin/` so it works from any directory; the
runner re-syncs that copy after every successful update.

## How the consult skill behaves

It answers as an advisor, not an oracle. On a situational question it will
**ask before it recommends** — scoping the decision boundary, the build phase,
what is measured versus assumed, the binding constraint, and the blast radius —
because advice given without the phase or the real constraint is close to
useless. It caps itself at one or two rounds of questions, and if you tell it to
just give the answer, it does, stating its assumptions up front instead.

It also states its own grounding before advising: whether the topic sits in a
channel where Benjamin is richly evidenced, or one where it is extrapolating.

## The weekly refresh

A Windows Scheduled Task (`LB-Benchy-Consult Weekly KB Update`) runs
`scripts/weekly-update.ps1` every **Monday at 08:07** local time. If the machine
is asleep or off, the task runs at the next opportunity.

Each run:

1. Reads the `watermark_date` from `STATE.json`.
2. Searches Slack for messages `from:<@U01BJHTFR70>` since that date — **public
   and private channels only, never DMs** — auto-discovering channels that
   aren't in the knowledge base yet.
3. Reads the surrounding thread for anything substantive, then folds it into the
   matching `channels/*.md` with dated entries.
4. Classifies each finding against `principles.md` as REINFORCES / REFINES /
   **EVOLVES** / NEW. Genuine changes in how he decides or communicates are kept
   as *both* the old behaviour (`through <date>`) and the new (`from <date>`),
   so drift is visible rather than silently overwritten.
5. Writes a `CHANGELOG.md` entry, advances the watermark, and pushes one commit.

Because it is one commit per week with a written rationale, any week's
interpretation can be undone with `git revert` without losing the raw evidence.

### Running it by hand

```powershell
# real run
powershell -ExecutionPolicy Bypass -File scripts\weekly-update.ps1

# see what it would change, without committing or pushing
powershell -ExecutionPolicy Bypass -File scripts\weekly-update.ps1 -DryRun
```

Logs land in `logs/` (gitignored, last 12 kept).

### If a week is missed

Nothing is lost. The watermark only advances on a successful run, so the next
run simply covers a wider window. A failed run deliberately leaves the repo
untouched — advancing the watermark past unread messages is the one
unrecoverable failure, so the runner is built to avoid exactly that.

## Scope guarantees

- **Channels only.** No DMs are ever read or stored.
- Financial/pricing/HR-sensitive content is filtered out.
- Binary attachments (images, PDFs, CAD) are referenced by filename only — never
  opened, so never described.
- **Name collision:** "Benjamin Ang Zi Jian" (`U02E5QUGGNL`) is a different
  person from Benjamin Chay (`U01BJHTFR70`). Attribution is by user ID only.
