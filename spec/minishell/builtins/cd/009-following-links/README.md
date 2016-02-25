# 009-following-links

*spec > minishell > builtins > cd > 009-following-links*

### What is done before test

```bash
rm -fr symbolic_link1 subdirectory
mkdir -p subdirectory/subsubdirectory
ln -s subdirectory symbolic_link1
ln -s subsubdirectory subdirectory/symbolic_link2

rm -f display_pwd
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-pwd/main.c -o display_pwd
```

### Shell commands that are sent to the standard entry

```bash
cd symbolic_link1
/bin/pwd
${GLOBAL_TMP_DIRECTORY}/display_pwd

cd symbolic_link2
/bin/pwd
${GLOBAL_TMP_DIRECTORY}/display_pwd

```

### What is expected on standard output

```bash
expected_to have_regexp "${GLOBAL_TMP_DIRECTORY}/symbolic_link1$"
expected_to have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}/subdirectory:PWD$"

expected_to have_regexp "${GLOBAL_TMP_DIRECTORY}/symbolic_link1/symbolic_link2$"
expected_to have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}/subdirectory/subsubdirectory:PWD$"
```

### What is expected on error output

```bash
expected_to be_empty
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
