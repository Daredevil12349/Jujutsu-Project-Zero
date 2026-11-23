# Dismemberment and limb-regrowth: Restricted-content track

Status: DRAFT, **FUTURE PHASE (project owner confirmed: planned for the final game, not the first milestones)**
Purpose: Capture the owner's plan for dismemberment (Sukuna-style cutting techniques, sharp Idle Transfiguration variants) with RCT limb regrowth, and the Roblox policy constraints that decide how it can ship.
Last reviewed: 2026-11-22
Sources: P01 to P06 (policy), E01 (mesh tech), see ../../RESEARCH_SOURCES.md
Related: [[../09-roblox-handbook/06-ragdoll-physics-study]], [[../09-roblox-handbook/07-mesh-slicing-study]], [[../05-animation/rct-limb-regrowth]], ../../MASTER_GAME_DESIGN.md

## 1. What the owner wants (stated)
- Dismemberment as part of the eventual game, tied to **Sukuna-style techniques and weapons** and **sharp variants of Idle Transfiguration**.
- Animations where limbs **regrow via RCT**.
- Physics studies for **ragdolls and mesh slashing**, with AKAYUKI: Steel Blossoms Red as a reference (see ../01-reference-games/akayuki-steel-blossoms-red.md).
- Labels: `GAME-ORIGINAL` (design); canon basis for each technique is deferred to the Part 2 encyclopedia and is currently `UNVERIFIED` here.

## 2. Roblox policy facts (OBSERVED in official pages via search excerpts, 2026-11-22; read the full pages before any decision)
| Fact | Source |
|---|---|
| Content-maturity docs describe a **Restricted** label for "graphic and realistic-looking depictions of violence and/or death", and their examples explicitly include **dismemberment**, mutilation, and severed/severing of body parts. | P02 |
| **Moderate** means non-graphic, realistic-looking violence/injury; the DevForum guidance says violence is Moderate if consequences are realistic *and* non-graphic. | P02, P06 |
| Community Standards say extreme violence and "realistic or real-world depictions of extreme gore, graphic violence, or death" are not allowed (outside what Restricted policy permits). | P01 |
| You must disclose violence and blood in the Maturity & Compliance questionnaire **including within any asset type**, and specify blood realism, intensity and frequency. | P03 |
| A Restricted label makes servers restart to remove everyone except age-verified 18+ players, and removes non-verified creators from collaboration sessions. | P03 |
| Restricted experiences are only available to age-checked adults. Sources disagree on the threshold wording (**17+** in a 2025 safety announcement, **18+** in the help-center label page). **UNVERIFIED which is current.** They are not playable, visible in top charts, or recommended to users who are not verified. | P04, P05 |
| All content is also subject to the separate **Restricted Content Policy Standards**; I have not read that page. | P01 |

### What this means
1. Dismemberment is **not** a stylization question that can be dodged with color or "temporary" effects; Roblox's own examples put it in the Restricted tier. (Matches the project rule in PROJECT_RULES.md.)
2. A Restricted label limits audience (verified adults only), discoverability, and likely monetization reach. That is a business trade-off for the owner.
3. Because violence/blood must be disclosed "including within any asset type", shipping dismemberment meshes, effects or code paths inside the **main** experience risks labeling the whole experience Restricted. (Inference from P03; UNVERIFIED how enforcement treats dormant assets.)

## 3. Architecture decision (RECOMMENDATION, logged in TECHNICAL_ARCHITECTURE.md)
Use a **Presentation Profile** abstraction so gameplay never depends on gore:

| Tier | Name | Visuals | Where it ships |
|---|---|---|---|
| 0 | Stylized (default) | Cursed-energy flashes, energy-dissolve, color shift, hit-stop, no blood, limbs never separate | Main experience |
| 1 | Stylized injury | Cracks/cuts rendered as energy lines, limb "disabled" pose, non-graphic | Main experience (confirm rating via questionnaire) |
| 2 | Restricted dismemberment | Visible limb separation + regrowth | **Separate Restricted experience only** (own place/universe, own rating) |

Rules:
- **Gameplay state is identical across tiers.** The server tracks limb state (section 4) and emits an *injury event*; the client's presentation profile decides what it looks like.
- Tier 2 meshes, particle assets, animations, and the code that spawns them live **only** in the Restricted project. The shared core is the same repo, built with a feature flag.
- Single-experience runtime toggling is **not recommended**: a Restricted label applies to the experience, and its servers restart to exclude non-verified users (P03). Whether any per-server or per-player toggle is permitted is **UNVERIFIED**; ask Roblox support/Creator docs before attempting.
- Before any Tier 2 work: read the Restricted Content Policy Standards in full, complete the questionnaire honestly, and do an IP review (JJK is third-party IP; no legal review done: see ASSET_LICENSING.md).

## 4. Gameplay model for limb injury (GAME-ORIGINAL, works at every tier)
Per limb (`LeftArm`, `RightArm`, `LeftLeg`, `RightLeg`; head/torso excluded from severing by design) the server holds:

```
Intact -> Wounded -> Severed -> Regrowing -> Restored (= Intact)
```
| State | Gameplay effect (placeholders; tune in playtest) |
|---|---|
| Wounded | Reduced output of moves using that limb; bleed-equivalent is a CE drain, not graphic |
| Severed | Moves needing that limb are locked; balance/movement penalties for legs; weapon dropped for arm loss |
| Regrowing | RCT channel in progress: costs CE per second, vulnerable, interruptible |
| Restored | Limb returns at partial integrity (brief weakness window) |

Design rules:
- **Severing requires a cause the opponent can read**: telegraphed slash or a bound condition (e.g. a low-integrity limb hit by a Cleave-class attack), never a random proc.
- **Counterplay**: dodge, block, parry, break the technique, or protect the limb with reinforcement.
- **Healing interruption**: damage to the channeling character or a guard break cancels regrowth; CE cost and cooldown prevent permanent immortality.
- **Fairness**: limb loss is a comeback-prevention tool only if the loser keeps agency; cap the number of simultaneous severed limbs and give a "last stand" window.
- Heavy limb states must be cheap to replicate: send an enum per limb, not meshes.

## 5. Technique families (design; canon notes deferred)
| Family | Intent | Notes |
|---|---|---|
| Cutting techniques (Dismantle-style, Cleave-style) | Multi-slash, area slash, adaptive cut | Distinct hitbox shapes, ranges, startup/recovery documented in docs/07; canon basis `UNVERIFIED` until Part 2 |
| Sharp Idle Transfiguration variants | Soul/body-reshaping attack that wounds or severs on contact windows | `GAME-ORIGINAL` adaptation; keep clearly labeled as non-canon |
| Weapons | Blades with distinct arcs and reach classes | docs/03 weapon combat |
Every entry uses `templates/technique.md` and must define Tier 0/1/2 presentation.

## 6. Regrowth presentation (see ../05-animation/rct-limb-regrowth.md)
Tier 0/1: energy-weave reconstitution of a "disabled" limb. Tier 2: staged regrowth. Both share the same timing so server logic and audio cues are identical.

## Implementation notes
- Build the limb-state machine and presentation-profile interface first with Tier 0 visuals only; it is testable without any policy exposure.
- Keep a `ContentProfile` constant in config; Tier 2 is compiled/enabled only in the Restricted project.

## Testing criteria
- [ ] Server limb-state transitions unit-tested (every legal and illegal transition).
- [ ] Identical gameplay outcomes with Tier 0 and Tier 1 profiles in a scripted duel replay.
- [ ] No Tier 2 asset or script exists in the main project (repo check in CI).
- [ ] Regrowth interruption by damage, guard break and death works and cleans up state.

## Open questions
- Current Restricted Content Policy limits on dismemberment depictions and on blood realism.
- 17+ vs 18+ threshold; revenue/discoverability impact; whether a separate universe is the right container.
- Whether to build Tier 2 at all after the main game is live.
