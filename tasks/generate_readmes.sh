#!/bin/bash

GLOBAL_INSTALLDIR="$(pwd)"
GLOBAL_TMP_DIRECTORY="${GLOBAL_INSTALLDIR}/tmp"
GLOBAL_LOCALBRANCH=$(git branch | awk '$0 ~ /^\*/ {print $2; exit}')
GLOBAL_LIST_OF_TESTS=
GLOBAL_TOTAL_TESTS=0
GLOBAL_SUPPORT_BINARIES_LIST=""
GLOBAL_SUPPORT_BINARIES_LIST2=""

if [ "${GLOBAL_LOCALBRANCH}" != "master" ]
then
  printf "%s\n" "Task error: must be run in master branch to ensure pull requests to keep clean"
  exit 1
fi

if [ -f "./tasks/${BASH_SOURCE[0]}" ]
then
  printf "%s\n" "Task error: must be run from install directory"
  exit 1
fi

run_create_support_binaries_readme()
{
  local SUPPORT_FILE
  local README
  local SUPPORT_FILE_NAME

  for SUPPORT_FILE in ./support/*
  do
    if [ -d "${SUPPORT_FILE}" ]
    then

      README="${SUPPORT_FILE}/README.md"
      SUPPORT_MAIN="${SUPPORT_FILE}/main.c"
      SUPPORT_DESCRIPTION="${SUPPORT_FILE}/description"
      SUPPORT_DIR_NAME="${SUPPORT_FILE##*/}"
      SUPPORT_BINARY_NAME="${SUPPORT_DIR_NAME//-/_}"

      printf "# %s\n\n" "./${SUPPORT_BINARY_NAME}" >"${README}"
      [ -f "${SUPPORT_DESCRIPTION}" ] && printf "%s\n\n" "$(cat "${SUPPORT_DESCRIPTION}")" >>"${README}"
      printf "\`\`\`c\n%s\n\`\`\`\n" "$(cat "${SUPPORT_MAIN}")" >>"${README}"

      GLOBAL_SUPPORT_BINARIES_LIST="$(printf "%s\n%s" "${GLOBAL_SUPPORT_BINARIES_LIST}" "* **[./${SUPPORT_BINARY_NAME}](http://github.com/we-sh/42ShellTester/tree/master/support/${SUPPORT_DIR_NAME})** -> $(cat "${SUPPORT_DESCRIPTION}")")"
      GLOBAL_SUPPORT_BINARIES_LIST2="${GLOBAL_SUPPORT_BINARIES_LIST2}\n\052 **[./${SUPPORT_BINARY_NAME}](http://github.com/we-sh/42ShellTester/tree/master/support/${SUPPORT_DIR_NAME})**: $(cat "${SUPPORT_DESCRIPTION}")"

    fi
  done
}

run_create_support_binaries_readme

run_create_readme()
{
  local INDEX="${1}"
  local TEST="${2}"
  local TEST_NAME="${TEST##*/}"
  local TEST_FULLNAME="${TEST##*spec/}"
  local PARENT_DIR_NAME="${TEST%/*}"
  local README="${TEST}/README.md"

  (( GLOBAL_TOTAL_TESTS= GLOBAL_TOTAL_TESTS + 1 ))

  printf "# %s\n\n" "${TEST_NAME}" >"${README}"
  printf "*[%s](%s) > %s*\n\n" "${PARENT_DIR_NAME//\// > }" ".." "${DIR_NAME}" >>"${README}"

  if [ -f "${TEST}/description" ]; then cat "${TEST}/description" >>"${README}"; fi

  if [ -f "${TEST}/before_exec" ]
  then
    printf "### What is done before test\n\n\`\`\`bash\n" >>"${README}"
    cat "${TEST}/before_exec" >>"${README}"
    printf "\n\`\`\`\n\n" >>"${README}"
  fi

  printf "### Shell commands that are sent to the standard entry\n\n\`\`\`bash\n" >>"${README}"
  cat "${TEST}/stdin" >>"${README}"
  printf "\n\`\`\`\n\n" >>"${README}"

  if [ -f "${TEST}/stdout" ]
  then
    printf "### What is expected on standard output\n\n\`\`\`bash\n" >>"${README}"
    cat "${TEST}/stdout" >>"${README}"
    printf "\n\`\`\`\n\n" >>"${README}"
  fi

  if [ -f "${TEST}/stderr" ]
  then
    printf "### What is expected on error output\n\n\`\`\`bash\n" >>"${README}"
    cat "${TEST}/stderr" >>"${README}"
    printf "\n\`\`\`\n\n" >>"${README}"
  fi

  if [ -f "${TEST}/misc" ]
  then
    printf "### What miscellaneous behaviors are expected\n\n\`\`\`bash\n" >>"${README}"
    cat "${TEST}/misc" >>"${README}"
    printf "\n\`\`\`\n\n" >>"${README}"
  fi

  printf "### Variables\n\nThe following variables may appear in this test:\n\n" >>"${README}"
  printf "* \${**GLOBAL_INSTALLDIR**} -> The installation directory of 42ShellTester\n" >>"${README}"
  printf "* \${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed\n" >>"${README}"
  printf "* \${**GLOBAL_TOKEN**} -> A token that changes value at launch time\n" >>"${README}"
  printf "* \${**PATH**} -> The standard environment variable PATH\n" >>"${README}"
  printf "* \${**HOME**} -> The standard environment variable HOME\n\n" >>"${README}"

  printf "### Support binaries\n\nThe following binaries may appear in this test:\n\n%s\n" "${GLOBAL_SUPPORT_BINARIES_LIST}" >>"${README}"
}

run_browse_directory()
{
  local -i INDEX=${1}
  local DIR="${2}"
  local DIR_NAME="${DIR##*/}"
  local DIR_FULLNAME="${DIR##*spec/}"
  local PARENT_DIR_NAME="${DIR%/*}"
  local README="${DIR}/README.md"
  local SUBDIR
  local IMGS=""

  if [ -f "${DIR}/stdin" ]
  then
    [ -f "${DIR}/non-posix" ] && IMGS=" <img src='./lib/assets/non-posix.png' width='63' height='12' />"
    [ -f "${DIR}/hard" ] && IMGS="${IMGS} <img src='./lib/assets/hard.png' width='38' height='12' />"
    [ -f "${DIR}/pending" ] && IMGS="${IMGS} <img src='./lib/assets/pending.png' width='54' height='12' />"
    GLOBAL_LIST_OF_TESTS="${GLOBAL_LIST_OF_TESTS}$(printf "% $(( INDEX * 2 ))s\052 [%s](%s)" "" "${DIR_NAME}${IMGS}" "${DIR}")\n"
    run_create_readme "${INDEX}" "${DIR}"
  else

    [ "${INDEX}" != "-1" ] && GLOBAL_LIST_OF_TESTS="${GLOBAL_LIST_OF_TESTS}$(printf "% $(( INDEX * 2 ))s\052 **[%s/](%s)**" "" "${DIR_NAME}" "${DIR}")\n"

    printf "# %s\n\n" "${DIR_NAME}" >"${README}"
    [ "${INDEX}" != "-1" ] && printf "*[%s](%s) > %s*\n\n" "${PARENT_DIR_NAME//\// > }" ".." "${DIR_NAME}" >>"${README}"

    for SUBDIR in $(ls -1 "${DIR}")
    do
      if [ -d "${DIR}/${SUBDIR}" ]
      then
        printf "\052 [%s](%s)\n" "${SUBDIR}" "./${SUBDIR}" >>"${README}"
        run_browse_directory "$(( INDEX + 1 ))" "${DIR}/${SUBDIR}"
      fi
    done

  fi
}

run_browse_directory -1 "spec"

awk -v SUPPORT_BINARIES_LIST="${GLOBAL_SUPPORT_BINARIES_LIST2}\n" -v LIST="${GLOBAL_LIST_OF_TESTS}" -v GLOBAL_TOTAL_TESTS="${GLOBAL_TOTAL_TESTS}" '
BEGIN {
  INSERT_DATA=0
}
INSERT_DATA == 0 {
  print
}
$0 ~ /<!--START_TOTAL_TESTS-->/ {
  INSERT_DATA=1;
  print "42ShellTester is currently packaged with **"GLOBAL_TOTAL_TESTS" tests**."
}
$0 ~ /<!--END_TOTAL_TESTS-->/ {
  INSERT_DATA=0;
  print
}
$0 ~ /<!--START_SUPPORT_BINARIES_LIST-->/ {
  INSERT_DATA=1;
  print SUPPORT_BINARIES_LIST
}
$0 ~ /<!--END_SUPPORT_BINARIES_LIST-->/ {
  INSERT_DATA=0;
  print
}
$0 ~ /<!--START_LIST_TESTS-->/ {
  INSERT_DATA=1;
  print LIST
}
$0 ~ /<!--END_LIST_TESTS-->/ {
  INSERT_DATA=0;
  print
}
' README.md > README.new.md && rm -f README.md && mv README.new.md README.md
