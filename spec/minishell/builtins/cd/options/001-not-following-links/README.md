# 001-not-following-links

*[spec > minishell > builtins > cd > options](..) > 001-not-following-links*

The purpose of this test is to check if cd -P doesn't follow symbolic link as argument.
We had create a symbolic link to a subdirectory and a link to a subsubdirectory which will be arguments of cd.
We are doing two tests there, check the before_exec and stdin files.### What is done before test

```bash
rm -fr subdirectory_link subdirectory
mkdir -p subdirectory/subsubdirectory
ln -s subdirectory subdirectory_link
ln -s subsubdirectory subdirectory/subsubdirectory_link

rm -f ./display_pwd
gcc -Wall -Werror -Wextra ${GLOBAL_INSTALLDIR}/support/display-pwd/main.c -o ./display_pwd

```

### Shell commands that are sent to the standard entry

```bash
cd -P subdirectory_link
/bin/pwd
${GLOBAL_TMP_DIRECTORY}/display_pwd

cd -P subsubdirectory_link
/bin/pwd
${GLOBAL_TMP_DIRECTORY}/display_pwd

```

### What is expected on standard output

```bash
might_not match_regex "${GLOBAL_TMP_DIRECTORY}/subdirectory_link$"
might match_regex "PWD:${GLOBAL_TMP_DIRECTORY}/subdirectory:PWD$"

might_not match_regex "${GLOBAL_TMP_DIRECTORY}/subdirectory_link/subsubdirectory_link$"
might match_regex "PWD:${GLOBAL_TMP_DIRECTORY}/subdirectory/subsubdirectory:PWD$"

```

### What is expected on error output

```bash
might be_empty

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
