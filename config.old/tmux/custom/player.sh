#!/bin/bash

# FORMAT="{{ title }} - {{ artist }}"
# TITLE=$(playerctl metadata title)
# ARTISTA=$(playerctl metadata artist)

# echo "$TITLE"

zscroll -l 30 \
  --delay 1 \
  --match-command "playerctl status" \
  --match-text "Playing" "--scroll 1 -b ' '" \
  --match-text "Paused" "--scroll 0 -b ' '" \
  --update-check true "playerctl metadata title"
wait

# INFO="$TITLE"
# INFO="$TITLE - $ARTISTA"

# zscroll -b "♪ x" -d 0.3 -M "playerctl status" -m "No players found" "-b 'a '" -m "Playing" "-b ' '" -m "paused" "-b ' ' -s 0" -u t "playerctl metadata title"
