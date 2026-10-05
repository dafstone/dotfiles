#!/usr/bin/env bash
# prefix+u: pick a URL from the focused pane. Enter opens it, ctrl+y copies it.
# herdr port of tmux-url-select.sh; runs in a popup.

herdr=${HERDR_BIN_PATH:-herdr}

"$herdr" pane read "${HERDR_ACTIVE_PANE_ID:?}" --source recent-unwrapped |
  grep -oE '(https?://[^ ]+|www\.[^ ]+)' |
  sed 's/[)>,;."'\'']*$//' |
  sort -u |
  fzf --prompt="[Enter] Open  [Ctrl-Y] Copy: " \
    --bind 'enter:execute-silent(setsid -f xdg-open {} >/dev/null 2>&1)+abort' \
    --bind 'ctrl-y:execute-silent(printf %s {} | wl-copy)+abort' \
  || true
