#!/bin/bash

# /*
# Test regular expression
# EXPECTED_TO_ARGS[0]* -> expected regular expression match
# RESPONSE             -> actual output (stdout or stderr)
# */

run_verb_match_regex()
{
  if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[0]}" '$0 ~ regexp {print}' "${RESPONSE}")" != "" ]
  then
    return 0
  else
    return 1
  fi
}
