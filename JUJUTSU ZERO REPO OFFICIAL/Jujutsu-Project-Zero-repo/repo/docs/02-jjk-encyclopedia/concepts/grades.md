# Grades (sorcerers, cursed spirits, tools)

Status: DRAFT
Purpose: Canon basis and game adaptation for the grading system, used for enemy tiers, player rank progression and threat levels.
Last reviewed: 2026-11-22
Sources: J27, J28 to J33
Related: [[cursed-spirits-and-objects]], [[clans-and-inherited-techniques]], ../../08-progression/README

## Canon basis
| Claim | Label | Source |
|---|---|---|
| Grades are assigned by Jujutsu High to rank sorcerers and curses; cursed tools, cursed objects and missions are graded too | `CANON-MANGA/ANIME (reported)` | J28, J29 |
| Cursed spirit grades, highest to lowest as listed by one guide: Special Grade, Special Grade 1, Grade 1, Semi-Grade 1, Grade 2, Semi-Grade 2, Grade 3, Grade 4; the classifications are "not exact" | `CANON (reported)`; the exact ladder is `UNVERIFIED` (guide wording) | J28 |
| A sorcerer can generally handle a curse of the same grade or lower | `CANON (reported)` | J28 |
| Sorcerer grades run Grade 4 up to Grade 1, then Special Grade 1 and Special Grade | `CANON (reported)` | J29 |
| Grade 2 sorcerers are trusted to go on missions alone | `CANON (reported)`; from a 2022 article that says it may be outdated | J-WGTC |
| In season 1 Ijichi compares curse grades to the firepower needed against them; for a special grade, cluster bombs "might" work | `CANON-ANIME (reported, season 1)` | J30, J31 |
| Special-grade sorcerers named by guides: Satoru Gojo, Yuta Okkotsu, Yuki Tsukumo, Suguru Geto (registered modern era); Sukuna called the strongest in history | `CANON (reported)`; lists vary, low-reliability sources | J27, J30, J33 |
| Grading is imperfect: Ino and Megumi share Grade 2 despite different power; the first special-grade curse, a finger bearer, and Sukuna both count as special grade | `INTERPRETATION` (articles' opinions) | J30, J32 |
| ⚠ A reported chapter-203 reveal by Kenjaku explains what special grades mean; details not retrieved | `UNVERIFIED` ⚠ MANGA-SPOILER | J-SR |

## Not yet researched
Exact grade-to-power relations, promotion rules, Semi-Grade definitions, cursed-tool grade ladder, how special grade is defined in canon.

## Game adaptation (GAME-ORIGINAL proposal)
| Use | Proposal |
|---|---|
| Player rank ladder | Grade 4 to Grade 1 (plus Special Grade as endgame), earned through missions, exams and boss kills, **not** purchases |
| Enemy tiers | Curse grades 4 to Special Grade set stats, abilities, rewards and required party size |
| Threat display | Each mission shows its grade, with a visible "grade may be misjudged" mechanic for risk events (canon: grades are imperfect) |
| Special Grade | Rare story/boss encounters, never random farm targets |
| Fairness | Rank gates content and prestige, not stats beyond what mastery provides |
Probabilities for any grade-based rewards belong in docs/08 and must be published.

## Implementation notes
Grades are data tables (`enum Grade`) consumed by mission, enemy and reward systems.

## Testing criteria
- [ ] No reward table references a grade not defined in the enum.
- [ ] Rank-ups are server-validated, with no client-set rank.

## Open questions
- Keep "Semi-Grade" and "Special Grade 1" tiers or simplify to 5 tiers plus special?
