# 001-single-pipe

*[spec > 21sh > pipe](..) > 001-single-pipe*

Simple test with one piped command.
The first process write a token on STDOUT and another on STDERR, then the second one read on STDIN and write lines suffixed with the character '@' (similar to `cat -e`).
### What is done before test

```bash
rm -f ./read_on_stdin
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/read-on-stdin/main.c" -o ./read_on_stdin

rm -f ./write_on_stdout_and_stderr
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/write-on-stdout-and-stderr/main.c" -o ./write_on_stdout_and_stderr

```

### Shell commands that are sent to the standard entry

```bash
./write_on_stdout_and_stderr "${GLOBAL_TOKEN}_stdout" "${GLOBAL_TOKEN}_stderr" | ./read_on_stdin

```

### What is expected on standard output

```bash
expected_to have_regexp "START READING ON STDIN@$"
expected_to have_regexp "${GLOBAL_TOKEN}_stdout@$"
expected_to have_regexp "END READING ON STDIN@$"

```

### What is expected on error output

```bash
expected_to have_regexp "${GLOBAL_TOKEN}_stderr$"

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
