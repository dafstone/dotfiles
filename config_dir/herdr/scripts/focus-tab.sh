#!/bin/sh
# ctrl+F1..F12: jump to tab N in the active workspace.
# herdr's switch_tab only covers 1..9 and has no function-key form.

herdr=${HERDR_BIN_PATH:-herdr}

tab=$("$herdr" tab list --workspace "${HERDR_ACTIVE_WORKSPACE_ID:?}" |
  jq -r --argjson n "$1" '.result.tabs[$n - 1].tab_id // empty')
[ -n "$tab" ] && exec "$herdr" tab focus "$tab"
