#!/usr/bin/env bash

set -euo pipefail

FILE="${HOME}/.tmux/data/favorite-sessions"
mkdir -p "$(dirname "$FILE")"
touch "$FILE"

current_session="$(tmux display-message -p '#S')"

if grep -Fxq "$current_session" "$FILE"; then
  tmux display-message "Session already in favorites: $current_session"
  exit 0
fi

echo "$current_session" >> "$FILE"
tmux display-message "Added favorite session: $current_session"
