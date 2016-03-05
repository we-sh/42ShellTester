# 003-too-many-args

*spec > minishell > builtins > exit > 003-too-many-args*

### Shell commands that are sent to the standard entry

```bash
exit 42 43
/bin/echo TOKEN_NOT_EXITED

```

### What is expected on standard output

```bash
expected_to have_regexp TOKEN_NOT_EXITED
```

### What is expected on error output

```bash
might be_filled
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
