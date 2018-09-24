#!/usr/bin/env bash
set -e
eval "$(jq -r '@sh "ARR1=\(.list1) ARR2=\(.list2)"')" # Extract the lists from passed JSON.

# Three possible scenarios (excluding bad input...)
# 1. Both arrays are empty.
# 2. One of the arrays are empty.
# 3. Neither array is empty.

if [ -z "$ARR1" ] && [ -z "$ARR2" ] # Both arrays are empty. Return empty value in diff.
then
  jq -n '{"diff" : ""}'
elif [ -z "$ARR1" ] || [ -z "$ARR2" ] # One array is empty
then
  [ -z "$ARR1" ] && RESULT=${ARR2}                   # If arr1 is empty, set result variable to arr2.
  [ -z "$ARR2" ] && RESULT=${ARR1}                   # If arr2 is empty, set result variable to arr1.
  jq -n --arg diff "${RESULT// /,}" '{"diff":$diff}' # Send the result as diff.
else # Neither array is empty.
  DIFF=$(echo $ARR1,$ARR2 | tr , "\n" | sort | uniq -u) # Diff the two lists.
  NO_NL=$(echo $DIFF | tr -d '\n')                      # Remove all new lines.
  jq -n --arg diff "${NO_NL// /,}" '{"diff":$diff}'     # Return as a json map with comma instead of new line.
fi
