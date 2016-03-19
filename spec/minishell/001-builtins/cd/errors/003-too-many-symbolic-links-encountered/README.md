# 003-too-many-symbolic-links-encountered

*spec > minishell > 001-builtins > cd > errors > 003-too-many-symbolic-links-encountered*

### What is done before test

```bash
rm -f symbolic_link1 symbolic_link2 symbolic_link3
ln -s symbolic_link1 symbolic_link2
ln -s symbolic_link2 symbolic_link3
ln -s symbolic_link3 symbolic_link1

rm -f display_pwd
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-pwd/main.c -o display_pwd
```

### Shell commands that are sent to the standard entry

```bash
cd symbolic_link1
${GLOBAL_TMP_DIRECTORY}/display_pwd

```

### What is expected on standard output

```bash
expected_to have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}:PWD$"
```

### What is expected on error output

```bash
expected_to be_filled
might have_regexp "[Tt]oo many symbolic links encountered"
```

### What miscellaneous behaviors are expected

```bash
might exit_with_status 1
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
