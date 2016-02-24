# 42shTests

Integration tests designed for the projects of the Shell branch at 42 School: **minishell**, **21sh** and **42sh**.

### Installation

```bash
git clone https://github.com/ftwftw0/42shTests ~/42shTests
```


### How to use

Replace the first argument by the path to your own binary (e.g.: `/Users/admin/Documents/42sh/42sh`):

```bash
cd ~/42shTests && sh 42shTests.sh "/ABSOLUTE/PATH/TO/YOUR/SHELL"
```

You may want to only run tests for a specific project, just add a matcher as second argument: 

```bash
cd ~/42shTests && sh 42shTests.sh "/ABSOLUTE/PATH/TO/YOUR/SHELL" "minishell" # tests for minishell
cd ~/42shTests && sh 42shTests.sh "/ABSOLUTE/PATH/TO/YOUR/SHELL" "exit"      # tests for the builtin exit
...
```

### Credits

Made by @gabkk, @jgigault, @ftwftw0
