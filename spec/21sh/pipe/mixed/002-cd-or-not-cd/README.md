# 002-cd-or-not-cd

*[spec > 21sh > pipe > mixed](..) > 002-cd-or-not-cd*

Calling the built-in `cd` in a piped process does not result in a current directory change.
### What is done before test

```bash
rm -f ./display_pwd
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/display-pwd/main.c" -o ./display_pwd

```

### Shell commands that are sent to the standard entry

```bash
cd / | ./display_pwd

```

### What is expected on standard output

```bash
expected_to have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}:PWD"

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
