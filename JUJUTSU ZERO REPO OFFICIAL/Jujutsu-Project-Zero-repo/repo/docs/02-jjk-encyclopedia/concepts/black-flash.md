# Black Flash

Status: DRAFT (contains manga spoilers)
Purpose: Canon basis and game adaptation for Black Flash.
Last reviewed: 2026-11-22
Sources: J18, J21, J22, J23, J26
Related: [[cursed-techniques]], ../../01-reference-games/jujutsu-infinite, ../../03-combat/README

## Canon basis
| Claim | Label | Source |
|---|---|---|
| Black Flash is introduced when Aoi Todo tells Yuji to unleash it during the fight against Hanami, saying it will make him stronger than ever | `CANON-MANGA (reported)` | J18 |
| Gojo states that Black Flash does not depend completely on total CE output, but more on luck; no one can know when one will occur | `CANON-MANGA (reported, ch.256)` | J23, J21 |
| Nobara and Yuji each hit the death-painting brothers with Black Flashes | `CANON-MANGA (reported)` | J23 |
| Sukuna's first Black Flash hit on Maki (after her return) is described as kick-starting his technique Dismantle | `CANON-MANGA (reported)` | J23 |
| ⚠ Yuji hits Sukuna with seven consecutive Black Flashes | `CANON-MANGA (reported, ch.257)` ⚠ MANGA-SPOILER | J22, J23 |
| ⚠ A sorcerer reportedly enters an "awakened state" after Black Flash(es): Yuji awakens a second technique, Sukuna kick-starts RCT and Dismantle, Gojo reaches an awakened state | `CANON-MANGA (reported)`; the Gojo detail comes from a fan translation, `UNVERIFIED` | J22, J23, J26 |
| ⚠ Yuji's seven Black Flashes struck the boundary of Megumi's and Sukuna's souls, costing Sukuna the chance to restore RCT; Sukuna reproduces Malevolent Shrine without reduced output using uncertain components and impromptu binding vows | `UNVERIFIED` (fan translation, narrator summary) | J26 |

## Not yet researched
Exact mechanical description (timing of CE impact, damage multiplier reported in the work); how it is triggered; chain/streak rules; who can use it beyond named examples.

## Game adaptation (GAME-ORIGINAL proposal)
| Design | Notes |
|---|---|
| Skill-expression window | Landing a hit inside a narrow timing window of a combo chain grants a Black Flash (not a screen prompt; see comparison takeaway T8) |
| Reward | Damage spike, brief mastery boost, and increased technique output for a short "Flow state" |
| Luck vs skill | Canon says luck; game uses a skill-weighted chance with visible streak feedback |
| Streaks | Consecutive Black Flashes increase a "Zone" meter; a streak cap prevents infinite loops |
| Awakening link | High streak count can unlock a once-per-match technique awakening (docs/08) |
Reference games gate Black Flash behind a skill tree and a resource (REPORTED; see [[../../01-reference-games/jujutsu-infinite]]); our proposal is skill-weighted.

## Implementation notes
Server rolls/validates the window from its own attack timing; client only shows the cue.

## Testing criteria
- [ ] A scripted perfect-timing chain triggers a Black Flash deterministically; off-timing never does.
- [ ] Streak counter resets on whiff, block or taking a hit.

## Open questions
- Verify the chapter 256/257 claims and the damage description in the manga.
