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
