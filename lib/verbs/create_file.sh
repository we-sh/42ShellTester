#!/bin/sh

# /*
# Test file creation
# EXPECTED_TO_ARGS[0]* -> expected file path
# EXPECTED_TO_ARGS[1]  -> file test (with_regexp, without_regexp, with_nb_of_lines)
# EXPECTED_TO_ARGS[2]  -> argument of file test
# */

function run_verb_create_file
{
  if [ -f "${EXPECTED_TO_ARGS[0]}" ]
  then
    if [ "${EXPECTED_TO_ARGS[1]}" == "" ]
    then
      return 0
    else
      case "${EXPECTED_TO_ARGS[1]}" in
        with_regexp)
          if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[2]}" '$0 ~ regexp {print}' "${EXPECTED_TO_ARGS[0]}")" == "" ]
          then
            return 1
          else
            return 0
          fi ;;
        without_regexp)
          if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[2]}" '$0 ~ regexp {print}' "${EXPECTED_TO_ARGS[0]}")" == "" ]
          then
            return 0
          else
            return 1
          fi ;;
        with_nb_of_lines)
          if [ "$(awk 'END {print NR}' "${EXPECTED_TO_ARGS[0]}")" == "${EXPECTED_TO_ARGS[2]}" ]
          then
            return 0
          else
            return 1
          fi ;;
        *)
          return 255 ;;
      esac
    fi
  else
    return 1
  fi
}
