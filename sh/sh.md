# Shell Command Language and the sh utility
The `sh` utility (see [POSIX sh utility specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/sh.html)) is a command language interpreter that executes [POSIX Shell Command Language](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19) commands. It reads input from a command line string, the standard input, or a specified file.

## Resources
- [POSIX sh utility specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/sh.html)
- [POSIX Shell Command Language](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19)
- [POSIX Shell Command Language - Shell Grammar](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_10)
- https://www.shellscript.sh
- https://www.grymoire.com/Unix/Sh.html

## Script files
You can create script files which can be run by `sh`. A script is a text file containing shell command language commands. 

You can name your scripts like `script.sh`, the `.sh` suffix is convention only.

### Running shell commands
You can run shell command language commands in a few ways:
- Run `sh` in a terminal, then start entering commands.
- Pass a shell script to `sh`: `sh my-script.sh`
- Pass shell commands directly to `sh`: `sh -c 'echo "Hello World"'`
- Run an executable script directly: `./my-script.sh`. Note to execute a script directly you must ensure your script is executable, with for e.g. `chmod +x my-script.sh`

### Current shell
Scripts run with `sh` or `./` run in a new shell process, this means any variables set in those scripts will not be set in the parent shell/CLI. To run a script in the current shell use `. ./my-script.sh` in POSIX (or `source ./my-script.sh` in bash).

### Hashbang/she-bang
`#!` is a shebang, e.g. `#!/bin/sh`. It tells the system which interpreter to use when the script is run directly, meaning you don't need to invoke the shell yourself. See e.g. [hashbang.sh](./hashbang.sh).

## Separators - newlines and semi-colons
Shell command language requires parts of commands to be separated by separators, which can be newlines or semi-colons. You tend to use newlines for scripts, and `;` if writing one-liners.

For example here separators are indicated by `;` and could be `;` or newlines:
```shell
for name; do command; done
for name in wordlist; do command; done
while condition; do command; done
```

## Variables
See [variables.sh](./variables.sh).

```shell
MY_VAR=value
```

## Escape characters
See [escape-chars.sh](./escape-chars.sh).

## Loops
See [loops.sh](./loops.sh).

```shell
for name; do command; done
for name in wordlist; do command; done
while condition; do command; done
```

## Pattern matching
See [pattern-matching.sh](./pattern-matching.sh).

Pattern matching notation matches strings against patterns such as `*`, `?`, and `[0-9]`. In POSIX `sh`, it is used directly by `case` and parameter expansion such as `${file%.*}`. POSIX utilities such as `find -name` also use it.

Pathname expansion uses these patterns to expand unquoted words into matching pathnames. In POSIX `sh`, this can occur in a word list such as `for file in *md` or a command such as `echo *.md`.

Bash's extended `[[ ... ]]` conditional construct also supports pattern matching, but is not POSIX. POSIX `[ ... ]` is the `test` command and does not use pattern matching for its `=` comparison.

### Conditions and test
See [conditions.sh](./conditions.sh).

```shell
if expression; then expression; fi

if expression; then expression; else expression; fi

if expression then 
  expression
elif expression then
  expression
else
  expression
fi

case WORD in
  pattern1) expression ;;
  pattern2) expression ;;
  *) expression ;;
esac
```

Note you won't find `[ expression ]` in the [POSIX Shell Command Language Grammar](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_10). This is because `[ expression ]` is actually invoking the [POSIX test command](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/test.html) so isn't part of shell command language grammar.

## Special parameters
See [special-parameters.sh](./special-parameters.sh).

- `$?`: The exit status of the most recent pipeline.
- `$0`: The name used to invoke the shell or script.
- `$1`, `$2`, ...: Positional parameters passed to the script.
- `$#`: The number of positional parameters.
- `"$@"`: All positional parameters, preserving them as separate arguments.
- `"$*"`: All positional parameters combined into one argument.
- `$$`: The process ID of the current shell.
- `$!`: The process ID of the most recent background command.

## Command substitution
See [command-substitution.sh](./command-substitution.sh).

## Functions
See [functions.sh](functions.sh).
