#!/bin/bash

tmux capture-pane -J -p | \
  grep -oE '(https?://[^ ]+|www\.[^ ]+)' | \
  sed 's/[)>,;."'\'']*$//' | \
  sort -u | \
  fzf-tmux -p 80%,60% \
    --prompt="[Enter] Open  [Ctrl-Y] Copy: " \
    --preview 'echo {}' \
    --preview-window up:3:wrap \
    --bind 'enter:execute(open {})+abort' \
    --bind 'ctrl-y:execute-silent(echo -n {} | pbcopy)+abort' \
  || true
