# 001-binary-path-relative

*[spec > minishell > binary](..) > 001-binary-path-relative*

This test check if you are using folders from the environement variable $PATH.
We are changing the actual PATH by PATH=${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1:${GLOBAL_INSTALLDIR}/tmp/virtualpath/p2
And executing the commande display_name1 and display_name2 located inside those folders
### What is done before test

```bash
mkdir ${GLOBAL_INSTALLDIR}/tmp/virtualpath
mkdir ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1 ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p2
rm -f ./display_name
rm -f ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1/display_name1
rm -f ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1/display_name2
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/display-program-name/main.c" -o ./display_name
cp ./display_name ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1/display_name1
cp ./display_name ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p2/display_name2
export PATH=${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1:NONE:${GLOBAL_INSTALLDIR}/tmp/virtualpath/p2

```

### Shell commands that are sent to the standard entry

```bash
display_name1
display_name2

```

### What is expected on standard output

```bash
expected_to match_regex "display_name1"
expected_to match_regex "display_name2"

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
* **./display_pwd** -> A binary that writes on standard output the absolute path of the current directory returned by `getcwd(3)`, encountered with the strings `PWD:` and `:PWD`.
* **./exit_with_status** -> A binary that immediately exits with the status given as first argument.
* **./read_on_stdin** -> A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.
* **./sleep_and_write_on_stderr** -> A binary that sleeps for a duration in seconds given as first argument and then writes on STDERR the string given as second argument without EOL.
* **./write_on_stderr** -> A binary that writes on standard error the first given argument (the same behavior as `echo` but with only one argument) and exits with an error status code given as second argument. If no argument is given, it writes the string "write on stderr" and exit with status `1`.
* **./write_on_stdout** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **./write_on_stdout_and_stderr** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".
