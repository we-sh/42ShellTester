#!/bin/bash

declare GLOBAL_PROG="$1"
declare GLOBAL_SPECS_MATCHER="$2"
declare GLOBAL_INSTALLDIR="$(pwd)"
declare GLOBAL_TMP_DIRECTORY="${GLOBAL_INSTALLDIR}/tmp"
declare C_RED="\033[31m\033[38;5;160m"
declare C_GREEN="\033[31m\033[38;5;34m"
declare C_YELLOW="\033[31m\033[1;33m"
declare C_CLEAR="\033[0m"

mkdir "${GLOBAL_TMP_DIRECTORY}" 2>/dev/null

function run_verb_exit_with_status
{
  if [ "${RESPONSE_EXIT_STATUS}" == "${EXPECTED_TO_ARGS[0]}" ]
  then
    return 0
  else
    return 1
  fi
}

function run_verb_be_empty
{
  if [ "$(awk '{print}' "${RESPONSE}")" == "" ]
  then
    return 0
  else
    return 1
  fi
}

function run_verb_be_filled
{
  if [ "$(awk '{print}' "${RESPONSE}")" != "" ]
  then
    return 0
  else
    return 1
  fi
}

function run_verb_have_nb_of_lines
{
  if [ "$(awk 'END {printf NR}' "${RESPONSE}")" == "${EXPECTED_TO_ARGS[0]}" ]
  then
    return 0
  else
    return 1
  fi
}

function run_verb_have_not_regexp
{
  if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[0]}" '$0 ~ regexp {print}' "${RESPONSE}")" == "" ]
  then
    return 0
  else
    return 1
  fi
}

function run_verb_have_regexp
{
  if [ "$(awk -v regexp="${EXPECTED_TO_ARGS[0]}" '$0 ~ regexp {print}' "${RESPONSE}")" != "" ]
  then
    return 0
  else
    return 1
  fi
}

function run_verb_match_each_lines_of_file
{
  INDEX=0
  ERROR=0
  TOTAL=$(awk 'END {print NR+1}' "${EXPECTED_TO_ARGS[0]}")
  while [ "$INDEX" -le "$TOTAL" ]
  do
    LINE="$(awk -v INDEX="${INDEX}" 'NR == INDEX {print; exit}' "${EXPECTED_TO_ARGS[0]}")"
    if [ "$(awk -v regexp="${LINE}" '$0 ~ regexp {print}' "${RESPONSE}")" == "" ]
    then
      ERROR=1
      printf "${C_RED}  ${1} %s${C_CLEAR}\n" "${LINE}"
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

function run_verb_special_funct_match_parent_env
{
  INDEX=0
  ERROR=0
  TOTAL=$(awk 'END {print NR+1}' "${EXPECTED_TO_ARGS[0]}")
  while [ "$INDEX" -le "$TOTAL" ]
  do
    VARIABLE="$(awk -v INDEX="${INDEX}" 'BEGIN {FS="="} NR == INDEX {print $1; exit}' "${EXPECTED_TO_ARGS[0]}")"
    if [ "$(awk -v regexp="${VARIABLE}\=" '$0 ~ regexp {print}' "${RESPONSE}")" == "" ]
    then
      ERROR=1
      printf "${C_RED}  ${1} %s${C_CLEAR}\n" "${VARIABLE}"
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

function run_expected_to
{
  shift 1
  local EXPECTED_TO_CMD="${1}"
  shift 1
  local -a EXPECTED_TO_ARGS=${@}

  eval "run_verb_${EXPECTED_TO_CMD}"
  if [ "${?}" != "0" ]
  then
    printf "${C_RED}  ✗ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "${LINE}"
  else
    printf "${C_GREEN}  √ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "${LINE}"
  fi
}

function run_might
{
  shift 1
  local EXPECTED_TO_CMD="${1}"
  shift 1
  local -a EXPECTED_TO_ARGS=${@}

  eval "run_verb_${EXPECTED_TO_CMD}"
  if [ "${?}" != "0" ]
  then
    printf "${C_YELLOW}  ~ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "${LINE}"
  else
    printf "${C_GREEN}  √ ${EXPECTED_STD_NAME} %s${C_CLEAR}\n" "${LINE}"
  fi
}

function run_expector
{
  local LINE
  local EXPECTED_STD="RESPONSE_${1}"
  local RESPONSE="${!EXPECTED_STD}"
  local EXPECTED_STD_NAME="${1}"
  local TEST_CMD
  local TEST_RETURN
  local OLD_IFS="${IFS}"

  #printf "  ${1}\n"
  IFS=$'\n'
  for LINE in $(cat "${TEST}/$(echo "${1}" | awk '{print tolower($0)}')")
  do
    TEST_CMD="$(echo "${LINE}" | awk '{ print $1 }')"
    eval "run_${TEST_CMD}" ${LINE}
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
  local EXIT_STATUS

  cd "${GLOBAL_TMP_DIRECTORY}"

  for TEST in $(find -E "${GLOBAL_INSTALLDIR}" -type d -regex "${GLOBAL_INSTALLDIR}/spec/${GLOBAL_SPECS_MATCHER}.*/[0-9]{3}\-.*")
  do
    TEST_NAME="${TEST##*/}"
    TEST_FULLNAME="${TEST##*spec/}"

    printf "#%s\n" "${TEST_FULLNAME}"

    if [ -f "${TEST}/before_exec" ]
    then
      eval "zsh" "${TEST}/before_exec"
    fi

    eval "${GLOBAL_PROG}" < "${TEST}/stdin" 1> "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stdout.raw" 2> "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stderr.raw"
    RESPONSE_EXIT_STATUS=${?}

    awk '{gsub(/\033\[[0-9;]*m/, ""); print}' "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stdout.raw" > "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stdout"
    awk '{gsub(/\033\[[0-9;]*m/, ""); print}' "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stderr.raw" > "${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stderr"

    RESPONSE_STDOUT="${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stdout"
    RESPONSE_STDERR="${GLOBAL_TMP_DIRECTORY}/spec.${TEST_NAME}.stderr"

    run_expector "STDOUT"
    run_expector "STDERR"
  done

  cd "${GLOBAL_INSTALLDIR}"
}

run_specs