For testing shell, command-line, and terminal-related things.

## Terminals, Shells, and Consoles
- A **terminal** is a user-facing endpoint for an interactive, character-based communication session. Historically, this was a hardware device separate from the computer it communicated with.
  - A **terminal emulator** is user-facing software that imitates the behaviour of a physical terminal, such as a VT100. macOS Terminal.app, iTerm2, and Windows Terminal are examples. It handles the keyboard and display, and interprets terminal-control instructions such as `Ctrl-C`, cursor movement, colours, and screen clearing.
    - On Unix/POSIX systems, a terminal emulator usually communicates with a shell through a **pseudo-terminal (PTY)**. The terminal emulator connects to the PTY's master side, while the shell connects to its slave side, such as `/dev/pts/0`. The PTY is the kernel-level interface that makes the shell see a terminal rather than an ordinary pipe, enabling interactive features such as job control, `Ctrl-C`, terminal sizing, and full-screen programs. Non-interactive shell scripts can use ordinary files or pipes instead.
    - On Windows, the analogous interface is called a **pseudoconsole (ConPTY)**.
  - Linux also provides **virtual consoles**, such as `/dev/tty1`. These are kernel-managed local text consoles, not PTYs.
  - **Virtual terminal** is an ambiguous umbrella term sometimes used for a terminal emulator, a PTY, or a virtual console. When possible, use the more specific term.
- A **console** traditionally means the computer’s primary, directly attached terminal. In modern usage, “console” and “terminal” are often used interchangeably.
- A **shell** is an interpreter for a command language. It reads input, parses that as a command language, including control-flow syntax such as `if`, `then`, and `fi`, expands things such as variables and wildcards, runs built-in commands such as `cd`, `export`, and `alias`, starts external programs such as `cat`, `ls`, `grep`, and `git`, and connects programs using pipes and redirections. Examples include `sh`, Bash, Zsh, and Fish. When you interact with a command line interface you will normally be sending commands to the shell on `stdin` and receiving output back on `stdout` and `stderr`. A shell is just a program, you can run it and send commands to it without a terminal e.g. with `sh my-script.sh` or `sh -c 'printf "%s\n" "hello"'`.
- A **command line** is a text-based way to interact with a computer by entering commands. On Linux, this typically means entering shell commands in a terminal; on Windows, it may mean entering PowerShell or Command Prompt commands in a terminal.

## Shells

### POSIX
[POSIX](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap01.html) is a standard for the interface an OS provides to programs and users. It is wide-ranging, covering shell languages and built-ins, standard command-line utilities, system APIs, file systems, processes, regular expressions, environment variables, and more.

The POSIX pieces most relevant here are:

- [**POSIX shell language**](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html): syntax such as `if`, `then`, `else`, `elif`, `fi`, `for`, `while`, `until`, `case`, `esac`, loops, quoting, variables, functions, command substitution, pipes, redirections, `&&`, and `||`.
- [**POSIX shell built-ins**](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_18_15): commands such as `cd`, `pwd`, `export`, `read`, `set`, `unset`, `alias`, `command`, `exec`, `eval`, `trap`, `shift`, `exit`, and `wait`.
- [**POSIX utilities**](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/contents.html): external commands such as `ls`, `cat`, `grep`, `find`, `cp`, `mv`, `rm`, `mkdir`, `touch`, `chmod`, `head`, `tail`, `sort`, `uniq`, `wc`, `cut`, `tr`, `sed`, `awk`, `xargs`, `diff`, `du`, `df`, `ps`, and `kill`, roughly in order of everyday usefulness.
- [**POSIX system interfaces**](https://pubs.opengroup.org/onlinepubs/9799919799/functions/V2_chap01.html): APIs that programs use to interact with the operating system, such as `open`, `close`, `read`, `write`, `stat`, `chmod`, `mkdir`, `unlink`, `rename`, `chdir`, `getcwd`, `fork`, `exec`, `pipe`, `dup2`, `wait`, `kill`, and `pthread_create`.

POSIX is a standard, not a program. For example, `cat` and `ls` are POSIX utility names, while GNU Coreutils and macOS's BSD-derived utilities are different implementations of many of those utilities.

### Shell implementations

A shell implementation is a program that implements a shell language. POSIX defines a portable shell language, while individual shells provide that language plus their own extensions.

| Shell | POSIX relationship                                                            | Examples of extensions or differences                                                                                                                                                                     |
|-------|-------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `sh`  | The standard POSIX shell interface; the implementation varies between systems | Portable scripts should use only POSIX syntax and commands. See examples under [/sh](./sh).                                                                                                               |
| Bash  | Implements POSIX shell features and adds many extensions                      | `[[ ... ]]`, `(( ... ))`, indexed and associative arrays, `source`, `local`, `declare`, `mapfile`, process substitution, here-strings, `shopt`, `pipefail`, `select`, and `coproc`                        |
| Zsh   | Supports much of the POSIX shell language and adds its own features           | `[[ ... ]]`, `(( ... ))`, arrays, `setopt`, `unsetopt`, `autoload`, `typeset`, extended and recursive globbing, parameter-expansion flags, process substitution, ZLE, and advanced interactive completion |
| Fish  | Uses a different command language and is not POSIX-compatible                 | Its own syntax, scripting features, and interactive experience                                                                                                                                            |
