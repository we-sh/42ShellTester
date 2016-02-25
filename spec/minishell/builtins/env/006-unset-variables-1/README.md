# 006-unset-variables-1

*spec > minishell > builtins > env > 006-unset-variables-1*

### What is done before test

```bash
rm -f display_env
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-env/main.c -o display_env
export TESTVARIABLE=TOKEN
```

### Shell commands that are sent to the standard entry

```bash
env -u HOME -u PATH -u TESTVARIABLE display_env

```

### What is expected on standard output

```bash
might have_not_regexp "HOME="
might have_not_regexp "PATH="
might have_not_regexp "TESTVARIABLE="
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
