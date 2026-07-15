# Assumption ledger (living — future /rnd cycles re-verify only what is due/volatile)

Format: fact · where it lives in the repo · source · last-verified · re-verify cadence.
Verdicts as of 2026-07-15 (cycle 1). ✅ true · ⚠️ changed (repo updated or pending) · ❓ login needed.

## fal.ai / generation — VOLATILE, verify monthly (prefer live fal MCP `get_pricing`)

| Fact | Lives in | Source | Verified | Every |
|---|---|---|---|---|
| Seedance 2.0 on fal = premium: 720p $0.3034/s, fast $0.2419/s, 1080p $0.682/s → NOT usable under $2.50 cap | MASTER-PLAN §0/§5 | fal.ai/models/bytedance/seedance-2.0/text-to-video | 2026-07-15 | 30d |
| Seedance 1.0 Pro Fast = draft tier: $1/M tokens ≈ $0.022/s @720p (5s ≈ $0.11); Lite deprecated → re-routed here | MASTER-PLAN §5, producer Step 4 | fal.ai/models/fal-ai/bytedance/seedance/v1/pro/fast/text-to-video | 2026-07-15 | 30d |
| Seedance 1.5 Pro: $1.20/M no-audio, $2.40/M audio (4–12s, 9:16 OK) | MASTER-PLAN §5 | fal model page | 2026-07-15 | 30d |
| B-roll alternatives: LTX-2 Fast $0.04/s @1080p (native audio); Wan 2.5 $0.05/s; Kling 2.5 Turbo Pro $0.07/s | shot-templates-tiktok-ugc T4 | fal.ai/pricing | 2026-07-15 | 30d |
| Official hosted fal MCP: https://mcp.fal.ai/mcp, Bearer FAL_KEY, 9 tools (get_pricing, recommend_model, run_model…); npm `fal-ai-mcp` unmaintained | MASTER-PLAN §2.2 | fal.ai/docs/documentation/setting-up/mcp | 2026-07-15 | 90d |
| fal has NO hard monthly cap; only prepaid credits + lock threshold → de-facto cap = load $50 only | preflight D | fal.ai/docs pricing/faq | 2026-07-15 | 90d ❓(check dashboard) |
| TTS: Kokoro $0.02/1k chars (EN+中文); MiniMax Speech 2.8 HD $0.10/1k (CN best); ElevenLabs Turbo $0.05/1k | voice-sheet, MASTER-PLAN §3 | fal.ai/learn TTS guide | 2026-07-15 | 90d |

## TikTok — verify monthly (terms/RPM volatile)

| Fact | Lives in | Source | Verified | Every |
|---|---|---|---|---|
| CRP: 18+, personal, 10k followers, 100k views/30d, videos ≥1 min (terms updated Jan 2026) | preflight A, MASTER-PLAN §4 | tiktok.com/legal CRP terms | 2026-07-15 | 30d |
| CRP NOT in Malaysia/SEA; exact country list conflicting (8–12 per trackers); "SEA late 2026–27" = rumor only | preflight A, MALAYSIA-EDITION | ttcalculator.net 2026-07-09 | 2026-07-15 | 30d |
| CRP RPM ~$0.20–1.00 and declining (no official figure); no official full-AI exclusion — lever is originality/quality bar | MASTER-PLAN §4 | miraflow.ai / benly.ai 2026 | 2026-07-15 | 30d |
| AI label mandatory ("fully generated or significantly edited", CG eff. 2025-09-13); C2PA auto-label since 2024-05 | §6, producer Step 6 | newsroom.tiktok.com | 2026-07-15 | 90d |
| Posting API ~15 posts/day/creator (all clients incl. manual); unaudited clients = SELF_ONLY + 5 users/24h | MASTER-PLAN Stage 7 | developers.tiktok.com | 2026-07-15 | 90d |
| Creative Center: browsing free logged-out; hashtag SEARCH removed (2024); full Keyword Insights needs free business login | trend-scout sources | socialmediatoday.com | 2026-07-15 | 90d |
| TikTok Shop MY: full affiliate 1k followers + MyKad/TIN; sub-1k "Program Affiliate Link" path exists; commission per-product 5–20% | MALAYSIA-EDITION | seller-my.tiktok.com (2026-02/03) | 2026-07-15 | 90d |

## YouTube — verify quarterly (stable, but watch enforcement)

| Fact | Lives in | Source | Verified | Every |
|---|---|---|---|---|
| Shorts = up to 3 min (since 2024-10-15) | §1, qc_check shorts bound | support.google.com/15424877 | 2026-07-15 | 90d |
| YPP full: 1k subs + 4k hrs OR 10M Shorts views/90d; fan-funding: 500 subs + 3 uploads/90d + (3k hrs OR 3M Shorts); Malaysia ✅ | preflight A | support.google.com/72851, /13429240 | 2026-07-15 | 90d |
| Shorts pool 45%; RPM ~$0.01–0.10; long-form $2–12 | §4 | support.google.com/12504220 + industry | 2026-07-15 | 90d |
| Altered/synthetic disclosure required; likeness detection all-YPP since Jan 2026, all adults May 2026 | §6 | support.google.com/14328491 | 2026-07-15 | 90d |
| "Inauthentic content" policy (eff. 2025-07-15): AI OK, mass-produced/no-human-input NOT; Jan 2026 termination wave (~16 channels) | §6 doctrine | support.google.com/1311392 | 2026-07-15 | 90d |
| COPPA $53,088/violation stands through 2026; amended Rule full compliance since 2026-04-22 | §6 kids | ftc.gov; federalregister.gov | 2026-07-15 | 90d |
| -14 LUFS / ≤-1 dBTP short-form consensus | qc_check, Stage 4 | industry consensus | 2026-07-15 | 180d |

## Douyin / novel_cn — verify monthly (rates volatile, law stable)

| Fact | Lives in | Source | Verified | Every |
|---|---|---|---|---|
| 《标识办法》eff. 2025-09-01; 主动声明 required; stripping labels illegal; Douyin enforcement ACTIVE (53.8万 removed, 4k+ accounts, 2026-04) | §6, CLAUDE.md rule 2 | cac.gov.cn; jiemian.com | 2026-07-15 | 90d |
| 番茄达人: individual → 抖音钱包 (mainland 实名), 机构 → 对公; foreigner path ❓ | preflight B | zhihu/星图 | 2026-07-15 | 90d ❓ |
| 番茄 ~¥8/新用户 (up to ¥10); 七猫 ~¥7; weekly settlement (data Tue 22:00) | §4 | sohu 2026 | 2026-07-15 | 30d |
| 关键词 3–8字 (番茄) / 4–10 (七猫); 1词1链, 6mo validity; 回填 deadline 每周四21:00; idle 28d needs new content | §2.4, novel-cn templates | zhihu; csdn | 2026-07-15 | 90d |
| 0粉 start OK; 1000粉 for anchor link | preflight B | zhihu | 2026-07-15 | 90d |
| 二/三级 middlemen scams (培训费/授权费/押金/扣量); official first-tier free | §2.4 | ukezhitan 2026 | 2026-07-15 | 180d |
| Verbatim 原文 → 判重限流; 健康分 <80 限流; 纯AI novels banned on 番茄/七猫 (author side) | storyboard rule 6 | opp2.com | 2026-07-15 | 90d |
| 红果 CPA ~¥7–9/单 still pays; 短剧 playback economics collapsed 2026-06 (−95%) — avoid playback-revenue plays | §4 red-guo row | 36kr 2026-06-04 | 2026-07-15 | 30d |

## Drama CPS — verify monthly (landscape moves fast)

| Fact | Lives in | Source | Verified | Every |
|---|---|---|---|---|
| Duopoly DramaBox+ReelShort (~$140M IAP each Q1'26); NetShort #3; NEW: FreeReels (#1 downloads), ByteDance PineDrama + TikTok Minis | MALAYSIA-EDITION path 1 | Sensor Tower 2026 | 2026-07-15 | 30d |
| Commission NOT flat 30–70%: observed 15–80% by channel/tier; RS Boost rate varies per promotion page | MALAYSIA-EDITION | RS Boost ToS 2025-10-23 | 2026-07-15 | 30d ❓(backend) |
| RS Boost signup OPEN (invite optional, boosts rate); others distributor-gated; paying for codes = scam (CCTV) | drama-cps templates | cps.reelshort.com | 2026-07-15 | 90d |
| Official-library-only, no re-dub/re-narrate, no use apart from promo links, records needed | CLAUDE.md rule 11, templates | RS Boost ToS | 2026-07-15 | 90d |
| SEA 32% of global downloads; MY top-10 both charts; AI漫剧 $650M 2026 (6×) but "AI魔改" cleanups (1,718 delisted) | MALAYSIA-EDITION | Sensor Tower; 36kr; thepaper | 2026-07-15 | 30d |
| TikTok suppresses 搬运 drama clips (competitor via Minis/PineDrama); Meta Partnership-Ads tag mandatory for affiliate content 2026 | drama-cps templates §compliance | kchuhai; Meta policies | 2026-07-15 | 90d |

## Posting / Claude — verify quarterly

| Fact | Lives in | Source | Verified | Every |
|---|---|---|---|---|
| Upload-Post: 45 tools, 12 platforms, hosted MCP + OAuth2.1; free = 10 uploads/mo; ~$16/mo annual | MASTER-PLAN §2.3 | docs.upload-post.com | 2026-07-15 | 90d |
| Postiz self-host = free zero-cost fallback (official MCP); Blotato $29/mo; Ayrshare now $299/mo (dropped) | §2.3 | postiz.com; github | 2026-07-15 | 90d |
| Audited aggregators inherit TikTok/YT API audits; DIY API = private-only posts + ~6 uploads/day YT quota | §2.3 rationale | developers.tiktok.com; developers.google.com | 2026-07-15 | 180d |
| Cowork: web+mobile beta, remote scheduled tasks; local MCP plugins desktop-only | §2.1/§2.5 | support.claude.com | 2026-07-15 | 90d |
| Skills spec: optional `compatibility` + `metadata.version`; body <500 lines; references/ one level deep | both SKILL.md | agentskills.io | 2026-07-15 | 180d |
| VectCutAPI (ex CapCutAPI) active — CapCut/Jianying draft export, MCP; Kinocut = strongest ffmpeg MCP | MASTER-PLAN Stage 4 note | github.com/sun-guannan/VectCutAPI | 2026-07-15 | 90d |

## ❓ Blocked on user logins (carry until resolved)
1. fal dashboard: any real spend-cap setting? (preflight D wording depends on it)
2. RS Boost backend: actual rate per promotion page + MY withdrawal rail
3. 番茄达人 backend: live 单价 for chosen vertical; settlement path viability
4. Creative Center: Keyword Insights depth with free business login
