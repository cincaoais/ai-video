# Operator Runbook — config double-check + how to make a video

Two parts: **Part 1** verifies every piece of your setup (all MCPs included).
**Part 2** is the plain-language walkthrough of making one video end to end.

---

## Part 1 — Configuration double-check

### 0. Your status right now (2026-07)
| Item | State |
|---|---|
| Git repo + Git for Windows | ✅ done |
| Kit copied into `project-workspace/` (prompts, templates, scripts, CLAUDE.md) | ✅ done |
| 2 skills installed in Cowork | ✅ done |
| Cowork folder → `...\ai video\project-workspace` | ✅ done |
| Test 1 (Cowork reads workspace) | ✅ passed |
| ffmpeg installed | ⚠️ installed — verify after reopening shell |
| **fal.ai MCP connector** | ❌ not added yet |
| **Posting MCP connector** | ❌ not added (only needed to auto-publish EN) |
| **`research/config.md` gate filled** | ❌ not filled — blocks all production |

### A. Local machine (needed before any generation)
Reopen **Git Bash**, then run:
```bash
ffmpeg -version    # expect: ffmpeg version …
ffprobe -version   # expect: ffprobe version …  (qc_check needs this too)
bash scripts/qc_check.sh   # expect a USAGE error = script + ffmpeg OK
```
If `qc_check.sh` throws `bad interpreter: /bin/bash^M` → line-ending issue, tell Claude Code (a `.gitattributes` fixes it).

### B. MCP connectors — the "all the MCPs" check
There are only **two**. Add them in **Claude Desktop → Settings → Connectors → Add custom connector**.

**1. fal.ai — video generation (REQUIRED to make anything)**
- URL: `https://mcp.fal.ai/mcp`
- Auth header: `Authorization: Bearer YOUR-FAL-KEY`
- Use fal's **official hosted** server only (avoid community npm ones).
- Fund the fal dashboard + **set the hard spend cap there** (this is a pre-flight verdict too).
- ✅ Verify — paste in Cowork:
  `Search fal models for seedance and get_pricing for fal-ai/bytedance/seedance/v1/pro/fast at 720p.`
  Working = live model data + a price.

**2. Posting service — publishing (only needed to auto-post EN; skip for now if testing)**
- e.g. Upload-Post (`mcp.upload-post.com/mcp`), or Blotato / Postiz.
- Connect your TikTok + YouTube accounts inside *their* app (their OAuth).
- **Set this connector to "always ask permission"** in Claude's connector settings — your 2nd publish lock.
- ✅ Verify — paste in Cowork: `List the accounts connected in my posting service.`

**Douyin = NO connector.** The pipeline builds a `douyin-package/` folder; you upload manually at creator.douyin.com and tick the **AI 内容声明** toggle.

### C. Cowork wiring (verify once)
- Folder points at `project-workspace` — ✅ (shown in your Cowork header).
- `CLAUDE.md` sits in that folder — ✅ (Test 1 proved Cowork reads it).
- Both skills appear in Settings → Capabilities → Skills — ✅.

### D. THE GATE — `research/config.md`
Nothing generates until every pre-flight verdict is filled (hard rule #7). Fill these (30–45 min) using `templates/preflight-checklist.md`:
- Regions & language (EN region, CN vertical — pick ONE, output languages)
- Creator Rewards eligible? → sets EN revenue model
- CN payout path (own 实名 / partner / 机构 / drama_cps / SKIP)
- drama_cps portal approved + tracking link tested in target geo?
- fal dashboard hard cap set = $?
- Warm-up week done? (TikTok / Douyin / YT)

---

## Part 2 — How to make an AI video

### The three locks (always on, in this order)
1. **Config gate** — no production until `config.md` verdicts are filled.
2. **QC** — every export must pass `scripts/qc_check.sh` before you see it.
3. **"approved"** — nothing publishes until you literally type `approved`. No urgency shortcut overrides this.

### Tracks (tell Cowork which, or it infers)
`tiktok` (default EN) · `novel_cn` (小说推文, Douyin) · `drama_cps` (短剧出海, Malaysia) · `kids` · `client`.

### Caps
**$2.50 per video**, **$50/month soft**. Cowork logs spend after each batch and pauses if a projection would blow the cap. Premium models (e.g. Seedance 2.0) need your explicit OK after it shows the cap math.

### The flow — what Cowork does vs what you do
| Step | Cowork does | You do |
|---|---|---|
| 0 Pre-flight | Checks `config.md` + resumes `project.json` | Fill the gate (first run only) |
| 1 Intake | Infers track/length/style; asks ONE round of gaps | Answer the gaps |
| 2 Research | Reads today's trend brief + TOP ACTIVE INSIGHTS; brand-safety/IP check | — |
| 3 Script + storyboard | Writes storyboard, **two hook variants (A/B)** | — |
| 4 Generate (fal) | 720p drafts, character refs, one seed/episode, logs spend | — |
| 5 Assemble (ffmpeg) | Concat, -14 LUFS audio, burned captions, exports **keeping metadata** | — |
| 5.5 QC | Runs `qc_check.sh` on every export, fixes failures | — |
| 6 **Review gate** | Shows videos, cost, QC results, disclosure checklist | **Review, then type `approved` (or ask for changes)** |
| 7 Publish | EN via posting MCP (≤2/day/platform); hands you the Douyin package | Confirm; upload Douyin manually; tick AI label |
| 8 Learn | Weekly: pulls analytics, updates `logs/learnings.md`, proposes template diffs | Drop 达人后台 / CPS screenshots into `research/*-weekly/` |

### How to actually start one (after the gate is filled)
Paste into Cowork, e.g.:
- `Make today's TikTok video about <topic>.`
- `推文 for <novel name> on 番茄, keyword approved.`
- `drama_cps Mode B teaser for <drama> on TikTok, tracking link ready.`
- Or just `What should I make today?` → runs trend-scout first, then produce from a brief.

At Step 6 you'll get the videos + cost + checklist. Reply `approved` only when you're happy — that's the one word that unlocks publishing.

### First real run
Do a **throwaway topic end-to-end** first: watch every stage output land in `output/<project>/`, confirm QC passes, confirm the review gate blocks publishing until you approve. Then set the daily trend-scout + weekly analytics schedules.
