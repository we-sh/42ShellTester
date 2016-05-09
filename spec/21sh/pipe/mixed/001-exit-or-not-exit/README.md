# 001-exit-or-not-exit

*[spec > 21sh > pipe > mixed](..) > 001-exit-or-not-exit*

Calling the built-in `exit` in a piped process does not result in a Shell termination.
In this test, the two commands `echo` are nevertheless executed.
### Shell commands that are sent to the standard entry

```bash
exit | echo "I AM STILL ALIVE"
echo "${GLOBAL_TOKEN}"

```

### What is expected on standard output

```bash
expected_to have_regexp "I AM STILL ALIVE$"
expected_to have_regexp "${GLOBAL_TOKEN}$"

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
