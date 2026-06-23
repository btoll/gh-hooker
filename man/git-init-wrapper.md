# git-init-wrapper 1

## NAME

git-init-wrapper -- A wrapper around `git init` that also optionally installs git pre-commit hooks and files such as `LICENSE`.

## SYNOPSIS

`git init-wrapper` [OPTIONS]

## DESCRIPTION

A wrapper around `git init` that initializes a new git repository and optionally installs git pre-commit hooks and bootstrap files like `LICENSE`.

## OPTIONS

`-d, --dir <path>`
    Path to the new git directory

`-t, --hooks <list>`
    Comma-separated list of hook directories to install from `$GIT_HOOKS/`. Examples: `go`, `py`, `_`

## EXAMPLES

Initialize without hooks:
    `git init-wrapper`
    Installs LICENSE and other bootstrap files only.

Initialize with hooks:
    `git init-wrapper --hooks go,_`
    Copies all hooks from the `$GIT_HOOKS/go/` and `$GIT_HOOKS/_/` directories, LICENSE and other bootstrap files. Asks for confirmation for each pre-commit hook to install.

## AUTHOR

Benjamin Toll ben@benjamintoll.com
