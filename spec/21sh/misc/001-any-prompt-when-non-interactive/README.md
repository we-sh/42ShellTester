# 001-any-prompt-when-non-interactive

*[spec > 21sh > misc](..) > 001-any-prompt-when-non-interactive*

A non-interactive Shell should not output a prompt. All the test suite runs the Shell in a non-interactive way so that `isatty()` returns `0`. This test is the only one that take it into account so that you can succeed the rest of the suite.
### What is done before test

```bash
rm -f ./write_on_stdout
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/write-on-stdout/main.c" -o ./write_on_stdout

```

### Shell commands that are sent to the standard entry

```bash
./write_on_stdout "${GLOBAL_TOKEN}"

```

### What is expected on standard output

```bash
expected_to have_nb_of_lines 1
expected_to have_regexp "^${GLOBAL_TOKEN}$"

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
