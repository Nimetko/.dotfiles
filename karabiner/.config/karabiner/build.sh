#!/bin/bash

# Set paths
BASE="base.json"
RULES_DIR="rules"
OUTPUT="karabiner.json"   # adjust this to your actual config path

# Combine all rules into one JSON array
ALL_RULES=$(jq -s 'add' $RULES_DIR/*.json)

# Insert rules into the base config
jq --argjson rules "$ALL_RULES" \
   '.profiles[0].complex_modifications.rules = $rules' \
  "$BASE" > "$OUTPUT"

echo "Built $OUTPUT from individual rules."
