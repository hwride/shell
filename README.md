For testing shell, command-line, and terminal-related things.

## Terminals, Shells, and Consoles
- A **terminal** is an interface for sending text input to a computer and displaying its text output. Historically, terminals were physical devices connected to another computer.
- A **console** traditionally means the computer’s primary, directly attached terminal. In modern usage, “console” and “terminal” are often used interchangeably.
- A **shell** is an interpreter for a command language. It reads input from a terminal, parses the command language, including control-flow syntax such as `if`, `then`, and `fi`, expands things such as variables and wildcards, runs built-in commands such as `cd`, `export`, and `alias`, starts external programs such as `cat`, `ls`, `grep`, and `git`, and connects programs using pipes and redirections. Examples include `sh`, Bash, Zsh, and Fish.
A **terminal emulator** is software that imitates the behavior of a physical terminal, such as a VT100. macOS Terminal.app, iTerm2, and Windows Terminal are examples. A terminal emulator usually creates or connects to a virtual terminal. In addition to accepting running a shell which it sends input to and displays output from, it will also emulate behaviour of physical terminals such as keyboard shortcuts liek `Ctrl-C`, cursor movement, colours, full-screen programs, etc.
- A **virtual terminal** is a software-provided terminal interface rather than a physical terminal device. This is a broad term, not one specific mechanism.
  - On Unix/POSIX systems, terminal emulators usually communicate with shells through **pseudo-terminals (PTYs)**, such as `/dev/pts/0`. Used by Terminal.app, iTerm2, SSH.
  - Linux also provides **virtual consoles**, such as `/dev/tty1`. These are virtual terminals, but they are not PTYs.
  - Windows provides an analogous interface called a **pseudoconsole (ConPTY)**.
- A **command line** is a text-based way to interact with a computer by entering commands. On Linux, this typically means entering shell commands in a terminal; on Windows, it may mean entering PowerShell or Command Prompt commands in a terminal.

## Shells

### POSIX
POSIX is a standard for the interface an OS provides to programs and users. It is wide-ranging, covering shell languages and built-ins, standard command-line utilities, system APIs, file systems, processes, regular expressions, environment variables, and more.

The POSIX pieces most relevant here are:

- **POSIX shell language:** syntax such as `if`, `then`, `else`, `elif`, `fi`, `for`, `while`, `until`, `case`, `esac`, loops, quoting, variables, functions, command substitution, pipes, redirections, `&&`, and `||`.
- **POSIX shell built-ins:** commands such as `cd`, `pwd`, `export`, `read`, `set`, `unset`, `alias`, `command`, `exec`, `eval`, `trap`, `shift`, `exit`, and `wait`.
- **POSIX utilities:** external commands such as `ls`, `cat`, `grep`, `find`, `cp`, `mv`, `rm`, `mkdir`, `touch`, `chmod`, `head`, `tail`, `sort`, `uniq`, `wc`, `cut`, `tr`, `sed`, `awk`, `xargs`, `diff`, `du`, `df`, `ps`, and `kill`, roughly in order of everyday usefulness.
- **POSIX system interfaces:** APIs that programs use to interact with the operating system, such as `open`, `close`, `read`, `write`, `stat`, `chmod`, `mkdir`, `unlink`, `rename`, `chdir`, `getcwd`, `fork`, `exec`, `pipe`, `dup2`, `wait`, `kill`, and `pthread_create`.

POSIX is a standard, not a program. For example, `cat` and `ls` are POSIX utility names, while GNU Coreutils and macOS's BSD-derived utilities are different implementations of many of those utilities.

### Shell implementations

A shell implementation is a program that implements a shell language. POSIX defines a portable shell language, while individual shells provide that language plus their own extensions.

| Shell | POSIX relationship | Examples of extensions or differences |
| --- | --- | --- |
| `sh` | The standard POSIX shell interface; the implementation varies between systems | Portable scripts should use only POSIX syntax and commands |
| Bash | Implements POSIX shell features and adds many extensions | `[[ ... ]]`, `(( ... ))`, indexed and associative arrays, `source`, `local`, `declare`, `mapfile`, process substitution, here-strings, `shopt`, `pipefail`, `select`, and `coproc` |
| Zsh | Supports much of the POSIX shell language and adds its own features | `[[ ... ]]`, `(( ... ))`, arrays, `setopt`, `unsetopt`, `autoload`, `typeset`, extended and recursive globbing, parameter-expansion flags, process substitution, ZLE, and advanced interactive completion |
| Fish | Uses a different command language and is not POSIX-compatible | Its own syntax, scripting features, and interactive experience |
