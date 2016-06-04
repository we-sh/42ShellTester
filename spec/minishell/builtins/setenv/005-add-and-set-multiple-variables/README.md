# 005-add-multiple-variables

*[spec > minishell > builtins > setenv](..) > 005-add-multiple-variables*

The purpose of this test is to check that the builtin `setenv` (or `export`) can add multiples variables into the environment, either with the syntax `setenv KEY VALUE` or with `setenv KEY=VALUE`.
### What is done before test

```bash
unset "TESTVAR1"
unset "TESTVAR2"
unset "TESTVAR3"
unset "TESTVAR4"
unset "TESTVAR5"
unset "TESTVAR6"
unset "TESTVAR7"
unset "TESTVAR8"
unset "TESTVAR9"
unset "TESTVAR10"

```

### Shell commands that are sent to the standard entry

```bash
setenv TEST_VAR1 VALUE_${GLOBAL_TOKEN}_1
setenv TEST_VAR2 VALUE_${GLOBAL_TOKEN}_2
setenv TEST_VAR3 VALUE_${GLOBAL_TOKEN}_3
setenv TEST_VAR4 VALUE_${GLOBAL_TOKEN}_4
setenv TEST_VAR5 VALUE_${GLOBAL_TOKEN}_5
setenv TEST_VAR6 VALUE_${GLOBAL_TOKEN}_6
setenv TEST_VAR7 VALUE_${GLOBAL_TOKEN}_7
setenv TEST_VAR8 VALUE_${GLOBAL_TOKEN}_8
setenv TEST_VAR9 VALUE_${GLOBAL_TOKEN}_9
setenv TEST_VAR10 VALUE_${GLOBAL_TOKEN}_10
./display_env

setenv TEST_VAR1=VALUE_${GLOBAL_TOKEN}_1
setenv TEST_VAR2=VALUE_${GLOBAL_TOKEN}_2
setenv TEST_VAR3=VALUE_${GLOBAL_TOKEN}_3
setenv TEST_VAR4=VALUE_${GLOBAL_TOKEN}_4
setenv TEST_VAR5=VALUE_${GLOBAL_TOKEN}_5
setenv TEST_VAR6=VALUE_${GLOBAL_TOKEN}_6
setenv TEST_VAR7=VALUE_${GLOBAL_TOKEN}_7
setenv TEST_VAR8=VALUE_${GLOBAL_TOKEN}_8
setenv TEST_VAR9=VALUE_${GLOBAL_TOKEN}_9
setenv TEST_VAR10=VALUE_${GLOBAL_TOKEN}_10
./display_env

export TEST_VAR1=VALUE_${GLOBAL_TOKEN}_1
export TEST_VAR2=VALUE_${GLOBAL_TOKEN}_2
export TEST_VAR3=VALUE_${GLOBAL_TOKEN}_3
export TEST_VAR4=VALUE_${GLOBAL_TOKEN}_4
export TEST_VAR5=VALUE_${GLOBAL_TOKEN}_5
export TEST_VAR6=VALUE_${GLOBAL_TOKEN}_6
export TEST_VAR7=VALUE_${GLOBAL_TOKEN}_7
export TEST_VAR8=VALUE_${GLOBAL_TOKEN}_8
export TEST_VAR9=VALUE_${GLOBAL_TOKEN}_9
export TEST_VAR10=VALUE_${GLOBAL_TOKEN}_10
./display_env

```

### What is expected on standard output

```bash
expected_to match_regex "TEST_VAR1=VALUE_${GLOBAL_TOKEN}_1"
expected_to match_regex "TEST_VAR2=VALUE_${GLOBAL_TOKEN}_2"
expected_to match_regex "TEST_VAR3=VALUE_${GLOBAL_TOKEN}_3"
expected_to match_regex "TEST_VAR4=VALUE_${GLOBAL_TOKEN}_4"
expected_to match_regex "TEST_VAR5=VALUE_${GLOBAL_TOKEN}_5"
expected_to match_regex "TEST_VAR6=VALUE_${GLOBAL_TOKEN}_6"
expected_to match_regex "TEST_VAR7=VALUE_${GLOBAL_TOKEN}_7"
expected_to match_regex "TEST_VAR8=VALUE_${GLOBAL_TOKEN}_8"
expected_to match_regex "TEST_VAR9=VALUE_${GLOBAL_TOKEN}_9"
expected_to match_regex "TEST_VAR10=VALUE_${GLOBAL_TOKEN}_10"

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


* **[./display_env](http://github.com/42shTests/42ShellTester/tree/master/support/display-env)** -> A binary that iterates on `**envp` and write each element on standard output.
* **[./display_program_name](http://github.com/42shTests/42ShellTester/tree/master/support/display-program-name)** -> A binary that writes its name on standard ouput.
* **[./display_pwd](http://github.com/42shTests/42ShellTester/tree/master/support/display-pwd)** -> A binary that writes on standard output the absolute path of the current directory returned by `getcwd(3)`, encountered with the strings `PWD:` and `:PWD`.
* **[./exit_with_status](http://github.com/42shTests/42ShellTester/tree/master/support/exit-with-status)** -> A binary that immediately exits with the status given as first argument.
* **[./read_on_stdin](http://github.com/42shTests/42ShellTester/tree/master/support/read-on-stdin)** -> A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.
* **[./sleep_and_exit_with_status](http://github.com/42shTests/42ShellTester/tree/master/support/sleep-and-exit-with-status)** -> A binary that sleeps for a duration in seconds given as first argument and then exits with status given as second argument.
* **[./sleep_and_write_on_stderr](http://github.com/42shTests/42ShellTester/tree/master/support/sleep-and-write-on-stderr)** -> A binary that sleeps for a duration in seconds given as first argument and then writes on STDERR the string given as second argument without EOL.
* **[./write_on_stderr](http://github.com/42shTests/42ShellTester/tree/master/support/write-on-stderr)** -> A binary that writes on standard error the first given argument (the same behavior as `echo` but with only one argument) and exits with an error status code given as second argument. If no argument is given, it writes the string "write on stderr" and exit with status `1`.
* **[./write_on_stdout](http://github.com/42shTests/42ShellTester/tree/master/support/write-on-stdout)** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **[./write_on_stdout_and_stderr](http://github.com/42shTests/42ShellTester/tree/master/support/write-on-stdout-and-stderr)** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".
