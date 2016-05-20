# 003-setenv-equal

*[spec > minishell > builtins > setenv](..) > 003-setenv-equal*

The purpose of this test is to check if your setenv command works to add new environments variables.
For this test we are using the following syntax.
setenv VALUE=key### Shell commands that are sent to the standard entry

```bash
setenv SETENVNULL=

setenv SETENV1=1

setenv SETENVLONG=LONG

setenv setenvlowercase=lowercase

	   		 setenv 		Sp4c3_T4B=_O_		 		 

setenv _=_

setenv PATH=

setenv HOME=

setenv PWD=

setenv USER=

setenv LOGNAME=

setenv =

setenv ===

env
```

### What is expected on standard output

```bash
expected_to match_regex SETENVNULL=$

expected_to match_regex SETENV1=1$

expected_to match_regex SETENVLONG=LONG$

expected_to match_regex setenvlowercase=lowercase$

expected_to match_regex Sp4c3_T4B=_O_$

expected_to match_regex _=_$

expected_to match_regex PATH=$

expected_to match_regex HOME=$

expected_to match_regex PWD=$

expected_to match_regex USER=$

expected_to match_regex LOGNAME=$

```

### What is expected on error output

```bash
might_not be_empty

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
* **./read_on_stdin** -> A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.
* **./write_on_stderr** -> A binary that writes on standard error the first given argument (the same behavior as `echo` but with only one argument) and exits with an error status code given as second argument. If no argument is given, it writes the string "write on stderr" and exit with status `1`.
* **./write_on_stdout** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **./write_on_stdout_and_stderr** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".
