# Pipeline Config (trend-scout + producer read this every run)

## Regions & language
- EN track region for Creative Center/Trends: {e.g. US}
- CN track region: 中国大陆 · CN vertical: {男频玄幻 | 女频甜宠 — pick ONE}
- drama_cps (MY edition): portal(s) {ReelShort/DramaBox/...} · market preset
  {EN-US女频 | CN-MY/SG} · payout rail {PayPal/Wise/Payoneer} · invite code via
  {official channel used}
- Output languages: EN / 中文

## Pre-flight verdicts (filled 2026-07-29 — LEARNING MODE: produce locally, publish nothing)
- Creator Rewards eligible?: NO (physically in Malaysia; CRP not in SEA; no VPN ever)
  → EN revenue model WHEN monetizing: YT YPP + TikTok Shop/affiliate + client work
- CN payout path confirmed?: SKIP novel_cn (user has a Douyin account but no mainland
  实名 → no wallet withdrawal path; revisit only via 机构/partner). CN-language work
  routes to drama_cps when its portal is set up.
- drama_cps portal approved + tracking link tested in target geo: NO — not yet signed up
- fal dashboard hard cap set: $25 loaded, no auto-top-up (2026-07-29; E3 pre-check)
- Warm-up week completed: N/A — no social accounts yet by choice; REQUIRED (5–7 days 养号)
  before any future first upload on any platform
- ACTIVE MODE: learning/local-only. Default track `tiktok` (EN) — the only track with no
  external dependencies. Production runs stop at Step 6 (review); Step 7 publish stays
  locked until accounts exist + user re-opens this section.

## Generation models (pinned by R&D 2026-07-28 Cycle 2 — re-pin via /rnd, verify prices at pre-flight)
- Drafts + finals: `fal-ai/bytedance/seedance/v1/pro/fast` (720p drafts → 1080p approved
  finals; image-to-video variant bills the same ~$0.022/s — used by the keyframe workflow)
- B-roll: `fal-ai/ltx-2/text-to-video/fast` (⚠ verify end-frame support at pre-flight;
  if absent, chaining B-roll needs `fal-ai/ltx-2.3` — same price)
- Boundary/keyframe images + last-frame re-mints: FLUX Kontext pro tier — CONFIRMED
  2026-07-29 via fal `get_pricing`: `fal-ai/flux-pro/kontext` (image-to-image re-mints)
  and `fal-ai/flux-pro/kontext/text-to-image` (first boundary frame), both $0.04/img
- Frame handoff: `fal-ai/ffmpeg-api/extract-frame` server-side ($0.0002/compute-s ≈
  $0.001/call) — local ffmpeg extraction is verification-only (E3)
- ⚠ Seedance t2v submissions: ALWAYS the full `.../fast/text-to-video` alias — the bare
  endpoint id bills but results are unfetchable via MCP (E3 lost $0.10 to this). i2v full
  path `.../fast/image-to-video` fetches fine. Tier renders SILENT video; audio at assembly
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
