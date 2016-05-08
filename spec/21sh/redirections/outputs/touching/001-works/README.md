# 001-works

*[spec > 21sh > redirections > outputs > touching](..) > 001-works*

### What is done before test

```bash
rm -f new_file
```

### Shell commands that are sent to the standard entry

```bash
/bin/ls .. invalid_folder :>new_file

```

### What is expected on standard output

```bash
expected_to have_regexp "42shTests.sh"

```

### What is expected on error output

```bash
expected_to have_regexp "No such file or directory"
```

### What miscellaneous behaviors are expected

```bash
expected_to create_file new_file with_nb_of_lines 0
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
