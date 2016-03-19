# 002-unset-and-set-variable

*spec > minishell > 001-builtins > env > multiple-options > 002-unset-and-set-variable*

### What is done before test

```bash
rm -f display_env
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-env/main.c -o display_env
```

### Shell commands that are sent to the standard entry

```bash
env -u HOME -u PATH TESTVARIABLE=TOKEN display_env
```

### What is expected on standard output

```bash
might have_regexp "START DISPLAYING ENVIRONMENT VARIABLES$"
might have_regexp "TESTVARIABLE=TOKEN$"
might have_not_regexp "HOME="
might have_not_regexp "PATH="
might have_regexp "END DISPLAYING ENVIRONMENT VARIABLES$"
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
