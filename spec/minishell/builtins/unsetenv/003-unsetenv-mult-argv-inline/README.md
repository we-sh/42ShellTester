# 004-unsetenv-mult-argv-inline

*[spec > minishell > builtins > unsetenv](..) > 004-unsetenv-mult-argv-inline*

### Shell commands that are sent to the standard entry

```bash
 unsetenv SSH_AUTH_SOCK Apple_PubSub_Socket_Render COLORFGBG ITERM_PROFILE XPC_FLAGS LANG PWD SHELL TERM_PROGRAM PATH TERM HOME TMPDIR USER XPC_SERVICE_NAME LOGNAME __CF_USER_TEXT_ENCODING ITERM_SESSION_ID SHLVL OLDPWD ZSH PAGER LESS LC_CTYPE LSCOLORS _ HOSTTYPE VENDOR OSTYPE MACHTYPE
env

```

### What is expected on standard output

```bash
expected_to_not match_regex $SSH_AUTH_SOCK
expected_to_not match_regex $Apple_PubSub_Socket_Render
expected_to_not match_regex $COLORFGBG
expected_to_not match_regex $ITERM_PROFILE
expected_to_not match_regex $XPC_FLAGS
expected_to_not match_regex $LANG
expected_to_not match_regex $SHELL
expected_to_not match_regex $TERM_PROGRAM
expected_to_not match_regex $TERM
expected_to_not match_regex $TMPDIR
expected_to_not match_regex $__CF_USER_TEXT_ENCODING
expected_to_not match_regex $ITERM_SESSION_ID
expected_to_not match_regex $PAGER
expected_to_not match_regex $ZSH
expected_to_not match_regex $LESS
expected_to_not match_regex $LC_CTYPE
expected_to_not match_regex $LSCOLORS
expected_to_not match_regex $PATH

```

### What is expected on error output

```bash
expected_to be_empty
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
