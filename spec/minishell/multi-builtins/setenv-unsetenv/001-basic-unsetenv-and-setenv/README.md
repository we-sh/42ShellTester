# 001-basic-unsetenv-and-setenv

*[spec > minishell > 003-multi-builtins > setenv-unsetenv](..) > 001-basic-unsetenv-and-setenv*

### What is done before test

```bash
env > stored_env;
```

### Shell commands that are sent to the standard entry

```bash
unsetenv PATH
unsetenv SSH_AUTH_SOCK
unsetenv _
setenv TEST=test
setenv TEST test
env
```

### What is expected on standard output

```bash
expected_to have_regexp TEST=test$

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
