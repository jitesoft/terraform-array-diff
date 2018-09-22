#!/usr/bin/env bash
set -e
eval "$(jq -r '@sh "ARR1=\(.list1) ARR2=\(.list2)"')" # Extract the lists.
DIFF=$(echo $ARR1,$ARR2 | tr , "\n" | sort | uniq -u) # Diff the two lists.
NO_NL=$(echo $DIFF | tr -d '\n')                      # Remove all new lines.
jq -n --arg diff "${NO_NL// /,}" '{"diff":$diff}'     # Return as a json map with comma instead of new line.
