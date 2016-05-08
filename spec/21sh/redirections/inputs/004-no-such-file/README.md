# 004-no-such-file

*[spec > 21sh > redirections > inputs](..) > 004-no-such-file*

### What is done before test

```bash
rm -f no_such_file

rm -f ./read_on_stdin
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/read-on-stdin/main.c" -o ./read_on_stdin

```

### Shell commands that are sent to the standard entry

```bash
./read_on_stdin <no_such_file

```

### What is expected on standard output

```bash
might be_empty

```

### What is expected on error output

```bash
expected_to_not be_empty
might have_regexp "[Nn]o such file or directory"

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
