# 002-unsetenv-all-and-setenv

*[spec > minishell > 003-multi-builtins > setenv-unsetenv](..) > 002-unsetenv-all-and-setenv*

### What is done before test

```bash
env > stored_env;
```

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
unsetenv SECURITYSESSIONID
unsetenv TERM_PROGRAM
unsetenv PATH
unsetenv COMMAND_MODE
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
setenv TEST=test
setenv TEST test
unsetenv TEST
setenv TEST2=ok
setenv TEST2 ok
setenv USER=42shtests
setenv USER 42shtests
env
```

### What is expected on standard output

```bash
expected_to have_regexp TEST2=ok$
expected_to have_regexp USER=42shtests$

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
