# 002-valid-arg

*spec > minishell > 001-builtins > exit > 002-valid-arg*

### Shell commands that are sent to the standard entry

```bash
exit 42

```

### What is expected on error output

```bash
might be_empty
```

### What miscellaneous behaviors are expected

```bash
might exit_with_status 42
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
