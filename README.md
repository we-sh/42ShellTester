# 42ShellTester

<img align="right"  src="./lib/assets/42ShellTester_cropped.png" width="45%" />42ShellTester is an **integration testing framework** wrote in Bash and designed for the pedagogical projects of the Shell branch at School 42 (Paris) listed bellow:
* **minishell**
* **21sh**
* **42sh**

It brings you an easy way to **add**, **maintain** and **run** integration tests, helping you to work step by step on your Shell implementation.

<!--START_TOTAL_TESTS-->
42ShellTester is currently packaged with **289 tests**.
<!--END_TOTAL_TESTS-->

## Install

```bash
git clone https://github.com/we-sh/42ShellTester ~/42ShellTester
```

## Run tests

Add the path to your Shell as argument:

```bash
bash ~/42ShellTester/42ShellTester.sh "/ABSOLUTE/PATH/TO/YOUR/SHELL"
```

## Options

##### `--filter` + `$regex`

Run tests that matches with the specified regular expression (e.g. `--filter "builtins"`).

##### `--reference` + `$binary`

Run tests that does not fail with the specified Shell binary (e.g. `--reference "bash"`).

##### `--posix`

Run tests that are POSIX compliant only (run all by default).

##### `--hard`

Run tests that are marked as « hard » (omitted by default).

##### `--pending`

Also run pending tests.

##### `--all`

Equivalent to use the two options `--pending` and `--hard` together.

##### `--show-success`

Also display tests that succeed (hidden by default).

## List of tests

<!--START_LIST_TESTS-->
* **[21sh/](spec/21sh)**
  * **[misc/](spec/21sh/misc)**
    * [001-no-prompt-in-non-interactive-mode](spec/21sh/misc/001-no-prompt-in-non-interactive-mode)
    * [002-simple-command-line](spec/21sh/misc/002-simple-command-line)
  * **[pipe/](spec/21sh/pipe)**
    * [001-single-pipe](spec/21sh/pipe/001-single-pipe)
    * [002-chained-pipes](spec/21sh/pipe/002-chained-pipes)
    * [003-many-chained-pipes](spec/21sh/pipe/003-many-chained-pipes)
    * [004-without-surrounding-whitespaces](spec/21sh/pipe/004-without-surrounding-whitespaces)
    * [005-asynchronous](spec/21sh/pipe/005-asynchronous)
    * [006-exit-status](spec/21sh/pipe/006-exit-status)
    * **[mixed/](spec/21sh/pipe/mixed)**
      * [001-exit-or-not-exit <img src='./lib/assets/hard.png' width='38' height='12' />](spec/21sh/pipe/mixed/001-exit-or-not-exit)
      * [002-cd-or-not-cd <img src='./lib/assets/hard.png' width='38' height='12' />](spec/21sh/pipe/mixed/002-cd-or-not-cd)
      * [003-unsetenv-or-not-unsetenv <img src='./lib/assets/hard.png' width='38' height='12' />](spec/21sh/pipe/mixed/003-unsetenv-or-not-unsetenv)
      * [004-setenv-or-not-setenv <img src='./lib/assets/hard.png' width='38' height='12' />](spec/21sh/pipe/mixed/004-setenv-or-not-setenv)
  * **[redirections/](spec/21sh/redirections)**
    * **[inputs/](spec/21sh/redirections/inputs)**
      * [001-close-stdin](spec/21sh/redirections/inputs/001-close-stdin)
      * [002-filename](spec/21sh/redirections/inputs/002-filename)
      * [003-filename-with-whitespaces](spec/21sh/redirections/inputs/003-filename-with-whitespaces)
      * [004-absolute-path](spec/21sh/redirections/inputs/004-absolute-path)
      * [005-no-such-file](spec/21sh/redirections/inputs/005-no-such-file)
    * **[outputs/](spec/21sh/redirections/outputs)**
      * **[appending/](spec/21sh/redirections/outputs/appending)**
        * [001-append-default-to-file](spec/21sh/redirections/outputs/appending/001-append-default-to-file)
        * [002-append-stdout-to-file](spec/21sh/redirections/outputs/appending/002-append-stdout-to-file)
        * [003-append-stderr-to-file](spec/21sh/redirections/outputs/appending/003-append-stderr-to-file)
        * **[multiple/](spec/21sh/redirections/outputs/appending/multiple)**
          * [001-append-twice-separately](spec/21sh/redirections/outputs/appending/multiple/001-append-twice-separately)
      * **[closing/](spec/21sh/redirections/outputs/closing)**
        * [001-close-default-output](spec/21sh/redirections/outputs/closing/001-close-default-output)
        * [002-close-stdout](spec/21sh/redirections/outputs/closing/002-close-stdout)
        * [003-close-stderr](spec/21sh/redirections/outputs/closing/003-close-stderr)
        * [004-close-twice-outputs](spec/21sh/redirections/outputs/closing/004-close-twice-outputs)
      * **[touching/](spec/21sh/redirections/outputs/touching)**
        * [001-works](spec/21sh/redirections/outputs/touching/001-works)
      * **[truncating/](spec/21sh/redirections/outputs/truncating)**
        * [001-creates-file-if-not-exits](spec/21sh/redirections/outputs/truncating/001-creates-file-if-not-exits)
        * [002-truncates-file-if-exists](spec/21sh/redirections/outputs/truncating/002-truncates-file-if-exists)
        * [003-whitespace-before-filename](spec/21sh/redirections/outputs/truncating/003-whitespace-before-filename)
        * **[multiple/](spec/21sh/redirections/outputs/truncating/multiple)**
          * [001-separately](spec/21sh/redirections/outputs/truncating/multiple/001-separately)
          * [002-together-stdout-first](spec/21sh/redirections/outputs/truncating/multiple/002-together-stdout-first)
          * [003-together-stderr-first](spec/21sh/redirections/outputs/truncating/multiple/003-together-stderr-first)
          * [004-together](spec/21sh/redirections/outputs/truncating/multiple/004-together)
          * [005-together-with-whitespaces](spec/21sh/redirections/outputs/truncating/multiple/005-together-with-whitespaces)
        * **[stderr/](spec/21sh/redirections/outputs/truncating/stderr)**
          * [001-works](spec/21sh/redirections/outputs/truncating/stderr/001-works)
        * **[stdout/](spec/21sh/redirections/outputs/truncating/stdout)**
          * [001-with-explicit-fd](spec/21sh/redirections/outputs/truncating/stdout/001-with-explicit-fd)
  * **[separators/](spec/21sh/separators)**
    * **[semicolon/](spec/21sh/separators/semicolon)**
      * [001-two-commands-sequentially](spec/21sh/separators/semicolon/001-two-commands-sequentially)
      * [002-n-commands-sequentially](spec/21sh/separators/semicolon/002-n-commands-sequentially)
      * [003-parse-error-empty-inline-command](spec/21sh/separators/semicolon/003-parse-error-empty-inline-command)
      * [004-parse-error-empty-command](spec/21sh/separators/semicolon/004-parse-error-empty-command)
* **[42sh/](spec/42sh)**
  * **[builtins/](spec/42sh/builtins)**
    * **[export/](spec/42sh/builtins/export)**
      * [001-display-env](spec/42sh/builtins/export/001-display-env)
      * [002-export-basic-key-value-1](spec/42sh/builtins/export/002-export-basic-key-value-1)
      * [003-export-basic-key-value-2](spec/42sh/builtins/export/003-export-basic-key-value-2)
      * [004-export-empty-variable-1](spec/42sh/builtins/export/004-export-empty-variable-1)
      * [005-export-empty-variable-2](spec/42sh/builtins/export/005-export-empty-variable-2)
      * [006-export-update-env-variable](spec/42sh/builtins/export/006-export-update-env-variable)
      * [007-existing-environment-variable](spec/42sh/builtins/export/007-existing-environment-variable)
      * [008-local-to-environment](spec/42sh/builtins/export/008-local-to-environment)
      * [009-export-with-equal-but-no-value-part1](spec/42sh/builtins/export/009-export-with-equal-but-no-value-part1)
      * [010-export-with-equal-but-no-value-part2](spec/42sh/builtins/export/010-export-with-equal-but-no-value-part2)
      * **[errors/](spec/42sh/builtins/export/errors)**
        * [001-invalid-identifier-1](spec/42sh/builtins/export/errors/001-invalid-identifier-1)
        * [002-invalid-identifier-2](spec/42sh/builtins/export/errors/002-invalid-identifier-2)
        * [003-illegal-option](spec/42sh/builtins/export/errors/003-illegal-option)
      * **[mixed/](spec/42sh/builtins/export/mixed)**
        * [001-export-and-tmp-env-part1](spec/42sh/builtins/export/mixed/001-export-and-tmp-env-part1)
        * [002-export-and-tmp-env-part2](spec/42sh/builtins/export/mixed/002-export-and-tmp-env-part2)
      * **[options/](spec/42sh/builtins/export/options)**
        * [001-export-with-only-p-parameter](spec/42sh/builtins/export/options/001-export-with-only-p-parameter)
        * [002-export-p-param-and-token-should-add-local-var-only-part1](spec/42sh/builtins/export/options/002-export-p-param-and-token-should-add-local-var-only-part1)
        * [003-export-p-param-and-token-should-add-local-var-only-part2](spec/42sh/builtins/export/options/003-export-p-param-and-token-should-add-local-var-only-part2)
        * [004-export-n-param](spec/42sh/builtins/export/options/004-export-n-param)
  * **[escaping/](spec/42sh/escaping)**
    * [001-escape-single-character-1](spec/42sh/escaping/001-escape-single-character-1)
    * [002-escape-single-character-2](spec/42sh/escaping/002-escape-single-character-2)
    * [003-escape-single-character-3](spec/42sh/escaping/003-escape-single-character-3)
    * [004-escape-single-character-4](spec/42sh/escaping/004-escape-single-character-4)
    * [005-escape-single-character-5](spec/42sh/escaping/005-escape-single-character-5)
    * **[mixed/](spec/42sh/escaping/mixed)**
      * **[globbing/](spec/42sh/escaping/mixed/globbing)**
        * **[brace-expansion/](spec/42sh/escaping/mixed/globbing/brace-expansion)**
          * [001-it-does-not-expand-braces-1](spec/42sh/escaping/mixed/globbing/brace-expansion/001-it-does-not-expand-braces-1)
          * [002-it-expands-braces-1](spec/42sh/escaping/mixed/globbing/brace-expansion/002-it-expands-braces-1)
          * [003-it-expands-braces-2](spec/42sh/escaping/mixed/globbing/brace-expansion/003-it-expands-braces-2)
        * **[bracket-expansion/](spec/42sh/escaping/mixed/globbing/bracket-expansion)**
          * [001-it-does-not-expand-brackets](spec/42sh/escaping/mixed/globbing/bracket-expansion/001-it-does-not-expand-brackets)
          * [002-escaped-inversion-mark](spec/42sh/escaping/mixed/globbing/bracket-expansion/002-escaped-inversion-mark)
          * [003-it-takes-escaped-bracket-as-pattern-character](spec/42sh/escaping/mixed/globbing/bracket-expansion/003-it-takes-escaped-bracket-as-pattern-character)
      * **[variable-expansion/](spec/42sh/escaping/mixed/variable-expansion)**
        * [001-escape-variable-1](spec/42sh/escaping/mixed/variable-expansion/001-escape-variable-1)
        * [002-it-does-not-escape-variable](spec/42sh/escaping/mixed/variable-expansion/002-it-does-not-escape-variable)
        * [003-escape-variable-2](spec/42sh/escaping/mixed/variable-expansion/003-escape-variable-2)
  * **[globbing/](spec/42sh/globbing)**
    * **[brace-expansion/](spec/42sh/globbing/brace-expansion)**
      * **[ascii-range/](spec/42sh/globbing/brace-expansion/ascii-range)**
        * [001-simple-ascending-1](spec/42sh/globbing/brace-expansion/ascii-range/001-simple-ascending-1)
        * [002-simple-ascending-2](spec/42sh/globbing/brace-expansion/ascii-range/002-simple-ascending-2)
        * [003-simple-ascending-3](spec/42sh/globbing/brace-expansion/ascii-range/003-simple-ascending-3)
        * [004-simple-descending-1](spec/42sh/globbing/brace-expansion/ascii-range/004-simple-descending-1)
        * [005-simple-descending-2](spec/42sh/globbing/brace-expansion/ascii-range/005-simple-descending-2)
        * [006-simple-descending-3](spec/42sh/globbing/brace-expansion/ascii-range/006-simple-descending-3)
        * [007-identical-start-and-end](spec/42sh/globbing/brace-expansion/ascii-range/007-identical-start-and-end)
        * [008-multiple-1](spec/42sh/globbing/brace-expansion/ascii-range/008-multiple-1)
        * [009-multiple-2](spec/42sh/globbing/brace-expansion/ascii-range/009-multiple-2)
        * [010-big-range](spec/42sh/globbing/brace-expansion/ascii-range/010-big-range)
      * **[errors/](spec/42sh/globbing/brace-expansion/errors)**
        * [001-invalid-pattern-1](spec/42sh/globbing/brace-expansion/errors/001-invalid-pattern-1)
        * [002-invalid-pattern-2](spec/42sh/globbing/brace-expansion/errors/002-invalid-pattern-2)
        * [003-invalid-pattern-3](spec/42sh/globbing/brace-expansion/errors/003-invalid-pattern-3)
        * [004-invalid-pattern-4](spec/42sh/globbing/brace-expansion/errors/004-invalid-pattern-4)
      * **[list-of-values/](spec/42sh/globbing/brace-expansion/list-of-values)**
        * [001-nothing-to-be-done](spec/42sh/globbing/brace-expansion/list-of-values/001-nothing-to-be-done)
        * [002-simple-test-1](spec/42sh/globbing/brace-expansion/list-of-values/002-simple-test-1)
        * [003-simple-test-2](spec/42sh/globbing/brace-expansion/list-of-values/003-simple-test-2)
      * **[numeric-range/](spec/42sh/globbing/brace-expansion/numeric-range)**
        * [001-simple-ascending-1](spec/42sh/globbing/brace-expansion/numeric-range/001-simple-ascending-1)
        * [002-simple-ascending-2](spec/42sh/globbing/brace-expansion/numeric-range/002-simple-ascending-2)
        * [003-simple-ascending-3](spec/42sh/globbing/brace-expansion/numeric-range/003-simple-ascending-3)
        * [004-simple-ascending-4](spec/42sh/globbing/brace-expansion/numeric-range/004-simple-ascending-4)
        * [005-simple-ascending-5](spec/42sh/globbing/brace-expansion/numeric-range/005-simple-ascending-5)
        * [006-simple-descending-1](spec/42sh/globbing/brace-expansion/numeric-range/006-simple-descending-1)
        * [007-simple-descending-2](spec/42sh/globbing/brace-expansion/numeric-range/007-simple-descending-2)
        * [008-simple-descending-3](spec/42sh/globbing/brace-expansion/numeric-range/008-simple-descending-3)
        * [009-simple-descending-4](spec/42sh/globbing/brace-expansion/numeric-range/009-simple-descending-4)
        * [010-simple-descending-5](spec/42sh/globbing/brace-expansion/numeric-range/010-simple-descending-5)
        * [011-identical-positive-start-and-end](spec/42sh/globbing/brace-expansion/numeric-range/011-identical-positive-start-and-end)
        * [012-identical-negative-start-and-end](spec/42sh/globbing/brace-expansion/numeric-range/012-identical-negative-start-and-end)
        * [013-multiple-1](spec/42sh/globbing/brace-expansion/numeric-range/013-multiple-1)
        * [014-multiple-2](spec/42sh/globbing/brace-expansion/numeric-range/014-multiple-2)
        * [015-big-range](spec/42sh/globbing/brace-expansion/numeric-range/015-big-range)
    * **[bracket-expansion/](spec/42sh/globbing/bracket-expansion)**
      * **[multi/](spec/42sh/globbing/bracket-expansion/multi)**
        * [001-range-and-char](spec/42sh/globbing/bracket-expansion/multi/001-range-and-char)
        * [002-reverse-range-and-chars](spec/42sh/globbing/bracket-expansion/multi/002-reverse-range-and-chars)
        * [003-reverse-multi-hard](spec/42sh/globbing/bracket-expansion/multi/003-reverse-multi-hard)
        * [004-simple-bracket+char+range](spec/42sh/globbing/bracket-expansion/multi/004-simple-bracket+char+range)
      * **[not/](spec/42sh/globbing/bracket-expansion/not)**
        * [001-simple-opposit-match](spec/42sh/globbing/bracket-expansion/not/001-simple-opposit-match)
        * [002-simple-opposite-range](spec/42sh/globbing/bracket-expansion/not/002-simple-opposite-range)
      * **[range-pattern/](spec/42sh/globbing/bracket-expansion/range-pattern)**
        * [001-alpha-range](spec/42sh/globbing/bracket-expansion/range-pattern/001-alpha-range)
        * [002-numeric-range](spec/42sh/globbing/bracket-expansion/range-pattern/002-numeric-range)
        * [003-ascii-range-1](spec/42sh/globbing/bracket-expansion/range-pattern/003-ascii-range-1)
        * [004-ascii-range-2](spec/42sh/globbing/bracket-expansion/range-pattern/004-ascii-range-2)
      * **[simple-pattern/](spec/42sh/globbing/bracket-expansion/simple-pattern)**
        * [001-simple-list](spec/42sh/globbing/bracket-expansion/simple-pattern/001-simple-list)
        * [002-multi-bracket](spec/42sh/globbing/bracket-expansion/simple-pattern/002-multi-bracket)
        * [003-brackets-as-pattern](spec/42sh/globbing/bracket-expansion/simple-pattern/003-brackets-as-pattern)
        * [004-multi-bracket-multi-char](spec/42sh/globbing/bracket-expansion/simple-pattern/004-multi-bracket-multi-char)
      * **[single-char-pattern/](spec/42sh/globbing/bracket-expansion/single-char-pattern)**
        * [001-single-char](spec/42sh/globbing/bracket-expansion/single-char-pattern/001-single-char)
        * [002-closing-bracket-char](spec/42sh/globbing/bracket-expansion/single-char-pattern/002-closing-bracket-char)
        * [003-opening-bracket-char](spec/42sh/globbing/bracket-expansion/single-char-pattern/003-opening-bracket-char)
  * **[local-variable/](spec/42sh/local-variable)**
    * [001-declare-and-expand-1](spec/42sh/local-variable/001-declare-and-expand-1)
    * [002-declare-and-expand-2](spec/42sh/local-variable/002-declare-and-expand-2)
    * [003-unknown-variable-does-not-result-in-new-argument](spec/42sh/local-variable/003-unknown-variable-does-not-result-in-new-argument)
    * [004-existing-variable-in-environment-1](spec/42sh/local-variable/004-existing-variable-in-environment-1)
    * [005-existing-variable-in-environment-2](spec/42sh/local-variable/005-existing-variable-in-environment-2)
    * [006-existing-variable-in-environment-3](spec/42sh/local-variable/006-existing-variable-in-environment-3)
    * [007-multiple-declaration-at-a-time](spec/42sh/local-variable/007-multiple-declaration-at-a-time)
    * [008-multiple-declaration-with-same-name](spec/42sh/local-variable/008-multiple-declaration-with-same-name)
    * [009-last-exit-status](spec/42sh/local-variable/009-last-exit-status)
    * **[mixed/](spec/42sh/local-variable/mixed)**
      * **[inline-environment-variable/](spec/42sh/local-variable/mixed/inline-environment-variable)**
        * [001-local-variable-shouldnt-be-set](spec/42sh/local-variable/mixed/inline-environment-variable/001-local-variable-shouldnt-be-set)
      * **[redirections/](spec/42sh/local-variable/mixed/redirections)**
        * [001-truncating](spec/42sh/local-variable/mixed/redirections/001-truncating)
        * [002-appending](spec/42sh/local-variable/mixed/redirections/002-appending)
        * [003-reading](spec/42sh/local-variable/mixed/redirections/003-reading)
      * **[tilde-expansion/](spec/42sh/local-variable/mixed/tilde-expansion)**
        * [001-process-tilde-expansion](spec/42sh/local-variable/mixed/tilde-expansion/001-process-tilde-expansion)
  * **[quoting/](spec/42sh/quoting)**
    * **[double-quotes/](spec/42sh/quoting/double-quotes)**
      * [001-it-works](spec/42sh/quoting/double-quotes/001-it-works)
      * [002-concatenated-strings](spec/42sh/quoting/double-quotes/002-concatenated-strings)
      * [003-first-argument-inhibited](spec/42sh/quoting/double-quotes/003-first-argument-inhibited)
      * [004-multiline-1](spec/42sh/quoting/double-quotes/004-multiline-1)
      * [005-multiline-2](spec/42sh/quoting/double-quotes/005-multiline-2)
      * **[mixed/](spec/42sh/quoting/double-quotes/mixed)**
        * **[escaping/](spec/42sh/quoting/double-quotes/mixed/escaping)**
          * [001-escape-double-quote-1](spec/42sh/quoting/double-quotes/mixed/escaping/001-escape-double-quote-1)
          * [002-escape-double-quote-2](spec/42sh/quoting/double-quotes/mixed/escaping/002-escape-double-quote-2)
          * [003-escape-double-quote-3](spec/42sh/quoting/double-quotes/mixed/escaping/003-escape-double-quote-3)
          * [004-it-results-in-error](spec/42sh/quoting/double-quotes/mixed/escaping/004-it-results-in-error)
          * [005-it-does-not-escape-double-quote](spec/42sh/quoting/double-quotes/mixed/escaping/005-it-does-not-escape-double-quote)
        * **[globbing/](spec/42sh/quoting/double-quotes/mixed/globbing)**
          * **[brace-expansion/](spec/42sh/quoting/double-quotes/mixed/globbing/brace-expansion)**
            * [001-it-does-not-expand-braces-1](spec/42sh/quoting/double-quotes/mixed/globbing/brace-expansion/001-it-does-not-expand-braces-1)
            * [002-it-does-not-expand-braces-2](spec/42sh/quoting/double-quotes/mixed/globbing/brace-expansion/002-it-does-not-expand-braces-2)
            * [003-it-does-not-expand-braces-3](spec/42sh/quoting/double-quotes/mixed/globbing/brace-expansion/003-it-does-not-expand-braces-3)
            * [004-it-does-not-expand-braces-4](spec/42sh/quoting/double-quotes/mixed/globbing/brace-expansion/004-it-does-not-expand-braces-4)
            * [005-it-does-not-expand-braces-5](spec/42sh/quoting/double-quotes/mixed/globbing/brace-expansion/005-it-does-not-expand-braces-5)
          * **[bracket-expansion/](spec/42sh/quoting/double-quotes/mixed/globbing/bracket-expansion)**
            * [001-it-works-1](spec/42sh/quoting/double-quotes/mixed/globbing/bracket-expansion/001-it-works-1)
            * [002-it-works-2](spec/42sh/quoting/double-quotes/mixed/globbing/bracket-expansion/002-it-works-2)
        * **[variable-expansion/](spec/42sh/quoting/double-quotes/mixed/variable-expansion)**
          * [001-expansion-enabled](spec/42sh/quoting/double-quotes/mixed/variable-expansion/001-expansion-enabled)
    * **[mixed/](spec/42sh/quoting/mixed)**
      * [001-simple-and-double-quotes](spec/42sh/quoting/mixed/001-simple-and-double-quotes)
      * [002-multiline](spec/42sh/quoting/mixed/002-multiline)
      * **[globbing/](spec/42sh/quoting/mixed/globbing)**
        * **[brace-expansion/](spec/42sh/quoting/mixed/globbing/brace-expansion)**
          * [001-it-does-not-expand-braces-1](spec/42sh/quoting/mixed/globbing/brace-expansion/001-it-does-not-expand-braces-1)
        * **[bracket-expansion/](spec/42sh/quoting/mixed/globbing/bracket-expansion)**
          * [001-it-works-1](spec/42sh/quoting/mixed/globbing/bracket-expansion/001-it-works-1)
          * [002-it-works-2](spec/42sh/quoting/mixed/globbing/bracket-expansion/002-it-works-2)
      * **[variable-expansion/](spec/42sh/quoting/mixed/variable-expansion)**
        * [001-it-does-not-expand-in-quotes](spec/42sh/quoting/mixed/variable-expansion/001-it-does-not-expand-in-quotes)
    * **[simple-quotes/](spec/42sh/quoting/simple-quotes)**
      * [001-it-works](spec/42sh/quoting/simple-quotes/001-it-works)
      * [002-concatenated-strings](spec/42sh/quoting/simple-quotes/002-concatenated-strings)
      * [003-first-argument-inhibited](spec/42sh/quoting/simple-quotes/003-first-argument-inhibited)
      * [004-multiline-1](spec/42sh/quoting/simple-quotes/004-multiline-1)
      * [005-multiline-2](spec/42sh/quoting/simple-quotes/005-multiline-2)
      * **[mixed/](spec/42sh/quoting/simple-quotes/mixed)**
        * **[escaping/](spec/42sh/quoting/simple-quotes/mixed/escaping)**
          * [001-escape-simple-quote-1](spec/42sh/quoting/simple-quotes/mixed/escaping/001-escape-simple-quote-1)
          * [002-escape-simple-quote-2](spec/42sh/quoting/simple-quotes/mixed/escaping/002-escape-simple-quote-2)
          * [003-escape-simple-quote-3](spec/42sh/quoting/simple-quotes/mixed/escaping/003-escape-simple-quote-3)
          * [004-it-does-not-escape-simple-quote-1](spec/42sh/quoting/simple-quotes/mixed/escaping/004-it-does-not-escape-simple-quote-1)
          * [005-it-does-not-escape-simple-quote-2](spec/42sh/quoting/simple-quotes/mixed/escaping/005-it-does-not-escape-simple-quote-2)
        * **[globbing/](spec/42sh/quoting/simple-quotes/mixed/globbing)**
          * **[brace-expansion/](spec/42sh/quoting/simple-quotes/mixed/globbing/brace-expansion)**
            * [001-it-does-not-expand-braces-1](spec/42sh/quoting/simple-quotes/mixed/globbing/brace-expansion/001-it-does-not-expand-braces-1)
            * [002-it-does-not-expand-braces-2](spec/42sh/quoting/simple-quotes/mixed/globbing/brace-expansion/002-it-does-not-expand-braces-2)
            * [003-it-does-not-expand-braces-3](spec/42sh/quoting/simple-quotes/mixed/globbing/brace-expansion/003-it-does-not-expand-braces-3)
            * [004-it-does-not-expand-braces-4](spec/42sh/quoting/simple-quotes/mixed/globbing/brace-expansion/004-it-does-not-expand-braces-4)
            * [005-it-does-not-expand-braces-5](spec/42sh/quoting/simple-quotes/mixed/globbing/brace-expansion/005-it-does-not-expand-braces-5)
          * **[bracket-expansion/](spec/42sh/quoting/simple-quotes/mixed/globbing/bracket-expansion)**
            * [001-it-works-1](spec/42sh/quoting/simple-quotes/mixed/globbing/bracket-expansion/001-it-works-1)
            * [002-it-works-2](spec/42sh/quoting/simple-quotes/mixed/globbing/bracket-expansion/002-it-works-2)
        * **[variable-expansion/](spec/42sh/quoting/simple-quotes/mixed/variable-expansion)**
          * [001-expansion-disabled](spec/42sh/quoting/simple-quotes/mixed/variable-expansion/001-expansion-disabled)
  * **[subshell/](spec/42sh/subshell)**
    * [001-tokens-are-recognized](spec/42sh/subshell/001-tokens-are-recognized)
    * [002-multiple-levels-of-subshells](spec/42sh/subshell/002-multiple-levels-of-subshells)
    * [003-multiline](spec/42sh/subshell/003-multiline)
    * [004-exit-status](spec/42sh/subshell/004-exit-status)
    * [005-copy-of-environment](spec/42sh/subshell/005-copy-of-environment)
    * **[errors/](spec/42sh/subshell/errors)**
      * [001-parse-error-1](spec/42sh/subshell/errors/001-parse-error-1)
      * [002-parse-error-2](spec/42sh/subshell/errors/002-parse-error-2)
      * [003-parse-error-3](spec/42sh/subshell/errors/003-parse-error-3)
      * [004-parse-error-4](spec/42sh/subshell/errors/004-parse-error-4)
    * **[mixed/](spec/42sh/subshell/mixed)**
      * **[builtins/](spec/42sh/subshell/mixed/builtins)**
        * **[cd/](spec/42sh/subshell/mixed/builtins/cd)**
          * [001-it-does-not-change-current-directory](spec/42sh/subshell/mixed/builtins/cd/001-it-does-not-change-current-directory)
          * [002-multiline](spec/42sh/subshell/mixed/builtins/cd/002-multiline)
        * **[exit/](spec/42sh/subshell/mixed/builtins/exit)**
          * [001-exiting-subshell](spec/42sh/subshell/mixed/builtins/exit/001-exiting-subshell)
        * **[setenv/](spec/42sh/subshell/mixed/builtins/setenv)**
          * [001-it-does-not-modify-parent-environment](spec/42sh/subshell/mixed/builtins/setenv/001-it-does-not-modify-parent-environment)
        * **[unsetenv/](spec/42sh/subshell/mixed/builtins/unsetenv)**
          * [001-it-does-not-modify-parent-environment](spec/42sh/subshell/mixed/builtins/unsetenv/001-it-does-not-modify-parent-environment)
      * **[escaping/](spec/42sh/subshell/mixed/escaping)**
        * [001-escaped-subshell-1](spec/42sh/subshell/mixed/escaping/001-escaped-subshell-1)
        * [002-escaped-subshell-2](spec/42sh/subshell/mixed/escaping/002-escaped-subshell-2)
      * **[inline-environment-variable/](spec/42sh/subshell/mixed/inline-environment-variable)**
        * [001-modifies-the-child-environment-only-1](spec/42sh/subshell/mixed/inline-environment-variable/001-modifies-the-child-environment-only-1)
        * [002-modifies-the-child-environment-only-2](spec/42sh/subshell/mixed/inline-environment-variable/002-modifies-the-child-environment-only-2)
      * **[piping/](spec/42sh/subshell/mixed/piping)**
        * [001-subshells-inside-piped-command](spec/42sh/subshell/mixed/piping/001-subshells-inside-piped-command)
        * [002-pipes-inside-subshells](spec/42sh/subshell/mixed/piping/002-pipes-inside-subshells)
        * [003-imbricated-subshells-and-pipes](spec/42sh/subshell/mixed/piping/003-imbricated-subshells-and-pipes)
      * **[quoting/](spec/42sh/subshell/mixed/quoting)**
        * [001-with-simple-quotes](spec/42sh/subshell/mixed/quoting/001-with-simple-quotes)
        * [002-with-double-quotes](spec/42sh/subshell/mixed/quoting/002-with-double-quotes)
        * [003-with-simple-and-double-quotes](spec/42sh/subshell/mixed/quoting/003-with-simple-and-double-quotes)
* **[bonuses/](spec/bonuses)**
  * **[builtins/](spec/bonuses/builtins)**
    * **[env/](spec/bonuses/builtins/env)**
      * [001-unset-variables <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/builtins/env/001-unset-variables)
      * [002-unset-and-set-variable <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/builtins/env/002-unset-and-set-variable)
  * **[inline-environment-variable/](spec/bonuses/inline-environment-variable)**
    * [001-modifies-child-environment-1](spec/bonuses/inline-environment-variable/001-modifies-child-environment-1)
    * [002-modifies-child-environment-2](spec/bonuses/inline-environment-variable/002-modifies-child-environment-2)
    * [003-modifies-PATH-only](spec/bonuses/inline-environment-variable/003-modifies-PATH-only)
  * **[redirections/](spec/bonuses/redirections)**
    * [001-append-twice-outputs-together <img src='./lib/assets/non-posix.png' width='63' height='12' /> <img src='./lib/assets/hard.png' width='38' height='12' /> <img src='./lib/assets/pending.png' width='54' height='12' />](spec/bonuses/redirections/001-append-twice-outputs-together)
  * **[separators/](spec/bonuses/separators)**
    * **[and/](spec/bonuses/separators/and)**
      * [001-run-twice](spec/bonuses/separators/and/001-run-twice)
      * [002-do-not-run-second](spec/bonuses/separators/and/002-do-not-run-second)
      * [003-run-until-failing](spec/bonuses/separators/and/003-run-until-failing)
      * **[errors/](spec/bonuses/separators/and/errors)**
        * [001-parse-error-at-beginning](spec/bonuses/separators/and/errors/001-parse-error-at-beginning)
        * [002-parse-error-too-much-symbol](spec/bonuses/separators/and/errors/002-parse-error-too-much-symbol)
    * **[mixed/](spec/bonuses/separators/mixed)**
      * [001-and-or](spec/bonuses/separators/mixed/001-and-or)
      * [002-and-or](spec/bonuses/separators/mixed/002-and-or)
      * [003-and-or](spec/bonuses/separators/mixed/003-and-or)
      * [004-or-and](spec/bonuses/separators/mixed/004-or-and)
      * [005-or-and](spec/bonuses/separators/mixed/005-or-and)
      * [006-or-and](spec/bonuses/separators/mixed/006-or-and)
    * **[or/](spec/bonuses/separators/or)**
      * [001-run-first-only](spec/bonuses/separators/or/001-run-first-only)
      * [002-run-second-only](spec/bonuses/separators/or/002-run-second-only)
      * [003-run-until-succeeding](spec/bonuses/separators/or/003-run-until-succeeding)
      * **[errors/](spec/bonuses/separators/or/errors)**
        * [001-parse-error-at-beginning](spec/bonuses/separators/or/errors/001-parse-error-at-beginning)
        * [002-parse-error-too-much-symbol](spec/bonuses/separators/or/errors/002-parse-error-too-much-symbol)
  * **[tilde-expansion/](spec/bonuses/tilde-expansion)**
    * [001-expanded-with-HOME-1](spec/bonuses/tilde-expansion/001-expanded-with-HOME-1)
    * [002-expanded-with-HOME-2](spec/bonuses/tilde-expansion/002-expanded-with-HOME-2)
    * [003-expanded-with-PWD-1](spec/bonuses/tilde-expansion/003-expanded-with-PWD-1)
    * [004-expanded-with-PWD-2](spec/bonuses/tilde-expansion/004-expanded-with-PWD-2)
    * [005-expanded-with-OLDPWD-1](spec/bonuses/tilde-expansion/005-expanded-with-OLDPWD-1)
    * [006-expanded-with-OLDPWD-2](spec/bonuses/tilde-expansion/006-expanded-with-OLDPWD-2)
    * **[not-expanded/](spec/bonuses/tilde-expansion/not-expanded)**
      * [001-not-expanded-with-HOME-1](spec/bonuses/tilde-expansion/not-expanded/001-not-expanded-with-HOME-1)
      * [002-not-expanded-with-HOME-2](spec/bonuses/tilde-expansion/not-expanded/002-not-expanded-with-HOME-2)
      * [003-not-expanded-with-PWD](spec/bonuses/tilde-expansion/not-expanded/003-not-expanded-with-PWD)
      * [004-not-expanded-with-OLDPWD](spec/bonuses/tilde-expansion/not-expanded/004-not-expanded-with-OLDPWD)
* **[minishell/](spec/minishell)**
  * **[binary/](spec/minishell/binary)**
    * [001-binary-path-relative](spec/minishell/binary/001-binary-path-relative)
    * [002-binary-path-absolute](spec/minishell/binary/002-binary-path-absolute)
    * [003-binary-test-exec-order](spec/minishell/binary/003-binary-test-exec-order)
    * [004-binary-test-empty-path](spec/minishell/binary/004-binary-test-empty-path)
    * [005-binary-test-wrong-path](spec/minishell/binary/005-binary-test-wrong-path)
    * [006-binary-undefined-path](spec/minishell/binary/006-binary-undefined-path)
    * [007-binary-permission-denied](spec/minishell/binary/007-binary-permission-denied)
    * [008-binary-too-many-symbolic-links-encountered](spec/minishell/binary/008-binary-too-many-symbolic-links-encountered)
  * **[builtins/](spec/minishell/builtins)**
    * **[cd/](spec/minishell/builtins/cd)**
      * [001-no-arg](spec/minishell/builtins/cd/001-no-arg)
      * [002-current-directory](spec/minishell/builtins/cd/002-current-directory)
      * [003-current-directory-2](spec/minishell/builtins/cd/003-current-directory-2)
      * [004-parent-directory](spec/minishell/builtins/cd/004-parent-directory)
      * [005-root-path](spec/minishell/builtins/cd/005-root-path)
      * [006-root-path-2](spec/minishell/builtins/cd/006-root-path-2)
      * [007-symbolic-link](spec/minishell/builtins/cd/007-symbolic-link)
      * [008-symbolic-link-2](spec/minishell/builtins/cd/008-symbolic-link-2)
      * [009-following-links <img src='./lib/assets/hard.png' width='38' height='12' />](spec/minishell/builtins/cd/009-following-links)
      * [010-update-OLDPWD](spec/minishell/builtins/cd/010-update-OLDPWD)
      * [011-dotdot](spec/minishell/builtins/cd/011-dotdot)
      * [012-dot](spec/minishell/builtins/cd/012-dot)
      * [013-absolute-path](spec/minishell/builtins/cd/013-absolute-path)
      * **[errors/](spec/minishell/builtins/cd/errors)**
        * [001-not-a-directory](spec/minishell/builtins/cd/errors/001-not-a-directory)
        * [002-not-a-directory-2](spec/minishell/builtins/cd/errors/002-not-a-directory-2)
        * [003-permission-denied](spec/minishell/builtins/cd/errors/003-permission-denied)
        * [004-permission-denied-2](spec/minishell/builtins/cd/errors/004-permission-denied-2)
        * [005-too-many-symbolic-links-encountered](spec/minishell/builtins/cd/errors/005-too-many-symbolic-links-encountered)
        * [006-too-many-symbolic-links-encountered-2](spec/minishell/builtins/cd/errors/006-too-many-symbolic-links-encountered-2)
        * [007-no-such-file-or-directory](spec/minishell/builtins/cd/errors/007-no-such-file-or-directory)
        * [008-no-such-file-or-directory-2](spec/minishell/builtins/cd/errors/008-no-such-file-or-directory-2)
        * [009-no-such-file-or-directory-symlink](spec/minishell/builtins/cd/errors/009-no-such-file-or-directory-symlink)
        * [010-no-such-file-or-directory-symlink-2](spec/minishell/builtins/cd/errors/010-no-such-file-or-directory-symlink-2)
      * **[options/](spec/minishell/builtins/cd/options)**
        * [001-not-following-links](spec/minishell/builtins/cd/options/001-not-following-links)
        * [002-oldpwd](spec/minishell/builtins/cd/options/002-oldpwd)
    * **[env/](spec/minishell/builtins/env)**
      * [001-env-same-value-as-parent](spec/minishell/builtins/env/001-env-same-value-as-parent)
      * [002-env-check-usefull-var](spec/minishell/builtins/env/002-env-check-usefull-var)
      * [003-ignore-environment](spec/minishell/builtins/env/003-ignore-environment)
      * [005-set-variables](spec/minishell/builtins/env/005-set-variables)
      * **[errors/](spec/minishell/builtins/env/errors)**
        * [001-command-not-found](spec/minishell/builtins/env/errors/001-command-not-found)
        * [002-illegal-option](spec/minishell/builtins/env/errors/002-illegal-option)
      * **[multiple-options/](spec/minishell/builtins/env/multiple-options)**
        * [001-ignore-environment-and-set-variable](spec/minishell/builtins/env/multiple-options/001-ignore-environment-and-set-variable)
    * **[exit/](spec/minishell/builtins/exit)**
      * [001-without-any-argument](spec/minishell/builtins/exit/001-without-any-argument)
      * [002-status-passed-as-argument](spec/minishell/builtins/exit/002-status-passed-as-argument)
      * [003-status-of-last-command](spec/minishell/builtins/exit/003-status-of-last-command)
      * **[errors/](spec/minishell/builtins/exit/errors)**
        * [001-too-many-args](spec/minishell/builtins/exit/errors/001-too-many-args)
        * [002-non-numeric-argument](spec/minishell/builtins/exit/errors/002-non-numeric-argument)
    * **[mixed/](spec/minishell/builtins/mixed)**
      * [001-setenv-unsetenv](spec/minishell/builtins/mixed/001-setenv-unsetenv)
    * **[setenv/](spec/minishell/builtins/setenv)**
      * [001-no-argument](spec/minishell/builtins/setenv/001-no-argument)
      * [002-add-new-variable](spec/minishell/builtins/setenv/002-add-new-variable)
      * [003-set-existing-variable](spec/minishell/builtins/setenv/003-set-existing-variable)
      * [004-invalid-identifier](spec/minishell/builtins/setenv/004-invalid-identifier)
      * [005-add-and-set-multiple-variables](spec/minishell/builtins/setenv/005-add-and-set-multiple-variables)
    * **[unsetenv/](spec/minishell/builtins/unsetenv)**
      * [001-unsetenv-first-elem](spec/minishell/builtins/unsetenv/001-unsetenv-first-elem)
      * [002-unsetenv-mult-envp](spec/minishell/builtins/unsetenv/002-unsetenv-mult-envp)
      * [003-unsetenv-mult-envp-inline](spec/minishell/builtins/unsetenv/003-unsetenv-mult-envp-inline)
  * **[misc/](spec/minishell/misc)**
    * [001-copy-of-environment](spec/minishell/misc/001-copy-of-environment)

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

An integration test must be **self-sufficient**, that means executing the full test suite or only one test must result in the same failed or success status. The framework 42ShellTester brings you tools for that!

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
  * **`matching_regex`** + *`$regex`*: At least one line of the file matches with the regular expression *$regex*.
  * **`not_matching_regex`** + *`$regex`*: Any line of the file does match with the regular expression *$regex*.
  * **`with_nb_of_lines`** + *`$int`*: The file contains exactly *$int* lines.
* **`exit_with_status`** + *`$int`*: The Shell termination results in the exit status *$int*.
* **`have_nb_of_lines`** + *`$int`*: Actual output contains exactly *$int* lines.
* **`match_regex`** + *`$regex`*: At least one line of actual output does match with the regular expression *$regex*.
  * **`once`**: The matching is limited to only one occurrence.
  * *`$int`* **`times`**: The matching must exactly occur *$int* times.
* **`match_each_regex_of_file`** + *`$filename`*: Actual output does match with each regular expression contained in the file named *$filename* (in an indifferent order).

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
  * Use the array `EXPECTED_TO_ARGS[]` to take advantage of arguments (e.g. `expected_to match_regex "regex"`, then `EXPECTED_TO_ARGS[0]` contains `regex`)

## Support binaries

The framework 42ShellTester provides several binaries to be used within the tests. Using them instead of using Unix binaries prevents from undefined behaviors and compatibility errors.

Find the available list of support binaries bellow:

<!--START_SUPPORT_BINARIES_LIST-->

* **[./display_env](http://github.com/we-sh/42ShellTester/tree/master/support/display-env)**: A binary that iterates on `**envp` and write each element on standard output.
* **[./display_program_name](http://github.com/we-sh/42ShellTester/tree/master/support/display-program-name)**: A binary that writes its name on standard ouput.
* **[./display_pwd](http://github.com/we-sh/42ShellTester/tree/master/support/display-pwd)**: A binary that writes on standard output the absolute path of the current directory returned by `getcwd(3)`, encountered with the strings `PWD:` and `:PWD`.
* **[./exit_with_status](http://github.com/we-sh/42ShellTester/tree/master/support/exit-with-status)**: A binary that immediately exits with the status given as first argument.
* **[./read_on_stdin](http://github.com/we-sh/42ShellTester/tree/master/support/read-on-stdin)**: A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.
* **[./sleep_and_exit_with_status](http://github.com/we-sh/42ShellTester/tree/master/support/sleep-and-exit-with-status)**: A binary that sleeps for a duration in seconds given as first argument and then exits with status given as second argument.
* **[./sleep_and_write_on_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/sleep-and-write-on-stderr)**: A binary that sleeps for a duration in seconds given as first argument and then writes on STDERR the string given as second argument without EOL.
* **[./write_all_arguments_on_stdout](http://github.com/we-sh/42ShellTester/tree/master/support/write-all-arguments-on-stdout)**: A binary that writes on standard output each argument separated by the symbol `@`. If no argument is given, it writes the string "nothing to be written on stdout".
* **[./write_on_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stderr)**: A binary that writes on standard error the first given argument (the same behavior as `echo` but with only one argument) and exits with an error status code given as second argument. If no argument is given, it writes the string "write on stderr" and exit with status `1`.
* **[./write_on_stdout](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stdout)**: A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".
* **[./write_on_stdout_and_stderr](http://github.com/we-sh/42ShellTester/tree/master/support/write-on-stdout-and-stderr)**: A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".

<!--END_SUPPORT_BINARIES_LIST-->

## Tasks

* `bash ./tasks/generate_readmes.sh` (only on master branch) to automaticaly generate the README files of tests

# The Team

* **Adrien Nouvel** [@anouvel](https://github.com/anouvel)
* **Gabriel Kuma** [@gabkk](https://github.com/gabkk)
* **Jean-Michel Gigault** [@jgigault](https://github.com/jgigault)

## Logo credits

Edouard Audeguy  
Illustrateur / Infographiste  
https://edouardaudeguy.wix.com/portfolio
