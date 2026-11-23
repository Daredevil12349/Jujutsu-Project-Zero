# Soulslike Progression and Reward Philosophy

Status: DRAFT — DESIGN DIRECTION
Purpose: Create a deep, exploration-led RPG progression loop with meaningful builds, bosses, discoveries, and PvP integrity.
Last reviewed: 2026-11-23
Sources: Owner vision; design recommendations; [[../01-reference-games/vv-ultimatum-design-takeaways]]
Related: [[README]], [[../11-world-story/narrative-world-design]], [[../03-combat/combat-design-standard]], [[../../MASTER_GAME_DESIGN]]

## 1. The target feeling

Progression should feel like learning a dangerous world, not filling bars through repetitive NPC farming. A player should remember the first time they survived a cursed district, understood a boss, found a hidden trainer, earned a technique upgrade, or returned to defeat an enemy that once overwhelmed them.

The Soulslike influence is about:
- dangerous but learnable encounters,
- interconnected spaces and shortcuts,
- environmental storytelling,
- deliberate checkpoints,
- boss mastery,
- build identity,
- discoveries that change how the player understands the world.

It is not a request to copy FromSoftware maps, names, UI, lore, or exact systems.

## 2. The core loop

Explore -> discover a threat or clue -> prepare -> fight -> learn -> earn a meaningful reward -> unlock a route / tool / story fragment -> return to a hub or push deeper.

A strong session should contain a mix of:
- exploration and navigation,
- a small story discovery,
- a combat challenge,
- a reward or new possibility,
- a safe place to regroup.

Avoid a loop that is only: accept quest -> defeat ten identical enemies -> turn in -> repeat.

## 3. Progression layers

Use several complementary tracks:

### Character growth
A modest set of attributes that alter playstyle, not just damage multipliers. Examples: physical power, control, CE capacity, CE efficiency, vitality, and weapon proficiency. Avoid a stat list so large that new players cannot understand it.

### Technique mastery
Mastery comes from meaningful use and challenge completion. Unlock variants that change decisions, not just bigger numbers. A mastery node should say what behavior it rewards and what trade-off it introduces.

### Weapon proficiency
Weapon paths should have unique attack grammar, reach, posture behavior, and signature technique. A katana, staff, cursed tool, and unarmed style must not be cosmetic reskins.

### Origin / identity
Sorcerer, Heavenly Restricted, Cursed Spirit, Incarnated Sorcerer, Cursed Object User, and Cursed Corpse are proposed identities. Each needs a unique loop and a complete progression route; none should be a strictly better rarity tier.

### World knowledge
Hidden routes, NPC testimony, lore objects, boss rematches, and faction relationships should reward curiosity. Knowledge can unlock options without granting mandatory raw stats.

### Social progression
Mentors, clans, schools, organizations, co-op boss attempts, and sparring should create identity. Group content must not invalidate solo progression.

## 4. Checkpoints and death

Checkpoints should:
- provide recovery and respawn,
- let players spend a defined progression currency,
- act as safe hubs with NPCs and preparation,
- create shortcuts when a region is mastered.

Death should have a cost, but not erase hours of progress. Recommended starting model:
- keep permanent unlocks, technique mastery, and story flags;
- drop only a recoverable portion of a clearly named exploration resource, if any;
- provide one recovery attempt at the death location;
- avoid losing equipped gear, paid items, or rare permanent unlocks;
- make boss retry distance reasonable after a player has discovered a shortcut.

The exact death penalty is not approved until playtested. Never implement a punishing loss loop without showing the player exactly what is at risk.

## 5. Bosses as teachers

Every major boss should teach one or two mechanics:
- spacing and reach,
- delayed timing,
- guard pressure,
- projectile lane control,
- interrupt windows,
- adds and target priority,
- arena hazards,
- phase transitions,
- resource conservation,
- anti-domain response.

A boss should not simply have inflated health and damage. Build a moveset with readable tells, distinct attack families, recovery windows, and multiple viable responses.

Bosses should have:
- a narrative reason to exist,
- an arena that reinforces their identity,
- a clear phase structure,
- an optional challenge or mastery condition,
- rewards tied to the boss's theme,
- rematch or training access where practical.

## 6. Build diversity and balance

Builds should change how the player approaches a fight:
- close-range pressure,
- weapon spacing,
- counter / punish,
- mobility and evasive play,
- CE control and technique zoning,
- reinforcement and endurance,
- summons or constructs, if implemented.

No origin, clan, technique, weapon, or roll rarity should guarantee victory. PvP balance may use normalized competitive presets or ranked-side modifiers while allowing PvE builds to express more power.

Avoid mandatory rerolls. If random acquisition exists:
- publish exact odds,
- implement pity,
- provide duplicate compensation,
- provide a deterministic path to a desired baseline,
- never sell direct competitive power,
- let players earn rolls through multiple playstyles.

## 7. Exploration and world layout

Use a hub-and-spoke structure that gradually reveals interconnections:
- safe hub with services and character-driven NPCs,
- dangerous district with landmarks and side paths,
- optional elite encounter,
- shortcut or hidden route back to known space,
- boss gate with a clear visual and narrative setup.

Do not make every region a flat field of spawn points. Use verticality carefully with R6 movement limits and readable traversal. Every area needs a gameplay purpose, visual identity, lore question, enemy roster, reward table, and return path.

## 8. Quest design

Quest types should be varied:
- main story investigation,
- boss hunt,
- rescue / escort with combat choices,
- cursed object recovery,
- exorcism / containment,
- faction conflict,
- mentor trial,
- exploration discovery,
- co-op raid,
- repeatable contracts.

Repeatable quests should be short and varied. Main story quests should reveal character or world information, not just serve as XP gates.

## 9. Rewards

A reward should answer: what new decision does this enable?

Strong rewards:
- a new move with a different risk profile,
- a technique extension,
- a weapon stance,
- a shortcut,
- a new mentor or faction contact,
- a lore revelation,
- a boss rematch modifier,
- a cosmetic with story meaning.

Weak rewards:
- tiny stat increase with no visible effect,
- currency with no useful sink,
- a random item that is immediately dismantled,
- a long grind for a negligible percentage increase.

## 10. Pacing and onboarding

Teach one concept at a time. First hour should introduce:
1. movement and camera,
2. basic M1 string,
3. block and dodge,
4. parry timing in a safe practice,
5. posture and guard break,
6. cursed energy,
7. first technique,
8. first boss with fair tells,
9. first checkpoint and shortcut.

Do not introduce every menu, currency, clan, origin, and skill tree in the opening tutorial.

## 11. Content cadence

Prefer fewer high-quality encounters over huge volumes of repetitive NPCs. Each content update should add at least one of:
- new enemy behavior,
- a new boss lesson,
- a new region loop,
- a new build decision,
- a story revelation,
- a quality-of-life improvement.

## Implementation notes
This is a design target, not an instruction to build all progression systems before the combat prototype. Begin with a short vertical slice: hub, one dangerous route, one elite, one boss, one checkpoint, one permanent unlock, one lore discovery.

## Testing criteria
- [ ] Players can describe why their build plays differently.
- [ ] Exploration yields useful discoveries beyond XP.
- [ ] Bosses can be learned and defeated through multiple defensive strategies.
- [ ] Death penalty is understandable and recoverable.
- [ ] No paid roll or rarity advantage is required for PvP viability.
- [ ] Solo and group paths both remain viable.

## Open questions
- Is the world open-zone, hub-and-spoke, or instanced chapter structure?
- How many origins ship at launch?
- What is the one permanent progression currency?
- What is the acceptable death penalty after playtesting?
