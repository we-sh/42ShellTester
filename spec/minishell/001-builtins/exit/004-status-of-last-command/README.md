# 004-status-of-last-command

*spec > minishell > 001-builtins > exit > 004-status-of-last-command*

### Shell commands that are sent to the standard entry

```bash
/bin/[ 42 -eq 21
exit

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
