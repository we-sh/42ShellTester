# 007-unset-variables-2

*[spec > minishell > 001-builtins > env](..) > 007-unset-variables-2*

### What is done before test

```bash
rm -f ./display_env
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/support/display-env/main.c -o ./display_env
export TESTVARIABLE=TOKEN

```

### Shell commands that are sent to the standard entry

```bash
env --unset HOME --unset PATH --unset TESTVARIABLE ./display_env

```

### What is expected on standard output

```bash
might_not have_regexp "HOME="
might_not have_regexp "PATH="
might_not have_regexp "TESTVARIABLE="

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
