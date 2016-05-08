# 001-close-stdin

*[spec > 21sh > redirections > inputs](..) > 001-close-stdin*

### What is done before test

```bash
rm -f ./read_on_stdin
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/read-on-stdin/main.c" -o ./read_on_stdin

```

### Shell commands that are sent to the standard entry

```bash
./read_on_stdin <&-

```

### What is expected on standard output

```bash
might be_empty

```

### What is expected on error output

```bash
expected_to have_regexp "STDIN READ ERROR$"

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
