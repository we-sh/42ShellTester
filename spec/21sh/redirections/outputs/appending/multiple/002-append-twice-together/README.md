# 002-append-twice-together

*[spec > 21sh > redirections > outputs > appending > multiple](..) > 002-append-twice-together*

A double right redirection opens the file with the oflag `O_APPEND`, so that its size is not truncated to 0 and output is written at the end of file. If the file does not exist, it is created.
In this test, twice outputs are appended to the same file.
### What is done before test

```bash
rm -f "new_file_stderr_and_stdout"

```

### Shell commands that are sent to the standard entry

```bash
./write_on_stdout_and_stderr ${GLOBAL_TOKEN}_1_1 ${GLOBAL_TOKEN}_1_2 &>> new_file_stderr_and_stdout
./write_on_stdout_and_stderr ${GLOBAL_TOKEN}_2_1 ${GLOBAL_TOKEN}_2_2 &>>	new_file_stderr_and_stdout
./write_on_stdout_and_stderr ${GLOBAL_TOKEN}_3_1 ${GLOBAL_TOKEN}_3_2 &>>	  	new_file_stderr_and_stdout

```

### What is expected on standard output

```bash
expected_to_not match_regex "${GLOBAL_TOKEN}_1_1"
expected_to_not match_regex "${GLOBAL_TOKEN}_2_1"
expected_to_not match_regex "${GLOBAL_TOKEN}_3_1"
expected_to_not match_regex "${GLOBAL_TOKEN}_1_2"
expected_to_not match_regex "${GLOBAL_TOKEN}_2_2"
expected_to_not match_regex "${GLOBAL_TOKEN}_3_2"

```

### What is expected on error output

```bash
expected_to_not match_regex "${GLOBAL_TOKEN}_1_1"
expected_to_not match_regex "${GLOBAL_TOKEN}_2_1"
expected_to_not match_regex "${GLOBAL_TOKEN}_3_1"
expected_to_not match_regex "${GLOBAL_TOKEN}_1_2"
expected_to_not match_regex "${GLOBAL_TOKEN}_2_2"
expected_to_not match_regex "${GLOBAL_TOKEN}_3_2"

```

### What miscellaneous behaviors are expected

```bash
expected_to create_file "new_file_stderr_and_stdout" with_regexp "${GLOBAL_TOKEN}_1_1$"
expected_to create_file "new_file_stderr_and_stdout" with_regexp "${GLOBAL_TOKEN}_2_1$"
expected_to create_file "new_file_stderr_and_stdout" with_regexp "${GLOBAL_TOKEN}_3_1$"
expected_to create_file "new_file_stderr_and_stdout" with_regexp "${GLOBAL_TOKEN}_1_2$"
expected_to create_file "new_file_stderr_and_stdout" with_regexp "${GLOBAL_TOKEN}_2_2$"
expected_to create_file "new_file_stderr_and_stdout" with_regexp "${GLOBAL_TOKEN}_3_2$"

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
