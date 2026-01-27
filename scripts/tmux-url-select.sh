#!/bin/bash

tmux capture-pane -J -p | \
  grep -oE '(https?://[^ ]+|www\.[^ ]+)' | \
  sort -u | \
  fzf-tmux -p 80%,60% \
    --prompt="Open URL: " \
    --preview 'echo {}' \
    --preview-window up:3:wrap \
    --bind 'enter:execute(open {})+abort'
