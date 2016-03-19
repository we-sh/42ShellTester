# 003-unsetenv-mult-argv

*spec > minishell > 001-builtins > unsetenv > 003-unsetenv-mult-argv*

### Shell commands that are sent to the standard entry

```bash
unsetenv SSH_AUTH_SOCK
unsetenv Apple_PubSub_Socket_Render
unsetenv COLORFGBG
unsetenv ITERM_PROFILE
unsetenv XPC_FLAGS
unsetenv LANG
unsetenv PWD
unsetenv SHELL
unsetenv TERM_PROGRAM
unsetenv PATH
unsetenv TERM
unsetenv HOME
unsetenv TMPDIR
unsetenv USER
unsetenv XPC_SERVICE_NAME
unsetenv LOGNAME
unsetenv __CF_USER_TEXT_ENCODING
unsetenv ITERM_SESSION_ID
unsetenv SHLVL
unsetenv OLDPWD
unsetenv ZSH
unsetenv PAGER
unsetenv LESS
unsetenv LC_CTYPE
unsetenv LSCOLORS
unsetenv _
unsetenv HOSTTYPE
unsetenv VENDOR
unsetenv OSTYPE
unsetenv MACHTYPE
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
