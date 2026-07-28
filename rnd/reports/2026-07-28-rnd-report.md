# R&D Report — 2026-07-28 (Cycle 2: ViMax study + advancement scan)

Trigger: user request to study github.com/HKUDS/ViMax and scan for pipeline
advancement directions. 4 ViMax research agents + 4 R&D agents (generation
techniques, OSS pipeline features, platform trends, audio/captions/post) ran
2026-07-28. No production, publishing, or paid generation was triggered.
Full agent findings condensed here; prices verified on fal.ai pages where
noted, otherwise flagged.

---

## 1. Executive summary

**ViMax verdict:** don't adopt (cloud-API orchestrator, $4–40+/video — breaks
our $2.50 cap; research-grade reliability; no QC/compliance/publish layer).
**Steal three techniques** instead, all validated affordable on fal.ai:
1. First/last-frame keyframing (image → image-to-video per shot)
2. Shot chaining (last frame of shot N → first frame of shot N+1, with a
   cheap image-model "re-mint" at each handoff to stop drift)
3. Reference-image character consistency (hero-shot tier via Kling 3.0
   `elements`; our @Image1 sheet workflow stays the default)

**Decisive cost fact (verified):** a 30s/6-shot video via keyframe chaining =
~$0.93 ($0.28 boundary images on FLUX Kontext pro @ $0.04/img + $0.65
image-to-video on pinned Seedance v1 Pro Fast @ $0.0216/s). Fits the $2.50 cap
with per-shot retries. Native multi-shot alternatives (Kling 3.0 multi_prompt
$3.36/30s, Seedance 2.0 reference-to-video ~$7.26/30s) do NOT fit the cap.

**Platform reality check (2026):** the top-ranked levers for views/revenue are
(1) systematic hook A/B (already ours) + hook scoring, (2) captions/subtitle
styling, (3) visual consistency — which is now a MONETIZATION issue: YouTube's
"inauthentic content" policy (Jul 2025, clarified Jul 2026) demonetizes
generic/templated AI content; consistency reads as "produced". Resolution
ranked LAST — do not spend cap budget on 1080p.

**Strategy signal (advisory, user decision):** 小说推文 is saturated and Douyin
subsidy budget is rotating to 真人短剧; overseas short-drama is growing fast
(SEA = 32% of global downloads, Sensor Tower Q1 2026). Supports leaning
drama_cps > novel_cn in weekly slot allocation.

---

## 2. Key verified facts (delta to Cycle 1 ledger)

| # | Fact | Source | Confidence |
|---|---|---|---|
| G7 | Seedance v1 Pro Fast **image-to-video** bills the same token formula as T2V: $0.0216/s @720p | fal token formula, cross-checked vs published 1080p example | verified |
| G8 | FLUX.1 Kontext [pro] $0.04/image — reference-edit model, right tool for boundary-frame re-minting | fal model page (via search summary) | medium — verify id+price via fal MCP `get_pricing` at pre-flight |
| G9 | Kling 3.0 Pro I2V: start+end frame + `elements` character refs (@Element1); $0.112/s audio-off, **2× with elements ($0.224/s)**; 3–15s | fal schema fetched directly | verified |
| G10 | Seedance 2.0 reference-to-video: 9 imgs + 3 vids + 3 audio; $0.2419/s fast — premium only | fal pricing table scraped | verified |
| G11 | Wan-FLF2V: dedicated first+last-frame endpoint, flat $0.40/video @720p | fal page scraped | verified |
| G12 | Raw last-frame chaining drifts (color/lighting/artifact amplification). Fix: re-mint the extracted frame through an image model with the character ref before feeding forward | practitioner sources ×2; matches ViMax's own design | medium |
| G13 | Whether pinned base LTX-2 (not 2.3) supports end-frame at all: **unverified** — check before chaining B-roll | — | open |
| A1 | MiniMax Speech-2.5 Turbo (fal): $0.06/1k chars, EN+Mandarin+Malay in one vendor | fal page fetched | verified |
| A2 | LatentSync lip-sync: $0.20 flat ≤40s clip | fal page fetched | verified |
| A3 | CassetteAI music-gen ~$0.02/min; generative BGM is license-safer cross-platform than TikTok's in-app commercial library (which is TikTok-only) | fal + uppbeat/joinstatus | medium |
| A4 | WhisperX word timestamps → ASS karaoke → ffmpeg `ass` filter burn: proven recipe, ~$0/video local | multiple recipes; captacity repo (stale) as reference | medium |
| P1 | YouTube "inauthentic content" (Jul 2025; Jul 2026 clarification): mass-produced/templated AI content demonetized; Jan 2026 channel sweep enforced | support.google.com/1311392 + TechCrunch 2026-07-20 | verified |
| P2 | YPP thresholds UNCHANGED (1k subs + 4k hrs or 10M Shorts/90d). The circulating "500 subs + 3M views" figure is a conflation with the fan-funding tier | support.google.com/72851 | verified — correction of common misinfo |
| P3 | Short-drama apps: Q1 2026 downloads 850M (+140% YoY), SEA 32% share; TikTok building a dedicated Short Drama feed; some top shows AI-generated | Sensor Tower; Business Insider | verified |
| P4 | 小说推文 saturated; Douyin ¥1.5B+ subsidy pool aimed at 真人短剧, not 推文 | Zhihu/36Kr/EEO | medium |

---

## 3. ViMax study (for the record)

HKUDS/ViMax (11.4k★, MIT, arXiv:2606.07649): agentic Idea2Video / Script2Video
/ Novel2Video / AutoCameo pipeline. Architecture: story → character portrait
registry (front/side/back) → script → storyboard → shot dependency graph →
first/last keyframe images per shot → I2V per shot (Veo/Seedance via
Google/OpenRouter/Yunwu proxy) → moviepy concat. No GPU; pure paid-API
orchestration. Weaknesses vs our kit: no cost controls (est. $4–40+/60s), no
QC, no compliance/publish/analytics layer, research-grade reliability (open
full-pipeline-failure issues, 1 release, no CI), no output-licensing
statement. Its portrait-registry + keyframe + dependency-graph techniques are
the portable value — hence items K1–K3 below.

---

## 4. Plan scheme (waves)

### Wave 1 — implemented this cycle (doc/prompt/config edits, $0 spend)
- **K1** Keyframe-chained generation as the default for character/continuity
  shots: boundary frame via pinned image tier → I2V → ffmpeg last-frame
  extract → re-mint with character ref → next shot. (SKILL.md Step 4,
  storyboard prompt gen_mode/chain_from fields, config pin.)
- **K2** Hook virality-scoring rubric (0–100: hook strength, emotional peak,
  conflict, quotability, practical value) applied to hook variants 1A/1B at
  storyboard time. (Prompt-only; rubric lifted from SamurAIGPT shorts repo.)
- **K3** Hero-shot consistency tier: ≤1 shot/video on Kling 3.0 Pro
  `elements` (~$1.12/5s) when face recognizability IS the hook (drama_cps
  cold-open). Opt-in, cost-mathed in the storyboard estimate.
- **K4** Audio pins: TTS = MiniMax Speech-2.5 Turbo (all 3 languages); BGM =
  generative (CassetteAI) for cross-platform license safety; BGM sidechain
  ducking under narration in the ffmpeg assemble step.

### Wave 2 — open backlog items (need ffmpeg/whisper install or approval)
- **C1** Karaoke word-highlight captions (WhisperX/TTS timestamps → ASS →
  ffmpeg). #2-ranked lever. Blocked on ffmpeg + whisper install (see W1/E3).
- **C2** Auto-thumbnail step (frame extract + overlay + title, PIL).
- **C3** QC upgrade: frame-sampled visual-defect check (broken captions) in
  qc_check.sh (OpenMontage pattern).
- **C4** Spend-governance script: turn Hard Rule 3 into a pre-generation
  check (estimate vs cap vs spend.md) instead of manual discipline.
- **C5** Doc sync: MASTER-PLAN §5 budget math + changelog for keyframe
  workflow (doc-only, low risk).
- **L1** Optional LatentSync talking-hook shot ($0.20 flat) for drama_cps
  Mode B — gate to clean frontal close-ups only.

### Wave 3 — experiments (explicit approval + spend, log to spend.md)
- **E4** Keyframe-chain vs current T2V bake-off: same storyboard both ways,
  compare drift/quality (~$2, fold into E1/E3 throwaway run).
- **E5** Monthly Seedance 2.0 reference-to-video benchmark vs chained
  baseline (~$7.26/30s from the $50 monthly headroom, NOT per-video cap).

### Explicitly rejected
- Adopting ViMax itself (cost, reliability, no ops layer).
- Unattended CRON auto-publish (MoneyPrinterV2 pattern) — violates Hard Rule 1.
- 1080p+ spend as a quality lever (ranked last by evidence).
- CapCut/剪映 draft integration now (pyJianYingDraft/VectCutAPI work today but
  break on private-format app updates; revisit as phase 3).

---

## 5. Sources
Agent transcripts summarized above. Primary: fal.ai model/schema pages,
support.google.com (1311392, 72851, 15424877), newsroom.tiktok.com, Sensor
Tower short-drama 2026 report, TechCrunch 2026-07-20, arXiv:2606.07649,
github.com/HKUDS/ViMax (+issues/API), Xinhua/ithome (PRC AI-labeling
measures). Secondary (flagged in-line above where load-bearing): creator-tool
blogs, Zhihu/36Kr commentary, vendor CPS rate pages.
