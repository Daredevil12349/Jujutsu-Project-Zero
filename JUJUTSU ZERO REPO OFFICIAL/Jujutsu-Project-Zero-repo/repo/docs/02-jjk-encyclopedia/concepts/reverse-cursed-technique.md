# Reverse Cursed Technique (RCT)

Status: DRAFT (contains manga spoilers)
Purpose: Canon basis and game adaptation for RCT, the basis of regeneration and the limb-regrowth track.
Last reviewed: 2026-11-22
Sources: J05, J12, J17, J24, J25, J27
Related: [[cursed-energy]], [[heavenly-restriction]], [[../../04-damage-rct/dismemberment-restricted-track]], [[../../05-animation/rct-limb-regrowth]]

## Canon basis
| Claim | Label | Source |
|---|---|---|
| Gojo healed an exhausted innate technique with RCT, which surprised other sorcerers | `CANON-MANGA (reported, ch.227)` | J05 |
| Yuta used RCT to revive Yuji after his "execution" (killing and restarting the heart) | `CANON-MANGA (reported, ch.175, 178)` | J24, J25 |
| Special-grade sorcerers typically can use RCT | `INTERPRETATION` (article generalization) | J27 |
| ⚠ Yuji's consecutive soul-rending strikes could not be healed with RCT | `CANON-MANGA (reported, ch.266)` ⚠ MANGA-SPOILER | J12 |
| ⚠ An article argues RCT acts on the **soul**, matching its inability to heal soul damage and the damage resistance of Heavenly Restriction users ("honed bodies, honed souls") | `INTERPRETATION` (author's reasoning) ⚠ MANGA-SPOILER | J17 |
| ⚠ A source reports Yuji learned RCT during the Shinjuku/Culling-Game period, and a fan translation states a post-Black-Flash Gojo built a "special pathway" for RCT | `CANON-MANGA (reported)`; the translation is `UNVERIFIED` (fan source) | J22, J26 |

## Not yet researched
CE cost of RCT; output-to-positive-energy rules; whether RCT can regrow severed limbs and how fast (needed for the limb-regrowth design); healing others (outputting RCT); limits and exceptions; Sukuna's RCT details.

## Game adaptation (GAME-ORIGINAL proposal)
| Mechanic | Proposal |
|---|---|
| Basic RCT | Channelled heal over time, costs CE per second, interruptible |
| Soul-damage exemption | A damage class ("soul"/"rending") that RCT cannot heal, giving a counter |
| Limb restoration | Staged regrowth of a severed limb (see [[../../04-damage-rct/dismemberment-restricted-track]]), long channel, high CE cost |
| Technique burnout cure | RCT clears technique overheat |
| Mastery | Faster channel, lower cost, reduced interruption vulnerability |
Canon support for limb regrowth rates is **not yet verified**; treat speeds and costs as balance numbers, not lore.

## Implementation notes
Server owns the channel timer and CE drain; damage taken during the channel cancels or reduces the heal per config.

## Testing criteria
- [ ] RCT cannot heal soul-class damage in a scripted test.
- [ ] Interruption at each phase leaves no stuck "healing" state.

## Open questions
- Verify chapter 266 and 227 claims against the manga and fill the "not yet researched" list.
