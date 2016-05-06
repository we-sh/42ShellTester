# 002-together-1

*spec > 21sh > redirections > outputs > truncating > multiple > 002-together-1*

### What is done before test

```bash
rm -f new_file_stderr_and_stdout
```

### Shell commands that are sent to the standard entry

```bash
/bin/ls .. invalid_folder 1>new_file_stderr_and_stdout 2>&1

```

### What is expected on standard output

```bash
expected_to have_not_regexp "No such file or directory"
expected_to have_not_regexp "42shTests.sh"

```

### What is expected on error output

```bash
expected_to have_not_regexp "No such file or directory"
expected_to have_not_regexp "42shTests.sh"

```

### What miscellaneous behaviors are expected

```bash
expected_to create_file new_file_stderr_and_stdout with_regexp "No such file or directory"
expected_to create_file new_file_stderr_and_stdout with_regexp "42shTests.sh"
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
