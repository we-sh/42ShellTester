#!/bin/bash

# /*
# Test emptiness of output
# RESPONSE -> actual output (stdout or stderr)
# */

run_verb_be_empty()
{
  if [ "$(awk '{print}' "${RESPONSE}")" == "" ]
  then
    return 0
  else
    return 1
  fi
}
