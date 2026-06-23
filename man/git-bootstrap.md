# git-bootstrap 1

## NAME

git-bootstrap -- Copy git hooks and extensions into a project

## SYNOPSIS

`git bootstrap` [OPTIONS]

## DESCRIPTION

Copy every file in `$HOME/.local/share/git-hooks-and-extensions/bootstrap`
into the git project directory.

## OPTIONS

`-d`, `--dir` <path>
    Path to git repository (default: current directory)

## EXAMPLES

Bootstrap the current repository:
    `git bootstrap`

Bootstrap a specific repository:
    `git bootstrap --dir $HOME/projects/foo`

## AUTHOR

Benjamin Toll ben@benjamintoll.com
