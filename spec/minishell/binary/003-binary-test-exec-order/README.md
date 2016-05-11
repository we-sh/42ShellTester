# 003-binary-test-exec-order

*[spec > minishell > binary](..) > 003-binary-test-exec-order*

This test purpose is to check if your shell is using the first binary found into the $PATH environement variable, from left to right.
We are changing the actual PATH by PATH=/tmp/virtualpath/p1:$PATH, and executing the commande ls located inside /tmp/virtualpath/p1 folder which is actually a getpwd instead of ls, to check if you are doing the job well.
### What is done before test

```bash
mkdir ${GLOBAL_INSTALLDIR}/tmp/virtualpath
mkdir ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1
rm -f ./fake_ls
gcc -Wall -Werror -Wextra "${GLOBAL_INSTALLDIR}/support/display-pwd/main.c" -o ./fake_ls
cp ./fake_ls ${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1/ls
export PATH=${GLOBAL_INSTALLDIR}/tmp/virtualpath/p1:$PATH

```

### Shell commands that are sent to the standard entry

```bash
ls

```

### What is expected on standard output

```bash
expected_to match_regex ${GLOBAL_INSTALLDIR}

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
* **./read_on_stdin** -> A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.
* **./write_on_stdout** -> A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **./write_on_stdout_and_stderr** -> A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".
