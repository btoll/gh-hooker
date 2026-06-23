# git-hub 1

## NAME

git-hub -- Open any file, directory or commit on GitHub in regular view or blame view.

## SYNOPSIS

`git hub` [OPTIONS]

## DESCRIPTION

Open any file, directory or commit on GitHub in the regular view or blame view. Supports remote branches, specific line ranges and commit hashes.

## OPTIONS

`-f, --file <path>`
    File or directory to open on GitHub

`-b, --branch <branch>`
    Remote branch (defaults to currently checked out branch)

`--range <range>`
    Line range to highlight. Format: `L10-L20`

`--hash <hash>`
    Commit hash to open

`--get-hash <ref>`
    Resolve a reference (branch name or tag) to its commit hash and open it

`--blame`
    Open file in blame view

## EXAMPLES

Open current working directory:
    `git hub`

Open a specific file:
    `git hub --file grid/filters/filter/List.js`

Open file in blame view:
    `git hub -f grid/header/Container --blame`

Open file from a remote branch:
    `git hub --branch extjs-4.2.x -f Component.js`

Open a commit hash:
    `git hub --hash b51abf6f38902`

Open commit hash from a local branch:
    `git hub --get-hash EXTJS-15755`

Open commit hash from a tag:
    `git hub --get-hash extjs5.1.0`

Open file with line range highlighted:
    `git hub -f app.js --range 'L10-L20'`

## AUTHOR

Benjamin Toll ben@benjamintoll.com
