#!/bin/bash

declare GLOBAL_INSTALLDIR="$(cd .. && pwd)"
declare GLOBAL_TMP_DIRECTORY="${GLOBAL_INSTALLDIR}/tmp"

function run_generate_readmes
{
  local TEST
  local TEST_NAME
  local TEST_FULLNAME
  local RESULT
  local RESPONSE_STDOUT
  local RESPONSE_STDERR
  local EXIT_STATUS

  for TEST in $(find -E "${GLOBAL_INSTALLDIR}/spec" -type d -regex "${GLOBAL_INSTALLDIR}/spec/.*${GLOBAL_SPECS_MATCHER}.*/[0-9]{3}\-.*")
  do
    TEST_NAME="${TEST##*/}"
    TEST_FULLNAME="${TEST##*spec/}"

    printf "#%s\n" "${TEST_FULLNAME}"

    RESPONSE_STDOUT="${GLOBAL_TMP_DIRECTORY}/${TEST_FULLNAME//\//-}.stdout"
    RESPONSE_STDERR="${GLOBAL_TMP_DIRECTORY}/${TEST_FULLNAME//\//-}.stderr"

    if [ -f "${TEST}/stdin" ]
    then

      local README="${TEST}/README.md"

      printf "# %s\n\n" "${TEST_NAME}" >"${README}"
      printf "*spec > %s*\n\n" "${TEST_FULLNAME//\// > }" >>"${README}"

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

    fi
  done

}

run_generate_readmes
