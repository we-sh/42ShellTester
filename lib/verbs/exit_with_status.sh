#!/bin/bash

# /*
# Test exit status
# EXPECTED_TO_ARGS[0]* -> expected exit status (integer)
# RESPONSE_EXIT_STATUS -> actual exit status
# */

run_verb_exit_with_status()
{
  if [ "${RESPONSE_EXIT_STATUS}" == "${EXPECTED_TO_ARGS[0]}" ]
  then
    return 0
  else
    return 1
  fi
}
