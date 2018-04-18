# autoscript
File management for `script(1)`.

## Installation
1. Check out `autoscript` into a directory. In the following example, `~/.autoscript` is used:
```bash
$ git clone https://github.com/federicotdn/autoscript.git ~/.autoscript
```

2. Add the `autoscript` executable to your `$PATH`, by adding a new line to your `.bashrc` file:
```bash
$ echo 'export PATH="$HOME/.autoscript/bin:$PATH"' >> ~/.bashrc
```

3. Load your `.bashrc` file:
```bash
$ source ~/.bashrc
```

## Usage
```bash
usage: autoscript [-v] [-h] <command> [-i <id>]

Available commands:
   record
   replay
   resume
   delete
   list
   context
```

## Tips
Add some tips here.

## Todo
 - Better list mode
 - Script compression
 - Print sessions removing ANSI escape sequences
 - Bash tab completion
