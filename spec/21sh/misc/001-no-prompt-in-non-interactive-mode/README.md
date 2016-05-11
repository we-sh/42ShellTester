# 001-no-prompt-in-non-interactive-mode

*[spec > 21sh > misc](..) > 001-no-prompt-in-non-interactive-mode*

A non-interactive Shell should not output a prompt. All the test suite runs the Shell in a non-interactive way so that `isatty()` returns `0`. This test is the only one that take it into account so that you can succeed the rest of the suite.
### Shell commands that are sent to the standard entry

```bash
./write_on_stdout "${GLOBAL_TOKEN}"

```

### What is expected on standard output

```bash
expected_to have_nb_of_lines 1
expected_to match_regex "^${GLOBAL_TOKEN}$"

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
