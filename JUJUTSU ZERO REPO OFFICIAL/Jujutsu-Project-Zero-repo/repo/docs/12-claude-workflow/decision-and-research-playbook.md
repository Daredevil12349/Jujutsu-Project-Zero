# Decision and Research Playbook

Status: DRAFT — OPERATING GUIDANCE
Purpose: Standardize how Claude and ChatGPT research, compare references, make recommendations, and record decisions.
Last reviewed: 2026-11-23
Sources: Existing repository rules; owner request.
Related: [[agent-operating-standard]], [[../../RESEARCH_SOURCES]], [[../../PROJECT_RULES]]

## 1. Separate evidence from design

Every statement belongs to one of these classes:
- FACT: directly supported by a reliable source.
- OBSERVED: personally inspected in the game or primary media.
- REPORTED: secondary guide, community post, or another person's account.
- INTERPRETATION: analysis based on evidence.
- RECOMMENDATION: proposed design for this project.
- UNVERIFIED: plausible but not confirmed.

Never write "the game does X" when the only evidence is a fan wiki excerpt. Say "a community guide reports X; verify in-game."

## 2. Reference analysis template

For each reference game or media source, capture:
1. What is the reference and why is it relevant?
2. What is directly observed versus reported?
3. What is the player loop?
4. What is the combat grammar?
5. What creates risk and counterplay?
6. What creates long-term motivation?
7. What frustrates players or creates degenerate play?
8. What is worth learning?
9. What should not be copied?
10. What original adaptation fits Project Zero?

Reference analysis should extract principles, not clone features, assets, names, maps, UI, animation, or code.

## 3. Compare references by design problem

Do not rank games as a whole when the goal is to learn a specific system. Compare them by:
- combat readability,
- movement and neutral,
- parry / dodge / block balance,
- boss telegraphs,
- build identity,
- progression pacing,
- exploration structure,
- narrative delivery,
- onboarding,
- accessibility,
- technical performance.

A game may be a good reference for one system and a poor reference for another.

## 4. Decision record

For every material decision, record:
- Decision ID and date
- Status: PROPOSED / APPROVED / REJECTED / SUPERSEDED
- Problem being solved
- Options considered
- Recommendation and rationale
- Trade-offs and risks
- Owner approval evidence
- Affected docs and code
- Revisit trigger

Never overwrite an old decision without preserving it in a Decision log.

## 5. Proactive gap audit

At least once per major milestone, audit:
- combat: states, counterplay, hitstun, resource loops, anti-degeneracy;
- engineering: authority, security, data persistence, cleanup, observability;
- content: enemy variety, boss identity, story integration, reward value;
- progression: onboarding, grind, catch-up, build respec, economy;
- UX: telegraphs, settings, controller, mobile, color accessibility;
- production: scope, asset pipeline, performance budget, test coverage;
- policy and licensing: current platform guidance and rights.

For every gap, write a concise risk and next action. Do not add speculative systems just to make the checklist look complete.

## 6. Research confidence

Suggested confidence:
- HIGH: primary source read or directly observed and recorded.
- MEDIUM: multiple reputable secondary sources agree.
- LOW: one secondary source, search excerpt, outdated guide, or ambiguous wording.

Confidence applies to each claim, not the entire document.

## 7. Turn research into implementation

A research note is useful only when it changes a decision or produces a test. Each major research item should end with:
- project implication,
- implementation or prototype question,
- measurable acceptance criterion,
- unresolved risk.

## Implementation notes
Use this playbook for new reference-game, technical, and lore research.

## Testing criteria
- [ ] Every nontrivial external claim has a source and confidence.
- [ ] OBSERVED and REPORTED are never conflated.
- [ ] Recommendations explain what to adapt and what not to copy.
- [ ] Material decisions have an owner-approval status.

## Open questions
- Should reference analyses include owner-captured clips and screenshots as mandatory evidence?
- What level of source quality is required before a balance value becomes a shipping value?
