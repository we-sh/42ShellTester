# 002-filename

*[spec > 21sh > redirections > inputs](..) > 002-filename*

### What is done before test

```bash
rm -f simple_text_file
echo "${GLOBAL_TOKEN}_LINE_1" >> simple_text_file
echo "${GLOBAL_TOKEN}_LINE_2" >> simple_text_file
echo "${GLOBAL_TOKEN}_LINE_3" >> simple_text_file

rm -f ./read_on_stdin
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/read-on-stdin/main.c" -o ./read_on_stdin

```

### Shell commands that are sent to the standard entry

```bash
./read_on_stdin <simple_text_file

```

### What is expected on standard output

```bash
expected_to have_regexp "${GLOBAL_TOKEN}_LINE_1$"
expected_to have_regexp "${GLOBAL_TOKEN}_LINE_2$"
expected_to have_regexp "${GLOBAL_TOKEN}_LINE_3$"

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
