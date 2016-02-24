# 003-setenv-equal

*spec > minishell > builtins > setenv > 003-setenv-equal*

### Shell commands that are sent to the standard entry

```bash
setenv SETENVNULL=

setenv SETENV1=1

setenv SETENVLONG=LONG

setenv setenvlowercase=lowercase

	   		 setenv 		Sp4c3_T4B=_O_		 		 

setenv _=_

setenv PATH=

setenv HOME=

setenv PWD=

setenv USER=

setenv LOGNAME=

setenv =

setenv ===

env
```

### What is expected on standard output

```bash
expected_to have_regexp SETENVNULL=$

expected_to have_regexp SETENV1=1$

expected_to have_regexp SETENVLONG=LONG$

expected_to have_regexp setenvlowercase=lowercase$

expected_to have_regexp Sp4c3_T4B=_O_$

expected_to have_regexp _=_$

expected_to have_regexp PATH=$

expected_to have_regexp HOME=$

expected_to have_regexp PWD=$

expected_to have_regexp USER=$

expected_to have_regexp LOGNAME=$
```

### What is expected on error output

```bash
might be_filled
```

### Variables

The following variables may appear in the tests:

* ${**GLOBAL_INSTALLDIR**} -> The installation directory of 42shTests
* ${**GLOBAL_TMP_DIRECTORY**} -> The temporary directory in which tests are executed
* ${**GLOBAL_TOKEN**} -> A token that changes value at launch time
* ${**PATH**} -> The standard environment variable PATH
* ${**HOME**} -> The standard environment variable HOME
