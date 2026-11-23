# Defensive Systems and Duel Flow

Status: DRAFT — DESIGN BASELINE
Purpose: Specify block, parry, dodge, posture, knockdown, wake-up, and duel pacing as one coherent interaction system.
Last reviewed: 2026-11-23
Sources: Owner vision; design recommendations; VV: Ultimatum community references are secondary only.
Related: [[combat-design-standard]], [[../04-damage-rct/injury-rct-and-rct-gameplay]], [[../../TECHNICAL_ARCHITECTURE]]

## 1. Defense is a choice with a cost

A strong combat system offers several valid answers:
- Block: reliable against ordinary pressure, but gives up posture and can be opened by heavies.
- Perfect block / parry: high-skill timing answer, high reward, punishable on failure.
- Dodge: avoids a committed threat and changes position, but costs a resource or enters recovery.
- Movement / spacing: avoids attacks before they become dangerous; costs positioning and attention.
- Interrupt: beats a slow startup, but loses to armor, feints, or faster checks.
- Technique-specific answer: powerful but narrow, with a CE or cooldown cost.

No defense should dominate every matchup. If a move is unblockable, its tell and dodge route must be unambiguous. If it is undodgeable, it must be rare and have another answer such as interrupt, range, cover, or a domain rule.

## 2. Block

Block is a held defensive state with:
- facing requirements,
- a defined guard arc,
- movement penalty,
- posture damage intake,
- vulnerability to guard-break moves and grabs,
- explicit rules for projectiles and multi-hit attacks.

Back attacks should bypass or heavily weaken block only when the attacker has genuinely reached the rear arc. Avoid arbitrary 360-degree guard.

Block should not be a permanent safe state. Apply pressure through posture, flanking, throws, delayed attacks, and resource cost. Do not make ordinary M1s instantly break guard.

## 3. Perfect block / parry

Use a tap or timed press with a short active window. A success should:
- negate or greatly reduce the incoming attack according to its class,
- create a brief advantage window,
- apply attacker recovery or posture pressure,
- produce a distinct animation and sound.

A failed attempt should not be equivalent to doing nothing. It can create recovery, posture loss, or CE waste. The penalty should be enough to discourage random spam but not so harsh that new players never experiment.

Avoid a universal parry answer to grabs, large floor zones, domain sure-hits, and every projectile. Each category must state its rule in the move data.

## 4. Dodge

Dodge has startup, active invulnerability or avoidance rules, and recovery. The active window should not cover the entire animation. Prefer directional movement with a small, consistent evade window.

Define:
- allowed directions,
- distance and collision behavior,
- invulnerability window,
- CE/stamina/cooldown cost,
- cancel permissions,
- landing / wall collision behavior,
- whether dodge can avoid tracking attacks.

Tracking attacks need a limit. A move that turns continuously to follow the player removes the value of a correctly timed dodge. Telegraph the tracking rule (snap, limited turn, or lock-on) through animation.

## 5. Posture and guard break

Posture is a pressure meter, not health. It increases from blocked heavies, certain techniques, and failed defensive choices. It should:
- recover after a short out-of-pressure delay,
- recover faster when the player creates real space,
- be readable through guard pose, audio, and a restrained UI indicator,
- break only after a meaningful sequence of pressure.

Guard break creates a punish window. It should not automatically guarantee a full combo plus ultimate. The punish duration must be tuned against ping and combo scaling.

## 6. Hitstun, knockback, knockdown, and wake-up

Use distinct reactions:
- light flinch: brief hit confirmation, minimal displacement;
- heavy stagger: meaningful interruption;
- launch / knockback: positional reset or combo route;
- knockdown: temporary loss of action with a wake-up decision;
- ragdoll: rare, authored, and bounded.

Wake-up must not be a helpless cutscene. Options may include neutral rise, roll, quick rise at resource cost, or delayed rise to bait an attack. Do not let wake-up attacks grant unconditional invulnerability or infinite reversal loops.

A player repeatedly knocked down should retain agency and have a reliable get-up path. Avoid arbitrary instant-death rules based only on knockdown count.

## 7. Duel tempo

A good duel alternates between:
- short pressure bursts,
- defensive reads,
- repositioning,
- resource decisions,
- occasional high-impact technique moments.

Do not fill every second with effects and attacks. Breathing room lets players read animations and makes the next impact matter.

Target pacing should be established through playtests, not guessed from a competitor's health bar. Track time to first hit, average neutral duration, average combo duration, and total time in hitstun.

## 8. Input buffering and cancel policy

Input buffering makes controls responsive but can create unintended actions. Define a small buffer for each action and clear it when:
- player is stunned,
- player is guard-broken,
- player is dead,
- a conflicting menu or interaction begins,
- the buffered action is no longer legal.

Cancel categories:
- hit-confirm cancel: only after a confirmed hit and only into named follow-ups;
- whiff cancel: rare, expensive, and move-specific;
- defensive cancel: reserved for explicitly designed windows;
- movement cancel: only when documented and never a universal escape from recovery.

Do not add high-speed cancel tech until the base combat can be understood by a new player.

## 9. Latency and fairness

Measure the timing system at multiple ping levels and frame rates. The server remains authoritative, but the client should predict immediate animation and reconcile cleanly. Never let a client claim a parry succeeded or a hit landed.

If a timing window feels inconsistent at normal player ping, fix the netcode and timing model before simply widening all hitboxes or adding generous invulnerability.

## Implementation notes
All timings are tunables. Record test builds and measured outcomes before balance changes.

## Testing criteria
- [ ] Block arc is correct from front, side, and rear.
- [ ] Parry success and failure have distinct outcomes.
- [ ] Dodge avoids only attacks whose data says it can avoid them.
- [ ] Guard break creates a bounded punish.
- [ ] Wake-up cannot be looped indefinitely.
- [ ] No defensive action can be held or spammed without a trade-off.

## Open questions
- One shared posture meter or weapon-specific guard integrity?
- Dodge resource: cooldown, CE, stamina, or hybrid?
- Should perfect block be available unarmed and armed with identical timing?
