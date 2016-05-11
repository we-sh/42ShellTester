#!/bin/bash

# /*
# Test number of output lines
# EXPECTED_TO_ARGS[0]* -> expected number of lines (integer)
# RESPONSE             -> actual output (stdout or stderr)
# */

run_verb_have_nb_of_lines()
{
  if [ "$(awk 'END {printf NR}' "${RESPONSE}")" == "${EXPECTED_TO_ARGS[0]}" ]
  then
    return 0
  else
    return 1
  fi
}
