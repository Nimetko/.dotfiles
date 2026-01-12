#!/usr/bin/env bash
set -euo pipefail

CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
BASE_DIR="$CODEX_HOME/sounds/RA2"
DEFAULT_DIR="$BASE_DIR/default/on-finished-task"

SOUND_DIR="$DEFAULT_DIR"

if [ -n "${TMUX_PANE:-}" ]; then
  # Actual window name for this pane
  RAW_WINDOW="$(tmux display-message -p -t "$TMUX_PANE" '#W')"

  # Clean it:
  # - trim trailing spaces
  # - remove trailing '-' (and any spaces before it)
  CLEAN_WINDOW="$(printf '%s' "$RAW_WINDOW" | sed -E 's/[[:space:]]+$//; s/[[:space:]]*-$//')"

  # If tmux window name *really* contains '-', fix it permanently
  if [ "$CLEAN_WINDOW" != "$RAW_WINDOW" ]; then
    tmux rename-window -t "$TMUX_PANE" "$CLEAN_WINDOW"
  fi

  WINDOW="$(printf '%s' "$CLEAN_WINDOW" | tr '[:upper:]' '[:lower:]')"

  if [ -d "$BASE_DIR/$WINDOW/on-finished-task" ]; then
    SOUND_DIR="$BASE_DIR/$WINDOW/on-finished-task"
  fi
fi

# Pick random file
FILES=$(ls -1 "$SOUND_DIR" 2>/dev/null || true)
[ -n "$FILES" ] || exit 0

COUNT=$(printf '%s\n' "$FILES" | wc -l | tr -d ' ')
INDEX=$((RANDOM % COUNT + 1))
FILE=$(printf '%s\n' "$FILES" | sed -n "${INDEX}p")
RANDOM_SOUND="$SOUND_DIR/$FILE"

# Play
if command -v afplay >/dev/null 2>&1; then
  afplay "$RANDOM_SOUND" >/dev/null 2>&1 &
elif command -v paplay >/dev/null 2>&1; then
  paplay "$RANDOM_SOUND" >/dev/null 2>&1 &
fi

# Mark window in tmux
printf '\a'
