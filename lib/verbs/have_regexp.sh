#!/bin/sh

# /*
# Test regular expression
# EXPECTED_TO_ARGS[0]* -> expected regular expression match
# RESPONSE             -> actual output (stdout or stderr)
# */

function run_verb_have_regexp
{
  if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[0]}" '$0 ~ regexp {print}' "${RESPONSE}")" != "" ]
  then
    return 0
  else
    return 1
  fi
}
