# 002-permission-denied

*spec > minishell > 001-builtins > cd > errors > 002-permission-denied*

### What is done before test

```bash
if [ -d permission_denied ]; then chmod 777 permission_denied; rm -r permission_denied; fi
mkdir -m 0 permission_denied

rm -f display_pwd
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/spec/support/display-pwd/main.c -o display_pwd
```

### Shell commands that are sent to the standard entry

```bash
cd permission_denied
${GLOBAL_TMP_DIRECTORY}/display_pwd

```

### What is expected on standard output

```bash
expected_to have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}:PWD$"
```

### What is expected on error output

```bash
expected_to be_filled
might have_regexp "[Pp]ermission denied"
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
