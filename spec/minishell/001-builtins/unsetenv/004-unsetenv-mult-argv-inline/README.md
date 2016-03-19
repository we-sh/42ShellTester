# 004-unsetenv-mult-argv-inline

*spec > minishell > 001-builtins > unsetenv > 004-unsetenv-mult-argv-inline*

### Shell commands that are sent to the standard entry

```bash
 unsetenv SSH_AUTH_SOCK Apple_PubSub_Socket_Render COLORFGBG ITERM_PROFILE XPC_FLAGS LANG PWD SHELL TERM_PROGRAM PATH TERM HOME TMPDIR USER XPC_SERVICE_NAME LOGNAME __CF_USER_TEXT_ENCODING ITERM_SESSION_ID SHLVL OLDPWD ZSH PAGER LESS LC_CTYPE LSCOLORS _ HOSTTYPE VENDOR OSTYPE MACHTYPE
env

```

### What is expected on standard output

```bash
expected_to have_not_regexp $SSH_AUTH_SOCK
expected_to have_not_regexp $Apple_PubSub_Socket_Render
expected_to have_not_regexp $COLORFGBG
expected_to have_not_regexp $ITERM_PROFILE
expected_to have_not_regexp $XPC_FLAGS
expected_to have_not_regexp $LANG
expected_to have_not_regexp $SHELL
expected_to have_not_regexp $TERM_PROGRAM
expected_to have_not_regexp $TERM
expected_to have_not_regexp $TMPDIR
expected_to have_not_regexp $__CF_USER_TEXT_ENCODING
expected_to have_not_regexp $ITERM_SESSION_ID
expected_to have_not_regexp $PAGER
expected_to have_not_regexp $ZSH
expected_to have_not_regexp $LESS
expected_to have_not_regexp $LC_CTYPE
expected_to have_not_regexp $LSCOLORS
expected_to have_not_regexp $PATH

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
