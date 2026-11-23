# Reference: Jujutsu Infinite

Status: RESEARCHED-SECONDARY (no first-hand play; every claim below is REPORTED unless marked otherwise)
Purpose: What to study and what to improve on, based on published guides.
Last reviewed: 2026-11-22
Sources: G01 to G11 in ../../RESEARCH_SOURCES.md
Related: [[comparison-and-takeaways]], [[OBSERVATION_PROTOCOL]], ../08-progression/

> Label key: `REPORTED (Gnn)` = third-party guide/news/wiki; `RECOMMENDATION` = our design advice; `UNVERIFIED` = conflicting or undated. **OBSERVED (first-hand) entries: none yet.** The owner should fill them in using [[OBSERVATION_PROTOCOL]].

## 1. Gameplay loop (REPORTED)
- Players roll (spin) for **Innate Techniques** in Main Menu > Customize; each spin rerolls the technique in the selected innate slot (G03, G05).
- Techniques are leveled through **mastery**, which unlocks additional skills; mastery progress is reported to be kept if you reroll that technique (G03, G04).
- Spins come from daily quests (reported ~90/day if done off cooldown), codes, an AFK area (reported 1 per 20 minutes), and daily login rewards (G03).
- Other systems mentioned: stat/skill trees (Technique, Focus, and others), crafting, gear/weapons/armor, bosses, awakenings, cursed energy natures, an AFK room (G03, G10).

## 2. Combat and movement (REPORTED, PC keybinds as published by Destructoid/ProGameGuides, G09)
| Action | Key |
|---|---|
| Basic attack (M1 chain) | Mouse 1 |
| Heavy attack | R |
| Block | F |
| Dash / air dash | Q |
| Rush (holdable; used for flight-like air travel with dash recharge) | E |
| Vent (reported as combo break) | H |
| Chant / Black Flash prompt (requires ShiftLock) | Mouse 2 |
| Sprint toggle | Left Ctrl |
Controller mappings exist for PlayStation and Xbox (G09).

### Black Flash (REPORTED, G10)
- Unlocked via the first node ("Focus Awaken") of the Focus skill tree, reported cost 2 stat points.
- Trigger: press M2 to show a prompt (described as a blue square or diamond), then press R (heavy) or a compatible skill key before the prompt disappears.
- Consumes Focus resource (some guides say tokens, up to 5; another says a Focus bar that fills passively during combat and hits). **Conflict between guides: UNVERIFIED which is current.**
- Only certain moves are compatible ("Strength" moves and weapon abilities).
- A reported Legendary Awakening ("Black Flash Arms") adds +8% Black Flash damage and changes the aura look (10% roll chance reported).

### Chanting (REPORTED, G10)
Requires nodes in both the Technique tree (Chanting) and Focus tree (Focus Awaken); "drastically boosts" innate techniques.

## 3. Techniques, rarity and odds (REPORTED, with conflicts flagged)
- Rarity tiers reported: Common, Uncommon, Rare, Legendary, Special Grade (G01, PvP tier list).
- Technique count varies by article date: 17 (G01), 19 (an older 2024-era guide), 23 (G11). **Treat as growing, current count UNVERIFIED.**
- Reported per-spin odds (a community wiki figure relayed by an explainer article, **explicitly not confirmed by the developer**; G05):

| Rarity | Reported chance |
|---|---|
| Common | 70% |
| Uncommon | 20% |
| Rare | 7% |
| Legendary | 2.75% |
| Special Grade | 0.25% (reported cumulative for seven Special Grade techniques, G02) |
Sum = 100.00%, so the set is internally consistent.
- A Special Grade **pity meter** is reported: keep spinning until it fills and the next spin grants a Special Grade (G06).
- Individual figures that look inconsistent: one guide gives Star Rage a 0.25% chance (G07) while another says the seven Special Grade techniques share 0.25% total (G02). **Conflict, UNVERIFIED.** A guide gives Blazing Courage 10% (G08); that matches an Uncommon pool of two techniques (20% / 2), which is my arithmetic inference, not a source statement.
- Domain Expansions reported only for Legendary and Special Grade innates; more than one Domain/Maximum Technique can reportedly be equipped (G03, G04).
- Techniques reportedly cannot be traded; spinning is the only way to change technique (G03).
- A guide notes a spun technique's effects are not shown until activated (Beebom, in G11).

## 4. PvP (REPORTED)
- PvP modes exist; community tier lists exist for PvP (G01 PvP list). Tier lists are subjective opinion pieces; not used as balance data.
- Reported mechanical identities: Soul Manipulation specializes in guard breaks and stacks (G02); Infinity is described as AoE-strong; Demon Vessel scales with Technique stat.

## 5. Strengths, weaknesses, opportunities
| | Assessment | Basis |
|---|---|---|
| Strength | Large technique variety with distinct rarity tiers, mastery depth per technique, and gear/stat trees | REPORTED (G01 to G04) |
| Strength | Controller mappings published; timing-prompt Black Flash is easy to teach | REPORTED (G09, G10) |
| Weakness | Technique acquisition reads as **single-path rolling** (spin only, no trading) | REPORTED (G03) |
| Weakness | Spun techniques are opaque until used | REPORTED (G11/Beebom) |
| Weakness | Published odds are community-sourced, not developer-confirmed | REPORTED (G05) |
| Study | Mastery persisting through rerolls (soft duplicate compensation) | REPORTED (G03, G04) |
| Study | Resource-gated, prompt-based Black Flash and chanting as risk/reward layers | REPORTED (G10) |
| Opportunity (RECOMMENDATION) | Offer technique **previews/trials** before commitment, plus multiple acquisition paths and transparent in-game odds | design |
| Opportunity (RECOMMENDATION) | Make Black Flash a rhythm outcome of landing a chain rather than a screen prompt, so skill expression is in the chain, not a reaction pop-up | design |

## Implementation notes
Not applicable (reference doc). Takeaways feed `docs/08-progression/` and `docs/03-combat/`.

## Testing criteria (for this doc)
- [ ] Owner completes an observation session; observed facts added with `OBSERVED` and date.
- [ ] Re-verify odds and technique count in-game before citing any number externally.

## Open questions
- Do in-game odds displays exist today? Do paid products affect rolls? (UNVERIFIED; the one article claiming nothing is paywalled is G-news opinion, not a store audit.)
