#!/bin/bash

# /*
# Launcher
# */

get_install_directory()
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
GLOBAL_PROG=""
GLOBAL_PROG_REFERENCE=""
GLOBAL_SPECS_FILTER=""
GLOBAL_ENTRYPATH=$(pwd)
GLOBAL_INSTALLDIR="$(get_install_directory)"
GLOBAL_TMP_DIRECTORY="${GLOBAL_INSTALLDIR}/tmp"
GLOBAL_LOCALBRANCH=$(git branch | awk '$0 ~ /^\*/ {print $2; exit}')
GLOBAL_TOKEN="TOKEN$(date +%Y%m%d%H%M)"
GLOBAL_TOTAL_TESTS=0
GLOBAL_TOTAL_FAILED_TESTS=0
GLOBAL_TOTAL_PENDING_TESTS=0
GLOBAL_LOG=""
GLOBAL_SHOW_SUCCESS=0
GLOBAL_RUN_POSIX_ONLY=0
GLOBAL_RUN_PENDING_TESTS=0
GLOBAL_RUN_HARD_TESTS=0
GLOBAL_RUN_ALL_TESTS=0
GLOBAL_INVALID_OPTION=0
C_BOLD="\033[37;1m"
C_RED="\033[31m\033[38;5;160m"
C_GREEN="\033[31m\033[38;5;34m"
C_YELLOW="\033[31m\033[1;33m"
C_GREY="\033[38;5;239m"
C_CLEAR="\033[0m"

# retrieve options
while [ ! -z "${1}" ]; do
  if [[ "${1}" =~ ^-- ]]
  then
    case "${1}" in
      "--reference")
        shift 1
        GLOBAL_PROG_REFERENCE="$(which ${1})"
        ;;
      "--filter")
        shift 1
        GLOBAL_SPECS_FILTER="${1}"
        ;;
      "--show-success")
        GLOBAL_SHOW_SUCCESS=1
        ;;
      "--pending")
        GLOBAL_RUN_PENDING_TESTS=1
        ;;
      "--posix")
        GLOBAL_RUN_POSIX_ONLY=1
        ;;
      "--hard")
        GLOBAL_RUN_HARD_TESTS=1
        ;;
      "--all")
        GLOBAL_RUN_ALL_TESTS=1
        ;;
      *)
        printf "%s\n" "Invalid option: ${1}"
        exit 1
        ;;
    esac
  else
    if [ "${GLOBAL_PROG}" == "" ]
    then
      [[ "${1}" =~ ^[\.][\.]\/ ]] && GLOBAL_PROG="../${1}" || GLOBAL_PROG="$(which ${1})"
    fi
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

# compile support binaries
make re -C "${GLOBAL_INSTALLDIR}/support/" TARGET_DIR=${GLOBAL_TMP_DIRECTORY} 1>- 2>-

# run main function
run_main

# display log
printf "%s\n\nTotal tests: %s\nTotal failed tests: %s\nTotal pending tests: %s\n" "${GLOBAL_LOG}" "${GLOBAL_TOTAL_TESTS}" "${GLOBAL_TOTAL_FAILED_TESTS}" "${GLOBAL_TOTAL_PENDING_TESTS}"

# go back to entry directory
cd "${GLOBAL_ENTRYPATH}"

# exit with success or error status
if [ "${GLOBAL_TOTAL_FAILED_TESTS}" == "0" ]
then
  exit 0
else
  exit 1
fi
