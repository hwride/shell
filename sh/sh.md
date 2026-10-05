# Shell Command Language and the sh utility
The `sh` utility (see [POSIX sh utility specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/sh.html)) is a command language interpreter that executes [POSIX Shell Command Language](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19) commands. It reads input from a command line string, the standard input, or a specified file.

## Resources
- https://www.grymoire.com/Unix/Sh.html
- https://www.shellscript.sh


## Script files
You can create script files which can be run by `sh`. A script is a text file containing shell command language commands. 

You can name your scripts like `script.sh`, the `.sh` suffix is convention only.

### Running shell commands
You can run shell command language commands in a few ways:
- Run `sh` in a terminal, then start entering commands.
- Pass a shell script to `sh`: `sh my-script.sh`
- Pass shell commands directly to `sh`: `sh -c 'echo "Hello World"'`
- Run an executable script directly: `./my-script.sh`. Note to execute a script directly you must ensure your script is executable, with for e.g. `chmod +x my-script.sh`

### Hashbang/she-bang
`#!` is a shebang, e.g. `#!/bin/sh`. It tells the system which interpreter to use when the script is run directly, meaning you don't need to invoke the shell yourself. See e.g. [hashbang.sh](./hashbang.sh).

