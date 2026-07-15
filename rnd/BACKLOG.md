# R&D Backlog (living, priority-ordered)

Status: ⬜ open · 🟨 approved/in progress · ✅ done (date + commit) · ❌ dropped.
Detail for each item: rnd/reports/2026-07-15-rnd-report.md §4.

## 🔧 Quick wins
- ⬜ **Q1** Pin model tiers (Seedance v1 Pro Fast drafts/finals, LTX-2 Fast B-roll) + fix §5 budget math + fal MCP `get_pricing` pre-flight step — Impact H / Effort L — AWAITING APPROVAL (question Q-A)
- ⬜ **Q2** Fix install instructions: copy prompts/templates/scripts into workspace — Impact H / Effort L — AWAITING APPROVAL (Q-B)
- ⬜ **Q3** Harden scripts/qc_check.sh (fail-closed, dep/file guards, float duration, aspect tolerance, longform checks, resolution report, intentional-black flag) — Impact H / Effort M
- ⬜ **Q4** Platform-facts refresh sweep across MASTER-PLAN/MALAYSIA-EDITION/preflight/skills/templates (report F9 list incl. Meta Partnership-Ads, COPPA amended rule, 回填周四21:00, keyword 3–8字, Upload-Post tiers, hosted fal MCP, VectCutAPI) — Impact H / Effort M
- ⬜ **Q5** Storyboard JSON contract: + drama_cps enum, hook A/B structure, per-shot seed/model, tracking-link metadata, track-conditional AI toggles — Impact M / Effort L
- ⬜ **Q6** Seed state files: learnings.md scaffold, spend.md row schema, competitors.md row format — Impact M / Effort L

## 🏗️ Structural
- ⬜ **S1** Per-video performance schema (logs/performance.md) + producer writes it — Impact H / Effort M
- ⬜ **S2** Close learnings→templates loop (weekly step proposes template diffs; trend-scout reads TOP ACTIVE INSIGHTS) — Impact H / Effort M
- ⬜ **S3** Monthly long-form compilation workflow — Impact M / Effort M
- ⬜ **S4** Thumbnail/cover workflow per track — Impact M / Effort M
- ⬜ **S5** drama_cps: Mode-B-first on TikTok, Mode A → FB/YT; Meta Partnership-Ads note — Impact M / Effort L — strategy change, needs explicit OK (Q-D)

## 🧪 Experiments (spend, within caps, log to spend.md — each needs explicit approval)
- ⬜ **E1** Model bake-off Seedance v1 Pro Fast vs LTX-2 Fast vs Wan 2.5 (~$2)
- ⬜ **E2** TTS bake-off Kokoro vs MiniMax 2.8 HD (CN) / Kokoro vs ElevenLabs (EN) (<$1)
- ⬜ **E3** End-to-end throwaway run, no publish (≤$2.50) — after Q1–Q3

## 🔁 Recurring (cadences live in rnd/ASSUMPTIONS.md)
- fal pricing (30d) · TikTok CRP/RPM (30d) · CPS landscape+rates (30d) · 推文/红果 rates (30d) · YT policies (90d) · COPPA/labeling law (90d) · Upload-Post tiers (90d) · skills spec (180d)

## Blocked on user
- fal dashboard cap check · RS Boost backend rates · 番茄达人 backend · Creative Center logged-in depth (report §2 ❓ list)
- ffmpeg not installed on this machine (`brew install ffmpeg`) — blocks Stage 4/5 and E3

## Done
- ✅ 2026-07-15 Cycle-1 full scan, verification, report, ledger, /rnd skill (this commit)
