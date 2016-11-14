# 015-big-range

*[spec > 42sh > globbing > brace-expansion > numeric-range](..) > 015-big-range*

The purpose of this test is to check that brace expansion may be performed with a big numeric range.
### Shell commands that are sent to the standard entry

```bash
./write_all_arguments_on_stdout {-100..100}

```

### What is expected on standard output

```bash
expected_to match_regex "^-100@-99@-98@-97@-96@-95@-94@-93@-92@-91@-90@-89@-88@-87@-86@-85@-84@-83@-82@-81@-80@-79@-78@-77@-76@-75@-74@-73@-72@-71@-70@-69@-68@-67@-66@-65@-64@-63@-62@-61@-60@-59@-58@-57@-56@-55@-54@-53@-52@-51@-50@-49@-48@-47@-46@-45@-44@-43@-42@-41@-40@-39@-38@-37@-36@-35@-34@-33@-32@-31@-30@-29@-28@-27@-26@-25@-24@-23@-22@-21@-20@-19@-18@-17@-16@-15@-14@-13@-12@-11@-10@-9@-8@-7@-6@-5@-4@-3@-2@-1@0@1@2@3@4@5@6@7@8@9@10@11@12@13@14@15@16@17@18@19@20@21@22@23@24@25@26@27@28@29@30@31@32@33@34@35@36@37@38@39@40@41@42@43@44@45@46@47@48@49@50@51@52@53@54@55@56@57@58@59@60@61@62@63@64@65@66@67@68@69@70@71@72@73@74@75@76@77@78@79@80@81@82@83@84@85@86@87@88@89@90@91@92@93@94@95@96@97@98@99@100@$"

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


* **[./display_env](http://github.com/we-sh/42ShellTester/tree/master/support/display-env)** -> A binary that iterates on `**envp` and write each element on standard output.
* **[./display_program_name](http://github.com/we-sh/42ShellTester/tree/master/support/display-program-name)** -> A binary that writes its name on standard ouput.
* **[./display_pwd](http://github.com/we-sh/42ShellTester/tree/master/support/display-pwd)** -> A binary that writes on standard output the absolute path of the current directory returned by `getcwd(3)`, encountered with the strings `PWD:` and `:PWD`.
* **[./exit_with_status](http://github.com/we-sh/42ShellTester/tree/master/support/exit-with-status)** -> A binary that immediately exits with the status given as first argument.
* **[./read_on_stdin](http://github.com/we-sh/42ShellTester/tree/master/support/read-on-stdin)** -> A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.
* **[./sleep_and_exit_with_status](http://github.com/we-sh/42ShellTester/tree/master/support/sleep-and-exit-with-status)** -> A binary that sleeps for a duration in seconds given as first argument and then exits with status given as second argument.
* **[./sleep_and_write_on_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/sleep-and-write-on-stderr)** -> A binary that sleeps for a duration in seconds given as first argument and then writes on STDERR the string given as second argument without EOL.
* **[./write_all_arguments_on_stdout](http://github.com/we-sh/42ShellTester/tree/master/support/write-all-arguments-on-stdout)** -> A binary that writes on standard output each argument separated by the symbol `@`. If no argument is given, it writes the string "nothing to be written on stdout".
* **[./write_on_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stderr)** -> A binary that writes on standard error the first given argument (the same behavior as `echo` but with only one argument) and exits with an error status code given as second argument. If no argument is given, it writes the string "write on stderr" and exit with status `1`.
* **[./write_on_stdout](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stdout)** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **[./write_on_stdout_and_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stdout-and-stderr)** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".
