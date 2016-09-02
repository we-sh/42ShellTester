# 004-read-text-file-and-break-with-blank-character-2

*[spec > bonuses > builtins > fold > text-files](..) > 004-read-text-file-and-break-with-blank-character-2*

The purpose of this test is to check that using the builtin 'fold' with the option '-s' breaks the lines after the last such <blank> character (width set to 51).
### What is done before test

```bash
rm -f "./folded_file"
printf "The purpose of this test is to check that using the builtin 'fold' with the option '-s' breaks the lines after the last such <blank> character.\nIfthereisno<blank>meetingtherequirements,the-soptionshallhavenoeffectforthatoutputsegmentoftheinputline." > "./folded_file"

```

### Shell commands that are sent to the standard entry

```bash
fold -s -w 51 folded_file

```

### What is expected on standard output

```bash
expected_to match_regex "^The purpose of this test is to check that using $"
expected_to match_regex "^the builtin 'fold' with the option '-s' breaks the $"
expected_to match_regex "^lines after the last such <blank> character.$"
expected_to match_regex "^Ifthereisno<blank>meetingtherequirements,the-soptio$"
expected_to match_regex "^nshallhavenoeffectforthatoutputsegmentoftheinputlin$"
expected_to match_regex "^e.$"

```

### What is expected on error output

```bash
expected_to be_empty

```

### What miscellaneous behaviors are expected

```bash
expected_to exit_with_status 0

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


* **[./display_env](http://github.com/we-sh/42ShellTester/tree/master/support/display-env)** -> A binary that iterates on `**envp` and write each element on standard output.
* **[./display_program_name](http://github.com/we-sh/42ShellTester/tree/master/support/display-program-name)** -> A binary that writes its name on standard ouput.
* **[./display_pwd](http://github.com/we-sh/42ShellTester/tree/master/support/display-pwd)** -> A binary that writes on standard output the absolute path of the current directory returned by `getcwd(3)`, encountered with the strings `PWD:` and `:PWD`.
* **[./exit_with_status](http://github.com/we-sh/42ShellTester/tree/master/support/exit-with-status)** -> A binary that immediately exits with the status given as first argument.
* **[./read_on_stdin](http://github.com/we-sh/42ShellTester/tree/master/support/read-on-stdin)** -> A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.
* **[./sleep_and_exit_with_status](http://github.com/we-sh/42ShellTester/tree/master/support/sleep-and-exit-with-status)** -> A binary that sleeps for a duration in seconds given as first argument and then exits with status given as second argument.
* **[./sleep_and_write_on_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/sleep-and-write-on-stderr)** -> A binary that sleeps for a duration in seconds given as first argument and then writes on STDERR the string given as second argument without EOL.
* **[./write_on_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stderr)** -> A binary that writes on standard error the first given argument (the same behavior as `echo` but with only one argument) and exits with an error status code given as second argument. If no argument is given, it writes the string "write on stderr" and exit with status `1`.
* **[./write_on_stdout](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stdout)** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **[./write_on_stdout_and_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stdout-and-stderr)** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".