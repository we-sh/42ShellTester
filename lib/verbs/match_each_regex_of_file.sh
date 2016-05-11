#!/bin/bash

# /*
# Multiple test regular expression
# EXPECTED_TO_ARGS[0]* -> file path that stores expected regular expression
# RESPONSE             -> actual output (stdout or stderr)
# */

run_verb_match_each_regex_of_file()
{
  local INDEX=0 ERROR=0 TOTAL LINE
  TOTAL=$(awk 'END {print NR+1}' "${EXPECTED_TO_ARGS[0]}")
  while [ "${INDEX}" -le "${TOTAL}" ]
  do
    LINE="$(awk -v INDEX="${INDEX}" 'NR == INDEX {print; exit}' "${EXPECTED_TO_ARGS[0]}")"
    if [ "$(awk -v regexp="${LINE}" '$0 ~ regexp {print}' "${RESPONSE}")" == "" ]
    then
      ERROR=1
    fi
    (( INDEX += 1 ))
  done
  if [ ${ERROR} -eq 1 ]
  then
    return 1
  else
    return 0
  fi
}
