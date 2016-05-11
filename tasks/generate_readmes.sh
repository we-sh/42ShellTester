#!/bin/bash

declare GLOBAL_INSTALLDIR="$(pwd)"
declare GLOBAL_TMP_DIRECTORY="${GLOBAL_INSTALLDIR}/tmp"
declare GLOBAL_LOCALBRANCH=$(git branch | awk '$0 ~ /^\*/ {print $2; exit}')
declare GLOBAL_LIST_OF_TESTS
declare -i GLOBAL_TOTAL_TESTS=0

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

  printf "### Variables\n\nThe following variables may appear in the tests:\n\n" >>"${README}"
  printf "* \${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests\n" >>"${README}"
  printf "* \${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed\n" >>"${README}"
  printf "* \${**GLOBAL_TOKEN**} -> A token that changes value at launch time\n" >>"${README}"
  printf "* \${**PATH**} -> The standard environment variable PATH\n" >>"${README}"
  printf "* \${**HOME**} -> The standard environment variable HOME\n" >>"${README}"
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

awk -v LIST="${GLOBAL_LIST_OF_TESTS}" -v GLOBAL_TOTAL_TESTS="${GLOBAL_TOTAL_TESTS}" '
BEGIN {
  INSERT_DATA=0
}
INSERT_DATA == 0 {
  print
}
$0 ~ /<!--START_TOTAL_TESTS-->/ {
  INSERT_DATA=1;
  print "42shTests is currently packaged with **"GLOBAL_TOTAL_TESTS" tests**."
}
$0 ~ /<!--END_TOTAL_TESTS-->/ {
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
