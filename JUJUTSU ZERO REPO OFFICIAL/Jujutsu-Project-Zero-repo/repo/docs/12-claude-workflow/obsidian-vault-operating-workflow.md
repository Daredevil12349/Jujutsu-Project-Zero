# Obsidian Vault Operating Workflow

Status: DRAFT
Purpose: Keep the JUJUTSU: PROJECT ZERO vault accurate, navigable, low-duplication, and inexpensive for Claude to use across long development sessions.
Last reviewed: 2026-11-23
Sources: Existing repository structure, CLAUDE.md, PROJECT_RULES.md, and owner direction.
Related: [[../../CLAUDE]], [[../../PROJECT_RULES]], [[../../README]], [[agent-operating-standard]], [[decision-and-research-playbook]]

## 1. The vault is the project's memory, not a transcript

Treat Obsidian as a maintained design knowledge base. It should contain durable decisions, verified research, system specifications, implementation references, and useful open questions—not every conversation, thought, or generated paragraph.

**Primary rule:** before creating a note, search for the information in existing notes. Update or extend the best existing note unless a separate note has a clear long-term purpose.

Do not create a new note just because a topic came up in chat. Create one when it is reusable, has enough substance, or needs its own lifecycle.

## 2. Source-of-truth hierarchy

Use this order:
1. Owner's latest explicit decision.
2. Approved decision recorded in the vault.
3. Project rules and master design.
4. Current system documentation and technical architecture.
5. Verified primary research.
6. Claude's proposals and interpretations.

If sources conflict, do not silently merge them. Record the conflict in the relevant note's **Open questions** and ask only if it blocks the current work.

Keep these states distinct:
- **APPROVED** — owner accepted it.
- **PROPOSED** — Claude recommends it; not yet accepted.
- **EXPERIMENT** — temporary test or prototype.
- **DEPRECATED** — retained for history, no longer current.
- **UNVERIFIED** — not adequately supported.

A generated idea is never an approved project decision merely because it appears in a document.

## 3. Where notes belong

Use the existing folder structure. Do not invent parallel folder trees.

| Topic | Location |
|---|---|
| Other Roblox/game references | `docs/01-reference-games/` |
| JJK lore, characters, canon techniques | `docs/02-jjk-encyclopedia/` |
| Combat rules, hitboxes, neutral, parry, posture, netcode | `docs/03-combat/` |
| Damage, injuries, healing, RCT | `docs/04-damage-rct/` |
| R6 animation principles and move libraries | `docs/05-animation/` |
| VFX and SFX design / manifests | `docs/06-vfx-sfx/` |
| Playable technique specifications | `docs/07-techniques/` |
| Builds, mastery, rewards, economy, odds | `docs/08-progression/` |
| Roblox APIs, Studio workflows, Luau patterns | `docs/09-roblox-handbook/` |
| Owner-provided screenshots, clips, frame analysis | `docs/10-picture and video reference/` |
| World, quests, factions, bosses, narrative | `docs/11-world-story/` |
| Claude workflows and decision processes | `docs/12-claude-workflow/` |
| Reusable note formats | `templates/` |
| Actual project code | `src/` |
| Test plans and automated tests | `tests/` |

If no existing category fits, propose the smallest sensible location and explain why before creating a new top-level folder.

## 4. Note creation and editing rules

Before writing:
1. Search the vault for the topic, aliases, and related systems.
2. Read the most relevant existing note and its linked decision/source notes.
3. Decide whether to update, split, or create.
4. Check for contradictions and duplicate explanations.
5. Use the appropriate template when one exists.

Every substantive document must follow PROJECT_RULES.md:
- Status: STUB / DRAFT / RESEARCHED / IMPLEMENTED
- Purpose: one sentence
- Last reviewed: YYYY-MM-DD
- Sources: links or "none yet"
- Related: Obsidian wikilinks

End substantive notes with:
- **Implementation notes**
- **Testing criteria**
- **Open questions**

Keep notes focused on one coherent subject. A note should answer a clear question. If it becomes a large catch-all, split it by responsibility and leave a short overview with links.

Do not rewrite an entire note to make cosmetic improvements. Preserve useful details, source trails, and decision history. Make targeted edits.

## 5. Obsidian linking and navigation

- Use `[[wikilinks]]` for internal note references.
- Link concepts where they are first meaningfully discussed; do not link every repeated word.
- Add a **Related** line to substantive notes.
- Keep folder README/index notes as maps, not copies of every child note.
- When adding a new note, add it to the relevant index only if that index is intended to enumerate its contents.
- Prefer descriptive filenames: `parry-and-counterplay.md`, not `notes2.md`, `newcombat.md`, or date-only names.
- Avoid duplicate aliases and near-identical pages.

## 6. Research and evidence hygiene

For every externally sourced claim that may affect design or implementation, record:
- the exact claim,
- source title and direct URL,
- creator / publisher where available,
- access date,
- access depth (full source, excerpt, screenshot, first-hand play, etc.),
- confidence,
- label: OBSERVED, REPORTED, RECOMMENDATION, or UNVERIFIED.

For JJK information, use the canon labels from PROJECT_RULES.md and cite chapter/episode where known. Keep manga spoilers clearly marked. Keep GAME-ORIGINAL mechanics separate from canon.

Do not turn an inference into a fact. Do not invent timestamps, API signatures, asset IDs, drop rates, frame data, or undocumented behavior. If a video cannot be inspected, state that and request specific timestamps or screenshots rather than pretending to have watched it.

When research changes an existing conclusion, update the original note and preserve the old conclusion in a short decision/history entry if it matters.

## 7. Decision records

Record durable decisions where the relevant system is documented. Do not scatter the same decision across multiple files.

For important decisions, use a compact block:
- **Decision:** what was chosen.
- **Status:** APPROVED / PROPOSED / EXPERIMENT / DEPRECATED.
- **Reason:** why this choice is preferred.
- **Alternatives:** only serious alternatives considered.
- **Consequences:** systems, balance, content, performance, or production affected.
- **Date / source:** when and who decided.

Owner decisions must remain distinguishable from Claude recommendations. Do not silently change an APPROVED decision; propose a revision with reasons.

## 8. Token-efficient context loading

Do not read the entire vault at the start of every session.

**Startup minimum:**
1. `CLAUDE.md`
2. `PROJECT_RULES.md`
3. `FEATURE_STATUS.md`
4. The one relevant roadmap / architecture section
5. The exact system notes needed for the current task

Then follow wikilinks only when they contain a dependency or unresolved detail.

**Before implementation:** build a compact context pack containing:
- current approved requirements,
- relevant architecture/contracts,
- related implemented code locations,
- constraints and known bugs,
- acceptance criteria,
- unresolved decisions.

Do not paste whole source documents into prompts if a short excerpt or precise path is enough. Do not repeatedly summarize facts already recorded. Reuse the vault as persistent memory and keep the active context focused on the current milestone.

For a task outside the current system, do not preload combat, lore, progression, and story notes all at once. Load only what the task touches.

## 9. Session maintenance

At the end of a meaningful session:
1. Update only notes changed by new evidence, approved decisions, or implementation.
2. Update FEATURE_STATUS.md when feature state changes.
3. Update TECHNICAL_ARCHITECTURE.md only when architecture/contracts change.
4. Add research sources to RESEARCH_SOURCES.md when relevant.
5. Record new owner decisions in the relevant note.
6. Remove stale TODOs only when resolved; never erase unresolved questions.
7. Provide a short changed-files list and a concise handoff.

Do not create a session diary by default. Create one only when the owner asks for a journal or a long-running investigation genuinely needs a chronological record.

## 10. Git and synchronization discipline

The GitHub repository is a versioned copy of the local Obsidian vault, not a live sync guarantee.

- Pull before editing and inspect the latest version.
- Do not overwrite local changes or assume unpushed Obsidian edits are present on GitHub.
- Keep commits small and descriptive.
- Review diffs before committing.
- Never commit API keys, tokens, credentials, private account data, or unrelated personal vault material.
- Do not rename or move large groups of notes without checking links and paths.
- After a change, verify that the file exists at the expected path and that links still point to valid notes where possible.

## 11. Quality bar

A good vault is:
- **Findable:** useful notes can be located quickly.
- **Trustworthy:** facts, interpretations, and proposals are labelled.
- **Connected:** notes link to related systems without becoming a maze.
- **Lean:** no duplicated essays, chat dumps, or unnecessary indexes.
- **Actionable:** design notes contain rules, edge cases, acceptance criteria, and tests.
- **Maintainable:** future Claude sessions can understand the current state without rereading the entire project history.

Before creating or expanding a note, ask: "Will this help a future session make a better decision or implement/test a system?" If not, leave it out.

## Implementation notes

- Read this workflow when editing or organizing the Obsidian vault.
- It supplements CLAUDE.md, PROJECT_RULES.md, and the Agent Operating Standard.
- Keep this file concise; detailed system design belongs in the relevant system notes.

## Testing criteria

- [ ] Claude searches before creating notes.
- [ ] Existing notes are updated instead of duplicated.
- [ ] Substantive notes use the required header and closing sections.
- [ ] Canon, interpretation, game-original design, and unverified claims remain distinct.
- [ ] Session context is limited to the current milestone.
- [ ] Git changes are reviewed and synchronization state is not assumed.

## Open questions

- Should the owner prefer a particular Obsidian community plugin set, or keep the vault plugin-light for portability?
- Should chronological session logs be enabled for major milestone work only?
