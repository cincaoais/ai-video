# Character Sheet Recipe (do once per character, reuse forever)

1. Design in text: name, 2-line visual description, personality, voice note.
2. Generate 4 stills via a cheap image model on fal (front, 3/4, expression, full-body),
   same seed, plain background. Iterate until on-model.
3. Save to assets/characters/{name}/ as ref-01..04.png + sheet.md (the text description).
4. Usage: every video prompt passes ref image as @Image1 AND restates the 2-line
   description. One seed per episode. Never redesign mid-series.
5. Why: consistency = watchability = the IP asset (merch/licensing later); also your
   clearest "original character" evidence vs copyright claims.
