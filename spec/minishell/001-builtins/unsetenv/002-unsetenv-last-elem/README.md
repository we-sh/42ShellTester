# 002-unsetenv-last-elem

*spec > minishell > 001-builtins > unsetenv > 002-unsetenv-last-elem*

### Shell commands that are sent to the standard entry

```bash
unsetenv _
unsetenv LSCOLORS
env
```

### What is expected on standard output

```bash
expected_to have_not_regexp $LSCOLORS
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
