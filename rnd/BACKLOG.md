# R&D Backlog (living, priority-ordered)

Status: ⬜ open · 🟨 approved/in progress · ✅ done (date + commit) · ❌ dropped.
Detail: rnd/reports/2026-07-15-rnd-report.md §4 (Q/S/E items) ·
rnd/reports/2026-07-28-rnd-report.md §4 (K/C/L items, Cycle 2).

## 🎬 Cycle 2 — ViMax techniques + advancement scan (2026-07-28)
- ✅ **K1** Keyframe-chained generation (boundary image → I2V → last-frame extract →
  Flux-Kontext re-mint → next shot) as default for character/continuity shots — 2026-07-28
- ✅ **K2** Hook virality-scoring rubric (0–100) on hook variants at storyboard time — 2026-07-28
- ✅ **K3** Hero-shot tier: ≤1 shot/video Kling 3.0 Pro `elements` (~$1.12/5s), opt-in — 2026-07-28
- ✅ **K4** Audio pins: MiniMax Speech-2.5 Turbo TTS (EN/CN/Malay) · CassetteAI generative
  BGM · sidechain ducking in assemble — 2026-07-28
- ⬜ **C1** Karaoke word-highlight captions (WhisperX/TTS timestamps → ASS → ffmpeg) —
  Impact H / Effort M — blocked on ffmpeg+whisper install (W1/E3)
- ⬜ **C2** Auto-thumbnail step (frame + overlay + title) — Impact M / Effort L
- ⬜ **C3** qc_check.sh frame-sampled visual-defect check (broken caption overlays) —
  Impact M / Effort L — pairs with C1
- ⬜ **C4** Spend-governance pre-generation check script (Hard Rule 3 as code) — Impact M / Effort L
- ⬜ **C5** Doc sync: MASTER-PLAN §5 budget math + changelog for keyframe workflow — Effort L
- ⬜ **L1** LatentSync talking-hook shot ($0.20 flat, clean frontal close-ups only,
  drama_cps Mode B) — Impact M / Effort L
- ⬜ **G13-check** Verify pinned base LTX-2 supports end-frame (else move B-roll chaining
  to LTX-2.3, same price) — one fal MCP query at next pre-flight
- 📌 Strategy (user decision, not a task): 小说推文 saturated + Douyin subsidies rotating to
  真人短剧; SEA short-drama growing (Sensor Tower) → consider weighting drama_cps > novel_cn

## 🔧 Quick wins
- ✅ **Q1** Pin model tiers + fix §5 budget math + fal MCP `get_pricing` pre-flight step — 2026-07-15 (approved: Q-A option 1)
- ✅ **Q2** Fix install instructions: copy prompts/templates/scripts into workspace — 2026-07-15 (approved: Q-B option 1)
- ✅ **Q3** Harden scripts/qc_check.sh — 2026-07-15 (media paths still need a real-file run once ffmpeg is installed → covered by E3)
- ✅ **Q4** Platform-facts refresh sweep + MASTER-PLAN v1.3 changelog — 2026-07-15
- ✅ **Q5** Storyboard JSON contract fixes — 2026-07-15
- ✅ **Q6** Seed state files — 2026-07-15

## 🏗️ Structural
- ✅ **S1** Per-video performance schema (logs/performance.md) — 2026-07-15
- ✅ **S2** Close learnings→templates loop — 2026-07-15
- ⬜ **S3** Monthly long-form compilation workflow — Impact M / Effort M (not yet approved)
- ⬜ **S4** Thumbnail/cover workflow per track — Impact M / Effort M (not yet approved)
- ✅ **S5** drama_cps Mode-B-first on TikTok, Mode A → FB/YT — 2026-07-15 (approved: Q-D option 1)
- ⬜ **S6** Decision-fingerprint learning loop (approved 2026-07-29, not yet built): every
  video logs template version + hook pattern + caption style + active insight tags in
  project.json/performance.md; Stage 8 correlates metrics vs fingerprints ACROSS videos
  (patterns must hold over ≥5 samples); extend A/B discipline to one more variable at a
  time (captions next). Human gate on template edits stays — attribution automated,
  authority not. Impact H / Effort M. Needs S1 data flowing first (≥5 published videos).

## 🧪 Experiments (spend, within caps, log to spend.md — each needs explicit approval)
- ⬜ **E1** Model bake-off Seedance v1 Pro Fast vs LTX-2 Fast vs Wan 2.5 (~$2)
- ⬜ **E2** TTS bake-off Kokoro vs MiniMax 2.8 HD (CN) / Kokoro vs ElevenLabs (EN) (<$1)
  — note 2026-07-28: MiniMax Speech-2.5 Turbo ($0.06/1k, EN+CN+Malay) now the pinned
  default; bake-off validates it vs alternatives
- ⬜ **E3** End-to-end throwaway run, no publish (≤$2.50) — after Q1–Q3
- ⬜ **E4** Keyframe-chain vs T2V bake-off: same storyboard both ways, compare drift (~$2;
  fold into E3)
- ⬜ **E5** Monthly Seedance 2.0 reference-to-video benchmark vs chained baseline
  (~$7.26/30s from monthly headroom, never per-video cap)

## 🔁 Recurring (cadences live in rnd/ASSUMPTIONS.md)
- fal pricing (30d) · TikTok CRP/RPM (30d) · CPS landscape+rates (30d) · 推文/红果 rates (30d) · YT policies (90d) · COPPA/labeling law (90d) · Upload-Post tiers (90d) · skills spec (180d)
- ⏰ ~2027-01: re-evaluate HKUDS/OpenOPC "Self-Grown" mechanism (per-role outcome
  attribution + auto write-back) — added 2026-07-29 when repo was 4 weeks old, README
  claimed MIT but no license file. Check: issue tracker shows real multi-week learning
  loops working (adopt ideas into S6), or demo-then-silence (drop). Relevant only to
  Stage 8; auto write-back stays excluded regardless (human gate is policy).

## Blocked on user
- fal dashboard cap check · RS Boost backend rates · 番茄达人 backend · Creative Center logged-in depth (report §2 ❓ list)
- fal.ai account not yet created — the ONLY remaining blocker for Stage 4/5 and E3
  (user signs up, loads ≤$50 credit no auto-top-up, adds MCP per MASTER-PLAN §2.2)
- ✅ ffmpeg installed — verified 2026-07-29: ffmpeg/ffprobe 8.1.2 on PATH in
  PowerShell AND Git Bash (winget Gyan.FFmpeg)
- ✅ **W1** Verified 2026-07-29: `bash scripts/qc_check.sh` runs from this environment on
  the Windows box — no args → usage error, exit 2, as specified. No PowerShell port needed.

## Done
- ✅ 2026-07-15 Cycle-1 full scan, verification, report, ledger, /rnd skill (commit 8cab310)
- ✅ 2026-07-15 Cycle-1 implementation: Q1–Q6, S1, S2, S5 (one commit per item; MASTER-PLAN v1.2 → v1.3)
- Kids preset kept with amended-COPPA warning (approved: Q-E option 1)
