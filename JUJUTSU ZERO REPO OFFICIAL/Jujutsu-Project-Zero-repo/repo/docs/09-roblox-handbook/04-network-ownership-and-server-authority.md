# 04: Network ownership, movement validation, and the Server Authority model

Status: RESEARCHED, **with a major open decision** (see section 4)
Purpose: How Roblox physics ownership affects cheating, and whether to build combat on Roblox's Server Authority model.
Last reviewed: 2026-11-22
Sources: R04, R02, R10, R11
Related: [[01-remote-validation-and-rate-limiting]], ../03-combat/, ../../TECHNICAL_ARCHITECTURE.md

## 1. Network ownership (OBSERVED in official docs)
- When a client owns network ownership of a part or assembly (including its own character), it has authority over the physics simulation of those objects. By default the server grants ownership of unanchored parts to clients with nearby characters to distribute load. (R04)
- Consequence: a determined exploiter can teleport, fly, change speed, and grab ownership of unanchored parts. Roblox states client-side-only enforcement will eventually be bypassed. (R04, R02)
- Movement validation must account for latency; Roblox says no universal solution exists. Practical advice in the doc: project movement onto planes (e.g. XZ for ground movement) so legitimate vertical movement is not penalized, and consider leaky-bucket accumulators for bursty movement (my reading of the Portuguese-localized snippet; **re-read the English page before implementing**). Games with legitimate teleport mechanics need explicit exemption systems. (R04)
- Critical interactable objects should be anchored, or use the network ownership API (`SetNetworkOwner` / `SetNetworkOwnershipAuto`) with server validation. (R01)

## 2. Server Authority model (OBSERVED, status partly UNVERIFIED)
- Roblox documents a **server authority model** for "responsive cheat-free competitive games such as FPS, racing, sports, and combat". The server is the single source of truth; clients report only inputs. Clients **predict** the effects of their inputs, and the client can **roll back and resimulate** on misprediction. (R10)
- Opt-in: set `Workspace.AuthorityMode` to `Server`, which automatically sets prerequisite Workspace properties. Core simulation code must be bound through `RunService:BindToSimulation()`; docs say not to use traditional input events such as `UserInputService.InputBegan` in the core simulation. `time()` is fixed-step and synchronized in this mode. (R10)
- Misprediction is described as normal and expected, especially with other players' actions. (R10)
- Documented limitations seen: "Tools aren't fully supported" (R10 snippet, date unknown). A Roblox announcement for an earlier beta stage listed a **limit of 8 concurrent animation tracks per Animator** and a required adaptation of the default Animate script (R11, announcement about 257 days before 2026-11-22; **may be out of date**).
- Release stage: the network-ownership page (updated 2026-07-10) says Server Authority is "currently in beta and will be released soon" (R04); a Client Beta announcement is about 205 days old (R11). **Current general-availability status as of 2026-11-22: UNVERIFIED.**

## 3. Implications for this project
| Option | Pros | Cons / risks |
|---|---|---|
| **A. Classic**: server-validated intent remotes, server hit detection, client-side prediction for visuals only | Mature, widely understood, works with all current features | You must build your own latency compensation; character movement is still client-owned unless validated |
| **B. Server Authority model** | Engine-level prediction, rollback, and server-owned movement; designed for combat games; better cheat resistance | Beta/maturity unverified; changes how input, animation, and tools work; may constrain animation (track limit), Tools, and Team Create (beta notes said Team Create/Team Test did not work correctly: R11, may be outdated) |
| **C. Hybrid**: start with A behind an abstraction (`Input -> Intent -> Server`), keep B possible | Preserves the first-milestone timeline | Requires discipline in the Net layer |

RECOMMENDATION: start with **C** (architecture ready for B, implementation A) **unless** you decide Server Authority is stable enough, which needs a spike (below).

## 4. DECISION (2026-11-22): Option C, hybrid, chosen by project owner
Build classic server-validated intent remotes now. Keep the input layer abstract (`Input -> Intent -> Net -> Server`) so a later migration to Server Authority replaces only the Input/Net layers. The questions below are retained for the spike.

### Original questions
1. Do you want to commit to Server Authority for PvP, or start classic and migrate later?
2. Are you comfortable with beta risk (Team Create limits, animation limits) in exchange for built-in prediction/rollback?

## 5. Spike plan (do before committing; each item produces a measured result)
- [ ] Read the full, current `server-authority` and `server-authority/techniques` pages; log date and status in RESEARCH_SOURCES.md.
- [ ] Build a 1-attack dummy duel under `AuthorityMode = Server` and note animation, Humanoid, Tools, and mobile behavior.
- [ ] Record the current concurrent-animation-track limit.
- [ ] Decide and record in TECHNICAL_ARCHITECTURE.md Decision log.

## Testing criteria
- [ ] Teleport a test client's character 200 studs: server detects or corrects it.
- [ ] Fly/speed exploit simulation: server rejects or corrects within a documented tolerance.
- [ ] Anchored vs unanchored interactable test per section 1.

## Open questions
- GA status and recommended production use of Server Authority today.
- Interaction between Server Authority and the planned over-the-shoulder camera and dash movement.
