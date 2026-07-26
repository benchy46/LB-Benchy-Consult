# The prompt to send a new collaborator

Send them the block below. They fill in the three `<...>` placeholders and paste
it into Claude Code. Add them to the repo as a collaborator first, or step 0
fails.

---

```text
I want you to build a "consult as me" Claude skill: a persona backed by my real
Slack history that answers engineering and process questions the way I actually
decide, and refreshes itself from Slack every week without me doing anything.

This has already been built for a colleague in the repo below, and there is a
written procedure for adding a second person. Follow it rather than inventing
your own approach — it encodes several traps that already cost time.

Repo:  https://github.com/benchy46/LB-Benchy-Consult   (I have collaborator access)
Me:    <MY FULL NAME EXACTLY AS IT APPEARS IN SLACK>

Seed from these channels:
<PASTE YOUR CHANNEL LIST, ONE PER LINE>

Do this:

0. Check prerequisites before any real work, and stop and tell me if any is
   missing: the Slack MCP is connected AND authenticated (prove it with a real
   call, not by reading config), the `claude` CLI is on PATH, and I can push to
   the repo. Also tell me roughly what the seed will cost in time and tokens
   before you start it — reading a couple of years of Slack is not cheap.

1. Clone the repo and read `docs/ADD-A-PERSON.md` in full. Follow it. Read
   `.claude/skills/consult-as-benjamin/SKILL.md` and
   `.claude/skills/update-benjamin-kb/SKILL.md` as the reference implementation.

2. Do not modify anything belonging to the existing person: nothing under
   `consult-as-benjamin/` or `update-benjamin-kb/`, and not `STATE.json` or
   `scripts/weekly-update.ps1`. Those are live and scheduled. Everything you
   create is suffixed with my name.

3. Hold these scope rules absolutely: channels only and never DMs; no
   financial, pricing or HR detail; attachments referenced by filename only
   since you cannot read them; and never invent a quote, date or decision. If a
   channel has little of me in it, record that honestly instead of padding it.

4. Match the register section of the skill to how I actually write, not how the
   existing persona writes. That part must not be copied.

5. Work on a branch `add-<my-name>` and open a PR when the seed is done. Do not
   push the initial dump straight to main.

6. Set up my weekly refresh on my own machine, on a different weekday or hour
   from the existing job so our pushes don't collide. Then prove it works with
   a dry run and show me the log — I want to see it complete, not just that it
   was scheduled.

Ask me anything you genuinely need before starting, but don't ask me to make
choices the procedure already makes.
```

---

## What to tell them out of band

- Roughly how far back to go. The existing persona used two years.
- Whether any channel on their list is sensitive enough to leave out. Easier to
  decide up front than to scrub afterwards.
- That the seed is the expensive part and only happens once; weekly runs after
  that are small.
