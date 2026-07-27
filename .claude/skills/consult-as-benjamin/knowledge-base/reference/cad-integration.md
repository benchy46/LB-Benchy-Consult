# CAD Integration for LionsBot — team standard

**Source:** Notion, "🚧 CAD INTEGRATION for Lionsbot"
(`https://app.notion.com/p/352ca9552bd880a68982cb0b164bf0b2`), under
Homepage → Mechanical Knowledge Wiki. Retrieved 2026-07-26; page content as of
2026-07-20. Derived from a CAD Integration Practices and Standards meeting,
2026-04-30.

**What this is, and how it differs from the rest of the knowledge base.** This
is an authored, prescriptive team standard — "all cad integrators should read
through at least once and understand fully." Everything else in this knowledge
base is *observed* evidence of how Benjamin decides. This is *codified rules he
works to*. When a question touches CAD integration, these are the rules in
force; the channel files remain the evidence for judgement calls the rules don't
cover.

**Two layers, and they conflict in places.** The page body is the curated,
current standard. It carries a meeting summary from 2026-04-30 underneath.
Where they disagree the body wins — it is later and deliberately edited — but
the meeting-only detail is preserved below, marked, because it is often more
specific. Genuine conflicts are flagged inline as **⚠ conflict**.

---

## CAD origin and coordinate system

- Robot origin is always on the **floor**, centred between the two traction
  wheels — the floor plane, *not* axle level.
- **Z = front, X = left, Y = top.** Follow this SolidWorks convention.
- If traction wheel position shifts, the origin must shift with it.
- All sensor positions in the URDF reference this origin.

## File management and version control

- Export checkpoints at key milestones (EV, DV, …) using **Pack and Go** or
  **parasolid**.
- Add a date suffix to exports to avoid filename conflicts. Suffix **must be
  YYMMDD** — 30 July 2026 = `260730`.
  - ⚠ conflict: the meeting summary gives the older, looser form `_30Dec`. The
    body's strict YYMMDD supersedes it.
- Do **not** include suppressed components in exports.
- Saving exports as zip is recommended.
- **Pack and Go** preserves the feature tree and metadata — recommended, but can
  be slower. **Parasolid** saves geometry only.
- *(Meeting only)* M: drive storage can be increased on request — 2 TB recently
  added, ~150 GB remaining at the time.

## File sharing and integration workflow

- Use a Notion page as the exchange point.
- The chassis designer creates a rough model with the correct origin and shares
  it to subsystem designers.
- Subsystem designers (camera mounts, LiDAR mounts, …) receive chassis/tank CAD
  carrying that origin.
- Exporting back: **suppress the chassis/tank and send only the sensor mount,
  in space, on the correct origin.**
  - Export as **parasolid** for initial integration, to dodge complexity issues
    with features and fasteners.
  - Receiver opens the parasolid and **mates it to the origin**.
    *(Meeting adds: and saves as an SMG file.)*
- When a chassis change affects other subsystems, the updated chassis must be
  reshared and the subsystems adjusted.

## Subsystem organization

- The current file structure reflects **design ownership, not assembly
  sequence**.
- It changes when handed to **NPI** for assembly-based organization.
  *(Meeting transcribes this as "MPI" — read as NPI.)*
- Nested subsystems, two workable approaches: one person pulls from both
  sources, or the work chains through one person.
- Avoid overlapping responsibility — the failure mode is multiple people sending
  conflicting versions.

## Part metadata and properties

- Metadata policing begins at **DV/PV** phase.
- Metadata covers material, revision, designer name.
- Revisioning starts only in proper phases, not during early concept work.
- The **Title** field needs special attention.

## Fastener and component standards

- **DIN912 hex socket head** screws are the standard.
- Consolidate fastener sizes to minimise variants.
- **M4/M6** are the common general-purpose sizes.
  - ⚠ conflict: the meeting records only **M4** as the common general-purpose
    size. The body's M4/M6 is current.
- **M2 standardized as M2x6** for TOF sensors, RGB cameras and similar.
- **M4x6 or M4x8** standardized for cable tie mounts.
- *(Meeting only)* **M3** favoured for camera subsystems, to minimise the tools
  an assembler needs.
- *(Meeting only)* **M2.5** used on some LiDAR mountings.
- A unique fastener size forced by an off-the-shelf component can be adopted as
  the priority size for that assembly.
- Standardization review should happen around **DV**, when all components are
  finally visible.
- Fasteners supplied with purchased components are non-changeable and must be
  accommodated.
- **Do not use spring washers — they are useless.**
- **Use flange head screws** rather than a normal head plus washer.
- **Do not use washers** unless absolutely necessary; use flanged heads instead.
- **Do not use nuts** unless absolutely necessary; use **brass inserts and
  threaded holes** instead.
- General fastening torque and Loctite practice lives on a separate linked page
  — captured in full at **`torque-and-loctite.md`** alongside this file.

## Cables, wires and flexible components

- Include **wire CAD models**, especially for sensors with large connectors
  (LiDAR, cameras). Connectors are notorious space hogs and must be modelled.
- Organise a sensor's wire, bracket and **mounting screws into a single
  subassembly** with the camera/sensor. Then changing a mounting screw is one
  subassembly swap that updates everything.
- **Bending radius is critical — physically bend a real wire sample and measure
  it** for the CAD representation. Do not guess it.
- For PCB wiring, use **placeholder extrusions** showing required clearance
  above the board.
- Tubes are modelled in CAD, but **actual length is specified in the BOM**, not
  held as a strict CAD dimension.
- **All cable tie mounts must be in the CAD.**
- Use cable tie mounts **sparingly** — too many are tedious to assemble
  *(meeting adds: and cut assemblers' hands)*.
- **Square holes on metal plates, circular holes on rotomould** for cable ties.

## Static discharge and grounding

- The chassis accumulates static from brush friction with the floor — worse on
  dry vacuum machines.
- **Conductive bristles** discharge static to ground during operation, but
  reduce rather than eliminate buildup.
- A **conductive rubber grounding strap** is an essential backup.
- The grounding strap is a **common part across R5, R3 vac and SC25**.
  - ⚠ conflict: the meeting lists "R5, R5 Bag, and SC-25". The body's
    R5 / R3 vac / SC25 is current.
- Metal is a **reservoir for static charge** — more metal, more potential charge.
- The strap is critical because the robot can end up where bristles can't reach
  ground (elevated access).

## Rotomould tolerances and mounting practice

- General mount tolerance is roughly **1% or more of the hole-to-hole distance**
  for rotomould.
  - ⚠ conflict: the meeting states 1% "relative to **part size**", and frames it
    as *motor* mount tolerance. The body's hole-to-hole basis is current and is
    the more useful rule.
- Small parts around 50 mm may need only **±0.5 mm**.
- *(Meeting only)* For rotomould **M6 screw mounting, use ±2 mm**.
- *(Meeting only)* **Always use a clearance fit** for motor mounting holes, so
  they fit despite manufacturing variation.
- **Datum-hole scheme** for sensor or critical-alignment mounting:
  1. **First hole: tight clearance** (e.g. 4.2 mm for an M4) to constrain
     position.
  2. **Second hole: a slot** to constrain rotation while allowing tolerance
     toward the first hole. **The slot runs along the line from the first tight
     hole to the slot.**
  3. **Remaining holes oversized.**
  - If the datum isn't especially important, one datum hole is enough and the
    rest can be oversized.
- **Long flat rotomould surfaces warp** — use **cooling jigs** for critical
  mounting holes during moulding.

## Design standards and best practice

- **Use whole numbers for critical dimensions** to simplify IQC inspection.
  - If DFM for injection moulding turns a whole number into an awkward one,
    that is acceptable.
- Avoid random decimals like 39.995 — round to clean numbers.
- **Section view mode** is essential for checking internal interferences.
- **Manual interference checking is preferred over automated tools**, because
  some interferences are intentional (rubber grommets, gaskets, …).
- Check the **full range of motion** of every moving part — hatches, doors,
  handlebars.
- Rule of thumb: **10 mm clearance** is a safe buffer for moving parts.
  - ⚠ conflict, and the one most likely to matter: the meeting says **5 mm**.
    The body's 10 mm is current and more conservative.
- **Give more buffer initially as insurance** — easier to reduce later than to
  increase.

## CAD accuracy and component modelling

- Police that **ALL components are in the CAD**, so nothing hides an
  interference.
- Include screws, washers, cable tie mounts and critical mounting hardware.
- E-stop, key switch and similar need **proper connector size representation**.
- **Gaskets are modelled approximately, as extrusions** representing the
  physical form. Gaskets may be supplied as continuous length for cutting, or
  pre-installed by the supplier.
- For PCBs with no 3D model, use extrusions above the board to represent
  connector clearance.

## Design review and quality control

- The CAD integrator's **first priority is subsystem-to-subsystem
  interferences**.
- Also sanity-check interferences *inside* subassemblies where possible.
- Pay particular attention to **mounting feasibility** — can the subassembly
  physically be installed without interference?
- **Check work from people under heavy workload or tight deadlines more
  carefully.** Worked example: a touchscreen mount was found to interfere with
  the touchscreen itself *after* being sent to manufacturing.
- Thorough checking is what avoids manual cutting and rework of parts already
  made.

## Manufacturing considerations and optimisation

- Chassis material is **mild steel, zinc plated, powder coated**. Powder coat
  may chip, but the zinc prevents rust.
- Some chassis designs use **riveted aluminium** for easy modification;
  **riveting gives better consistency than welding**.
- **Threads are shown in CAD as simple holes**, for clarity on supplier
  drawings.
- *(Meeting only)* **Target weight is under 70 kg** — the prototype sat around
  70 kg. Weight reduction improves battery life and gradability, and riveted
  aluminium chassis is the lever if weight becomes a significant concern.

## SolidWorks performance optimisation

- Run **performance evaluation** to find the parts causing slowdowns.
- Check **triangle count and opening time** on imported components.
- Suppress or delete internal geometry that doesn't affect external interfaces.
- Simplify complex purchased parts — save as **dumb solids**, or replace with
  simple boxes.
- Set subassemblies to **"Solve as flexible" only when** you actually need to
  move components in context.

## Open action items (as of the 2026-04-30 meeting)

Recorded as unchecked on the page; status not verified here.

- Team to send parasolid files of all subassemblies for consolidation.
- Standardize fastener sizes across subsystems where possible.
- Add grounding strap to chassis for static discharge.
- Use conductive bristles for static management.
- Run SolidWorks performance evaluation to find problematic parts.
- Export checkpoint versions at key milestones (EV, DV) via Pack and Go with
  date suffixes.
- Request M: drive storage increase if space runs low.
