# 003-whitespace-before-filename

*spec > 21sh > redirections > outputs > truncating > 003-whitespace-before-filename*

### What is done before test

```bash
rm -f new_file
```

### Shell commands that are sent to the standard entry

```bash
/bin/echo TOKEN1 > new_file

```

### What is expected on standard output

```bash
expected_to have_not_regexp TOKEN1
```

### What is expected on error output

```bash
expected_to be_empty
```

### What miscellaneous behaviors are expected

```bash
expected_to create_file new_file with_regexp TOKEN1
expected_to create_file new_file with_nb_of_lines 1
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
