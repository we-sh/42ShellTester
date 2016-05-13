# 003-append-stderr-to-file

*[spec > 21sh > redirections > outputs > appending](..) > 003-append-stderr-to-file*

A double right redirection opens the file with the oflag `O_APPEND`, so that its size is not truncated to 0 and output is written at the end of file. If the file does not exist, it is created.
In this test, the standard error is appended to the file.
### What is done before test

```bash
./write_on_stdout "${GLOBAL_TOKEN}_first" >append_file_stderr

```

### Shell commands that are sent to the standard entry

```bash
./write_on_stdout_and_stderr ${GLOBAL_TOKEN}_stdout ${GLOBAL_TOKEN}_stderr 2>>append_file_stderr

```

### What is expected on standard output

```bash
expected_to match_regex "${GLOBAL_TOKEN}_stdout"

```

### What is expected on error output

```bash
expected_to_not match_regex "${GLOBAL_TOKEN}_stderr"

```

### What miscellaneous behaviors are expected

```bash
expected_to create_file "append_file_stderr" with_regexp "${GLOBAL_TOKEN}_first"
expected_to create_file "append_file_stderr" with_regexp "${GLOBAL_TOKEN}_stderr"

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
* **./write_on_stdout** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **./write_on_stdout_and_stderr** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".