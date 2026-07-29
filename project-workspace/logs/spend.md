# spend.md — generation spend tracker (log after EVERY batch; caps: $2.50/video hard · $50/month soft)

| date | project | shots × model tier | batch cost $ | month running total $ | notes |
|---|---|---|---|---|---|
| 2026-07-29 | 2026-07-29-e3-throwaway | 3× flux-pro/kontext img ($0.04 ea: boundary 1A, boundary 6, remint→2) | 0.12 | 0.12 | E3 test; t2i + i2i both $0.04 confirmed |
| 2026-07-29 | 2026-07-29-e3-throwaway | TTS minimax speech-2.5-turbo 254 chars + BGM cassetteai 35s + 1× extract-frame | 0.02 | 0.14 | TTS $0.0152; BGM ~$0.004; extract-frame ~$0.0004 |
| 2026-07-29 | 2026-07-29-e3-throwaway | 4× seedance v1 pro fast 5s@720p ($0.103 ea: 1A i2v, 6 i2v, 5 t2v ×2) | 0.41 | 0.55 | shot 5 double-billed: bare-endpoint result fetch 404 via MCP → resubmit on /text-to-video alias (fetches fine) |
| 2026-07-29 | 2026-07-29-e3-throwaway | 2× flux-pro/kontext re-mints (→3, →4) + 2× extract-frame | 0.08 | 0.63 | chain handoffs server-side via fal-ai/ffmpeg-api/extract-frame (no local upload needed — no FAL_KEY on this box) |
| 2026-07-29 | 2026-07-29-e3-throwaway | 3× seedance v1 pro fast i2v 5s@720p ($0.103 ea: shots 2, 3, 4) | 0.31 | 0.94 | chain complete; all clips 704x1248@24fps, silent (Seedance 1.0 ignores audio prompt text) |

Rules: one row per generation batch, same session. If a projection exceeds a cap,
pause and ask BEFORE generating. New month = restart the running total (keep old rows).
| 2026-07-29 | 2026-07-29-badminton-singles | 3× kontext t2i ($0.04 ea: boundary 1A, 1B attempt-1 FAILED landscape+safety-flag but billed, 1B retry OK) + 1× kontext i2i remint→2 | 0.16 | 1.10 |
| 2026-07-29 | 2026-07-29-badminton-singles | 3× seedance fast 5s@720p (1A i2v, 1B i2v, 4 t2v-alias) + TTS 258ch + BGM 35s + 1× extract-frame | 0.33 | 1.43 |
| 2026-07-29 | 2026-07-29-badminton-singles | chain cycles: shots 2+3 i2v ($0.104 ea) + 2× kontext remint (→3, →5) + 2× extract-frame | 0.29 | 1.72 |
| 2026-07-29 | 2026-07-29-badminton-singles | final chain: shots 5+6 i2v ($0.104 ea) + 1× kontext remint (→6) + 1× extract-frame | 0.25 | 1.97 |
