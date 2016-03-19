# 002-env-check-usefull-var

*spec > minishell > 001-builtins > env > 002-env-check-usefull-var*

### What is done before test

```bash
export TEST_42SHTEST=token1;

```

### Shell commands that are sent to the standard entry

```bash
env
```

### What is expected on standard output

```bash
expected_to have_regexp PATH=
expected_to have_regexp PATH=${PATH}

expected_to have_regexp PWD=
expected_to have_regexp PWD=${PWD}

expected_to have_regexp OLDPWD=
expected_to have_regexp OLDPWD=${OLDPWD}

expected_to have_regexp HOME=
expected_to have_regexp HOME=${HOME}

expected_to have_regexp TEST_42SHTEST=
expected_to have_regexp TEST_42SHTEST=token1

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
