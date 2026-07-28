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
- fal dashboard hard cap set: {$..}
- Warm-up week completed: TikTok {..} · Douyin {..} · YT {..}

## Generation models (pinned by R&D 2026-07-28 Cycle 2 — re-pin via /rnd, verify prices at pre-flight)
- Drafts + finals: `fal-ai/bytedance/seedance/v1/pro/fast` (720p drafts → 1080p approved
  finals; image-to-video variant bills the same ~$0.022/s — used by the keyframe workflow)
- B-roll: `fal-ai/ltx-2/text-to-video/fast` (⚠ verify end-frame support at pre-flight;
  if absent, chaining B-roll needs `fal-ai/ltx-2.3` — same price)
- Boundary/keyframe images + last-frame re-mints: FLUX Kontext pro tier (~$0.04/img —
  confirm exact endpoint id + price via fal MCP `get_pricing`)
- Opt-in premium (explicit approval only, breaks $2.50 cap): `bytedance/seedance-2.0/*`
- Pre-flight step: query fal MCP `get_pricing` for every pinned tier above; if changed,
  update MASTER-PLAN §5 math
