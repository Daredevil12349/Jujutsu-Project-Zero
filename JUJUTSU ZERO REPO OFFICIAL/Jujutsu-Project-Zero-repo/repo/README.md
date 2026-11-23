# JUJUTSU: PROJECT ZERO

A Jujutsu Kaisen-inspired open-world RPG and competitive PvP experience for Roblox (Studio + Luau).

This repository is the **knowledge base and source of truth** for the project. It is not the game place file; it holds design documents, research, technical references, templates, and (later) Rojo-friendly source code.

## Start here
| If you are... | Read |
|---|---|
| A Claude session starting work | `CLAUDE.md`, then `PROJECT_RULES.md`, then `FEATURE_STATUS.md` |
| Deciding what the game is | `MASTER_GAME_DESIGN.md` |
| Deciding where code goes | `TECHNICAL_ARCHITECTURE.md` |
| Deciding what to build next | `DEVELOPMENT_ROADMAP.md` |
| Checking whether a fact is verified | `RESEARCH_SOURCES.md` |
| Using any outside asset or idea | `ASSET_LICENSING.md` |

## Layout
```
docs/
  01-reference-games/     research on other games (observed vs reported vs recommended)
  02-jjk-encyclopedia/    lore: concepts/, characters/, techniques/
  03-combat/              M1, hitboxes, parry, hitstop, state machines, netcode
  04-damage-rct/          damage model, injury states, RCT, Shrine-style slashing
  05-animation/           animation design library
  06-vfx-sfx/             effect library, manifests, mobile alternatives
  07-techniques/          one file per game technique
  08-progression/         rolling, pity, mastery, probability tables
  09-roblox-handbook/     current Roblox API guidance with verified code
templates/                entry templates (technique, animation, VFX, SFX, boss, system, lore, research)
src/                      Rojo-style source skeleton (shared / server / client)
tests/                    test plans and unit tests
```

## Status
See `FEATURE_STATUS.md`. Every doc carries a status banner: `STUB`, `DRAFT`, `RESEARCHED`, or `IMPLEMENTED`.

## Rules in one line
Nothing is canon, verified, or implemented unless it is labelled that way, with a source.
