# 011-path-absolute-with-wrong-$PATH

*spec > minishell > 002-binary > 011-path-absolute-with-wrong-$PATH*

### What is done before test

```bash
rm -f ${GLOBAL_INSTALLDIR}/tmp/output_binary
ls -1 ${GLOBAL_INSTALLDIR}/spec > ${GLOBAL_INSTALLDIR}/tmp/output_binary
```

### Shell commands that are sent to the standard entry

```bash
setenv PATH toto
setenv PATH=toto
/bin/ls -1 ../spec
ls ../spec
/sbin/md5 test
/sbin/md5 /sbin/md5

```

### What is expected on standard output

```bash
expected_to match_each_lines_of_file ${GLOBAL_INSTALLDIR}/tmp/output_binary
expected_to have_regexp 28b265e57ba18215aeff762bfe0d2689
```

### What is expected on error output

```bash
expected_to have_regexp "md5: test: No such file or directory"
expected_to have_regexp "ls: Command not found."
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
