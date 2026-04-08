#!/usr/bin/env bash

set -euo pipefail

FILE="${HOME}/.tmux/data/favorite-sessions"
mkdir -p "$(dirname "$FILE")"
touch "$FILE"

tmux display-popup -w 70% -h 70% -x C -y C -T "Harpoon" -E "nvim '$FILE'"
