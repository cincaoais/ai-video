# AI Video Side-Income Pipeline — Master Plan
### Fully automated production · Human-approved publishing · Claude Cowork edition · **v1.2**
*Malaysia users: read MALAYSIA-EDITION.md after §0.5 — it adds a `drama_cps` track;
all China-track material below remains valid and unchanged.*
*Research compiled July 2026. Re-verify platform policies before launch — they change fast.*

---

## 0. Your configuration (locked from our discussion)

| Setting | Value |
|---|---|
| Priority track | **TikTok/Shorts trending (EN)**, with **Chinese novel 推文 (Douyin)** as parallel track; kids preset kept as optional third |
| Budget | Flexible, soft cap **US$50/month** on generation (≈ 15–25 finished videos). Per-video hard cap: **$2.50** |
| Generation backbone | **fal.ai** (pay-per-use, official + community MCP, Seedance 2.0 and 1,000+ models) |
| Publishing | EN: posting-service MCP (Upload-Post or similar) after your approval · CN: manual upload package for Douyin |
| Your workload | Stage 0 input (~1 min) + Stage 6 review (~5–10 min) per video |

---

## 0.5 PRE-FLIGHT — do this before anything else
Work through `templates/preflight-checklist.md` (~30–45 min, the single source of
detail) and write the verdicts into `research/config.md`. The two that shape everything:

**EN verdict — TikTok Creator Rewards is geo-locked.** Not physically in an eligible
country (VPN = ban) → EN revenue pivots to YouTube YPP + TikTok Shop/affiliate +
brand deals/client work; TikTok stays as the free A/B-testing and growth ground.

**CN verdict — payouts need a mainland settlement path.** Own 实名, trusted mainland
partner, or a reputable 机构 — none available → drama_cps or skip CN. 0 followers is
enough to start.

**Plus:** account warm-up week (养号), fal-dashboard hard spend cap (second lock),
and side income is generally taxable in your jurisdiction.

---

## 1. Architecture overview

```
 YOU                    CLAUDE COWORK (automatic)                          YOU        CLAUDE
┌──────┐   ┌─────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐   ┌────────┐ ┌─────────┐
│Stage0│ → │ Stage 1  │→│ Stage 2  │→│ Stage 3  │→│ Stage 4–5 │ → │Stage 6 │→│ Stage 7 │
│prompt│   │ research │ │ script + │ │ generate │ │ assemble  │   │REVIEW  │ │ publish │
│ or   │   │ (trend-  │ │storyboard│ │ clips    │ │ captions  │   │GATE ✋ │ │ + log   │
│screen│   │  scout)  │ │  (JSON)  │ │ (fal MCP)│ │ + QC      │   │approve │ │         │
│ shot │   └─────────┘ └──────────┘ └──────────┘ └──────────┘   └────────┘ └─────────┘
└──────┘                                                                        ↓
                          ┌──────────────── Stage 8: scheduled analytics loop ──┘
                          │  weekly: pull performance → update learnings.md
```

**One 9:16 master file per topic** fans out to: TikTok (>60s cut for Creator Rewards) →
YouTube Shorts (<3 min) → optionally IG/FB Reels. Monthly: stitch best episodes into a
10–15 min long-form YouTube compilation **with new framing narration** (that's where
$2–12 RPM lives, vs $0.01–0.10 on Shorts).

For the CN novel track the fan-out is: Douyin (primary) → 快手/小红书/视频号 (optional
re-posts), with the 关键词 in title/comment and the video link backfilled (回填) in the
达人 center.

---

## 2. One-time setup (~60–90 minutes)

### 2.1 Claude side
1. Install **Claude Desktop** (Pro/Max plan required for Cowork). Open the Cowork tab.
2. Create a project folder on disk — copy the `project-workspace/` folder from this kit.
   Point Cowork at it as the project folder.
3. Copy `CLAUDE.md` (from this kit) into the project root. Cowork reads it every session.
4. Install the two skills: copy `skills/ai-video-producer/` and `skills/trend-scout/`
   into your Cowork skills location (Settings → Capabilities → Skills → upload, or the
   skills folder on disk, depending on your version). Verify they appear in the skills list.

### 2.2 Video generation (fal.ai)
5. Create account at fal.ai → Dashboard → API Keys → create key. Add ~$20 credit.
6. Add a fal MCP server to Claude Desktop config
   (`claude_desktop_config.json` → macOS: `~/Library/Application Support/Claude/`,
   Windows: `%APPDATA%\Claude\`):
```json
{ "mcpServers": {
    "fal-ai": {
      "command": "npx", "args": ["-y", "fal-ai-mcp"],
      "env": { "FAL_KEY": "YOUR-FAL-KEY" } } } }
```
   (Any of the maintained community fal MCP servers works; fal's hosted server at
   `https://mcp.fal.ai/mcp` is the alternative once your client supports its auth.)
7. Test in a Cowork chat: *"Search fal models for seedance and show pricing for a
   10-second 720p generation."* You should see live model data.

### 2.3 Publishing (EN platforms)
8. Sign up for a multi-platform posting service with an MCP server (e.g. Upload-Post —
   ~45 tools covering TikTok, YouTube, Instagram; get API key from their dashboard).
   Connect your TikTok + YouTube accounts inside their app (their OAuth, already
   platform-audited). Add their MCP to your config with your API key.
9. **Set this connector to "always ask permission"** in Claude's connector settings.
   This is your second safety lock on publishing.
10. For Douyin: no connector. The pipeline produces `output/<project>/douyin-package/`
    with video + title + 简介 + keyword text; you upload at 抖音创作者服务平台
    (creator.douyin.com) and tick the **AI 内容声明** toggle. ~3 minutes.

### 2.4 CN novel track accounts (one-time)
11. Register at an official 达人 portal (番茄达人 / 七猫达人 / 起点达人) or join a
    reputable **一级授权** team. Avoid 二/三级 middlemen (commission-skimming is the #1
    reported scam in this niche).
12. Learn the portal flow once: pick novel → apply unique 关键词 (4–8 chars, must not
    duplicate) → wait approval → verify keyword is searchable in the reading app →
    publish video → **回填** the video link in the portal. The skill scripts everything
    except the portal clicks.

### 2.5 First run & schedules
13. Test end-to-end with a throwaway topic. Check every stage output in `output/`.
14. Schedule tasks (type `/schedule` in Cowork): **trend-scout** daily 08:00;
    **analytics loop** weekly Sunday. Scheduled tasks run remotely (your computer can
    be off) — which is why the publishing connector should be a hosted service.

---

## 3. Stage-by-stage specification

### Stage 0 — Input (you)
Any of: a one-line topic · a screenshot (client brief, competitor video, trending page)
· "use today's trend brief" · a novel name + chapter range (CN track). The skill asks at
most one round of intake questions and only for what it can't infer.

### Stage 1 — Research (auto)
Reads today's `research/briefs/` file if present, else invokes trend-scout inline.
Reads `logs/learnings.md`. Confirms topic is brand-safe and IP-clean.

### Stage 2 — Script + storyboard (auto)
Runs `prompts/storyboard-master-prompt.md`. Output = one JSON storyboard file: shots
(4–15s each, fully self-contained prompts), dialogue/SFX per shot, metadata (titles,
description, hashtags, platform toggles), estimated cost. Hard rule: hook lands inside
2 seconds; TikTok master cut must exceed 60 seconds (Creator Rewards requirement).

### Stage 3 — Generate (auto, fal MCP) — with crash recovery
`output/<project>/project.json` tracks each shot (pending/generated/qc_pass/
approved); any interrupted run RESUMES instead of regenerating. Hook A/B by
default: two shot-1 variants; TikTok tests A vs B, the 48h winner becomes the
Shorts/Douyin version. Per shot: seed locked per episode, character refs passed
as @Image1 style references, **720p drafts first**, voice locked per account in
`assets/voice-sheet.md`. Retry budget: max 2 regenerations per shot, then flag
for your review. Abort the run if projected spend exceeds the $2.50 cap. TTS
narration and BGM via fal audio models (original audio also protects your Shorts
revenue share — licensed music splits the pool allocation).

### Stage 4 — Assemble (auto, ffmpeg)
Concat → loudness normalize → burned captions (track-specific style) → export 9:16
master + 16:9 variant + platform cuts. Phase-2 optional upgrade: community CapCut MCP
(CapCutAPI/VectCutAPI) builds a CapCut draft instead, letting you polish by hand —
which also strengthens your "human editing" evidence.

### Stage 5 — Automated QC
Every export runs `scripts/qc_check.sh`: duration bounds per platform cut, 9:16
aspect, audio present, loudness ≈ -14 LUFS, black-frame scan, metadata check
(assembly uses `-map_metadata 0` so AIGC provenance is never stripped). You review
creative quality; the script catches technical defects.

### Stage 6 — Review gate (YOU — never skipped)
Claude presents: final drafts, metadata, cost actuals, and the compliance checklist
(see §6). You reply **approved** / list fixes / **kill**. Approved shots re-render at
1080p if drafts were lower. Your edits are logged to `logs/published-log.md` — this is
your human-authorship evidence file.

### Stage 7 — Publish (auto after approval)
EN: posting MCP with the exact approved metadata + disclosure toggles
(YouTube "altered/synthetic content", TikTok AI label, made-for-kids where true).
CN: writes the Douyin upload package; you upload manually and tick AI 声明; then Claude
reminds you to 回填 the link. Respect caps: TikTok API ≈15 posts/day; start at 1–2/day
per platform anyway (new-account trust building).

### Stage 8 — Learn (scheduled)
Weekly: pull analytics (posting-service MCP / your screenshots for Douyin), identify
best hooks & formats, retire losers, append to `logs/learnings.md`. The storyboard
prompt reads this file — the loop is what compounds.

---

## 4. Platform economics cheat-sheet (2026, re-verify at launch)

| Platform | Gate | Pay mechanism | Realistic rate |
|---|---|---|---|
| TikTok Creator Rewards | 10k followers + 100k views/30d; videos >1 min; AI label required | RPM on qualified views | ~$0.40–1.20 /1k views (some sources report full-AI exclusions — verify in-app terms) |
| YouTube Shorts | YPP: 1k subs + 10M Shorts views/90d OR 4k watch-hrs (entry tier 500 subs) | pooled, 45% after music fees | ~$0.01–0.10 /1k views |
| YouTube long-form | same YPP | per-impression ads | $2–12 RPM (the real prize) |
| YouTube made-for-kids | quality principles + COPPA | contextual ads only | ~$1–3 RPM; brand deals are the true revenue |
| Douyin 推文 (CN novel) | 授权 + unique 关键词 | commission per conversion | ~¥5–12 /单 (番茄 ≈ ¥8) — pay-per-conversion, uncorrelated with follower count |
| 红果/短剧推广 | authorization via 番茄/巨量 ecosystem | promo commission / 分账 | verify current terms in the 达人 portal |

**Strategic read:** the CN 推文 track can pay from day one (no follower threshold);
the EN track is a 3–6 month compounding build toward Creator Rewards + YPP + brand
deals. Run both: 推文 funds the runway, EN builds the asset. Fastest EN cash remains
client work — selling this pipeline's output at $50–200/video.

---

## 5. Budget model (soft cap $50/month)

Per finished 60–90s video: 6–10 shots × $0.15–0.40 (Seedance via fal, 720p draft
workflow) + ~30% retries + TTS/BGM ≈ **$1.50–2.50**. Monthly at $50 → ~20–25 videos
→ ~5–6 uploads/week across tracks. Cost levers the skill already uses: draft-res
review, per-shot retry cap, Seedance *mini/fast* variants for B-roll shots, reusing
character stills instead of re-describing, and one seed per episode.

---

## 6. Compliance checklist (embedded in the skill; summarized here)

**Every video:** ☐ human edits logged ☐ AI disclosure toggle correct per platform
☐ no copyrighted characters/music/IP resemblance ☐ materially different from our
previous uploads (YouTube "inauthentic content" is a channel-level penalty)
☐ no real-person likeness.

**Kids preset extra:** ☐ made-for-kids designation correct (COPPA is a legal duty,
penalties up to ~$53k/violation) ☐ calm pacing, no chase/threat/panic, nothing
dangerously imitable ☐ passes YouTube kids quality principles.

**CN track extra:** ☐ 授权 valid, keyword approved & searchable ☐ Douyin AI 内容声明
ticked (law since 2025-09-01; unlabeled AI risks 限流/下架/封号) ☐ never strip AI
watermarks/metadata (explicitly illegal) ☐ 回填 done ☐ content isn't 低俗/虚假 bait.

**The doctrine:** platforms don't punish AI — they punish *absent humans*. Your review
gate, logged edits, recurring characters, and analytics-driven variation are what keep
every channel monetizable.

---

## 7. Phased rollout

**Phase 0 (week 0) — pre-flight + warm-up:** resolve §0.5 verdicts into research/config.md; 养号 warm-up on all accounts.
**Phase 1 (weeks 1–2) — calibrate:** 8–10 videos, watch every stage, tune shot
templates, don't chase volume. Get CN 授权 sorted in parallel.
**Phase 2 (weeks 3–6) — full pipeline:** daily trend brief, 4–6 uploads/week, start
the published-log habit, first Douyin 推文 conversions.
**Phase 3 (month 2+) — compound:** analytics loop drives format choices; introduce a
recurring character/IP on the EN side; monthly long-form compilation; consider client
offers; revisit budget only when a track proves ROI.

---

## 8. Kit contents

See README.md for the install order; the folder itself is the file map
(`skills/`, `prompts/`, `templates/`, `scripts/`, and `project-workspace/` —
the last one is what you copy out as your Cowork project folder).
