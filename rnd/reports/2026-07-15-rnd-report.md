# R&D Report — 2026-07-15 (Cycle 1, full scan)

First full R&D cycle. Repo scanned in entirety; 6 parallel web-research agents
verified the assumption ledger (all sources checked 2026-07-15). No production,
publishing, or paid generation was triggered.

---

## 1. Executive feedback

**What is strong.** The safety/compliance architecture is genuinely good — the
review gate, the two-lock publishing design, AI-label preservation, the
"platforms punish absent humans" doctrine, and CPS Mode-A source rules all
survived verification and are *more* correct today than when written (YouTube's
Jan 2026 AI-slop channel terminations and Douyin's 53.8万-video takedown wave
prove the point). The track structure (EN / novel_cn / drama_cps / kids) still
matches how the market actually pays. Crash-resume via `project.json`, one seed
per episode, locked voices, and the hook-A/B default are the right production
instincts.

**What is weak.** The kit has never been run, and it shows in three ways:
(1) the install instructions produce a broken workspace (skills reference
`prompts/`, `templates/`, `scripts/` by relative path, but step 2 only copies
`project-workspace/`); (2) the QC script fails open on probe errors and
false-fails on legitimate outputs; (3) the learning loop — the thing §3 Stage 8
says compounds — has no mechanism that actually flows insights back into the
prompt/template files, and no structured performance data to learn from.

**The 3 things most limiting results right now:**
1. **The budget math is stale and silently dangerous.** MASTER-PLAN names
   "Seedance 2.0" as the backbone; Seedance 2.0 on fal now costs $0.24–0.30/s
   at 720p → **$14.50–21.80 per 60–90s video, 6–9× the $2.50 cap**. The $2.50
   cap only holds if drafts are pinned to Seedance 1.0 Pro Fast (~$0.022/s) or
   Seedance 1.5 Pro with audio off. Today, an honest first run either aborts at
   the cap check or (if a model is picked by name from the plan) blows it.
2. **The kit doesn't survive its own install instructions** (relative-path
   breakage above). Everything downstream is untestable until this is fixed.
3. **No performance schema, and the learnings loop doesn't close.**
   `published-log.md` holds one free-text 7-day line per video; nothing owns
   updating `prompts/` from `learnings.md`; trend-scout never reads learnings.
   Without this, week 6 output quality = week 1 output quality.

---

## 2. Verification results

Legend: ✅ still true · ⚠️ changed (old → new) · ❓ unverifiable without login.
All checked 2026-07-15. Full agent transcripts summarized in `rnd/ASSUMPTIONS.md`.

### fal.ai / generation

| # | Claim (location) | Verdict | Current fact | Source |
|---|---|---|---|---|
| G1 | "Seedance 2.0 … backbone" (MASTER-PLAN §0) | ⚠️ | Seedance 2.0 exists on fal (`bytedance/seedance-2.0/*` + `/fast/`) but is a **premium tier**: 720p $0.3034/s, fast $0.2419/s, 1080p $0.682/s → $14.50–21.80/video. Not usable under the $2.50 cap | fal.ai/models/bytedance/seedance-2.0/text-to-video |
| G2 | "$0.15–0.40/shot, $1.50–2.50/video" (MASTER-PLAN §5) | ⚠️ | Holds **only** on Seedance 1.0 Pro Fast ($1/M tokens ≈ $0.022/s; 720p 5s ≈ $0.11/shot; full video ≈ $1.75–2.65) or Seedance 1.5 Pro no-audio ($0.13/5s shot). Kit must pin the tier | fal.ai model pages |
| G3 | Seedance "mini/fast variants for B-roll" (§5) | ⚠️ | Seedance 1.0 **Lite is deprecated** (silently re-routed to Pro Fast, favorably). Cheap B-roll alternatives: LTX-2 Fast $0.04/s @1080p native audio; Wan 2.5 $0.05/s; Kling 2.5 Turbo Pro $0.07/s | fal.ai/pricing |
| G4 | fal MCP via npm `fal-ai-mcp` (§2.2) | ⚠️ | Package exists but is a one-day community project (all versions 2026-03-07, unmaintained). **Official hosted MCP `https://mcp.fal.ai/mcp`** (Bearer FAL_KEY; 9 tools incl. `get_pricing`, `recommend_model`) supersedes it | fal.ai/docs/documentation/setting-up/mcp |
| G5 | "fal-dashboard hard spend cap" (§0.5, preflight D) | ⚠️ | **No documented hard-cap feature.** Mechanisms: prepaid credits + account lock threshold. De-facto cap = load only $50 credit, don't auto-top-up | fal.ai/docs pricing/faq |
| G6 | TTS via fal (§3 Stage 3) | ✅ | Kokoro $0.02/1k chars (EN + Mandarin endpoints); MiniMax Speech 2.8 HD $0.10/1k (best CN narration, cloning, emotion); ElevenLabs Turbo $0.05/1k | fal.ai/learn TTS guide |

### TikTok

| # | Claim | Verdict | Current fact | Source |
|---|---|---|---|---|
| T1 | CRP: 18+, personal, 10k followers, 100k views/30d, >60s (§4, preflight A) | ✅ | Confirmed in program terms (updated Jan 2026); "at least 1 minute" | tiktok.com/legal (CRP terms) |
| T2 | CRP in ~10–12 countries, not MY/SEA; "SEA late 2026–2027" (preflight A) | ❓/⚠️ | Not-in-Malaysia/SEA ✅ solid. Exact list unverifiable — third-party trackers conflict (8 vs 12 countries). "SEA late 2026–2027" is **blog rumor, no official announcement** → downgrade wording | ttcalculator.net 2026-07-09 et al. |
| T3 | CRP RPM $0.40–1.20; "some sources report full-AI exclusions" (§4) | ⚠️ | 2026 reporting skews lower: **~$0.20–1.00, declining**. No official AI-exclusion rule; the real lever is the originality/quality bar ("original, high-quality, >1 min"). Keep hedged | miraflow.ai, benly.ai 2026 |
| T4 | TikTok AI label mandatory + C2PA auto-label (§6) | ✅ | Strengthened: CG revision eff. 2025-09-13 requires disclosure of "fully generated or significantly edited" content; C2PA auto-labeling since 2024 | newsroom.tiktok.com |
| T5 | "TikTok API ≈15 posts/day" (§3 Stage 7) | ✅ | Official: "typically around 15 posts per day/creator account", shared across all clients incl. manual. Unaudited API clients: SELF_ONLY visibility + 5 users/24h — audited aggregators (Upload-Post etc.) inherit their audit | developers.tiktok.com |
| T6 | Creative Center works without login (trend-scout §1) | ⚠️ | Trend Discovery browsing still free logged-out, BUT **hashtag search was removed (early 2024)** and full Keyword Insights metrics need a free TikTok-for-Business login | socialmediatoday.com |
| T7 | TikTok Shop MY affiliate (MALAYSIA-EDITION) | ✅ | Open; full Affiliate = 1,000 followers + MyKad/TIN; **new sub-1k "Program Affiliate Link" path** (link-share only). Commission per-product, typ. 5–20% | seller-my.tiktok.com (2026-02/03) |

### YouTube

| # | Claim | Verdict | Current fact | Source |
|---|---|---|---|---|
| Y1 | Shorts "<3 min" (§1, qc_check) | ✅ | "Up to 3 minutes" (since 2024-10-15). QC bound `<180s` is correct | support.google.com/15424877 |
| Y2 | YPP: 1k subs + 10M Shorts/90d or 4k hrs; entry tier 500 subs; MY available (preflight A) | ⚠️ | Full tier ✅; fan-funding tier also requires **3 valid public uploads in last 90d**; Shorts-feed watch time doesn't count toward 4k hrs. Malaysia ✅ on YPP list | support.google.com/72851, /13429240 |
| Y3 | Shorts pooled 45%, RPM $0.01–0.10; long-form $2–12 (§1, §4) | ✅ | Mechanics confirmed; RPM ranges still fair (Shorts global ~$0.01–0.07) | support.google.com/12504220 |
| Y4 | "altered/synthetic" disclosure (§6) | ✅/⚠️ | Requirement current. **New:** likeness detection (all YPP by Jan 2026, all adults from May 2026 — people can request removal of AI face/voice content); C2PA auto-labels | support.google.com/14328491; techcrunch 2025-10-21 |
| Y5 | "materially different from previous uploads" rule (§6) | ✅/⚠️ | Policy renamed "inauthentic content" (eff. 2025-07-15). AI itself doesn't disqualify; test = meaningful human input per video. **Enforcement now real: Jan 2026 wave terminated ~16 AI-slop channels (~35M subs)**; ongoing demonetizations | support.google.com/1311392; futurism.com |
| Y6 | COPPA "~$53k/violation" (§6) | ✅/⚠️ | $53,088 stands through 2026 (no 2026 adjustment). **Amended COPPA Rule full-compliance deadline passed 2026-04-22** — kids preset operates under the new rule now | ftc.gov; federalregister.gov 2026-07-07 |
| Y7 | -14 LUFS target (qc_check, §3 Stage 4) | ✅ | Still industry consensus for short-form; true peak ≤ -1.0 dBTP | criticallisteninglab.com et al. |

### Douyin / CN novel track

| # | Claim | Verdict | Current fact | Source |
|---|---|---|---|---|
| D1 | AI声明 law eff. 2025-09-01; stripping labels illegal (§6, CLAUDE.md) | ✅ | 《标识办法》confirmed; Douyin: unlabeled → 补标"疑似AI生成"+限流, repeat → 下架/封号. **Enforcement active: 53.8万 AI videos removed, 4,000+ accounts punished (2026-04); CAC app crackdown 2025-11** | cac.gov.cn; jiemian.com |
| D2 | 番茄达人: individuals → 抖音钱包, mainland 实名 required; 机构 → 对公 (preflight B) | ✅/❓ | Confirmed; exact foreigner path needs mainland login ❓ | zhihu/星图结算 |
| D3 | Commission ¥5–12/单, 番茄 ≈ ¥8 (§4) | ✅ | 番茄拉新 ~¥8 (some ¥10); 七猫 ≈ ¥7; weekly settlement (data Tue 22:00) | sohu 2026 |
| D4 | 关键词 4–8字; flow 选书→关键词→审核→发布→回填 (§2.4) | ⚠️ | Flow ✅ unchanged. Keyword length: **番茄 3–8字** (七猫 4–10). New detail: **回填 deadline 每周四 21:00**; keyword idle 28天 needs fresh content; 6-month validity | zhihu; csdn |
| D5 | 0粉 OK; 1000粉 for anchor link (preflight B) | ✅ | Confirmed | zhihu 2026 |
| D6 | Portals: 番茄/七猫/起点达人 (§2.4) | ✅/❓ | 番茄 ✅ self-serve; 七猫 ✅ mostly via 机构挂靠; "起点达人" self-serve portal ❓ not publicly verifiable | zhihu |
| D7 | 二/三级 scam warning (§2.4) | ✅ | Confirmed pattern (培训费/授权费/押金/扣量); official first-tier = free | ukezhitan 2026 |
| D8 | Verbatim novel text → 判重限流 (storyboard rule 6) | ✅ | Confirmed + Douyin 健康分 system (<80 限流). Also new: **纯AI-written novels banned on 番茄/七猫 (author side)** — doesn't hit 推文 but signals climate | opp2.com; zhihu |
| D9 | 红果短剧 via 番茄 ecosystem (§4) | ✅/⚠️ | Works (CPA ~¥7/单 official, ¥9+ first-tier). **But 短剧 supply side "一夜入冬" (2026-06): playback payouts −95%, AI剧保底 cancelled** — CPS 拉新 still pays; treat 红果 playback-revenue plays skeptically | 36kr 2026-06-04 |

### Drama CPS (Malaysia edition)

| # | Claim | Verdict | Current fact | Source |
|---|---|---|---|---|
| C1 | ReelShort/DramaBox/ShortMax/GoodShort/NetShort main apps (MALAYSIA-EDITION) | ⚠️ | Duopoly = DramaBox + ReelShort (~$140M IAP each Q1 2026). Rank shifted: NetShort #3 (+196%); **new: FreeReels (#1 downloads), ByteDance PineDrama + TikTok Minis** | Sensor Tower 2026 |
| C2 | Commission 30–70% recharge, USD via PayPal/Wise/Payoneer | ⚠️ | No official flat rates; observed 15–80% depending on channel/tier. RS Boost: rate varies per promotion page, withdrawal to bank card; Payoneer common; **Wise unconfirmed** | RS Boost ToS 2025-10-23 |
| C3 | Invitation-code gated; never pay to join | ⚠️/✅ | RS Boost signup is **open** (invite code optional, boosts rate). Others are distributor-channel gated ❓. "Paying = scam" strongly confirmed (CCTV coverage) | cps.reelshort.com |
| C4 | Official-library-only, no full episodes, tracking links + records | ✅ | Confirmed in RS Boost ToS (no re-dubbing/re-narrating; no use apart from promo links); industry piracy enforcement at scale | RS Boost ToS |
| C5 | SEA growth market; AI漫剧 rising format | ✅ | SEA = 32% of global downloads Q1 2026; Malaysia top-10 by downloads AND revenue. AI漫剧 overseas est. **$650M 2026 (6× YoY)**. Caveat: "AI魔改" cleanup delisted 1,718 AI短剧 since 2026-01 | Sensor Tower; 36kr; thepaper |
| C6 | (new) Platform friction | ⚠️ | TikTok is now a **competitor** (Minis/PineDrama), suppresses 搬运 drama clips, pays up to 20× for original → Mode B (original AI teaser) structurally favored over Mode A. **Meta 2026: Partnership Ads tag mandatory for affiliate content** — untagged = "Deceptive Practice" | kchuhai; 36kr; ALM/Meta |

### Posting / Claude ecosystem

| # | Claim | Verdict | Current fact | Source |
|---|---|---|---|---|
| P1 | Upload-Post MCP ~45 tools, TikTok/YT/IG (§2.3) | ✅/⚠️ | 45 tools / 12 platforms confirmed. Now also OAuth 2.1 + hosted `mcp.upload-post.com/mcp`. **Free tier = 10 uploads/mo**; real cadence ≈ $16/mo (annual) | docs.upload-post.com |
| P2 | Alternatives | ✅ | Blotato ($29/mo, hosted MCP); **Postiz (open-source, self-host free, official MCP)** = credible zero-cost fallback; Ayrshare now $299/mo (drop) | postiz.com; github |
| P3 | Scheduled tasks / Cowork (§2.5) | ✅/⚠️ | Cowork now on web + mobile beta (Jul 2026); scheduled tasks run remotely. **Local MCP plugins are desktop-only** — local ffmpeg steps need the desktop app | support.claude.com |
| P4 | CapCut MCP "CapCutAPI/VectCutAPI" (§3 Stage 4) | ⚠️ | Renamed: **VectCutAPI** (sun-guannan/VectCutAPI, active, MCP + REST, exports CapCut/Jianying drafts). Kinocut (87 tools) = strongest local ffmpeg MCP | github.com/sun-guannan/VectCutAPI |
| P5 | Skills best practices (both SKILL.md) | ✅/⚠️ | Kit skills follow the spirit. Current spec adds optional `compatibility` + `metadata.version` frontmatter; body <500 lines; `references/` one level deep | agentskills.io; platform.claude.com |

### ❓ Requires your login (batched for you)

1. **fal dashboard** — confirm whether any spend-cap/limit setting exists beyond prepaid balance (G5).
2. **RS Boost backend** — actual CPS rate shown per promotion page; withdrawal currency/rails for Malaysia (C2).
3. **番茄达人 backend** — current live 单价 for your vertical; foreigner/proxy payout reality (D2/D3).
4. **TikTok Creative Center logged-in** — depth of Keyword Insights with a free business login (T6).
5. **In-app CRP check** (only if you get access to an eligible-country account — otherwise moot).

---

## 3. Findings (issues & opportunities, with evidence and location)

**F1 — Budget/model mismatch (CRITICAL).** MASTER-PLAN §0 sells "Seedance 2.0"
as backbone; §5's per-shot math only works on Seedance 1.0 Pro Fast / 1.5 Pro
no-audio (see G1–G3). Nothing in `skills/ai-video-producer/SKILL.md` Step 4 or
`prompts/storyboard-master-prompt.md` pins a model tier or feeds live pricing
into `estimated_cost_usd`. **Fix:** pin draft/final/B-roll model IDs in one
place (config.md), update §5 math, use fal MCP `get_pricing` at pre-flight.

**F2 — Install instructions produce a broken workspace (CRITICAL).**
README step 2 + MASTER-PLAN §2.1 copy only `project-workspace/` + CLAUDE.md;
skills call `prompts/…`, `templates/…`, `scripts/qc_check.sh` by relative path
(e.g. SKILL.md Step 3/5.5/0); README:14 even warns to keep the folder names —
but those folders never arrive in the workspace. **Fix:** copy the whole kit
(or `prompts/ templates/ scripts/` into the workspace) and say so explicitly.

**F3 — `scripts/qc_check.sh` is fail-open and false-fails legitimate output.**
Observed live on this machine (no ffmpeg installed): raw `command not found`
spew, and probe failures skip the FAIL branch instead of failing (`[ "" -le 60 ]`
errors → test false → no FAIL recorded). Additional defects: duration truncation
(`cut -d. -f1`) false-fails a 60.5–60.9s TikTok cut; exact-integer 9:16 check
fails encoder-rounded resolutions (e.g. 704×1248); blackdetect false-fails the
intentional 黑屏 cliffhanger the novel_cn template N4 *requires*; `longform`
gets no 16:9/duration check; no resolution check (720p draft vs 1080p final
indistinguishable); no dependency/file-exists guard. Also: **ffmpeg is not
installed on this machine** — Stage 4/5 can't run at all until it is.

**F4 — Storyboard JSON contract gaps** (`prompts/storyboard-master-prompt.md`).
Track enum on line 9 omits `drama_cps` (its rule 7 exists but the enum
contradicts it); no structure for the hook A/B variants the producer skill
mandates (Step 3); no per-shot `seed`/`model` field (T4 template says "use
cheap/fast model variant" — unexpressable); rule 7 demands tracking-link
placement text in metadata but the schema has no field for it;
`douyin_ai_shengming` not marked track-conditional (MALAYSIA-EDITION says it
does NOT apply to drama_cps).

**F5 — The learnings loop doesn't close.** Producer Step 2 reads TOP ACTIVE
INSIGHTS ✅, but no step owns propagating insights into `prompts/` templates;
trend-scout never reads `logs/learnings.md`; `learnings.md` lacks the scaffold
CLAUDE.md mandates (and "append-only" header contradicts the maintained
TOP-10 section). rnd-master-prompt called this out as a top finding: confirmed.

**F6 — No per-video performance schema.** `published-log.md` = one free-text
7-day line. No structured views/retention/conversion capture, no A/B result
tracking beyond hooks, no retention-curve analysis prompt. The weekly Stage 8
task has nothing rigorous to write into or read from.

**F7 — Unowned workflows.** Monthly long-form compilation (the "$2–12 RPM
prize", §1) has no skill/step/template; no thumbnail/cover workflow (Douyin
封面, Shorts frame, TikTok cover text); no kill criteria for underperforming
tracks/formats.

**F8 — Empty-shell state files.** `spend.md` and `competitors.md` have no row
schema; `learnings.md` no scaffold. Cheap to fix, high compliance/ops value.

**F9 — Stale platform facts** (full list in §2): RPM ranges, CRP country
wording, SEA rumor, Shorts "up to 3 min", fan-funding 3-uploads condition,
关键词 3–8字, 回填周四21:00 deadline, COPPA amended rule in force, Upload-Post
free-tier limits, unaudited-API constraints, Creative Center hashtag-search
removal, VectCutAPI rename, fal-ai-mcp npm → hosted MCP, no fal hard cap,
Seedance Lite deprecated.

**F10 — Environment shifted around the kit (risk + opportunity).**
Risk: YouTube likeness detection + inauthentic-content enforcement wave;
Douyin enforcement quantified; Meta Partnership-Ads tag now mandatory for
affiliate content (directly hits drama_cps FB/IG posts — not mentioned
anywhere in the kit); TikTok turned competitor in short-drama and suppresses
搬运 clips (weakens Mode A on TikTok specifically). Opportunity: AI漫剧 promo
confirmed as a $650M/6×-YoY wave = exactly Mode B + this pipeline's sweet spot;
FreeReels/NetShort/PineDrama = new low-saturation portals; Cowork remote
scheduled tasks fit the daily/weekly loops.

**F11 — Cosmetic.** Stage numbering drift (MASTER-PLAN Stage 4=assemble,
5=QC vs skill Step 5=assemble, 5.5=QC); skills could add `compatibility` +
`metadata.version` frontmatter per current spec.

---

## 4. Prioritized R&D backlog

Ratings: Impact/Effort H/M/L · Costs money Y/N.

### 🔧 Quick wins

| ID | What | Why | Files | Impact | Effort | Risk | $ |
|---|---|---|---|---|---|---|---|
| Q1 | Pin generation model tiers (drafts = `fal-ai/bytedance/seedance/v1/pro/fast`, B-roll = LTX-2 Fast or Seedance fast, finals = 1080p same tier) + rewrite §5 budget math + add "query fal MCP `get_pricing` at pre-flight" | $2.50 cap is currently fiction (F1) | MASTER-PLAN §0/§2.2/§5, producer SKILL.md Step 4, storyboard prompt, config.md | H | L | L | N |
| Q2 | Fix install: copy `prompts/ templates/ scripts/` into workspace (README step 2, §2.1) | Kit breaks at runtime (F2) | README.md, MASTER-PLAN §2.1 | H | L | L | N |
| Q3 | Harden `qc_check.sh`: dep/file guards, fail-closed on probe errors, float-safe duration, aspect tolerance (±2%), longform 16:9+duration, resolution report, opt-in flag for intentional trailing black | QC gate is fail-open (F3) | scripts/qc_check.sh | H | M | L | N |
| Q4 | Platform-facts refresh sweep (all F9 items) incl. Meta Partnership-Ads rule + COPPA amended-rule note + 回填周四 deadline | Stale facts → wrong decisions & compliance gaps | MASTER-PLAN §2.2/§2.3/§4/§6, MALAYSIA-EDITION, preflight-checklist, both SKILL.md, shot-templates-novel-cn/drama-cps | H | M | L | N |
| Q5 | Storyboard contract fixes: add `drama_cps` to enum, hook A/B structure, per-shot `seed`+`model`, tracking-link metadata field, track-conditional AI toggles | Contract contradicts the skill that runs it (F4) | prompts/storyboard-master-prompt.md | M | L | L | N |
| Q6 | Seed state files: learnings.md scaffold (TOP ACTIVE INSIGHTS + archive), spend.md row schema + monthly total, competitors.md row format | Empty shells block the habits (F8) | project-workspace/logs/*, research/competitors.md | M | L | L | N |

### 🏗️ Structural

| ID | What | Why | Files | Impact | Effort | Risk | $ |
|---|---|---|---|---|---|---|---|
| S1 | Per-video performance schema (`logs/performance.md` table or CSV: id, track, hook A/B, length, 24h/72h/7d views, watch %, completion, conversions, revenue) + producer Step 8 writes it | Nothing to learn from otherwise (F6) | new log file, producer SKILL.md Step 7/8, published-log template | H | M | L | N |
| S2 | Close the loop: weekly analytics step must end with "propose template/prompt edits from insights (diff, ask approval)"; learnings entries get `applied→file@date` field; trend-scout reads TOP ACTIVE INSIGHTS | Insights must reach `prompts/` (F5) | producer SKILL.md Step 8, trend-scout SKILL.md, learnings.md scaffold | H | M | L | N |
| S3 | Monthly long-form compilation workflow (new framing narration, 16:9, chapters, QC longform) | The stated RPM prize is unowned (F7) | producer SKILL.md (new step or reference file), qc_check.sh longform | M | M | L | N |
| S4 | Thumbnail/cover workflow per track (cover frame choice, text overlay, Douyin 封面 3-word hook; cheap image model) | CTR lever completely absent (F7) | new prompts/cover-templates.md, producer Step 5 | M | M | L | N |
| S5 | Mode-B-first repositioning of drama_cps for TikTok (Mode A demoted to FB/YT where friction is lower; Meta posts get Partnership-Ads note) | TikTok suppresses 搬运 clips; AI漫剧 wave favors Mode B (F10/C6) | MALAYSIA-EDITION, shot-templates-drama-cps.md, trend-scout | M | L | M (strategy) | N |

### 🧪 Experiments (need spend — each within caps, logged to spend.md)

| ID | What | Why | Impact | Effort | Risk | $ |
|---|---|---|---|---|---|---|
| E1 | Model bake-off: same 2 shots on Seedance v1 Pro Fast vs LTX-2 Fast vs Wan 2.5 (9:16, 720p) | Pick draft + B-roll tiers on evidence | H | L | L | Y ~$2 |
| E2 | TTS bake-off: Kokoro vs MiniMax Speech 2.8 HD (CN) / Kokoro vs ElevenLabs Turbo (EN); lock voice-sheet entries | Voice = channel identity; choose before first upload | M | L | L | Y <$1 |
| E3 | End-to-end throwaway run (1 video, no publish) once Q1–Q3 land | Validates pipeline + real cost actuals | H | M | L | Y ≤$2.50 |

### 🔁 Recurring checks (encoded in rnd/ASSUMPTIONS.md cadences)

| ID | What | Cadence |
|---|---|---|
| R1 | fal pricing via MCP `get_pricing` (drafts tier + horizon) | monthly |
| R2 | TikTok CRP countries/terms + RPM reporting | monthly |
| R3 | CPS portal rates/rules + app landscape (FreeReels/PineDrama movement) | monthly |
| R4 | Douyin AI-label enforcement + 推文 rates | monthly |
| R5 | COPPA/AI-labeling law changes; skills-spec changes | quarterly |
| R6 | Upload-Post plan limits/pricing | quarterly |

---

## 5. Open questions (numbered; my recommendation marked ★)

**Q-A. Model pinning (backlog Q1)**
1. ★ Pin drafts+finals to Seedance 1.0 Pro Fast, B-roll to LTX-2 Fast; Seedance 2.0 documented as opt-in premium (breaks $2.50 → needs your per-run approval).
2. Seedance 1.5 Pro no-audio drafts (slightly better quality, ~$2.00–3.05/video — brushes the cap).
3. Raise the per-video cap to ~$15–20 to use Seedance 2.0 as the plan currently implies.

**Q-B. Install-layout fix (backlog Q2)**
1. ★ Docs-only fix: README/§2.1 say "copy the whole kit folder; point Cowork at it; `project-workspace/` is your working state inside it".
2. Restructure the repo so `prompts/ templates/ scripts/` physically live under `project-workspace/` (bigger diff, breaks kit/workspace separation).

**Q-C. Posting service**
1. ★ Keep Upload-Post (free 10/mo for testing → ~$16/mo when publishing starts).
2. Document Postiz self-host as primary (free, but you run infra).
3. Blotato ($29/mo).

**Q-D. drama_cps strategy after the 短剧 winter + TikTok friction findings**
1. ★ Keep drama_cps primary but Mode-B-first on TikTok (backlog S5), Mode A mainly on FB/YT; start with RS Boost (open signup, no invite needed).
2. Also apply to newer low-saturation portals (FreeReels/NetShort) — needs distributor-channel contact.
3. Deprioritize CPS; lean YPP + TikTok Shop MY.

**Q-E. Kids preset under the amended COPPA Rule (in force since 2026-04-22)**
1. ★ Keep preset but add a "new-COPPA in force" warning + re-verify checklist item before first kids video.
2. Freeze the kids preset until you decide to actually run that track.

**Q-F. Your logins needed (can't verify from here)** — see ❓ list at end of §2:
fal dashboard cap · RS Boost backend rates · 番茄达人 backend · Creative Center
logged-in depth. Worth 20 minutes before the first paid run.

---
*Next cycle: type `/rnd` (skill installed this cycle). It will delta-scan, re-verify only due/volatile assumptions (see rnd/ASSUMPTIONS.md), and refresh rnd/BACKLOG.md.*
