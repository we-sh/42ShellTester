# 009-path-relative-without-$PATH

*[spec > minishell > 002-binary](..) > 009-path-relative-without-$PATH*

### What is done before test

```bash
rm -f "${GLOBAL_INSTALLDIR}/tmp/output_binary"
ls -1 "${GLOBAL_INSTALLDIR}/spec" > "${GLOBAL_INSTALLDIR}/tmp/output_binary"
```

### Shell commands that are sent to the standard entry

```bash
unsetenv PATH
/bin/ls -1 ../spec
md5 test

```

### What is expected on standard output

```bash
expected_to match_each_lines_of_file "${GLOBAL_INSTALLDIR}/tmp/output_binary"
```

### What is expected on error output

```bash
expected_to_not be_empty
might have_regexp "[Cc]ommand not found"

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
