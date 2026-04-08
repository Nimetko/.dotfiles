#!/usr/bin/env bash

set -euo pipefail

FILE="${HOME}/.tmux/data/favorite-sessions"
TMP_FILE="${FILE}.tmp"

[ -f "$FILE" ] || touch "$FILE"

> "$TMP_FILE"

while IFS= read -r line; do
  session_name="$(printf '%s' "$line" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"
  [ -z "$session_name" ] && continue

  if tmux has-session -t "$session_name" 2>/dev/null; then
    echo "$session_name" >> "$TMP_FILE"
  fi
done < "$FILE"

mv "$TMP_FILE" "$FILE"
tmux display-message "Favorite sessions cleaned"
