---
name: trend-scout
description: Social-media trend research producing a scored Trend Brief with 3–5 validated video ideas for TikTok, YouTube Shorts, Douyin and CN web-novel promotion. Use whenever the user asks what's trending, wants video ideas, mentions 热点/爆款/trends/viral, before planning any content, and as the daily scheduled morning task — even if they only vaguely ask "what should I make today?".
---

# Trend Scout

Read `research/config.md` FIRST (regions, CN vertical, EN revenue model) — never
infer regions daily. Also read the TOP ACTIVE INSIGHTS section of
`logs/learnings.md`: skip formats it marks as losers, and weight proven
hooks/formats when scoring Fit. Output: one file `research/briefs/YYYY-MM-DD-brief.md` using
`templates/trend-brief-template.md`. Research only — this skill NEVER generates or
publishes content.

## Sources (in order; browse like a human researcher, no scraping loops)

**EN track**
1. TikTok Creative Center → Trend Discovery (browsing works logged-out; hashtag
   SEARCH was removed in 2024, and full Keyword Insights metrics need a free
   TikTok-for-Business login): hashtags, songs, videos, creators for the target region. ALWAYS compare 7-day vs
   30-day growth to catch pre-peak trends; prefer sounds marked approved-for-business.
2. TikTok Creative Center → Keyword Insights: rising search terms in-niche.
3. YouTube trending + latest Shorts of the 5 channels in `research/competitors.md`.
4. Google Trends: 7-day breakout queries for the niche.

**CN / novel_cn track**
5. Web-search 抖音热点宝 topics + 小说推文 low-follower breakout videos
   (低粉爆款 pattern) to see which novel genres/formats are converting this week.
6. Novel selection signals: platform charts (番茄/七猫/知乎盐选 rankings), strong
   first-chapter hooks, genres matching our account vertical (stay vertical —
   don't mix 玄幻 and 甜宠 on one account).

**drama_cps track (Malaysia edition — additional, CN sources above unchanged)**
7. CPS portal dashboards/material libraries: which dramas are newly pushed or
   commission-boosted this week (new material = low saturation window).
8. TikTok/FB: search top drama-clip accounts per market preset (EN-US女频,
   CN-MY/SG); note which titles + hook styles are converting (comments asking
   "app name?" = conversion signal). App-store chart movement of ReelShort/
   DramaBox/ShortMax as demand signal.

**Kids preset:** validate against evergreen kids categories (colors, counting,
animals, feelings, vehicles, routines) + seasonal calendar; meme velocity is
irrelevant for kids.

## Scoring rubric — score every candidate 1–5 on each; report the total
- **Momentum**: rising on BOTH 7-day and 30-day windows, confirmed by ≥2
  independent sources (single-source spikes are noise).
- **Saturation**: early beats crowded; check whether big channels already flooded it.
- **Fit**: doable with our characters/style with NO copyrighted IP, licensed music,
  or real-person likeness; matches account vertical.
- **Monetizable**: advertiser-friendly; kids-appropriate if kids;
  conversion-plausible if novel_cn (would a viewer actually search the keyword?).

## Brief contents (3–5 ideas)
Per idea: trend name + evidence links · why now (data) · our angle · hook concept
(the first 2 seconds, written out) · format (length, style preset, track) · risk
notes (IP/music/policy/lifespan) · score breakdown. Flag each trend's lifespan
class (moment ≤5 days / format / seasonal) and do not recommend stale moments.

## Batch flag
If ≥2 ideas score ≥15/20, mark the brief "BATCH CANDIDATE" so the producer skill
offers a multi-video session.

## Guardrails
- Never recommend trends built on copyrighted characters, licensed songs, real
  public figures, tragedy/兜售焦虑 bait, or anything unsafe for kids preset.
- Note label duties in the brief when relevant (TikTok AI label, Douyin AI声明).
- drama_cps ideas must name: drama title, portal, paywall episode if known, market preset.
- Creative Center is browsed at human cadence (the automated-scanning product is
  TikTok's separate Research API — we don't hammer the free tool).
