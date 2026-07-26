# Knowledge base changelog

One entry per weekly refresh that actually changed something, newest first. Each
entry corresponds to exactly one commit, so any week's interpretation can be
reverted in isolation with `git revert`. Empty windows are deliberately not
recorded here — `logs/` is the record that the job fired.

## 2026-07-26 — initial seed

- **Messages reviewed:** two years of history (2024-07-26 → 2026-07-26)
- **Channels:** 50, extracted in parallel into `channels/*.md`
- **Principles:** initial synthesis across seven sections
- **Automation:** weekly incremental refresh installed (see `README.md`)
- **Validation:** two dry runs on the seed date confirmed the pipeline
  end-to-end against an empty window. Both correctly found the only in-window
  messages already captured and changed nothing. They also established that
  Slack's `after:` filter is **exclusive** of the named date, which is why the
  updater searches from `watermark − 1 day` and dedupes — that overlap is what
  makes a gap impossible.
