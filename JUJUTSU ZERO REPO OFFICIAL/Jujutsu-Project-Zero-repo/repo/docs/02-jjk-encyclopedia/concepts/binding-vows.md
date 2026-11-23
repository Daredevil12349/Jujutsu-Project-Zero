# Binding vows and Heavenly Restriction

Status: DRAFT (two concepts, linked; contains manga spoilers)
Purpose: Canon basis and game adaptation for binding vows, plus the Heavenly Restriction path.
Last reviewed: 2026-11-22
Sources: J01 (old revision), J17, J19, J20, J21, J26
Related: [[cursed-energy]], [[reverse-cursed-technique]], ../../08-progression/README

## Binding vows
| Claim | Label | Source |
|---|---|---|
| A binding vow is a deal in which a sorcerer gets something in return for a sacrifice or restriction | `CANON-MANGA (reported)` | J21 |
| Itadori and Sukuna made a vow in chapter 11: Sukuna can say "Enchain" and take control of Itadori's body for one minute | `CANON-MANGA (reported, ch.11)`; the exact terms and the exchange are `UNVERIFIED` (secondary guide) | J20 |
| Chapter 263 introduces two new vows (Yuji's and Todo's) during the fight with Sukuna | `CANON-MANGA (reported, ch.263)` ⚠ MANGA-SPOILER | J19 |
| Impromptu vows are reported being used by Sukuna to reproduce Malevolent Shrine at full output | `UNVERIFIED` (fan translation) ⚠ MANGA-SPOILER | J26 |

Not yet researched: how vows are enforced, penalties for breaking them, vow size/benefit scaling, limits, vows involving techniques ("revealing information" vows), vow chaining.

## Heavenly Restriction
| Claim | Label | Source |
|---|---|---|
| Toji Fushiguro has no CE and is described as nearly invisible to many people because of that | `CANON-MANGA (reported, ch.71, 77)`; old revision | J01 |
| Maki Zen'in and Kokichi Muta (Mechamaru) are Heavenly Restriction users; Mechamaru's is described as another type | `CANON-MANGA (reported)` | J21 |
| Heavenly Restriction is obtained by birth, per the article's reading of lore, so a vow cannot create one; no known metric predicts it | `INTERPRETATION` (article), `UNVERIFIED` against later chapters | J21 |
| ⚠ An article argues honed bodies imply honed souls, explaining unusual resistance to damage | `INTERPRETATION` ⚠ MANGA-SPOILER | J17 |

Not yet researched: formal definition (sacrifice for body/ability trade), physical capabilities in canon, and details of the "types".

## Game adaptation (GAME-ORIGINAL proposal)
### Binding vows
| Mechanic | Proposal |
|---|---|
| Vow slots | A small number of equipped vows per build |
| Structure | Each vow = a **restriction** (visible, enforced by server) and a **benefit** (stat, cost reduction, output) |
| Examples | "Cannot use technique X for 60 s, +Y% damage"; "Cannot block, +Z% mastery gain" (placeholders) |
| Breaking | Vows are enforced by code so they cannot be broken; or optional penalty vows for high risk/reward |
| Unlocks | Tied to mastery nodes and story, not rolls |
### Heavenly Restriction path
| Mechanic | Proposal |
|---|---|
| Origin choice | A distinct character origin (docs/08) with **no CE pool** and a physical-focused kit |
| Trade-off | High physical stats, weapon mastery, soul/body durability; no CE techniques or domain |
| Counterplay | Vulnerable to range pressure, traps, and status effects that bypass physical stats |
| Balance goal | Competitive in PvP without being untouchable by CE builds |

## Implementation notes
Vows and origins are data-driven; the server applies restrictions before any ability check.

## Testing criteria
- [ ] A vow's restriction always blocks the restricted action server-side, regardless of client input.
- [ ] A Heavenly Restriction character never gains CE through any path (unit test).

## Open questions
- Verify vow and HR details in the manga and extend the "not yet researched" lists.
