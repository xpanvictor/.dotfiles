#!/bin/bash

tmux list-panes -a -F "#{pane_id}" | while read -r pane_id; do
  if tmux compare-session -t "$pane_id" \; attach \; send-keys -t : "normal G" \; detach \; &> /dev/null; then
    tmux send-signal -t "$pane_id" SIGSTOP
  fi
done
