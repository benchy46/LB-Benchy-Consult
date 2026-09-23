# #s3-scm-tooling-discussion
**Slack channel ID:** C0BQ3REAP6J
**Purpose:** R&D ↔ Supply Chain working channel for S3 **injection-mould tooling** — supplier shortlisting, DFM review sequencing, mould-design sign-off and quote comparison. Primary SCM voice is Eric Xie (China side), with Boon Seong and Jean; R&D side is Benjamin Ang Zi Jian and Benjamin Chay.

**Added 2026-09-23.** New channel, not in the original 50-channel seed.

> Pricing, quotation and supplier-selection detail in this channel is filtered out by design; what follows is the process/role content only.

## Decisions & Reasoning (Benjamin)

- **[2026-09-15] Objected to a supply-chain process by naming the concrete dependency it breaks, asked the process owner to solve it, then proposed the smallest fix.** Benjamin Ang (*the other Benjamin* — `U02E5QUGGNL`, not Benjamin Chay) opened by asking whether an injection-moulding supplier shortlist existed yet, "looking to kick off DFM discussions soon and want to loop them in early." Eric Xie replied with a five-step sequence: at least three suppliers for initial DFM; drawings go to supply chain first; supply chain forwards to mould suppliers for DFM analysis; **then** a WeChat group is created where R&D and suppliers finalise the report; then final mould drawings and a multi-supplier price comparison.
  - Benjamin Chay's objection went at the ordering, not the policy: "For DFM related issues, sometimes we will have to enquire with the supplier regarding more complex features, if they have a recommendation on how to DFM the part, or what are their limitations in making a certain feature. **This influences the design, even before we send supply chain the design.** How do we then discuss with a given supplier if the supplier is not even given? Any suggestions?"
  - The argument is a dependency argument. Eric's sequence assumes the design is finished when it reaches supply chain, but DFM feedback is an *input* to the design — a moulder's stated limitations change the geometry before there is a drawing to forward. So a process that gates supplier contact behind a completed drawing makes the one conversation that would have improved the drawing impossible. He does not assert a right to contact suppliers; he states what he would lose and ends on "Any suggestions?", handing the fix back to the person who owns the process.
  - Eric conceded most of it immediately ("You can chat with multiple suppliers in the WeChat group at the same time in the early stages - that won't affect anything"), and Benjamin closed by converting the concession into the single concrete change that delivers it: "Is it possible then to create the Wechat group earlier? That will help with initial discussions also." Eric: "Sure, no problem at all."
  - **The shape is his standard pushback pattern applied across a functional boundary**: blunt on the substance, collegial on the process, ends with a proposed alternative rather than a veto — and the alternative is the *minimum* edit to the other party's plan (move one step earlier) rather than a counter-proposal that replaces it. Note also what he did not do: he did not invoke the 2026-08-26 role boundary (`s3-rnd-scm-approval.md`) or argue about who owns suppliers. He argued only about when the technical conversation can happen, which is squarely the "technical communication" half that ruling left with engineering. — [source](https://lionsbot.slack.com/archives/C0BQ3REAP6J/p1789444044948009)

## Notable Exchanges
- The five-step DFM/tooling sequence Eric Xie laid out on 2026-09-15 is worth retaining as context for any S3 tooling question: ≥3 suppliers at initial DFM → drawings to supply chain → SCM forwards to mould suppliers for DFM report → WeChat group for R&D+supplier finalisation → final mould drawings → SCM compares quotes and picks the supplier and price. Benjamin's amendment moves the WeChat group earlier; the rest stands.

## Recurring Themes / Principles Observed
- **Treats supplier manufacturing knowledge as a design input, not a review gate.** The reason he wants early access is that DFM limitations change geometry, and he says so explicitly.
- **Pushes back on other functions' processes by naming what breaks, not by claiming territory**, and asks them for the remedy before proposing his own.
- **Asks for the smallest possible change to someone else's plan** once they concede the principle.

## Referenced Files (not content-readable)
None in the captured window.

## Coverage note
**Partial, single-thread.** Built 2026-09-23 from Benjamin Chay's two messages in this channel (both 2026-09-15) plus the full surrounding thread. The channel's other traffic — and any history before 2026-09-15 — was not read. Note this channel has heavy participation from **Benjamin Ang Zi Jian**, a different person; the opening message of the captured thread is his, not Benjamin Chay's.
