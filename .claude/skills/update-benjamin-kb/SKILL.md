---
name: update-benjamin-kb
description: Weekly incremental refresh of the consult-as-benjamin knowledge base from new Slack activity. Use when running the scheduled update, when asked to refresh/update the Benjamin knowledge base, or to backfill a missed week. Pulls only messages newer than the STATE.json watermark, folds them into the channel extracts, detects genuine evolution in his judgment or communication style, and updates principles.md and the consult skill accordingly.
---

# Update the Benjamin knowledge base

Incremental, evidence-first refresh. Run from the repo root. Everything here is
relative to the repo root unless stated otherwise.

Paths:
- Watermark: `STATE.json`
- Knowledge base: `.claude/skills/consult-as-benjamin/knowledge-base/`
- Consult skill: `.claude/skills/consult-as-benjamin/SKILL.md`
- Run log: `CHANGELOG.md`

Benjamin Chay's Slack user ID is `U01BJHTFR70`. That ID — never a name string —
is the only reliable way to identify him.

## Hard guardrails (violating any of these corrupts the knowledge base)

1. **Channels only, never DMs.** Every search MUST pass
   `channel_types="public_channel,private_channel"`. Never `im`, never `mpim`.
   The knowledge base's scope guarantee is that no private 1:1 content is in it.
2. **Never fabricate.** If you did not read a message, it does not go in. Do not
   invent a quote, a date, or a decision to round out a narrative. An empty week
   is a perfectly valid outcome — write "no substantive activity" and stop.
3. **Name collision.** "Benjamin Ang Zi Jian" (`U02E5QUGGNL`) is a different
   person. Attribute by user ID only. Never fold his words into Benjamin Chay's.
4. **Filter out** financial/pricing/invoice detail, HR-sensitive material, and
   anything personal about a named third party. Reference binary attachments by
   filename only — you cannot read them, so never describe their contents.
5. **Never delete existing evidence.** This is an append-and-annotate history.
   Superseded patterns get dated and marked, not removed (see Evolution below).

## Procedure

### 1. Establish the window

Read `STATE.json` → `watermark_date`. Search from **one day before** it and
dedupe by timestamp; `after:` boundary behaviour is inclusive-ish and a one-day
overlap is far cheaper than a silent gap.

### 2. Pull his new messages

```
slack_search_public_and_private(
  query = "from:<@U01BJHTFR70> after:<watermark minus 1 day>",
  channel_types = "public_channel,private_channel",
  sort = "timestamp", sort_dir = "asc",
  include_context = false, response_format = "concise", limit = 20)
```

Page through with `cursor` until exhausted. Expect roughly 30–60 messages a
week; if you see far more, still page to the end, but summarise more tightly.

Group the results by channel. For any message that looks substantive — a
decision, a rationale, a spec number, a pushback, a standard being set — call
`slack_read_thread` on its thread to get the surrounding context, because his
one-line replies are frequently only meaningful against the question asked.
Skip pure logistics ("Meeting room", "on leave today") for the channel files,
but do keep them in mind for the communication-register read in step 4.

### 3. Fold into the channel extracts

For each channel with substantive new content:

- **Existing file** in `knowledge-base/channels/<channel>.md` — append to the
  relevant sections (Decisions & Reasoning / Notable Exchanges / Recurring
  Themes / Referenced Files) in the file's existing template. Date every new
  entry `[YYYY-MM-DD]` so the timeline stays legible.
- **New channel** — create `knowledge-base/channels/<channel>.md` following the
  same template as the existing files (read a rich one such as
  `s3-handlebar.md` first to match structure and tone), then add a row to the
  substantiveness table in `knowledge-base/index.md`.

New channels are expected and important: the original 50-channel sweep already
missed active ones (`r5-development`, `r5-mech-architecture`,
`internal_product_mech`, `r5-selfcleaning-squeegee` were all absent). Never
assume the channel list is closed.

### 4. Evolution analysis — the point of this whole job

Read `knowledge-base/principles.md`. For each new piece of evidence, classify it
against what is already documented:

| Class | Meaning | Action |
|---|---|---|
| **REINFORCES** | Same pattern, new instance | Add the citation only if the existing principle is thinly evidenced. Do not pad. |
| **REFINES** | Pattern holds but scope/nuance shifts | Edit the principle in place to state the sharper boundary; cite both old and new. |
| **EVOLVES** | He now does the opposite, or differently, than the older evidence | Keep the old text, mark it `*(through <date>)*`, and add the new behaviour as `*(from <date>)*`. This is the signal the user most wants captured — do not smooth it away. |
| **NEW** | A pattern with no existing counterpart | Add it under the best-fitting of the seven sections, with at least one dated quote. |

Be conservative. One offhand message is not an evolution. Require either a
repeated pattern across the window, or a single unambiguous explicit statement
("from now on we do X"). When in doubt, record the evidence in the channel file
and leave `principles.md` alone — the channel files are the evidence layer and
lose nothing by waiting for the pattern to confirm itself.

Pay specific attention to **communication style drift**, since that is the
hardest thing to notice and the thing this repo exists to track: register
changes (terser/warmer/more formal), new recurring phrasings, shifts in how he
opens or closes a thread, changes in how he delivers pushback or bad news, new
habits like standardising on forms/templates instead of ad-hoc asks, emoji and
humour patterns, and whether he is delegating where he used to decide directly.

### 5. Update the consult skill if warranted

If — and only if — step 4 produced a REFINES/EVOLVES/NEW finding that changes
how the persona should actually answer, edit
`.claude/skills/consult-as-benjamin/SKILL.md`. Two sections go stale:

- **`## 5. His register`** — the bullets describing how he decides and how he
  talks. This is the usual place a style evolution lands.
- **`## 2. Open with intake`** — the scoping questions. If the evidence shows
  the questions he actually asks first have shifted (a new standing concern, a
  constraint he now always checks), update that list.

Keep both tight; the file loads into context on every consult, so length is a
real cost. Most weeks this file should not change at all.

### 6. Record and commit

**Empty window? Stop here.** If no channel file changed and no principle was
classified — because there were no new messages, or every hit was already
captured — then write **no** `CHANGELOG.md` entry, make **no** commit, and leave
`STATE.json` alone. Report "empty window, nothing to record" and finish. Quiet
weeks are normal, and a changelog that logs its own idleness buries the entries
that matter. The run log in `logs/` is the record that the job fired.

Otherwise, prepend an entry to `CHANGELOG.md`:

```markdown
## <YYYY-MM-DD> — window <start> to <end>

- **Messages reviewed:** N across M channels
- **Channels updated:** ...
- **New channels added:** ... (or none)
- **Principles changed:** REFINES/EVOLVES/NEW items, one line each, with the
  evidence date — or "none; evidence recorded in channel files only"
- **Consult skill changed:** yes (what) / no
```

Then update `STATE.json`: set `watermark_date` to the date of the newest message
actually processed (not today's date — if the newest message is Thursday, the
watermark is Thursday, so Friday's messages are not skipped), bump `runs`, and
set `last_run_utc`.

Commit everything as one commit:

```
git add -A
git commit -m "kb: weekly update <window start>..<window end>"
git push origin main
```

If `git push` is rejected because the remote moved, `git pull --rebase origin main`
and push again. If the rebase conflicts, stop and leave the work committed
locally — do not force-push; the runner will surface it in the log.

## Failure behaviour

If the Slack MCP is unavailable or unauthenticated, do **not** advance the
watermark, do **not** commit, and do **not** write a `CHANGELOG.md` entry —
leave the repo untouched and state plainly in your final message that the run
failed and why. A skipped week self-heals, because the watermark is
untouched and the next run simply covers a two-week window. Silently advancing
the watermark past unread messages is the one unrecoverable failure.
