# autoscript
File management for [`script(1)`](http://man7.org/linux/man-pages/man1/script.1.html).

**`script`** makes a typescript (recording) of everything displayed on your terminal.

**`autoscript`** manages files created by `script`, allowing the user to list, delete and resume recordings. `autoscript` also attaches some data along the created typescripts, like the current date or a user-specified message.

## Requirements

- On **GNU/Linux**, `autoscript` requires Bash, and the `script` and `scriptreplay` commands.
- On **macOS**, `autoscript` requires Bash and only the `script` command.

## Installation
1. Check out `autoscript` into a directory. In the following example, `~/.autoscript` is used:
```bash
$ git clone https://github.com/federicotdn/autoscript.git ~/.autoscript
```

2. Add the `autoscript` executable to your `$PATH`, by adding a new line to your Bash configuration file:
```bash
$ echo 'export PATH="$HOME/.autoscript/bin:$PATH"' >> ~/.bashrc # on GNU/Linux

$ echo 'export PATH="$HOME/.autoscript/bin:$PATH"' >> ~/.bash_profile # on macOS
```

3. Load your Bash configuration file:
```bash
$ source ~/.bashrc # on GNU/Linux

$ source ~/.bash_profile # on macOS
```

## Usage
Once `autoscript` is installed, you can start recording a terminal session using the `record` command. Once a session has started, it can be stopped using the `exit` shell builtin:

```bash
$ autoscript record -m "github tutorial"
This session is being recorded by autoscript.
Script file: /home/me/.config/autoscript/3.typescript
Use 'exit' to stop recording.

$ echo "All output to the terminal will be recorded"
All output to the terminal will be recorded

$ exit # Exit the current session
```

After a session has been recorded, it'll show up in the sessions list:
```bash
$ autoscript list
 ID    DATE                 MESSAGE
 1     2018-04-13 14:58     -
 2     2018-04-14 20:01     -
 3     2018-04-18 11:04     github tutorial
```

To replay a recorded session, use the `replay` command, specifying the session ID:
```bash
$ autoscript replay -i 3
Script started on 2018-04-18 11:04:53

$ echo "All output to the terminal will be recorded"
All output to the terminal will be recorded

$ exit

Script done on 2018-04-18 11:05:51
```

To resume a stopped session, use the `resume` command:
```bash
$ autoscript resume -i 3
$ # Continue working inside session 3...
```

The `context` command will return an ID only when inside an `autoscript` session:
```bash
$ autoscript context
3
```

Finally, the `delete` command can be used to delete a stopped session:
```bash
$ autoscript delete -i 1 # Delete session with ID 1
$ autoscript list
 ID       DATE                 MESSAGE
 2        2018-04-14 20:01     -
 3 (r)    2018-04-18 11:04     github tutorial
```

Note that the `list` command will show a `(r)` next to the IDs of sessions that are currently being recorded.

## Tips
Using [junegunn's `fzf`](https://github.com/junegunn/fzf), one can easily search for text in a previousy recorded session:
```bash
$ autoscript replay -i 3 | fzf --ansi --reverse
```

## Uninstalling
To uninstall `autoscript`, delete the application directory (default: `~/.autoscript`), and the configuration directory (default: `~/.config/autoscript`). Finally, remove the `$PATH` entry that was added to `.bashrc` or `.bash_profile`.

## Todo
 - Add more scripts metadata
 - Script compression
 - Bash tab completion
