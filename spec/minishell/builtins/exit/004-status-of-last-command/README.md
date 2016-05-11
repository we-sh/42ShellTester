# 004-status-of-last-command

*[spec > minishell > 001-builtins > exit](..) > 004-status-of-last-command*

### What is done before test

```bash
rm -f ./exit_with_status
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/support/exit-with-status/main.c -o ./exit_with_status

```

### Shell commands that are sent to the standard entry

```bash
./exit_with_status 42
exit

```

### What miscellaneous behaviors are expected

```bash
expected_to exit_with_status 42

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
