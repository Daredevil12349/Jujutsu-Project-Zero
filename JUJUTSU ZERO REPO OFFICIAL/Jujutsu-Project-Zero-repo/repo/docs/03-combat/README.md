# Combat engineering and design

Status: DRAFT — design baseline added; implementation not started
Purpose: Define combat rules and index the engineering specifications.
Last reviewed: 2026-11-23
Sources: Owner vision and design recommendations; technical API claims belong in [[../../RESEARCH_SOURCES]].

## Files
| File | Status | Notes |
|---|---|---|
| combat-design-standard.md | DRAFT | Combat identity, states, attack data, M1 grammar, resources, domains, R6 |
| defense-states-and-duel-flow.md | DRAFT | Block, parry, dodge, posture, knockdown, wake-up, latency |

## Implementation order
1. State machine and server intent validation.
2. One four-hit M1 string.
3. Block and perfect block.
4. Dodge and posture / guard break.
5. Hit reactions and knockdown.
6. Two-player arena, telemetry, tuning.

## Open questions
- Lock-on and camera policy?
- Separate stamina resource?
- Dodge cost and parry timing after latency tests?
- First complete weapon moveset?
