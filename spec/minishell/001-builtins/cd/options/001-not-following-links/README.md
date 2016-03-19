# 001-not-following-links

*spec > minishell > 001-builtins > cd > options > 001-not-following-links*

### What is done before test

```bash
rm -fr subdirectory_link subdirectory
mkdir -p subdirectory/subsubdirectory
ln -s subdirectory subdirectory_link
ln -s subsubdirectory subdirectory/subsubdirectory_link

rm -f display_pwd
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-pwd/main.c -o display_pwd

```

### Shell commands that are sent to the standard entry

```bash
cd -P subdirectory_link
/bin/pwd
${GLOBAL_TMP_DIRECTORY}/display_pwd

cd -P subsubdirectory_link
/bin/pwd
${GLOBAL_TMP_DIRECTORY}/display_pwd

```

### What is expected on standard output

```bash
might have_not_regexp "${GLOBAL_TMP_DIRECTORY}/subdirectory_link$"
might have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}/subdirectory:PWD$"

might have_not_regexp "${GLOBAL_TMP_DIRECTORY}/subdirectory_link/subsubdirectory_link$"
might have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}/subdirectory/subsubdirectory:PWD$"

```

### What is expected on error output

```bash
might be_empty

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
