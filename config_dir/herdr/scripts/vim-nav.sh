#!/bin/sh
# ctrl+h/j/k/l: move between herdr panes, or pass the key through when vim is
# in the foreground so vim's own window navigation keeps working.
# Usage: vim-nav.sh left|down|up|right ctrl+h|ctrl+j|ctrl+k|ctrl+l

herdr=${HERDR_BIN_PATH:-herdr}
pane=${HERDR_ACTIVE_PANE_ID:?}

if "$herdr" pane process-info --pane "$pane" | jq -e '
  any(.result.process_info.foreground_processes[].name; test("^g?(view|n?vim?)(diff)?$"))' >/dev/null
then
  exec "$herdr" pane send-keys "$pane" "$2"
fi
exec "$herdr" pane focus --pane "$pane" --direction "$1"
