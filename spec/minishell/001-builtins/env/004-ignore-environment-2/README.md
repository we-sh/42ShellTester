# 004-ignore-environment-2

*spec > minishell > builtins > env > 004-ignore-environment-2*

### What is done before test

```bash
rm -f display_env
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-env/main.c -o display_env
```

### Shell commands that are sent to the standard entry

```bash
env --ignore-environment display_env
```

### What is expected on standard output

```bash
expected_to have_nb_of_lines 2
expected_to have_regexp "START DISPLAYING ENVIRONMENT VARIABLES$"
expected_to have_regexp "END DISPLAYING ENVIRONMENT VARIABLES$"
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
