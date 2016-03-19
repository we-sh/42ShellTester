# 005-set-variables

*spec > minishell > 001-builtins > env > 005-set-variables*

### What is done before test

```bash
rm -f display_env
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-env/main.c -o display_env
```

### Shell commands that are sent to the standard entry

```bash
env 42SHTESTS1=TOKEN1 42SHTESTS2=TOKEN2 42SHTESTS3=TOKEN3 display_env

```

### What is expected on standard output

```bash
expected_to have_regexp "42SHTESTS1=TOKEN1$"
expected_to have_regexp "42SHTESTS2=TOKEN2$"
expected_to have_regexp "42SHTESTS3=TOKEN3$"
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
