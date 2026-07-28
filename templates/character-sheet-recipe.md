# Character Sheet Recipe (do once per character, reuse forever)

1. Design in text: name, 2-line visual description, personality, voice note.
2. Generate 4 stills via a cheap image model on fal (front, 3/4, expression, full-body),
   same seed, plain background. Iterate until on-model.
3. Save to assets/characters/{name}/ as ref-01..04.png + sheet.md (the text description).
4. Usage: every video prompt passes ref image as @Image1 AND restates the 2-line
   description. One seed per episode. Never redesign mid-series.
5. Keyframe workflow (SKILL Step 4): the ref stills + 2-line description are the
   inputs for every boundary-frame generation AND for last-frame re-mints
   ("keep this exact character/outfit"). Hero shots (Kling elements tier) pass
   ref-01 as the frontal image and ref-02..04 as reference_images.
6. Why: consistency = watchability = the IP asset (merch/licensing later); also your
   clearest "original character" evidence vs copyright claims. As of 2026 it is
   also a monetization defense: platforms demonetize "generic/templated" AI
   content — a recognizable recurring character reads as produced, not slop.
