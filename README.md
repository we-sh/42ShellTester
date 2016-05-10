# 42shTests

<img align="right"  src="./lib/assets/42shTestsTeamLogo_sm.png" width="213" />42shTests is an **integration testing framework** wrote in Bash and designed for the pedagogical projects of the Shell branch at School 42 (Paris) listed bellow:
* **minishell**
* **21sh**
* **42sh**

It brings you an easy way to **add**, **maintain** and **run** integration tests, helping you to work step by step on your Shell implementation.

<!--START_TOTAL_TESTS-->
42shTests is currently packaged with **89 tests**.
<!--END_TOTAL_TESTS-->

## Install

```bash
git clone https://github.com/42shTests/42shTests ~/42shTests
```

## Run tests

Add the path to your Shell as argument:

```bash
sh ~/42shTests/42shTests.sh "PATH/TO/YOUR/SHELL"
```

## Options

You can use the following options:

##### `--filter` + `$regex`

Run tests that matches with the specified regular expression (e.g. `--filter "builtins"`).

##### `--reference` + `$binary`

Run tests that does not fail with the specified Shell binary (e.g. `--reference "bash"`).

##### `--posix`

Run tests that are POSIX compliant only (run all by default).

##### `--hard`

Run tests that are marked as « hard » (omitted by default).

##### `--show-success`

Also display tests that succeed (hidden by default).

##### `--pending`

Also run pending tests.

## List of tests

<!--START_LIST_TESTS-->
* **[21sh/](spec/21sh)**
  * **[misc/](spec/21sh/misc)**
    * [001-any-prompt-when-non-interactive](spec/21sh/misc/001-any-prompt-when-non-interactive)
  * **[pipe/](spec/21sh/pipe)**
    * [001-single-pipe <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/pipe/001-single-pipe)
    * [002-chained-pipes <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/pipe/002-chained-pipes)
    * [003-many-chained-pipes <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/pipe/003-many-chained-pipes)
    * **[mixed/](spec/21sh/pipe/mixed)**
      * [001-exit-or-not-exit <img src='./lib/assets/hard.png' width='38' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/pipe/mixed/001-exit-or-not-exit)
      * [002-cd-or-not-cd <img src='./lib/assets/hard.png' width='38' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/pipe/mixed/002-cd-or-not-cd)
  * **[redirections/](spec/21sh/redirections)**
    * **[inputs/](spec/21sh/redirections/inputs)**
      * [001-close-stdin <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/inputs/001-close-stdin)
      * [002-filename <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/inputs/002-filename)
      * [003-filename-with-whitespaces <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/inputs/003-filename-with-whitespaces)
      * [004-no-such-file <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/inputs/004-no-such-file)
    * **[outputs/](spec/21sh/redirections/outputs)**
      * **[appending/](spec/21sh/redirections/outputs/appending)**
        * **[multiple/](spec/21sh/redirections/outputs/appending/multiple)**
          * [005-together-3-with-whitespaces <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/appending/multiple/005-together-3-with-whitespaces)
      * **[closing/](spec/21sh/redirections/outputs/closing)**
        * [001-fd-not-specified <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/closing/001-fd-not-specified)
        * [002-stdout-specified <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/closing/002-stdout-specified)
        * [003-stderr-specified <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/closing/003-stderr-specified)
        * [004-twice <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/closing/004-twice)
      * **[touching/](spec/21sh/redirections/outputs/touching)**
        * [001-works <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/touching/001-works)
      * **[truncating/](spec/21sh/redirections/outputs/truncating)**
        * [001-creates-file-if-not-exits <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/001-creates-file-if-not-exits)
        * [002-truncates-file-if-exists <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/002-truncates-file-if-exists)
        * [003-whitespace-before-filename <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/003-whitespace-before-filename)
        * **[multiple/](spec/21sh/redirections/outputs/truncating/multiple)**
          * [001-separately <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/multiple/001-separately)
          * [002-together-stdout-first <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/multiple/002-together-stdout-first)
          * [003-together-stderr-first <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/multiple/003-together-stderr-first)
          * [004-together-and <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/multiple/004-together-and)
          * [005-together-and-with-whitespaces <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/multiple/005-together-and-with-whitespaces)
        * **[stderr/](spec/21sh/redirections/outputs/truncating/stderr)**
          * [001-works <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/stderr/001-works)
        * **[stdout/](spec/21sh/redirections/outputs/truncating/stdout)**
          * [001-with-explicit-fd <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/redirections/outputs/truncating/stdout/001-with-explicit-fd)
  * **[separators/](spec/21sh/separators)**
    * **[semicolon/](spec/21sh/separators/semicolon)**
      * [001-two-commands-sequentially <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/separators/semicolon/001-two-commands-sequentially)
      * [002-n-commands-sequentially <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/separators/semicolon/002-n-commands-sequentially)
      * [003-empty-commands-inline <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/separators/semicolon/003-empty-commands-inline)
      * [004-empty-commands <img src='./lib/assets/pending.png' width='54' height='12' />](spec/21sh/separators/semicolon/004-empty-commands)
* **[bonuses/](spec/bonuses)**
  * **[separators/](spec/bonuses/separators)**
    * **[and/](spec/bonuses/separators/and)**
      * [001-run-twice <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/and/001-run-twice)
      * [002-do-not-run-second <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/and/002-do-not-run-second)
      * [003-parse-error-at-beginning <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/and/003-parse-error-at-beginning)
      * [004-parse-error-at-end <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/and/004-parse-error-at-end)
      * [005-parse-error-too-much-symbol <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/and/005-parse-error-too-much-symbol)
    * **[or/](spec/bonuses/separators/or)**
      * [001-run-first-only <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/or/001-run-first-only)
      * [002-run-second-only <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/or/002-run-second-only)
      * [003-parse-error-at-beginning <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/or/003-parse-error-at-beginning)
      * [004-parse-error-at-end <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/or/004-parse-error-at-end)
      * [005-parse-error-too-much-symbol <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/separators/or/005-parse-error-too-much-symbol)
* **[minishell/](spec/minishell)**
  * **[001-builtins/](spec/minishell/001-builtins)**
    * **[cd/](spec/minishell/001-builtins/cd)**
      * [001-no-arg <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/001-no-arg)
      * [002-current-directory <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/002-current-directory)
      * [003-current-directory-2 <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/003-current-directory-2)
      * [004-parent-directory <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/004-parent-directory)
      * [005-absolute-path <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/005-absolute-path)
      * [007-symbolic-link <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/007-symbolic-link)
      * [008-symbolic-link-2 <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/008-symbolic-link-2)
      * [009-following-links <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/009-following-links)
      * **[errors/](spec/minishell/001-builtins/cd/errors)**
        * [001-not-a-directory <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/errors/001-not-a-directory)
        * [002-permission-denied <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/errors/002-permission-denied)
        * [003-too-many-symbolic-links-encountered <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/errors/003-too-many-symbolic-links-encountered)
        * [004-no-such-file-or-directory <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/errors/004-no-such-file-or-directory)
      * **[options/](spec/minishell/001-builtins/cd/options)**
        * [001-not-following-links <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/options/001-not-following-links)
        * [002-oldpwd <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/cd/options/002-oldpwd)
    * **[env/](spec/minishell/001-builtins/env)**
      * [001-env-same-value-as-parent <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/001-env-same-value-as-parent)
      * [002-env-check-usefull-var <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/002-env-check-usefull-var)
      * [003-ignore-environment-1 <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/003-ignore-environment-1)
      * [004-ignore-environment-2 <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/004-ignore-environment-2)
      * [005-set-variables <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/005-set-variables)
      * [006-unset-variables-1 <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/006-unset-variables-1)
      * [007-unset-variables-2 <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/007-unset-variables-2)
      * **[calling-builtins/](spec/minishell/001-builtins/env/calling-builtins)**
        * [001-cd-HOME-without-environment <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/calling-builtins/001-cd-HOME-without-environment)
      * **[multiple-options/](spec/minishell/001-builtins/env/multiple-options)**
        * [001-ignore-environment-and-set-variable <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/multiple-options/001-ignore-environment-and-set-variable)
        * [002-unset-and-set-variable <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/env/multiple-options/002-unset-and-set-variable)
    * **[exit/](spec/minishell/001-builtins/exit)**
      * [001-simple <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/exit/001-simple)
      * [002-valid-arg <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/exit/002-valid-arg)
      * [003-too-many-args <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/exit/003-too-many-args)
      * [004-status-of-last-command <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/exit/004-status-of-last-command)
    * **[setenv/](spec/minishell/001-builtins/setenv)**
      * [001-setenv-no-parameter <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/setenv/001-setenv-no-parameter)
      * [002-setenv-noequal <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/setenv/002-setenv-noequal)
      * [003-setenv-equal <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/setenv/003-setenv-equal)
    * **[unsetenv/](spec/minishell/001-builtins/unsetenv)**
      * [001-unsetenv-first-elem <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/unsetenv/001-unsetenv-first-elem)
      * [002-unsetenv-last-elem <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/unsetenv/002-unsetenv-last-elem)
      * [003-unsetenv-mult-argv <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/unsetenv/003-unsetenv-mult-argv)
      * [004-unsetenv-mult-argv-inline <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/001-builtins/unsetenv/004-unsetenv-mult-argv-inline)
  * **[002-binary/](spec/minishell/002-binary)**
    * [001-path-relative-in-ls <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/001-path-relative-in-ls)
    * [002-path-relative-usrin-whereis <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/002-path-relative-usrin-whereis)
    * [003-path-relative-stderr-usrsbin-rarpd <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/003-path-relative-stderr-usrsbin-rarpd)
    * [004-path-relative-sbin-md5 <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/004-path-relative-sbin-md5)
    * [005-path-relative-usrlocalinmonop <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/005-path-relative-usrlocalinmonop)
    * [006-path-relative-stderr-usrlocalmunkiptyexec <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/006-path-relative-stderr-usrlocalmunkiptyexec)
    * [007-path-absolute-inls <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/007-path-absolute-inls)
    * [008-path-absolute-display-pwd <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/008-path-absolute-display-pwd)
    * [009-path-relative-without-$PATH <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/009-path-relative-without-$PATH)
    * [010-path-relative-with-wrong-$PATH <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/010-path-relative-with-wrong-$PATH)
    * [011-path-absolute-with-wrong-$PATH <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/002-binary/011-path-absolute-with-wrong-$PATH)
  * **[003-multi-builtins/](spec/minishell/003-multi-builtins)**
    * **[setenv-unsetenv/](spec/minishell/003-multi-builtins/setenv-unsetenv)**
      * [001-basic-unsetenv-and-setenv <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/003-multi-builtins/setenv-unsetenv/001-basic-unsetenv-and-setenv)
      * [002-unsetenv-all-and-setenv <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/003-multi-builtins/setenv-unsetenv/002-unsetenv-all-and-setenv)
  * **[misc/](spec/minishell/misc)**
    * [copy-of-environment <img src='./lib/assets/pending.png' width='54' height='12' />](spec/minishell/misc/copy-of-environment)

<!--END_LIST_TESTS-->

# Development

## Coding convention

* Scope indentation must be done with 2 spaces
* Variable names must be upper case (e.g. `INDEX`)
* Global variables must be prefixed with `GLOBAL_` (e.g. `GLOBAL_TOKEN`)
* Variable expansion must be surrounded by curly braces (e.g. `${VARIABLE}`)
* Arguments of functions and commands must be surrounded by double or simple quotes (e.g. `run_assert "STDERR"`)
* Semicolon are banned so that words like `then` and `do` are always at start of lines (e.g. wrong inline code: `if [ ... ]; then cmd; fi`)
* Folder names may only contain alphanumeric and `-`

## Adding new test

An integration test must be **self-sufficient**, that means executing the full test suite or only one test must result in the same failed or success status. The framework 42shTests brings you tools for that!

Firstly, tests are executed inside a temporary folder `tmp/` that is created at launch time and placed at the root installation folder of the framework. You may generate temporary files, binaries and folders that are needed for your test, but pay attention to not touch external folders. Use the `before_exec` callback to generate these resources.

Secondly, each test is executed within a sub-shell, so that you may modify the environment without disrupting the test suite. Use the `before_exec` callback to modify the environment.

Thirdly, a test must concern one single feature at a time, that means **wherever possible** you must avoid the use of multiple builtins or capabilities (e.g. do not use a pipe `|` within a test that concerns the builtin `env`, or again use absolute paths to binaries like `/bin/ls` to let the Shell implementation not support the `PATH`, except if you precisely test this feature!).

Fourthly, when a test need binaries like `/bin/env` or `/bin/echo`, prefer to recode your own, simplier and multi-platform, and place it in `support/` folder. Then use the `before_exec` callback to compile it and make it available for your test.

Sixthly, a test that is not POSIX compliant must contain a file named `non-posix` containing a small explanation of why.

Finally, don't write a README and let the task `generate_readmes` do it for you :-) A description may be added in a file named `description` that will appear at the top of the README.

Follow the guideline to add a new test:

1. Create a sub-folder in `spec/` (e.g. `spec/minishell/builtin/cd/new-test/`)
2. If necessary, create a file `before_exec` that contains the shell commands that prepare the environment and the temporary resources (e.g. `mkdir valid_folder`)
2. Create a file `stdin` that contains the shell command you want to test (e.g. `cd invalid_folder`)
3. Create the files `stdout` and/or `stderr` that contain the expected output assertions (e.g. in stderr: `expected_to_not be_empty`) (see available assertions and verbs bellow)
4. You may also create a file `misc` that contains special expectations not concerning output on standard and error (e.g. `expected_to_not exit_with_status 0`)
5. If necessary, create a file `description` that describes more precisely the purpose of the test (e.g. `Trying to access invalid folder must display an error on standard error and result in a failure status code`) (the description will be included at top of the auto-generated README)
6. If the test is not POSIX compliant, create a file `non-posix` that explains why.

## Assertions

* **`expected_to`** / **`expected_to_not`** + *`verb`*: An assertion beginning with **expected_to** (or its opposite **expected_to_not**) makes the test resulting in failure status if the expectation that follows **does not** comply.

* **`might`** / **`might_not`** + *`verb`*: An assertion beginning with **might** (or its opposite **might_not**) always makes the test resulting in success status. When the expectation that follows **may not** comply, it is nevertheless considered as success but it displays a warning message.

## Verbs

* **`be_empty`**: Actual output is empty.
* **`create_file`** + *`$filename`*: Actual command creates a file named *$filename*. May also be followed with a file test:
  * **`with_regexp`** + *`$regex`*: At least one line of the file matches with the regular expression *$regex*.
  * **`without_regexp`** + *`$regex`*: Any line of the file does match with the regular expression *$regex*.
  * **`with_nb_of_lines`** + *`$int`*: The file contains exactly *$int* lines.
* **`exit_with_status`** + *`$int`*: The Shell termination results in the exit status *$int*.
* **`have_nb_of_lines`** + *`$int`*: Actual output contains exactly *$int* lines.
* **`have_regexp`** + *`$regex`*: At least one line of actual output does match with the regular expression *$regex*.
* **`match_each_lines_of_file`** + *`$filename`*: Actual output does match with each regular expression contained in the file named *$filename* (in an indifferent order).

## Adding new verb

A verb is a function that is prefixed by `run_verb_` and that returns `0` or `1` according to the tested behavior. It may return a status `255` when bad or missing argument.

At runtime, the framework provides a list of variables that can be used by the verbs:

* **`RESPONSE`**: The path to the file containing actual output (STDOUT or STDERR)
* **`RESPONSE_EXIT_STATUS`**: The exit status of the Shell termination
* **`EXPECTED_TO_ARGS[]`**: An array containing the arguments following the verb

Follow the guideline to add a new verb:

1. Choose the best name that respects the *CamelCase* convention and that can be human-readable when used with an assertion (e.g. `expected_to be_empty` can be read `actual output is expected to be empty`)
2. Create a file in `lib/verbs/` with the exact name of the verb and that is prefixed with `run_verb_` (e.g. `lib/verbs/run_verb_be_empty.sh`
3. Add a *shebang*: `#!/bin/sh` and a comment that describes the tested behavior
4. Create a function with the exact name of the verb and that is prefixed with `run_verb_` (the same as the file name) and make it respect the following rules:
  * Local variables must be declared with `local`
  * No output can be done with `echo` or `printf`
  * Function returns `0` on succes, `1` on fail or `255` on bad use
  * Use the array `EXPECTED_TO_ARGS[]` to take advantage of arguments (e.g. `expected_to have_regexp "regex"`, then `EXPECTED_TO_ARGS[0]` contains `regex`)

## Tasks

* `sh ./tasks/generate_readmes.sh` (only on master branch) to automaticaly generate the README files of tests

# The Team

* **Adrien Nouvel** [@anouvel](https://github.com/anouvel)
* **Gabriel Kuma** [@gabkk](https://github.com/gabkk)
* **Jean-Michel Gigault** [@jgigault](https://github.com/jgigault)
