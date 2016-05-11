# 001-cd-HOME-without-environment

*[spec > minishell > 001-builtins > env > calling-builtins](..) > 001-cd-HOME-without-environment*

### Shell commands that are sent to the standard entry

```bash
env -i cd
/bin/pwd
```

### What is expected on standard output

```bash
expected_to have_regexp "${GLOBAL_TMP_DIRECTORY}$"
expected_to_not have_regexp "${HOME}$"

```

### What is expected on error output

```bash
expected_to_not be_empty

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
