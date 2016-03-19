# 010-path-relative-with-wrong-$PATH

*[spec > minishell > 002-binary](..) > 010-path-relative-with-wrong-$PATH*

### What is done before test

```bash
rm -f ${GLOBAL_INSTALLDIR}/tmp/output_binary
ls ${GLOBAL_INSTALLDIR}/spec > ${GLOBAL_INSTALLDIR}/tmp/output_binary
```

### Shell commands that are sent to the standard entry

```bash
setenv PATH toto
setenv PATH=toto
ls -1 ../spec
md5 test

```

### What is expected on standard output

```bash
might be_empty
```

### What is expected on error output

```bash
expected_to have_regexp "md5: Command not found."
expected_to have_regexp "ls: Command not found."
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
