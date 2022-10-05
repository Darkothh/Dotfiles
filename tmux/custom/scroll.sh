zscroll -l 30 \
  --delay 0.1 \
  --match-command "playerctl status" \
  --match-text "Playing" "--scroll 1" \
  --match-text "Paused" "--scroll 0" \
  --update-check true "$HOME/.tmux/plugins/custom/player.sh"
wait
