#!/bin/sh

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

function run_assert
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

  IFS=$'\n'
  for LINE in $(cat "${TEST}/$(echo "${EXPECTED_STD_NAME}" | awk '{print tolower($0)}')")
  do
    TEST_CMD="$(echo "${LINE}" | awk '{ print $1 }')"
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

function run_expected_to
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
      printf "${C_GREEN}  √ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    1)
      printf "${C_RED}  x ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
  esac

  return "${ASSERT_STATUS}"
}

function run_expected_to_not
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
      printf "${C_GREEN}  √ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    0)
      ASSERT_STATUS="1"
      printf "${C_RED}  x ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
  esac

  return "${ASSERT_STATUS}"
}

function run_might
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
      printf "${C_GREEN}  √ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    1)
      ASSERT_STATUS="2"
      printf "${C_YELLOW}  ~ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
  esac

  return "${ASSERT_STATUS}"
}

function run_might_not
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
      printf "${C_GREEN}  √ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    0)
      ASSERT_STATUS="2"
      printf "${C_YELLOW}  ~ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
    255)
      printf "${C_RED} [!] INVALID TEST COMMAND: ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "$(eval echo ${LINE})" ;;
  esac

  return "${ASSERT_STATUS}"
}
