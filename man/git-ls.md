# git-ls 1

## NAME

git-ls -- List the files that are staged and modified or that make up any given commit and optionally open in Vim for editing.

## SYNOPSIS

`git ls` [OPTIONS]

## DESCRIPTION

List the files that make up any given commit or that have been staged or modified. Defaults to HEAD unless another commit is specified.

Files can be opened in the Vim editor in horizontally or vertically split windows, tabs or buffers.

A search of the commit files can be performed using a regular expression so that only those files will be targeted.

## OPTIONS

`-c, --commit <commit>`
    Commit hash or reference (default: HEAD)

`-e, --edit <mode>`
    Open files in Vim. Mode can be: `b` (buffers), `h` (horizontal split), `v` (vertical split) or `t` (tabs)

`--dirty`
    List files that are staged and modified in the workspace

`-pattern <regex>`
    Filter files matching the regular expression

## EXAMPLES

List files in latest commit:
    `git ls`

List staged and modified files:
    `git ls --dirty`

Open files in vertically-split Vim windows:
    `git ls --edit v`

Open files in tabs for a specific commit:
    `git ls --commit HEAD -e t`

Open files in buffers:
    `git ls --edit b`

Open files for a specific hash in horizontally-split windows:
    `git ls -c cf457b6 -e h`

Open matching files for a specific hash in horizontally-split windows:
    `git ls -c cf457b6 -pattern debugger -e h`

## AUTHOR

Benjamin Toll ben@benjamintoll.com
