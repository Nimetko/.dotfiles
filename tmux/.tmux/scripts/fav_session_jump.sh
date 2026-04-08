#!/usr/bin/env bash

set -euo pipefail

if [ $# -ne 1 ]; then
  tmux display-message "Usage: fav_session_jump.sh <index>"
  exit 1
fi

FILE="${HOME}/.tmux/data/favorite-sessions"
INDEX="$1"

if [ ! -f "$FILE" ]; then
  tmux display-message "Favorites file does not exist"
  exit 1
fi

session_name="$(sed -n "${INDEX}p" "$FILE" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"

if [ -z "${session_name:-}" ]; then
  tmux display-message "No favorite session in slot $INDEX"
  exit 1
fi

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux display-message "Session does not exist: $session_name"
  exit 1
fi

tmux switch-client -t "$session_name"
