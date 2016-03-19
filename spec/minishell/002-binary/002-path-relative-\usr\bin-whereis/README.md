# 002-path-relative-\usr\bin-whereis

*spec > minishell > 002-binary > 002-path-relative-\usr\bin-whereis*

### What is done before test

```bash

```

### Shell commands that are sent to the standard entry

```bash
whereis yes

```

### What is expected on standard output

```bash
expected_to have_regexp /usr/bin/yes
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
