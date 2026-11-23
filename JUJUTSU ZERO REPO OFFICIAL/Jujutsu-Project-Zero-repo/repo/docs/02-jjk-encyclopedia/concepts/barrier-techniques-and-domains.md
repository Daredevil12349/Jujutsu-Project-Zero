# Barrier techniques and domains

Status: DRAFT (domain clashes, refinement, and per-domain entries not yet researched; contains manga spoilers)
Purpose: Canon basis and game adaptation for Domain Expansion and its counters: Curtain, Simple Domain, Hollow Wicker Basket, Falling Blossom Emotion, Domain Amplification.
Last reviewed: 2026-11-22
Sources: J06, J08, J09, J10, J11, J12, J13, J14, J15, J16
Related: [[cursed-techniques]], [[../../03-combat/README]], [[../../01-reference-games/jujutsu-infinite]]

## Canon basis
### Domain Expansion
| Claim | Label | Source |
|---|---|---|
| A sorcerer imbues their innate technique into a barrier, creating an innate domain that buffs them and gives a **sure-hit** strike | `CANON-MANGA (reported)` | J16 |
| A domain without a complete (closed) barrier lacks the sure-hit effect; Megumi's incomplete Chimera Shadow Garden had none | `CANON-MANGA (reported, ch.171 context)` | J08, J15 |
| A domain can lack the sure-kill element (Higuruma's) | `CANON-MANGA (reported)` | J08 |
| Mahito's Self-Embodiment of Perfection is his domain expansion using Idle Transfiguration | `CANON-MANGA (reported)` | J14 |
| A domain is described as the pinnacle of a sorcerer's technique, guaranteeing hits for techniques activated inside | `INTERPRETATION` (guide wording) | J11 |
### Counters
| Technique | Claim | Label | Source |
|---|---|---|---|
| Simple Domain | A small barrier around the user that neutralizes the sure-hit effect even inside an enemy domain | `CANON-MANGA (reported)` | J08 |
| Simple Domain | Created in the Heian era by Sadatsuna Ashiya as the "domain for the weak"; its prototype was Hollow Wicker Basket | `CANON-MANGA (reported)` | J11 |
| Simple Domain vs Domain Amplification | Simple Domain does not counter the domain's technique directly; it interferes with the barrier to nullify the sure-hit | `INTERPRETATION` (guide) | J08 |
| Hollow Wicker Basket (HWB) | Hand sign: fingers folded between one another with arms extended; forms a spherical, woven-basket shield | `CANON-ANIME/MANGA (reported)` | J09 |
| HWB | Neutralizes a domain's barrier imbued with a technique and nullifies the sure-hit; does not protect from cursed techniques themselves; useless against incomplete and non-lethal domains | `CANON-MANGA (reported)` | J09, J13 |
| HWB users | Reggie Star (ch.171), Sukuna (ch.249 vs Yuta's domain; ch.266), Kashimo | `CANON-MANGA (reported)` | J09, J12, J13 |
| HWB | Weaker outputs than domains that manifest mental images; buys time before being overpowered, but Sukuna offsets this by maintaining the hand signs | `CANON-MANGA (reported, ch.266)` ⚠ MANGA-SPOILER | J12 |
| Falling Blossom Emotion | Created to negate a domain's sure-hit; a secret technique passed down in the three major jujutsu families; user coats themselves in CE; Naobito uses it | `CANON-MANGA (reported)` | J10 |
| Barrier techniques | One guide counts "six" barrier techniques while listing five or fewer names (curtain, domain expansion, simple domain, Domain Amplification / Falling Blossom Emotion, HWB) | `UNVERIFIED` (count inconsistent) | J10 |
| Domain Amplification, Curtain | Listed as techniques in the wiki navigation | `CANON-MANGA (reported)` | J06 |

## Not yet researched
Domain clashes, domain refinement, barrier "size" and durability rules, sure-kill/sure-hit specifics per domain, how a domain "closes", Malevolent Shrine as a domain, Unlimited Void, other canon domains, innate vs. non-innate domain definitions.

## Game adaptation (GAME-ORIGINAL proposal)
| Mechanic | Proposal |
|---|---|
| Domain Expansion | Ultimate move: costs most of a CE bar plus a long cooldown; creates a bounded arena with a guaranteed-hit window for the user's technique, limited duration |
| Closed vs incomplete | A domain cast while stunned or with low CE is **incomplete**: smaller radius, no sure-hit |
| Simple Domain | Defensive CE-costly stance that negates sure-hit but drains CE, cannot be used with offense |
| Hollow Wicker Basket | Held defensive stance (maintain hand signs): negates sure-hit, immobile, drains CE, cannot cast while held |
| Falling Blossom Emotion | Clan-gated active defense that counters sure-hit and attack; also lets the user move |
| Domain clash | Resolved by CE output and refinement stat (design pending); winner's domain persists |
| Counterplay | Break the caster's concentration with a guard-break; leave the arena; cancel with a high-damage burst |
Sure-hit in PvP must never be unavoidable: always expose a counter (Simple Domain, HWB, FBE, leaving range, interrupting the cast).

## Implementation notes
Domain arenas are server-side regions with a hit-validation override; clients render the visuals. Keep a hard cap on active domains per server.

## Testing criteria
- [ ] An incomplete domain never grants sure-hit in a scripted duel.
- [ ] Each counter negates sure-hit and costs CE; none works against an incomplete domain.
- [ ] Domain cannot be stacked beyond the per-server cap.

## Open questions
- Which canon domains get adapted vs invented? Per-domain entries are queued.
