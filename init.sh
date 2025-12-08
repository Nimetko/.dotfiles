#!/usr/bin/env bash
set -euo pipefail

# Always run from the repo root (this file's directory)
cd "$(dirname "$0")"

./scripts/installPackages.sh
./scripts/initStow.sh

# If on macOS, run additional setup
./scripts/setupMac.sh
