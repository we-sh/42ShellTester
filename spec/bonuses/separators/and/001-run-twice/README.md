# 001-run-twice

*[spec > bonuses > separators > and](..) > 001-run-twice*

### Shell commands that are sent to the standard entry

```bash
/bin/echo FIRST_TOKEN && /bin/echo LAST_TOKEN

```

### What is expected on standard output

```bash
might have_regexp FIRST_TOKEN
might have_regexp LAST_TOKEN

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
