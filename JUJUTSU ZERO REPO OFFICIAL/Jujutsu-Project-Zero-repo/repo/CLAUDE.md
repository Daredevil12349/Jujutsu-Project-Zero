# CLAUDE.md: Instructions for every development session

Read this file first. Then `PROJECT_RULES.md` and `FEATURE_STATUS.md`.

## Project
JUJUTSU: PROJECT ZERO is a JJK-inspired Roblox RPG with PvP, built in Roblox Studio with Luau. The philosophy: **make 1v1 combat so good it is fun without rewards, then build the world around it.**

## How to work
1. **One functional system at a time.** Build it, give test steps, confirm it works, then move on. Never generate the whole game or dozens of scripts at once.
2. **Complete working Luau.** No pseudocode, no "add your code here". State the exact script location (service > folder > script name and type), install/connect steps, and test steps. When editing, give the full updated script or a precise patch.
3. **Server-authoritative.** The client sends intent, the server validates and decides. See `docs/03-combat/` and `docs/09-roblox-handbook/`.
4. **Check current Roblox docs before using an API** (create.roblox.com/docs). Record what you checked in `RESEARCH_SOURCES.md`. Do not use deprecated APIs from memory.
5. **Update the trackers in the same session:** `FEATURE_STATUS.md` (what is implemented vs unfinished) and, if architecture changed, `TECHNICAL_ARCHITECTURE.md`.
6. **Use the templates** in `templates/` for every new technique, animation, VFX, SFX, boss, or system entry.

## Integrity rules (non-negotiable)
- Never fabricate: asset IDs, animation IDs, sound IDs, API behavior, other games' features or drop rates, performance numbers, or JJK abilities.
- Label every lore claim: `CANON-MANGA`, `CANON-ANIME`, `MANGA-SPOILER`, `INTERPRETATION`, or `GAME-ORIGINAL`. Unlabelled lore is a bug.
- Label every external-game claim: `OBSERVED` (first-hand), `REPORTED` (community, with source), or `RECOMMENDATION` (our design).
- Anything unconfirmed is marked `UNVERIFIED`.
- No copied assets, animations, audio, maps, or code from other games. Original implementations only.
- Roblox content policy: default to stylized, non-graphic injury visuals. Actual dismemberment is a separate restricted-content decision (`docs/04-damage-rct/`). Never assume fantasy-colored blood or "temporary" effects bypass policy.
- No pay-to-win. Rolling needs pity, duplicate compensation, and gameplay-earned rolls.

## Definition of done for a system
Server module + client controller + shared types + remote registration, all server-validated; test steps documented; `FEATURE_STATUS.md` updated; no open `TODO` left silently.


## Obsidian vault workflow (added 2026-11-22)
- This repo lives in the connected Obsidian vault at `Jujutsu-Project-Zero-repo/repo/`. Read and edit files there directly with the Obsidian tools; do not rely on stale zip copies.
- Before editing a file, read its current content (the owner may have edited it). Prefer `patch_vault_file` or `append_to_vault_file` over whole-file overwrites.
- Use `[[wikilinks]]` for cross-references so Obsidian's graph and backlinks work.
- `docs/10-picture and video reference/` holds owner-supplied visual references. Claude cannot watch videos: ask the owner for captured frames, then analyze only what is visible (see that folder's README).
