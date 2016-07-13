#!/bin/bash

# /*
# Test regular expression
# EXPECTED_TO_ARGS[0]* -> expected regular expression match
# EXPECTED_TO_ARGS[1]* -> value 'once' or if next argument is value 'times', the number of times
# RESPONSE             -> actual output (stdout or stderr)
# */

run_verb_match_regex()
{
  local NB_OF_TIMES="0" RESULT
  if [ "${EXPECTED_TO_ARGS[1]}" == "once" ]
  then
    NB_OF_TIMES="1"
  fi
  if [ "${EXPECTED_TO_ARGS[2]}" == "times" ]
  then
    NB_OF_TIMES="${EXPECTED_TO_ARGS[1]}"
  fi
  RESULT="$(awk -v regexp="${EXPECTED_TO_ARGS[0]}" 'BEGIN {TOTAL=0} $0 ~ regexp {TOTAL++} END {printf TOTAL}' "${RESPONSE}")"
  if [ "${NB_OF_TIMES}" == "0" ]
  then
    if [ "${RESULT}" != "0" ]
    then
      return 0
    else
      return 1
    fi
  else
    if [ "${RESULT}" == "${NB_OF_TIMES}" ]
    then
      return 0
    else
      return 1
    fi
  fi
}
