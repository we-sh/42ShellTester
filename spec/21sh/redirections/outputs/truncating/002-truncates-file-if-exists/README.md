# 002-truncates-file-if-exists

*spec > 21sh > redirections > outputs > truncating > 002-truncates-file-if-exists*

### What is done before test

```bash
/bin/echo FIRST_TOKEN >truncated_file
```

### Shell commands that are sent to the standard entry

```bash
/bin/echo LAST_TOKEN >truncated_file

```

### What is expected on standard output

```bash
expected_to have_not_regexp LAST_TOKEN
```

### What miscellaneous behaviors are expected

```bash
expected_to create_file truncated_file with_regexp LAST_TOKEN
expected_to create_file truncated_file without_regexp FIRST_TOKEN
expected_to create_file truncated_file with_nb_of_lines 1
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
