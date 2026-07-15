#!/usr/bin/env bash
# Automated QC gate — run on every export BEFORE presenting to the user (Stage 5).
# Usage: ./qc_check.sh <video.mp4> <platform: tiktok|shorts|douyin|longform>
# Exit 0 = pass, 1 = fail (print reasons). Requires ffmpeg/ffprobe.
set -u
F="$1"; P="${2:-tiktok}"; FAIL=0
say(){ echo "QC[$P] $1"; }

DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$F" | cut -d. -f1)
W=$(ffprobe -v error -select_streams v:0 -show_entries stream=width  -of csv=p=0 "$F")
H=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 "$F")

# 1. Duration bounds per platform cut
case "$P" in
  tiktok)  [ "$DUR" -le 60 ]  && { say "FAIL duration ${DUR}s — Creator-Rewards cut must exceed 60s"; FAIL=1; };;
  shorts)  [ "$DUR" -ge 180 ] && { say "FAIL duration ${DUR}s — Shorts must be under 3 min"; FAIL=1; };;
  douyin)  [ "$DUR" -lt 45 ]  && { say "WARN duration ${DUR}s — 推文 usually 60–120s for retention+conversion"; };;
esac

# 2. Aspect ratio (9:16 for all short-form)
if [ "$P" != "longform" ]; then
  [ $(( W * 16 )) -ne $(( H * 9 )) ] && { say "FAIL aspect ${W}x${H} — expected 9:16"; FAIL=1; }
fi

# 3. Audio stream exists + loudness near -14 LUFS
ffprobe -v error -select_streams a -show_entries stream=codec_name -of csv=p=0 "$F" | grep -q . \
  || { say "FAIL no audio stream"; FAIL=1; }
LUFS=$(ffmpeg -i "$F" -af loudnorm=print_format=summary -f null - 2>&1 | awk '/Input Integrated/{print $3}' | tr -d 'LUFS ')
if [ -n "${LUFS:-}" ]; then
  OK=$(awk -v l="$LUFS" 'BEGIN{print (l>=-18 && l<=-10)?1:0}')
  [ "$OK" = "0" ] && { say "FAIL loudness ${LUFS} LUFS — target -14 (±4)"; FAIL=1; }
fi

# 4. Black/frozen frame detection (over 1s of black = broken shot or bad concat)
BLACK=$(ffmpeg -i "$F" -vf "blackdetect=d=1.0:pix_th=0.10" -an -f null - 2>&1 | grep -c black_start)
[ "$BLACK" -gt 0 ] && { say "FAIL ${BLACK} black segment(s) >1s detected"; FAIL=1; }

# 5. Metadata preserved? (AIGC provenance must NOT be stripped — assembly must use -map_metadata 0)
ffprobe -v error -show_entries format_tags -of default=nw=1 "$F" | grep -q . \
  || say "WARN no container metadata tags — confirm assembly used -map_metadata 0 (AI-label integrity)"

[ "$FAIL" -eq 0 ] && say "PASS ${DUR}s ${W}x${H}"
exit $FAIL
