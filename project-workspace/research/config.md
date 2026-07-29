# Pipeline Config (trend-scout + producer read this every run)

## Regions & language
- EN track region for Creative Center/Trends: {e.g. US}
- CN track region: 中国大陆 · CN vertical: {男频玄幻 | 女频甜宠 — pick ONE}
- drama_cps (MY edition): portal(s) {ReelShort/DramaBox/...} · market preset
  {EN-US女频 | CN-MY/SG} · payout rail {PayPal/Wise/Payoneer} · invite code via
  {official channel used}
- Output languages: EN / 中文

## Pre-flight verdicts (from templates/preflight-checklist.md — fill before Phase 1)
- Creator Rewards eligible?: {YES/NO} → EN revenue model: {CRP | YT+Shop+clients}
- CN payout path confirmed?: {own 实名 | partner | 机构 | drama_cps instead | SKIP}
- drama_cps portal approved + tracking link tested in target geo: {YES/NO}
- fal dashboard hard cap set: $25 loaded, no auto-top-up (2026-07-29; E3 pre-check)
- Warm-up week completed: TikTok {..} · Douyin {..} · YT {..}

## Generation models (pinned by R&D 2026-07-28 Cycle 2 — re-pin via /rnd, verify prices at pre-flight)
- Drafts + finals: `fal-ai/bytedance/seedance/v1/pro/fast` (720p drafts → 1080p approved
  finals; image-to-video variant bills the same ~$0.022/s — used by the keyframe workflow)
- B-roll: `fal-ai/ltx-2/text-to-video/fast` (⚠ verify end-frame support at pre-flight;
  if absent, chaining B-roll needs `fal-ai/ltx-2.3` — same price)
- Boundary/keyframe images + last-frame re-mints: FLUX Kontext pro tier — CONFIRMED
  2026-07-29 via fal `get_pricing`: `fal-ai/flux-pro/kontext` (image-to-image re-mints)
  and `fal-ai/flux-pro/kontext/text-to-image` (first boundary frame), both $0.04/img
- TTS (all tracks EN/CN/Malay): `fal-ai/minimax/preview/speech-2.5-turbo` ($0.06/1k chars);
  voice ids locked in assets/voice-sheet.md
- BGM: `cassetteai/music-generator` (~$0.02/min; generative = license-safe cross-platform)
- Hero consistency shot (opt-in, ≤1/video, must fit cap): `fal-ai/kling-video/v3/pro/
  image-to-video` with `elements` (~$0.224/s ≈ $1.12/5s)
- Lip-sync hook shot (opt-in, backlog L1): `fal-ai/latentsync` ($0.20 flat ≤40s)
- Opt-in premium (explicit approval only, breaks $2.50 cap): `bytedance/seedance-2.0/*`
- Pre-flight step: query fal MCP `get_pricing` for every pinned tier above; if changed,
  update MASTER-PLAN §5 math
- Prices verified 2026-07-29 (E3 pre-check, all match pins): Seedance v1 pro fast =
  $1/M video tokens, tokens=(h×w×FPS×dur)/1024 → 720×1280@24fps ≈ $0.0216/s (i2v endpoint
  `.../fast/image-to-video` exists, same token pricing); FLUX Kontext pro $0.04/img;
  MiniMax speech-2.5-turbo $0.06/1k chars; cassetteai/music-generator $0.00125/compute-s
  (30s sample renders in <2s compute → effectively <$0.01/track)
