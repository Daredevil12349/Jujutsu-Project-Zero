# CLAUDE.md: Instructions for every development session

Read this file first. Then `PROJECT_RULES.md`, `FEATURE_STATUS.md`, and the relevant system docs.

## Project
JUJUTSU: PROJECT ZERO is an original-story, JJK-inspired Roblox R6 sorcery action RPG with PvP. The intended feel combines deliberate, readable fighting-game combat, high-stakes Soulslike encounters and exploration, and the build/progression depth of Roblox action RPG references such as VV: Ultimatum. These are design inspirations, not assets, code, lore, or systems to copy.

**Core philosophy:** make 1v1 combat so good it is fun without rewards; make the world worth exploring even when the player is not grinding.

## How to work
1. **One functional vertical slice at a time.** Design it, build it, test it, then move on. Never generate the whole game or dozens of scripts at once.
2. **Complete working Luau.** No pseudocode or "add your code here". State exact script location, type, install steps, and test steps. When editing, provide the full updated script or a precise patch.
3. **Server-authoritative.** Client sends intent; server validates and decides. See `docs/03-combat/` and `docs/09-roblox-handbook/`.
4. **Research current APIs and policy** before relying on them. Prefer create.roblox.com/docs and official announcements. Log source, date, access depth, confidence, and implications in `RESEARCH_SOURCES.md`.
5. **Update trackers in the same session:** `FEATURE_STATUS.md`; update `TECHNICAL_ARCHITECTURE.md` when architecture changes.
6. **Use templates** in `templates/` for every new technique, animation, VFX, SFX, boss, or system entry.
7. **Be proactive, not presumptuous.** Identify gaps, contradictions, risks, and high-value opportunities. Recommend a sensible next step with trade-offs. Mark ideas PROPOSED; only the owner can approve identity-defining or expensive decisions.
8. **Read before writing.** Inspect current files before edits. Preserve owner changes and decision history. Use Obsidian wikilinks for internal references.

## Design north star
- R6-first presentation: authored poses, readable silhouettes, intentional hit arcs, and bespoke animation. Never assume R15 anatomy.
- Combat is deliberate: startup / active / recovery, neutral, spacing, block, parry, dodge, interrupt, posture, resource pressure, and bounded combo routes.
- Multiple defensive answers: parry is powerful but never the universal answer.
- Soulslike depth: learnable bosses, interconnected regions, shortcuts, environmental storytelling, meaningful checkpoints, and discoveries that recontextualize earlier events.
- Progression creates new decisions and build identity, not only bigger numbers.
- Injury is consequential but readable, recoverable, and separate from gore presentation.
- PC, mobile, and controller are first-class.
- No pay-to-win. Random acquisition requires published odds, pity, duplicate compensation, and earned paths.

## Integrity rules (non-negotiable)
- Never fabricate asset IDs, animation IDs, sound IDs, API behavior, performance numbers, external-game mechanics/drop rates, or JJK abilities.
- Label lore: `CANON-MANGA`, `CANON-ANIME`, `MANGA-SPOILER`, `INTERPRETATION`, or `GAME-ORIGINAL`.
- Label external-game claims: `OBSERVED`, `REPORTED`, or `RECOMMENDATION`.
- Anything unconfirmed is `UNVERIFIED`; distinguish search excerpts from full-page research and first-hand play.
- No copied assets, animations, audio, maps, dialogue, code, or recognizable protected expression from other games or anime. Build original implementations.
- Injury presentation must follow current Roblox content-maturity and Restricted-content rules. Do not assume a toggle, fantasy color, low frequency, or temporary effect changes an experience's rating. See `docs/04-damage-rct/`.
- Never put Restricted-only assets into the main experience and rely on a client toggle to hide them.
- No pay-to-win.

## Session startup
For substantial work, follow [[docs/12-claude-workflow/agent-operating-standard]] and [[docs/12-claude-workflow/decision-and-research-playbook]]:
1. Read current status and relevant docs.
2. State the smallest useful milestone and dependencies.
3. Design the player loop, states, data, server/client boundary, counterplay, failure cases, and test plan before code.
4. Implement one vertical slice.
5. Verify in Studio when possible; distinguish verified from unverified.
6. Update docs and trackers.

## Definition of done
A system is not done because code was generated. It needs server module + client controller + shared types/config + remote registration as applicable; server validation; cleanup; normal and adversarial tests; mobile/controller checks; documentation; `FEATURE_STATUS.md` update; and no silently abandoned TODOs.

## Session closeout
Report: **Changed**, **Verified**, **Not verified**, **Risks / owner decisions**, and **Next recommended step**. Never claim a Studio test passed unless it was actually run.

## Obsidian / Git workflow
- The repository is a GitHub-backed copy of the Obsidian vault. It is not a live view of uncommitted local edits.
- Pull before substantial edits and push committed changes so all tools see the latest version.
- Never assume a local Obsidian change is present in GitHub until pushed.
- `docs/10-picture and video reference/` holds owner-supplied visual references. If a video cannot be inspected directly, ask for timestamped screenshots/frames and analyze only what is visible.
