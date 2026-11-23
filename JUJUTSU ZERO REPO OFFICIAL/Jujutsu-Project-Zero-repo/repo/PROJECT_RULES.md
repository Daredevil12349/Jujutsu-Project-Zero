# PROJECT_RULES.md

## 1. Source-label vocabulary
| Label | Meaning |
|---|---|
| `CANON-MANGA` | Stated or shown in the manga (cite chapter when known) |
| `CANON-ANIME` | Stated or shown in the anime (cite episode/season) |
| `ANIME-ONLY` | Appears in the anime but not the manga |
| `MANGA-SPOILER` | Late-story manga information; keep in clearly marked sections |
| `INTERPRETATION` | Reasonable reading of canon, not stated outright |
| `GAME-ORIGINAL` | Our own mechanic or adaptation; never presented as canon |
| `OBSERVED` / `REPORTED` / `RECOMMENDATION` | For other games: first-hand, community-sourced (cite), or our design advice |
| `UNVERIFIED` | Not confirmed against a source |

## 2. Document header (required on every doc)
```
Status: STUB | DRAFT | RESEARCHED | IMPLEMENTED
Purpose: one sentence
Last reviewed: YYYY-MM-DD
Sources: links or "none yet"
Related: [[cross-references]]
```
Every doc ends with **Implementation notes**, **Testing criteria**, and **Open questions**.

## 3. Code rules
- `--!strict` Luau, ModuleScripts everywhere; exactly one server `Script` and one client `LocalScript` as entry points.
- No `_G`. Explicit `require`. Remotes created on the server from one list.
- Every remote handler validates: argument types, ranges, cooldowns, state, and rate limit.
- Tunable numbers live in config modules, not inline.
- Disconnect connections on cleanup; no per-frame allocations in hot paths.

## 4. Content rules
- Original designs only; inspiration from mechanics, never assets or code.
- Mobile and controller support are requirements, not extras.
- Probabilities must sum to 1 and be published in `docs/08-progression/`.

## 5. Process rules
- One system at a time, tested before the next.
- Check for contradictions when adding docs; fix or log them in the doc's Open questions.
- Never delete the audit trail: superseded decisions go in a "Decision log" section.
