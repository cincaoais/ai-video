# learnings.md — insight ledger (weekly Stage 8 writes here; storyboard + trend-scout read the top section)

## TOP ACTIVE INSIGHTS (max 10 — distilled; each carries evidence + `applied→<file>@<date>` once propagated into a template)
1. [production] Re-mint prompts must enumerate ENVIRONMENT anchors (floor type/color,
   venue) as strictly as character accessories — badminton test chain held player
   identity over 4 re-mints but court surface wandered green-mat↔wood and a phantom
   blue arm band appeared by remint6 even with accessories enumerated. Evidence:
   output/2026-07-29-badminton-singles/frames/drift_contact_sheet.png. NOT yet applied
   to a template (proposed diff pending user approval).
2. [production] FLUX Kontext t2i can silently return LANDSCAPE + a safety false-positive
   on innocuous action prompts phrased as "smash/shot toward the camera" — output was
   1024x768 despite aspect_ratio 9:16 and still billed. Rephrase to a third-person
   angle ("low front angle beside the net") and always CHECK dims+nsfw flag before
   feeding a boundary frame downstream. Evidence: badminton 1B attempt-1, 2026-07-29.

## Archive
(stale or superseded insights move here, dated, instead of being deleted)
