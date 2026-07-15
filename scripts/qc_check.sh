#!/usr/bin/env bash
# Automated QC gate — run on every export BEFORE presenting to the user (Stage 5).
# Usage: ./qc_check.sh <video.mp4> <platform: tiktok|shorts|douyin|longform> [--allow-black]
#   --allow-black: skip the black-frame check for an INTENTIONAL 黑屏 cliffhanger
#                  beat (e.g. novel_cn template N4). Use per-file, never by default.
# Exit 0 = pass, 1 = fail (reasons printed), 2 = usage/environment error.
set -u
command -v ffprobe >/dev/null 2>&1 && command -v ffmpeg >/dev/null 2>&1 \
  || { echo "QC ERROR: ffmpeg + ffprobe required (macOS: brew install ffmpeg)"; exit 2; }
[ $# -ge 1 ] || { echo "Usage: qc_check.sh <video> [tiktok|shorts|douyin|longform] [--allow-black]"; exit 2; }
F="$1"; P="${2:-tiktok}"; ALLOW_BLACK="${3:-}"
[ -f "$F" ] || { echo "QC ERROR: file not found: $F"; exit 2; }
FAIL=0
say(){ echo "QC[$P] $1"; }

DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$F")
W=$(ffprobe -v error -select_streams v:0 -show_entries stream=width  -of csv=p=0 "$F")
H=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 "$F")
FPS=$(ffprobe -v error -select_streams v:0 -show_entries stream=avg_frame_rate -of csv=p=0 "$F" \
      | awk -F/ '{ if ($2+0 > 0) printf "%.2f", $1/$2; else print $1 }')

# Fail CLOSED: if core specs can't be probed, the file is broken — never pass it.
case "${DUR:-}" in ''|N/A) say "FAIL cannot read duration (corrupt/truncated file?)"; DUR=0; FAIL=1;; esac
if [ -z "${W:-}" ] || [ -z "${H:-}" ]; then
  say "FAIL no video stream / cannot read resolution"; W=0; H=0; FAIL=1
fi

# 1. Duration bounds per platform cut (float-safe — no integer truncation)
dur_lt(){ awk -v d="$DUR" -v t="$1" 'BEGIN{exit !(d+0 <  t+0)}'; }
dur_gt(){ awk -v d="$DUR" -v t="$1" 'BEGIN{exit !(d+0 >  t+0)}'; }
case "$P" in
  tiktok)   dur_lt 60.5 && { say "FAIL duration ${DUR}s — Creator-Rewards cut must exceed 60s (target >61s for trim safety)"; FAIL=1; };;
  shorts)   dur_gt 180  && { say "FAIL duration ${DUR}s — Shorts must be ≤3 min or YouTube treats it as long-form"; FAIL=1; };;
  douyin)   dur_lt 45   && say "WARN duration ${DUR}s — 推文 usually 60–120s for retention+conversion";;
  longform) dur_lt 480  && say "WARN duration ${DUR}s — long-form compilations target 10–15 min";;
esac

# 2. Aspect ratio: 9:16 short-form, 16:9 longform (±2% tolerance for encoder rounding)
if [ "$W" -gt 0 ] && [ "$H" -gt 0 ]; then
  if [ "$P" = "longform" ]; then TARGET="1.7778"; LABEL="16:9"; else TARGET="0.5625"; LABEL="9:16"; fi
  awk -v w="$W" -v h="$H" -v t="$TARGET" 'BEGIN{r=w/h; exit !(r > t*0.98 && r < t*1.02)}' \
    || { say "FAIL aspect ${W}x${H} — expected ${LABEL} (±2%)"; FAIL=1; }
  if [ "$P" != "longform" ] && [ "$W" -lt 1080 ]; then
    say "WARN ${W}x${H} is draft resolution — approved finals should be 1080x1920"
  fi
fi

# 3. Audio stream exists + loudness near -14 LUFS
if ffprobe -v error -select_streams a -show_entries stream=codec_name -of csv=p=0 "$F" | grep -q .; then
  LUFS=$(ffmpeg -i "$F" -af loudnorm=print_format=summary -f null - 2>&1 | awk '/Input Integrated/{print $3}')
  case "${LUFS:-}" in
    ''|N/A|-inf) say "FAIL could not measure loudness (silent or broken audio?)"; FAIL=1;;
    *) awk -v l="$LUFS" 'BEGIN{exit !(l >= -18 && l <= -10)}' \
         || { say "FAIL loudness ${LUFS} LUFS — target -14 (±4)"; FAIL=1; };;
  esac
else
  say "FAIL no audio stream"; FAIL=1
fi

# 4. Black-frame detection (>1s of black = broken shot or bad concat)
if [ "$ALLOW_BLACK" = "--allow-black" ]; then
  say "NOTE black-frame check skipped (--allow-black: intentional cliffhanger freeze)"
else
  BLACK=$(ffmpeg -i "$F" -vf "blackdetect=d=1.0:pix_th=0.10" -an -f null - 2>&1 | grep -c black_start)
  [ "$BLACK" -gt 0 ] && { say "FAIL ${BLACK} black segment(s) >1s — if intentional (黑屏 cliffhanger), re-run with --allow-black"; FAIL=1; }
fi

# 5. Metadata preserved? (AIGC provenance must NOT be stripped — assembly must use -map_metadata 0)
ffprobe -v error -show_entries format_tags -of default=nw=1 "$F" | grep -q . \
  || say "WARN no container metadata tags — confirm assembly used -map_metadata 0 (AI-label integrity)"

[ "$FAIL" -eq 0 ] && say "PASS ${DUR}s ${W}x${H} @ ${FPS:-?}fps"
exit $FAIL
