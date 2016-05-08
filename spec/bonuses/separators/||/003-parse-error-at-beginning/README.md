# 003-parse-error-at-beginning

*[spec > bonuses > separators > ||](..) > 003-parse-error-at-beginning*

### Shell commands that are sent to the standard entry

```bash
|| /bin/echo TOKEN

```

### What is expected on standard output

```bash
might be_empty

```

### What is expected on error output

```bash
might_not be_empty

```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
