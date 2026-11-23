# Picture and video reference

Status: DRAFT (index; supplied by project owner)
Purpose: Visual reference library. Claude cannot watch videos; this folder is the bridge between video/links and analysis.
Last reviewed: 2026-11-22
Sources: owner-supplied link pack (not independently verified by Claude; links may change or require sign-in)
Related: [[Jujutsu_Project_Zero_Gameplay_Reference_Pack]], [[../01-reference-games/OBSERVATION_PROTOCOL]], [[../../RESEARCH_SOURCES]]

## Files
| File | Status |
|---|---|
| Jujutsu_Project_Zero_Gameplay_Reference_Pack.md | Owner-supplied link pack (10 references with timestamps) |

## How Claude can and cannot use this
- **Cannot:** watch YouTube or Medal videos, or fetch pages that are not returned by search.
- **Can:** analyze screenshots/frames the owner attaches in chat, then write findings into the matching game doc as `OBSERVED (from owner-supplied frames, date)`.
- Every finding separates what is visible from what is assumed; names, assets and choreography are never copied (see ../../ASSET_LICENSING.md).

## Frame folder convention
Store captured frames in `docs/10-picture and video reference/frames/` named like `JJI-01_01-startup.png` (reference number, frame number, moment). Write one analysis note per mechanic using `templates/research-entry.md`. Frames are for private analysis only and are not redistributed (do not commit frames of other creators' work to a public repo).

## Reference-to-doc map
| Pack item | Feeds |
|---|---|
| 01, 02 Jujutsu Infinite showcases | docs/01-reference-games/jujutsu-infinite.md, docs/07-techniques, docs/06-vfx-sfx |
| 03, 04 Jujutsu Shenanigans showcases (domains, clashes) | docs/01-reference-games/other-roblox-jjk-games.md, docs/03-combat (clash staging) |
| 05, 06 Shibuya | docs/01-reference-games/shibuya.md |
| 07, 08 Jujutsu: RETRO | docs/01-reference-games/jujutsu-retro.md |
| 09 Anime combat system demo (marketplace product page) | docs/03-combat (hit-stop, guard, parry, ragdoll); mechanics only, not art direction |
| 10 Anime VFX pack | docs/06-vfx-sfx vocabulary |

## Testing criteria
- [ ] At least one frame set analyzed per pack item before it is cited in a design doc.
## Open questions
- Which items should be analyzed first? (Suggested: 09 for hit-stop/parry feel, 04 for domain/beam clash staging.)
