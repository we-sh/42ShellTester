# 003-together-stderr-first

*[spec > 21sh > redirections > outputs > truncating > multiple](..) > 003-together-stderr-first*

### What is done before test

```bash
rm -f new_file_stderr_and_stdout
rm -f ./write_on_stdout_and_stderr
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/write-on-stdout-and-stderr/main.c" -o ./write_on_stdout_and_stderr

```

### Shell commands that are sent to the standard entry

```bash
./write_on_stdout_and_stderr ${GLOBAL_TOKEN}_1 ${GLOBAL_TOKEN}_2 2>new_file_stderr_and_stdout 1>&2

```

### What is expected on standard output

```bash
expected_to_not have_regexp "${GLOBAL_TOKEN}_1"
expected_to_not have_regexp "${GLOBAL_TOKEN}_2"

```

### What is expected on error output

```bash
expected_to_not have_regexp "${GLOBAL_TOKEN}_1"
expected_to_not have_regexp "${GLOBAL_TOKEN}_2"

```

### What miscellaneous behaviors are expected

```bash
expected_to create_file new_file_stderr_and_stdout with_regexp "${GLOBAL_TOKEN}_1$"
expected_to create_file new_file_stderr_and_stdout with_regexp "${GLOBAL_TOKEN}_2$"

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
