# 006-path-relative-stderr-\usr\local\munki\ptyexec

*spec > minishell > 002-binary > 006-path-relative-stderr-\usr\local\munki\ptyexec*

### What is done before test

```bash
rm -f ${GLOBAL_INSTALLDIR}/tmp/output_binary
ptyexec 2> ${GLOBAL_INSTALLDIR}/tmp/output_binary
```

### Shell commands that are sent to the standard entry

```bash
ptyexec

```

### What is expected on standard output

```bash
might be_empty
```

### What is expected on error output

```bash
expected_to have_regexp "Usage:"
expected_to have_regexp "ptyexec"
expected_to have_regexp "[command to run] [arguments...]"
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
