# 001-works

*[spec > 21sh > redirections > outputs > truncating > stderr](..) > 001-works*

### What is done before test

```bash
rm -f new_file_stderr
```

### Shell commands that are sent to the standard entry

```bash
/bin/ls .. invalid_folder 2>new_file_stderr

```

### What is expected on standard output

```bash
expected_to_not have_regexp "No such file or directory"
expected_to have_regexp "42shTests.sh"

```

### What is expected on error output

```bash
expected_to be_empty
```

### What miscellaneous behaviors are expected

```bash
expected_to create_file new_file_stderr with_regexp "No such file or directory"
expected_to create_file new_file_stderr with_nb_of_lines 1
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
