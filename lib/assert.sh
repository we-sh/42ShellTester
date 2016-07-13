#!/bin/bash

# /*
# Assert logic
#
# run_assert
# @param -> prefix applied to output file name
# @param -> output that is tested (STDOUT, STDERR or MISC)
# function that:
# - sets the variable RESPONSE with the path of the file that stores the actual output
# - iterates over the current test configuration file ('stdout', 'stderr' or 'misc')
# - calls the expected type of assertion ('expected', 'might' or their opposite)
#
# run_expected_to
# run_expected_to_not
# run_might
# run_might_to
# @param -> current test (e.g. 'expected_to be_empty')
# functions that calls the verbs and treats their exit status
# */

run_assert()
{
  local LINE
  local PREFIX_STD="${1}"
  local EXPECTED_STD="RESPONSE_${PREFIX_STD}${2}"
  local RESPONSE="${!EXPECTED_STD}"
  local EXPECTED_STD_NAME="${2}"
  local RESPONSE_EXIT_STATUS_VAR="${PREFIX_STD}EXIT_STATUS"
  local RESPONSE_EXIT_STATUS="${!RESPONSE_EXIT_STATUS_VAR}"
  local TEST_CMD
  local OLD_IFS="${IFS}"
  local ASSERT_STATUS="0"
  local CURRENT_ASSERT_STATUS
  local DISPLAY_LINE

  IFS=$'\n'
  for LINE in $(awk '{gsub(/\\\\/, "\\\\\\\\\\\\\\\\"); print}' "${TEST}/$(echo "${EXPECTED_STD_NAME}" | awk '{print tolower($0)}')")
  do
    TEST_CMD="$(echo "${LINE}" | awk '{ print $1 }')"
    DISPLAY_LINE="$(printf "${LINE}" | awk -v GLOBAL_TOKEN="${GLOBAL_TOKEN}" -v GLOBAL_INSTALLDIR="${GLOBAL_INSTALLDIR}" -v GLOBAL_TMP_DIRECTORY="${GLOBAL_TMP_DIRECTORY}" -v PATH="${PATH}" -v HOME="${HOME}" '{i=1; while(i <= NF) {gsub(/^"/, "`", $i); gsub(/"$/, "`", $i); i++}; gsub(/\\\\\\\\/, "\\"); gsub(/\$\{GLOBAL_TOKEN\}/, GLOBAL_TOKEN); gsub(/\$\{GLOBAL_INSTALLDIR\}/, GLOBAL_INSTALLDIR); gsub(/\$\{GLOBAL_TMP_DIRECTORY\}/, GLOBAL_TMP_DIRECTORY); gsub(/\$\{PATH\}/, PATH); gsub(/\$\{HOME\}/, HOME); print}')"
    eval "run_${TEST_CMD}" ${LINE}
    CURRENT_ASSERT_STATUS="${?}"
    if [ "${CURRENT_ASSERT_STATUS}" != "0" ]
    then
      [ "${ASSERT_STATUS}" == "0" -o "${ASSERT_STATUS}" == "2" ] && ASSERT_STATUS="${CURRENT_ASSERT_STATUS}"
    fi
  done
  IFS="${OLD_IFS}"

  return "${ASSERT_STATUS}"
}

run_expected_to()
{
  shift 1
  local EXPECTED_TO_CMD="${1}"
  shift 1
  local -a EXPECTED_TO_ARGS='(${@})'
  local ASSERT_STATUS

  eval "run_verb_${EXPECTED_TO_CMD}"
  ASSERT_STATUS="${?}"
  case "${ASSERT_STATUS}" in
    0)
      printf "${C_GREEN}  %-10s %s${C_CLEAR}\n" "SUCCESS" "${DISPLAY_LINE}" ;;
    1)
      printf "${C_RED}  %-10s %s${C_CLEAR}\n" "FAILURE" "${DISPLAY_LINE}" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: %s${C_CLEAR}\n" "${DISPLAY_LINE}" ;;
  esac

  return "${ASSERT_STATUS}"
}

run_expected_to_not()
{
  shift 1
  local EXPECTED_TO_CMD="${1}"
  shift 1
  local -a EXPECTED_TO_ARGS='(${@})'
  local ASSERT_STATUS

  eval "run_verb_${EXPECTED_TO_CMD}"
  ASSERT_STATUS="${?}"
  case "${ASSERT_STATUS}" in
    1)
      ASSERT_STATUS="0"
      printf "${C_GREEN}  %-10s %s${C_CLEAR}\n" "SUCCESS" "${DISPLAY_LINE}" ;;
    0)
      ASSERT_STATUS="1"
      printf "${C_RED}  %-10s %s${C_CLEAR}\n" "FAILURE" "${DISPLAY_LINE}" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: %s${C_CLEAR}\n" "${DISPLAY_LINE}" ;;
  esac

  return "${ASSERT_STATUS}"
}

run_might()
{
  shift 1
  local EXPECTED_TO_CMD="${1}"
  shift 1
  local -a EXPECTED_TO_ARGS='(${@})'
  local ASSERT_STATUS

  eval "run_verb_${EXPECTED_TO_CMD}"
  ASSERT_STATUS="${?}"
  case "${ASSERT_STATUS}" in
    0)
      printf "${C_GREEN}  %-10s %s${C_CLEAR}\n" "SUCCESS" "${DISPLAY_LINE}" ;;
    1)
      ASSERT_STATUS="2"
      printf "${C_YELLOW}  %-10s %s${C_CLEAR}\n" "WARNING" "${DISPLAY_LINE}" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: %s${C_CLEAR}\n" "${DISPLAY_LINE}" ;;
  esac

  return "${ASSERT_STATUS}"
}

run_might_not()
{
  shift 1
  local EXPECTED_TO_CMD="${1}"
  shift 1
  local -a EXPECTED_TO_ARGS='(${@})'
  local ASSERT_STATUS

  eval "run_verb_${EXPECTED_TO_CMD}"
  ASSERT_STATUS="${?}"
  case "${ASSERT_STATUS}" in
    1)
      ASSERT_STATUS="0"
      printf "${C_GREEN}  %-10s %s${C_CLEAR}\n" "SUCCESS" "${DISPLAY_LINE}" ;;
    0)
      ASSERT_STATUS="2"
      printf "${C_YELLOW}  %-10s %s${C_CLEAR}\n" "WARNING" "${DISPLAY_LINE}" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "${DISPLAY_LINE}" ;;
  esac

  return "${ASSERT_STATUS}"
}
