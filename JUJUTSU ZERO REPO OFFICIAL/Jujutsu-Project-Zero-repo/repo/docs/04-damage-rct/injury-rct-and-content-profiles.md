# Injury, Limb Function, and Reverse Cursed Technique

Status: DRAFT — GAMEPLAY SPECIFICATION
Purpose: Connect injuries, limb functionality, RCT healing, and visual presentation to combat without making gore the gameplay.
Last reviewed: 2026-11-23
Sources: Existing [[dismemberment-restricted-track]]; owner preference for optional injury intensity; gameplay recommendations.
Related: [[README]], [[dismemberment-restricted-track]], [[../03-combat/combat-design-standard]], [[../05-animation/README]]

## 1. Design principle

Injury should make a fight feel consequential, but it must not make a player lose control for long periods or turn every match into a visual-effects contest. Gameplay state and visual intensity are separate.

The user wants injuries, optional visible blood, and a presentation setting. Preserve that goal through a content-profile abstraction. A setting that hides effects is a comfort option; it does not change the platform's content classification or make restricted content permissible in a less-restricted experience. The existing Restricted-track document remains the source of truth for visible dismemberment decisions.

## 2. Injury categories

Use readable gameplay categories rather than a large simulation of anatomy:

| Injury | Gameplay consequence | Recovery |
|---|---|---|
| Bruise / impact | Cosmetic or short stagger only | Natural |
| Wound | Brief CE leakage or reduced stability under pressure | Time, rest, or low-cost RCT |
| Arm impairment | Selected weapon / technique actions weakened or unavailable | RCT, item, checkpoint |
| Leg impairment | Dash distance or movement stability reduced modestly | RCT, item, checkpoint |
| Severe trauma | Temporary vulnerability / knockdown; not a permanent stat loss | RCT or safe recovery |
| Limb loss | Separate future Restricted track only | RCT regrowth design, if approved |

Do not permanently reduce a player's base stats from routine PvP hits. Persistent consequences should be rare, explicit, recoverable, and preferably reserved for authored story events.

## 3. Limb state machine

For each supported limb:
Intact -> Wounded -> Disabled -> Regrowing -> Restored

The Restricted track may add Severed as a separate presentation/gameplay state only after a separate content decision. The main experience should not require visible separation.

The server owns limb state. Clients receive compact state changes and choose presentation based on their own accessibility settings. Never send mesh geometry or detailed physics state over remotes.

## 4. Reverse Cursed Technique gameplay

RCT is powerful recovery with an opportunity cost:
- It consumes CE over time or per treatment stage.
- It requires a vulnerable channel or safe interruption window.
- Damage, guard break, or a defined interruption cancels or delays healing.
- It restores function in stages rather than erasing all consequences instantly.
- Healing another player, if supported, has a different cost profile from self-healing.
- RCT cannot revive a dead player in ordinary combat unless a specific, rare, authored mechanic says otherwise.

Suggested stages:
1. Stabilize: stop ongoing penalty / prevent worsening.
2. Restore function: recover the action or limb's gameplay capability.
3. Complete recovery: remove residual temporary penalty after a delay or safe rest.

The animation and VFX should communicate each stage. Healing must be interruptible and readable, not a hidden menu action.

## 5. Cursed energy interaction

RCT should have a meaningful CE premium relative to ordinary reinforcement. A player who spends all CE offensively cannot instantly heal every mistake. Conversely, a player with no CE should still be able to move, block, and use basic attacks.

Design for multiple viable choices:
- reinforce before a heavy exchange,
- spend CE on a technique to secure pressure,
- save CE for emergency RCT,
- disengage to recover rather than endlessly trade.

## 6. Presentation profiles and player settings

Use an explicit content profile chosen by the experience build and a separate player preference layer for permitted effects.

Player-facing options may include:
- Injury visuals: Off / Reduced / Standard
- Blood effects: Off / Reduced / Standard, only if permitted for the experience's declared maturity
- Screen shake: Off / Reduced / Standard
- Hit flash: Off / Reduced
- Camera impulse: Off / Reduced / Standard

Never let a client preference alter damage, hitboxes, injury states, hit reactions, or competitive outcomes. All clients see the same gameplay state; they may see different permitted presentation intensity.

Tier 0/1 and Tier 2 content boundaries remain as described in [[dismemberment-restricted-track]]. Do not put Tier 2 assets in the main experience and rely on a toggle to hide them.

## 7. R6 rig implications

R6 has a simplified body structure. Do not assume separate forearm, hand, calf, or foot joints. Model injury function at the logical limb level and translate it into R6-compatible animation, equipment visibility, and movement changes.

A disabled arm should not create impossible weapon poses. A disabled leg should use a controlled locomotion profile, not uncontrolled physics jitter. Keep hit detection independent from the cosmetic injury mesh.

## 8. PvP fairness

- Injury effects are temporary and bounded.
- No random limb impairment procs.
- The attack that causes an injury must be readable and have counterplay.
- Repeated injury should not stack into a permanent stun.
- RCT must not create infinite stall loops.
- Accessibility settings must not hide attack telegraphs or competitive information.

## Implementation notes
Build the logical injury state and profile interface before any high-intensity visuals. Tier 0/1 first. Treat Restricted content as a separate future project decision, not a default implementation detail.

## Testing criteria
- [ ] Injury state is server-authoritative.
- [ ] Visual settings never change gameplay.
- [ ] RCT is interruptible, CE-limited, and staged.
- [ ] Every injury has a counterplay and recovery route.
- [ ] Main experience contains no Tier 2-only assets or scripts.
- [ ] R6 animation remains stable during impairment and restoration.

## Open questions
- Should the main experience use visible non-graphic blood at all, pending current Creator guidance?
- Which injuries are temporary combat debuffs versus persistent story consequences?
- Is ally-targeted RCT a launch feature or later specialization?
