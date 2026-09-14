# #s3-rnd-scm-approval
**Slack channel ID:** C0BSFELMSLS
**Purpose:** The R&D → Supply Chain approval gate for S3 purchasing — engineers post the parts and quotes they need approved, and SCM (Vignesh, Boon Seong, Jean, Eric Xie, Sunardi Tay) approves, sources, or negotiates. Created shortly before the captured window.

**Added 2026-08-31.** Missed by the initial 50-channel seed.

> **Heavy filtering applies to this channel.** *(Updated 2026-09-14: still true of the channel's traffic overall, but his own contribution is no longer thin — from 2026-09-09 he posts a consistent, price-free change-notification template here several times a week. See the 2026-09-09 → 09-11 entry below.)* Its content is predominantly quotations, prices, requisition links, and supplier negotiation — all of which the knowledge base deliberately excludes. What is recorded below is the process/role content only. Benjamin's three captured messages are almost entirely procurement logistics.

## Decisions & Reasoning (Benjamin)
- **[2026-08-26] Routes S3 handlebar part approvals through this channel and unblocks the sourcing side by wiring people together, not by chasing.** Asked by Vignesh to attach a quotation under time pressure, he supplied it and, in the same minute, asked Boon Seong to "Please help add @Eric To the wechat" — putting the China-side sourcing contact into the supplier group rather than relaying messages himself. Later that day he added the remaining handlebar parts to the same thread for approval. — [source](https://lionsbot.slack.com/archives/C0BSFELMSLS/p1787714474899929?thread_ts=1787629632.463109&cid=C0BSFELMSLS)

- **[2026-09-09 → 09-11] Six change notices in three days, all to one template — and the field that does the work is "what does the supplier have to do".** Every post names the same three recipients (Boon Seong, Eric, Jean), states whether the change is drawing-only or physical, gives the rev transition, links the Drive folder, and then — the load-bearing part — states the supplier action explicitly in both directions:
  - drawing-only, supplier already told: "the supplier has requested to change the coating process from Powder coating to Anodizing. Drawing REV number increased. ONLY drawings changed. Parts updated in google drive. New drawings already sent via wechat to Mark from STON." (six handlebar mount/adapter SKUs, 09-09)
  - physical change, supplier told: "Physical changes to these parts. Drawings and CAD has been updated. Supplier has been notified, and new drawings and CAD sent to STON." (`MNT-0932`/`MNT-0933` X0→X1, 09-10; the same two again X1→X2, 09-11)
  - physical change, **supplier deliberately not told, with the reason**: "NO ACTION to supplier, since file has not been confirmed by SCM in the bom" (`OTH-0128`/`OTH-0129` Left/Right Throat, 09-10)
  - his own drawing defects, found and fixed without prompting: "[MNT-0924-X0] BRUSH DOOR MOUNT drawing did not have a material. Material added and updated in google drive"; same for "[BRS-0069-X0] MAIN BRUSH" (09-10).
  - This channel is where the 2026-08-26 role boundary actually gets lived. SCM ruled that engineers supply drawings and technical communication while SCM owns price; his template carries the drawing change and the supplier contact, and never a number. The day after the last of these he wrote the rule down for everyone else (`s3-mech-architecture.md`, 2026-09-10) — note the order: he ran the practice for a day first, then codified it, the same sequence as the NPPA folder standard (2026-08-13). — [source](https://lionsbot.slack.com/archives/C0BSFELMSLS/p1788937240048139)
  - One small tell of how he writes for skimmers: after posting near-identical notices for the same two part numbers two days running, the second opens "**NOT DUPLICATE MESSAGE**" (09-11). Pre-empting the exact wrong conclusion the reader is about to draw, in the position where they will draw it — the same reflex as "Not a regression from this update" on the Pack-and-Go failure note (`s3-mech-cad-changelog.md`, 2026-08-29).
  - Also worth recording as engineering content rather than procurement: he accepted a **supplier-initiated process change** (powder coating → anodizing across six handlebar parts) and absorbed it as a drawing-REV bump only, and `MNT-0932`/`MNT-0933` moved X0→X1→X2 inside 30 hours — two physical revisions of the same pair of parts in a day and a half, each announced separately rather than batched.

## Notable Exchanges
- **[2026-08-26] A role boundary was set in this thread that constrains how Benjamin can act on supplier pricing from now on.** Asked by SCM to check whether a price was reasonable and negotiate it further, Eric Xie pushed back on the division of labour — "I hope that going forward, the supply chain and suppliers will handle the pricing, and the engineers will just focus on technical communication" — and Sunardi Tay ruled on it: "From now on - R&D will share the engineering drawings - Eric will deal the quotation."
  - **This is other people's decision about Benjamin's role, not his own words**, and he is not captured responding to it. It is recorded because it dates a real constraint: several of his documented supplier behaviours in `principles.md` §5 involve him engaging suppliers directly. As of 2026-08-26, **price** negotiation is formally SCM's, and engineering's contribution is drawings and technical communication. His technical pushback on suppliers (draft angles, insert specs, delivery reliability) is untouched by this.
  - Also visible: Jack Dyer escalating approval latency in-channel ("please approve this ASAP, we need to move on this to get the parts in to check them on the EV02"), i.e. this gate is a real schedule dependency for the S3 build, not a formality.

## Recurring Themes / Principles Observed
- Too little of Benjamin's own voice survives the pricing filter to draw principles from this channel. Its value is contextual: it dates the R&D/SCM pricing boundary, and it shows the approval path S3 hardware purchases actually take.

## Referenced Files (not content-readable)
- Supplier quotation attachment(s) posted by Benjamin, and a Precoro requisition link — contents deliberately not recorded (pricing).

## Coverage note
**Partial, and heavily filtered by design.** Built 2026-08-31 from Benjamin's three messages in the 2026-08-16 → 2026-08-29 window plus surrounding thread context; **extended 2026-09-14** with his six change notices from 2026-09-09 → 09-11, which are the first substantial body of his own voice here. Most channel content is out of scope for this knowledge base.
