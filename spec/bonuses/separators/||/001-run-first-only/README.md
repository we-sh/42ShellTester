# 001-run-first-only

*[spec > bonuses > separators > ||](..) > 001-run-first-only*

### Shell commands that are sent to the standard entry

```bash
/bin/echo FIRST_TOKEN || /bin/echo LAST_TOKEN

```

### What is expected on standard output

```bash
might have_regexp FIRST_TOKEN
might_not have_regexp LAST_TOKEN

```

### What is expected on error output

```bash
might be_empty

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
