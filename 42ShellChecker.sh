#!/bin/bash

declare GLOBAL_PROG="$1"
declare GLOBAL_INSTALLDIR="$(pwd)"
declare GLOBAL_TMP_DIRECTORY="${GLOBAL_INSTALLDIR}/tmp"
declare C_RED="\033[31m\033[38;5;160m"
declare C_CLEAR="\033[0m"

mkdir "${GLOBAL_TMP_DIRECTORY}" 2>/dev/null

function run_expected_to_be_empty
{
  if [ "$(awk '{print}' "${RESPONSE}")" == "" ]
  then
    return 0
  else
    return 1
  fi
}

function run_expected_to_be_filled
{
  if [ "$(awk '{print}' "${RESPONSE}")" != "" ]
  then
    return 0
  else
    return 1
  fi
}

function run_expected_to_have_nb_of_lines
{
  if [ "$(awk 'END {printf NR}' "${RESPONSE}")" == "${EXPECTED_TO_ARGS[0]}" ]
  then
    return 0
  else
    return 1
  fi
}

function run_expected_to_have_not_regexp
{
  if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[0]}" '$0 ~ regexp {print}' "${RESPONSE}")" == "" ]
  then
    return 0
  else
    printf 1
  fi
}

function run_expected_to_have_regexp
{
  if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[0]}" '$0 ~ regexp {print}' "${RESPONSE}")" != "" ]
  then
    return 0
  else
    return 1
  fi
}

function run_expected_to
{
  shift 1
  local EXPECTED_TO_CMD="${1}"
  shift 1
  local -a EXPECTED_TO_ARGS=${@}

  eval "run_expected_to_${EXPECTED_TO_CMD}"
}

function run_expector
{
  local LINE
  local EXPECTED_STD="RESPONSE_${1}"
  local RESPONSE="${!EXPECTED_STD}"
  local TEST_CMD
  local TEST_RETURN
  local OLD_IFS="${IFS}"

  #printf "  ${1}\n"
  IFS=$'\n'
  for LINE in $(cat "${TEST}/$(echo "${1}" | awk '{print tolower($0)}')")
  do
    TEST_CMD="$(echo "${LINE}" | awk '{ print $1 }')"
    eval "run_${TEST_CMD}" ${LINE}
    if [ "${?}" != "0" ]
    then
      printf "${C_RED}  ${1} %s${C_CLEAR}\n" "${LINE}"
    fi
  done

  IFS="${OLD_IFS}"
}

function run_specs
{
  local TEST
  local TEST_NAME
  local TEST_FULLNAME
  local RESULT
  local RESPONSE_STDOUT
  local RESPONSE_STDERR

  cd "${GLOBAL_TMP_DIRECTORY}"

  for TEST in $(find "${GLOBAL_INSTALLDIR}" -type d -regex "${GLOBAL_INSTALLDIR}/spec/.*/[0-9]\{3\}-.*")
  do
    TEST_NAME="${TEST##*/}"
    TEST_FULLNAME="${TEST##*spec/}"

    printf "#%s\n" "${TEST_FULLNAME}"

    eval "${GLOBAL_PROG}" < "${TEST}/stdin" 1> "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stdout" 2> "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stderr"

    RESPONSE_STDOUT="${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stdout"
    RESPONSE_STDERR="${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stderr"

    run_expector "STDOUT"
    run_expector "STDERR"
  done

  cd "${GLOBAL_INSTALLDIR}"
}

run_specs