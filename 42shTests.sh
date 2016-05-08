#!/bin/sh

# /*
# Launcher
# */

function get_install_directory
{
  local SOURCE="${BASH_SOURCE[0]}"
  local DIR
  while [ -h "${SOURCE}" ]
  do
    DIR="$(cd -P "$(dirname "${SOURCE}")" && pwd)"
    SOURCE="$(readlink "${SOURCE}")"
    [[ "${SOURCE}" != /* ]] && SOURCE="${DIR}/${SOURCE}"
  done
  printf "%s" "$(cd -P "$(dirname "${SOURCE}")" && pwd)"
}

# global variables
declare GLOBAL_PROG=""
declare GLOBAL_PROG_REFERENCE=""
declare GLOBAL_SPECS_FILTER=""
declare GLOBAL_ENTRYPATH=$(pwd)
declare GLOBAL_INSTALLDIR="$(get_install_directory)"
declare GLOBAL_TMP_DIRECTORY="${GLOBAL_INSTALLDIR}/tmp"
declare GLOBAL_LOCALBRANCH=$(git branch | awk '$0 ~ /^\*/ {print $2; exit}')
declare GLOBAL_TOKEN="42SHTESTTOKEN_$(date +%Y%m%d%H%M)"
declare GLOBAL_TOTAL_TESTS=0
declare GLOBAL_TOTAL_FAILED_TESTS=0
declare GLOBAL_LOG=""
declare GLOBAL_SHOW_SUCCESS=0
declare GLOBAL_RUN_POSIX_ONLY=0
declare C_RED="\033[31m\033[38;5;160m"
declare C_GREEN="\033[31m\033[38;5;34m"
declare C_YELLOW="\033[31m\033[1;33m"
declare C_CLEAR="\033[0m"

# retrieve options
while [ ! -z "${1}" ]; do
  if [[ "${1}" =~ ^-- ]]
  then
    case "${1}" in
      "--reference")
        shift 1
        GLOBAL_PROG_REFERENCE="${1}"
        ;;
      "--filter")
        shift 1
        GLOBAL_SPECS_FILTER="${1}"
        ;;
      "--show-success")
        GLOBAL_SHOW_SUCCESS=1
        ;;
      "--posix")
        GLOBAL_RUN_POSIX_ONLY=1
        ;;
    esac
  else
    [ "${GLOBAL_PROG}" == "" ] && GLOBAL_PROG="${1}"
  fi
  shift 1
done

# go to install directory
cd "${GLOBAL_INSTALLDIR}"

# load application sources
for FILE in ./lib/* ./lib/verbs/*
do
  if [ -f "${FILE}" ]
  then
    source "${FILE}"
  fi
done

# create and go to temporary directory
mkdir -p "${GLOBAL_TMP_DIRECTORY}"
cd "${GLOBAL_TMP_DIRECTORY}"

# run main function
run_main

# display log
printf "%s\n\nTotal tests: %s\nTotal failed tests: %s\n" "${GLOBAL_LOG}" "${GLOBAL_TOTAL_TESTS}" "${GLOBAL_TOTAL_FAILED_TESTS}"

# go back to entry directory
cd "${GLOBAL_ENTRYPATH}"

# exit with success or error status
if [ "${GLOBAL_TOTAL_FAILED_TESTS}" == "0" ]
then
  exit 0
else
  exit 1
fi
