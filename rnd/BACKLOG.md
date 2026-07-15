# R&D Backlog (living, priority-ordered)

Status: ⬜ open · 🟨 approved/in progress · ✅ done (date + commit) · ❌ dropped.
Detail for each item: rnd/reports/2026-07-15-rnd-report.md §4.

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
- ✅ 2026-07-15 Cycle-1 full scan, verification, report, ledger, /rnd skill (commit 8cab310)
- ✅ 2026-07-15 Cycle-1 implementation: Q1–Q6, S1, S2, S5 (one commit per item; MASTER-PLAN v1.2 → v1.3)
- Kids preset kept with amended-COPPA warning (approved: Q-E option 1)
