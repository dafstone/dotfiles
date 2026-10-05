#!/usr/bin/env bash
# prefix+space: cycle the active tab through tmux's layouts, keeping panes alive.
#   even-horizontal -> even-vertical -> main-horizontal -> main-vertical -> tiled
#
# herdr has no layout presets and ignores pane moves within the same tab, so
# every pane but the first is parked in a staging tab and moved back in the
# target shape. A move's ratio is the target pane's share of the split.

set -euo pipefail

herdr=${HERDR_BIN_PATH:-herdr}
ws=${HERDR_ACTIVE_WORKSPACE_ID:?}
tab=${HERDR_ACTIVE_TAB_ID:?}
focused=${HERDR_ACTIVE_PANE_ID:-}
main_ratio=0.6

layouts=(even-horizontal even-vertical main-horizontal main-vertical tiled)

# Panes in creation order, like tmux pane indexes
mapfile -t panes < <("$herdr" pane list --workspace "$ws" |
  jq -r --arg tab "$tab" '.result.panes | map(select(.tab_id == $tab))
    | sort_by(.pane_id | sub(".*:p"; "") | tonumber) | .[].pane_id')
n=${#panes[@]}
((n > 1)) || exit 0

state_dir="${XDG_RUNTIME_DIR:-/tmp}/herdr-layouts"
state="$state_dir/${tab//:/_}"
mkdir -p "$state_dir"
i=$(( ($(cat "$state" 2>/dev/null || echo -1) + 1) % ${#layouts[@]} ))
echo "$i" >"$state"

# Park everything but the first pane
staging=$("$herdr" pane move "${panes[1]}" --new-tab --workspace "$ws" --no-focus |
  jq -r '.result.move_result.pane.tab_id')
for p in "${panes[@]:2}"; do
  "$herdr" pane move "$p" --tab "$staging" --split right --no-focus >/dev/null
done

place() { # pane target direction ratio
  "$herdr" pane move "$1" --tab "$tab" --target-pane "$2" --split "$3" --ratio "$4" --no-focus >/dev/null
}

# Chain panes[from..to] off each other in one direction, evenly
chain() { # from to direction
  local j count=$(($2 - $1 + 1))
  for ((j = $1 + 1; j <= $2; j++)); do
    place "${panes[j]}" "${panes[j - 1]}" "$3" "$(jq -n "1 / ($count - ($j - $1) + 1)")"
  done
}

case ${layouts[i]} in
  even-horizontal) chain 0 $((n - 1)) right ;;
  even-vertical) chain 0 $((n - 1)) down ;;
  main-horizontal)
    place "${panes[1]}" "${panes[0]}" down "$main_ratio"
    chain 1 $((n - 1)) right
    ;;
  main-vertical)
    place "${panes[1]}" "${panes[0]}" right "$main_ratio"
    chain 1 $((n - 1)) down
    ;;
  tiled)
    cols=$(jq -n "$n | sqrt | ceil")
    rows=$(((n + cols - 1) / cols))
    for ((r = 1; r < rows; r++)); do
      place "${panes[r * cols]}" "${panes[(r - 1) * cols]}" down "$(jq -n "1 / ($rows - $r + 1)")"
    done
    for ((r = 0; r < rows; r++)); do
      last=$(((r + 1) * cols - 1))
      ((last < n)) || last=$((n - 1))
      chain $((r * cols)) "$last" right
    done
    ;;
esac

if [[ -n $focused ]]; then
  printf '{"id":"cycle-layout","method":"pane.focus","params":{"pane_id":"%s"}}\n' "$focused" |
    socat -t1 - "UNIX-CONNECT:${HERDR_SOCKET_PATH:?}" >/dev/null
fi
