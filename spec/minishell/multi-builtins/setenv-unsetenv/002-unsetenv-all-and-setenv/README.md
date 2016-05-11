# 002-unsetenv-all-and-setenv

*[spec > minishell > multi-builtins > setenv-unsetenv](..) > 002-unsetenv-all-and-setenv*

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
expected_to match_regex TEST2=ok$
expected_to match_regex USER=42shtests$

```

### Variables

The following variables may appear in this test:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42ShellTester
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME

### Support binaries

The following binaries may appear in this test:


* **./display_env** -> A binary that iterates on `**envp` and write each element on standard output.
* **./display_program_name** -> A binary that writes its name on standard ouput.
* **./display_pwd** -> A binary that writes on standard output the absolute path of the current directory returned by `getcwd(3)`.
* **./exit_with_status** -> A binary that immediately exits with the status given as first argument.
* **./read_on_stdin** -> A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character).
* **./write_on_stdout** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **./write_on_stdout_and_stderr** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".
