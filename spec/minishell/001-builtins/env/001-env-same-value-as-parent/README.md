# 001-env-same-value-as-parent

*spec > minishell > 001-builtins > env > 001-env-same-value-as-parent*

### What is done before test

```bash
env > stored_env;
```

### Shell commands that are sent to the standard entry

```bash
env
```

### What is expected on standard output

```bash
expected_to special_funct_match_parent_env stored_env

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
