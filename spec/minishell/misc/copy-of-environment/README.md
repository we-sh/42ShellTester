# copy-of-environment

*[spec > minishell > misc](..) > copy-of-environment*

A Shell must send a copy of the environment `char **envp` to its sub-processes.
### What is done before test

```bash
rm -f ./display_env
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/support/display-env/main.c -o ./display_env

export COPYENV_VAR1="${GLOBAL_TOKEN}_VAR1"
export COPYENV_VAR2="${GLOBAL_TOKEN}_VAR2"
export COPYENV_VAR3="${GLOBAL_TOKEN}_VAR3"

```

### Shell commands that are sent to the standard entry

```bash
./display_env

```

### What is expected on standard output

```bash
expected_to have_regexp "COPYENV_VAR1=${GLOBAL_TOKEN}_VAR1"
expected_to have_regexp "COPYENV_VAR2=${GLOBAL_TOKEN}_VAR2"
expected_to have_regexp "COPYENV_VAR3=${GLOBAL_TOKEN}_VAR3"

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
