# 004-no-such-file-or-directory

*spec > minishell > builtins > cd > errors > 004-no-such-file-or-directory*

### What is done before test

```bash
if [ -f no_such_file_or_directory ]; then rm -r no_such_file_or_directory; fi
```

### Shell commands that are sent to the standard entry

```bash
cd no_such_file_or_directory
${GLOBAL_TMP_DIRECTORY}/display_pwd

```

### What is expected on standard output

```bash
expected_to have_regexp "PWD:${GLOBAL_TMP_DIRECTORY}:PWD$"
```

### What is expected on error output

```bash
expected_to be_filled
might have_regexp "[Nn]o such file or directory"
```

### What miscellaneous behaviors are expected

```bash
might exit_with_status 1
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
