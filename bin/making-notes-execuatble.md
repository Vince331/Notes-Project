`PATH`
------

Operating System level (not part of a programming language, but part
of how Unix works).

This is an "environment variable", which means that when you set it,
and run a program, that program will have access to its value.
We say the value of the variable came from the environment (the program
that ran it), hence naming them environment variables.

The value of the `PATH` is an array of directories.
When you run a program, Unix will locate the program by searching
the directories in the `PATH`.

Every way to get a program that can be run from anywhere
will require you to use the `PATH`, in some manner.


`$LOAD_PATH`
------------

A global variable in Ruby. We know it's a global,
because it begins with a dollar sign.

It is named this, because the idea behind it is taken from the `PATH`, up above.

The value of the `$LOAD_PATH` is an array of directories.
When you require a file, Ruby will locate the file by searching
the directories in the `$LOAD_PATH`.

This will not have anything to do with getting a program to run from anywhere.


Making `notes` executable
-------------------------

You can either:

1. Make a symlink to the notes executable
   from some directory in your PATH.
2. Add the directory containing the `notes` executable
   to your `PATH` environment variable.


Adding a symlink
----------------

Here is an example:

```
$ ln -s "$PWD/bin/notes" "$HOME/bin/notes"
```

That works, because `~/bin` is in your `PATH`.

Another reasonable place to link from would be your dotfiles bin.

```
$ ln -s "$PWD/bin/notes" "$HOME/code/dotfiles/bin/notes"
```


Adding the directory to your `PATH`
-----------------------------------

You can do this in the `fish` shell with:

```
$ set -x PATH "$PWD/bin" $PATH
```

Translated to Ruby (for the purpose of being easier to think about,
this won't actually work).

```
path = ["./bin"] + path
```

The problem with this approach is that environment
variables are stored in memory, not your file system,
so when the program ends (eg if you restart your computer,
or open a second shell), then the path will not have this information.

So you need to put the command that adds (the `set -x ...`)
somewhere that it will run every time you start a new shell.

Fish gives you such a place:
`~/.config/fish/config.fish`

Every time fish starts, it will run the code in that file.
So if you add your directory from within there,
then your `PATH` will have it set each time you start a shell.

