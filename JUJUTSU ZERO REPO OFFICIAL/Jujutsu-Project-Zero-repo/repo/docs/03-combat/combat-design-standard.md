# Combat Design Standard

Status: DRAFT — DESIGN BASELINE, NOT IMPLEMENTED
Purpose: Define the feel, rules, readability, and engineering expectations for the game's R6 melee, cursed-energy, weapon, and technique combat.
Last reviewed: 2026-11-23
Sources: Owner vision; design recommendations; see [[../01-reference-games/vv-ultimatum-design-takeaways]] and [[../../RESEARCH_SOURCES]]
Related: [[README]], [[../04-damage-rct/injury-rct-and-rct-gameplay]], [[../05-animation/README]], [[../../TECHNICAL_ARCHITECTURE]], [[../../FEATURE_STATUS]]

## 1. Combat identity

The target is a deliberate, high-stakes sorcery action RPG: readable like a fighting game, expressive like an anime duel, and demanding like a Soulslike. Use the R6 rig as a deliberate visual language: compact silhouettes, strong pose changes, clear weapon arcs, expressive torso/hip rotation, and bespoke animation rather than relying on extra limb joints.

The player should feel that every committed action has weight. The game must not become a mash-M1 race, a parry-only rhythm test, or a cooldown-button simulator.

Core promise: **read the opponent, choose a response, commit with intent, and earn a punish.**

## 2. The combat loop

1. **Observe:** identify stance, range, weapon, CE aura, technique tells, and opponent habits.
2. **Probe:** use movement, safe light attacks, feints where supported, or low-commitment tools to test defense.
3. **Commit:** choose a string, heavy, weapon art, technique, or approach.
4. **Resolve:** hit, block, parry, dodge, clash, armor trade, or whiff.
5. **Convert:** use a confirmed opening for a short combo, knockdown, wall interaction, resource pressure, or positional advantage.
6. **Reset:** disengage, recover resources, change range, or continue pressure at a real risk.
7. **Adapt:** bosses and skilled players should change behavior based on repeated habits, not secretly read inputs.

## 3. Combat state model

Use explicit, mutually understandable states. Initial set:

- Neutral
- Startup
- Active
- Recovery
- Hitstun
- Blockstun
- ParrySuccess
- ParryRecovery
- DodgeStartup
- DodgeActive
- DodgeRecovery
- GuardBreak
- Knockdown
- Getup
- TechniqueCast
- DomainSequence
- Ragdoll
- Dead

State transitions must be centralized in the combat state machine. Do not let separate scripts independently set WalkSpeed, jump, AutoRotate, invulnerability, or action locks without a shared ownership/cleanup contract.

Every state must specify: allowed inputs, movement policy, rotation policy, cancel rules, vulnerability, duration source, interruption rules, and cleanup behavior.

## 4. Attack data contract

Every attack is data-driven and has at minimum:

| Field | Meaning |
|---|---|
| AttackId | Stable unique identifier |
| Startup | Time from accepted intent to active frames |
| Active | Hit detection window |
| Recovery | Time until neutral or a defined cancel |
| Range / Shape | Spatial envelope and direction |
| Damage | Health damage |
| PostureDamage | Guard pressure |
| CE Cost | Resource cost, if any |
| Hitstun / Blockstun | Resulting control lock |
| HitReaction | Animation / reaction category |
| GuardRule | Blockable, guard-break, parryable, dodgeable |
| ArmorRule | Whether startup armor exists and what breaks it |
| CancelRules | Explicit follow-ups and windows |
| HitLimit | Per-target and per-activation hit cap |
| Presentation | Animation, VFX, SFX, camera, hit-stop tags |

Do not hardcode balance values in animation scripts. Put tunables in shared configuration, with server-owned values authoritative.

## 5. M1 strings and combo grammar

The first prototype uses a four-step light string, but four hits must not mean four identical damage events.

Recommended grammar:
- M1-1: quick check, low commitment, modest hitstun.
- M1-2: confirms pressure, slightly different angle/pose.
- M1-3: stronger commitment or lateral reposition.
- M1-4: string ender with a deliberate choice: knockback, launch, knockdown, guard pressure, or weapon-specific ender.

Rules:
- A whiffed attack must expose recovery; do not let players cancel every miss into dash.
- A confirmed hit may allow only documented follow-ups.
- Combo scaling reduces repeated burst and preserves defender survival options.
- Repeated hitstun must not create infinite loops. Use combo count, diminishing hitstun, escape/tech rules, and server-enforced hit limits.
- Air combos are a later feature, not a requirement for the first playable build.
- Add weapon-specific strings only after the base unarmed/standard weapon string is stable.

## 6. Neutral, range, and commitment

Support at least three meaningful ranges:
- Close: M1, throws/grabs if designed, short technique checks, parry threat.
- Mid: weapon reach, approach tools, projectile startup, whiff punishment.
- Long: ranged technique threat, line-of-sight play, resource and cooldown pressure.

Movement should create decisions, not permanent safety. Dashes have startup/active/recovery and resource or cooldown costs. Avoid unlimited cancel chains. Backpedaling should not beat every approach; forward pressure should not automatically beat every retreat.

Add soft target-facing for accessibility, but do not make aim correction so strong that spacing and facing cease to matter. Camera and lock-on behavior must be tested on PC, mobile, and controller.

## 7. Defensive interaction matrix

| Incoming action | Block | Perfect block / parry | Dodge | Counterplay |
|---|---|---|---|---|
| Standard light | Mitigates; adds posture | Timing reward, attacker recovery | Avoids if timed | Mix timing, change angle |
| Heavy / guard pressure | High posture cost; may break | High-risk reward | Usually viable | Bait, interrupt, reposition |
| Grab / command throw | No | No, unless explicitly designed | Yes | Read the tell |
| Large area attack | Usually no or partial | No by default | Escape marked area | Leave zone before detonation |
| Projectile | Depends on type | Select projectile types only | Side-step / cover | Approach, reflect, counter-technique |
| Domain sure-hit | No ordinary block | Not a universal answer | Domain-specific counter | Anti-domain, clash, interrupt, escape rules |

Do not use color alone as the only signal. Pair color with shape, icon, sound, animation, and timing. Avoid ambiguous attack categories where one color means multiple incompatible defensive rules.

## 8. Posture, stamina, and cursed energy

Keep three concepts distinct:

- **Health:** survivability and injury thresholds.
- **Posture / guard integrity:** pressure from blocking, heavy attacks, and certain techniques. It recovers when safe; it is not simply a second health bar.
- **Cursed Energy (CE):** technique use, reinforcement, selected movement or defensive abilities, and RCT.

A separate stamina bar is optional. Do not add it merely because other games have one. If introduced, it must govern a distinct decision space and not duplicate CE or posture.

Posture design:
- Blocking repeated heavies builds posture damage.
- Perfect defense reduces or prevents posture loss and creates a modest advantage.
- Guard break is a punish opportunity, not an automatic full-health deletion.
- Passive recovery is slower under active pressure and resumes after a clear disengagement interval.
- Posture damage must be visible through animation/audio/UI, not hidden math only.

CE design:
- A player should be able to fight with fundamentals when low on CE.
- Reinforcement is a strategic spend, not a permanent toggle with no trade-off.
- Avoid resource starvation loops where a player cannot defend or meaningfully re-enter combat.
- Regeneration rules differ in combat and out of combat, and must be communicated.

## 9. Parry philosophy: reward timing, not parry spam

Parry should be a powerful option, never the only correct option.

- Use a narrow, learnable success window; tune after latency tests.
- Failed parry has a meaningful recovery / posture or resource cost.
- Multi-hit strings should have varied timing and occasional delayed follow-ups.
- Unparryable attacks must be clearly telegraphed and have a reliable alternate answer.
- Bosses should test dodge, spacing, interrupt, block, and environmental awareness as well as parry.
- Never make every boss phase a sequence of mandatory parries.
- Network latency must be considered before choosing a tiny timing window. Prefer forgiving server-validated timing over a theoretically precise but unreliable window.

## 10. Hit confirmation and feedback

A successful hit should communicate:
- contact direction and target,
- damage tier,
- hitstun / guard result,
- whether the target is armored or invulnerable,
- whether a combo continuation is legal.

Use layered feedback: hit reaction, brief hit-stop where appropriate, impact sound, restrained camera impulse, contact VFX, and UI only when needed. Do not stack full-screen flashes, excessive camera shake, and giant particles on every M1.

Hit-stop is presentation, not server simulation pause. The authoritative combat timeline continues consistently.

## 11. Black Flash and skill expression

Black Flash is a high-skill event, not a random critical-hit lottery. The design should reward a well-timed input / attack confirmation in a defined window with strong audiovisual identity and a meaningful but bounded combat benefit.

- No pay-to-win modifiers to the timing window.
- Avoid an always-on buff that makes one successful event snowball an entire match.
- Give clear feedback for near misses so players can learn.
- Test with varied ping, frame rate, and input devices.
- Canon claims belong in the JJK encyclopedia; gameplay tuning belongs here and is GAME-ORIGINAL.

## 12. Domain and high-impact technique rules

Domains are late-game strategic commitments, not ordinary ultimate buttons:
- Require a meaningful setup, resource cost, and risk window.
- A domain must have a readable activation and a defined contest/response sequence.
- Sure-hit behavior must be deterministic, bounded, and documented.
- Domain clashes should compare explicit properties (refinement, output, condition, remaining duration) rather than hidden random rolls.
- Anti-domain tools must have limits and trade-offs.
- A domain should change the encounter's rules, not simply multiply damage.
- Domain content must have counterplay in PvP and boss encounters.

## 13. R6 rig animation and hitbox principles

- Build around R6's six-part silhouette; do not assume R15 joints or limb names exist.
- Use authored animation poses and root motion only where server reconciliation can remain trustworthy.
- Visual weapon arcs and hitboxes must agree. A sword should not hit behind the character unless its authored move says so.
- Use animation markers for client presentation and local timing cues; server attack windows remain authoritative and cannot be extended by client markers.
- Validate hit targets using server-side spatial queries and per-attack limits.
- Test wall, slope, stair, corner, low-ceiling, and multi-target interactions.
- Keep cosmetic dismemberment, ragdoll, and mesh effects separate from authoritative hit resolution.

## 14. PvP fairness and anti-degeneracy

Track:
- average duel duration,
- first-hit win rate,
- guard-break frequency,
- parry success and failed-parry rate,
- dodge success rate,
- technique damage share,
- time spent unable to act,
- ping and frame-rate cohorts,
- win rate by origin, technique, weapon, and input device.

Red flags: infinite block, infinite dash, repeated stun loops, safe whiff cancels, unavoidable burst, one technique dominating all ranges, and a single defense invalidating all others.

## 15. First implementation slice

Do not implement this entire document at once. The recommended vertical slice is:
1. state machine + server intent validation,
2. one four-hit M1 string,
3. block and one perfect-block window,
4. dodge with defined vulnerability,
5. posture / guard break,
6. one dummy and two-player test arena,
7. telemetry and tuning sheet.

Only after this slice is fun should the team add weapon variants, advanced cancels, domain clashes, or elaborate injury visuals.

## Implementation notes
All timing and damage numbers are initial tuning variables, not sacred values. Keep them configurable and record playtest results.

## Testing criteria
- [ ] No client can award damage, posture, stun, invulnerability, or CE.
- [ ] Every attack has startup/active/recovery and a documented cancel policy.
- [ ] A defender always has a readable response to every attack category.
- [ ] No infinite combo, block, dash, or parry loop in automated duel tests.
- [ ] Same combat outcome under Tier 0 and Tier 1 injury presentation.
- [ ] PC, mobile, and controller can perform the same core defensive actions.

## Open questions
- Final lock-on policy and camera shoulder swap?
- Whether a separate stamina resource adds real decisions?
- Target latency and timing windows after live tests?
- Which weapon family is the first complete exemplar?
