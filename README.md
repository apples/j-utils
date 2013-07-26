# Linux J-Utils

These utils are things I use every day, nothing special.
If you use these scripts, make sure you understand what they do
before using them, or you might break something.

# Bin

| Name   | Description
|:-------|:---
| `wcat` | Wrapper for `wget` that prints to stdout.

Wow, only one!
Why am I even writing this?

# Apps

The `apps` folder is special.
When `collect.sh` is run,
all installed apps will be aggregated in `apps/.all`.

To install an app,
when compiling from source,
assuming the `apps` folder is in `$HOME`,
run the configure script with `--prefix="$HOME/apps/myAppName"`.
Then, after `make && make install`,
run `apps/collect.sh`.

This symlinks all of the installed apps' files into `apps/.all`.
For example, if you install Git into `apps/git-latest`,
then, after running `collect.sh`,
the `git` executable is `$HOME/apps/.all/bin/git`.
