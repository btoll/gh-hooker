# `git-hooks-and-extensions`

- [About](#about)
    + [`git-init-wrapper`](#git-init-wrapper)
    + [`git-bootstrap`](#git-bootstrap)
    + [`git-hooks`](#git-hooks)
    + [`git-hub`](#git-hub)
    + [`git-ls`](#git-ls)
- [Installation](#installation)
    + [`podman`](#podman)
    + [`git clone`](#git-clone)
    + [`gh`](#gh)
- [Usage](#Usage)

---

# About

This extension provides a number of custom Git extensions:

- `git-init-wrapper`
- `git-bootstrap`
- `git-hooks`
- `git-hub`
- `git-ls`

## `git-init-wrapper`

A wrapper around `git init` that also optionally installs git pre-commit hooks and bootstrap files.

- Initialize the new repository (`git-init`).
- Install pre-defined bootstrap files that should be copied into each new repository.
- Optionally install one or more groups of Git hooks scripts, defined by language:
    + `go`
    + `python`
    + `js`
    + `_`
        - This is a catch-all.

## `git-bootstrap`

Copy every file in $HOME/.local/share/git-hooks-and-extensions/bootstrap into the git project directory.  Currently, it will install the following files:

- `README.md`
- `LICENSE`
- `.gitignore`

Note that several of the files contain the placeholder `PROJECT_NAME`, which will be replaced by the project name.

## `git-hooks`

Use this extension when installing Git hooks into an existing repository.

## `git-hub`

Open any file, directory or commit on GitHub in regular view or blame view.

## `git-ls`

List the files that are staged and modified or that make up any given commit and optionally open in Vim for editing.

For example:

- Open all the files that made up the previous commit in buffers in Vim:

```bash
$ git ls -e
```

- List the files that are in the staged area and are modified in the workspace:

```bash
$ git ls -e
```

- And, open them in Vim:

```bash
$ git ls --dirty -e
```

Add a useful alias:

```bash
alias dirty=git ls --dirty -e
```

Weeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

# Installation

## [`podman`]

```bash
podman run --rm -v "$HOME/.local":/root/.local docker.io/btoll/git-hooks-and-extensions:latest
```

## `git-clone`

```bash
$ git clone git@github.com:btoll/git-hooks-and-extensions.git
$ cd git-hooks-and-extensions
$ ./git-hooks-and-extensions
$ export PATH="$PATH":"$HOME"/.local/bin/git-hooks-and-extensions/bin
```

## [`gh`]

The structure of this repository is such that it allows for easily installation when using `gh`.

```bash
gh extension install btoll/git-hooks-and-extensions
```

```bash
git-hooks-and-extensions
```

This will copy custom Git extensions and Git hooks to `$HOME/.local/bin/git-hooks-and-extensions`.  In addition, files that are common to all repositories of an organization are copied to `$HOME/.local/share/git-hooks-and-extensions`.

The hooks are configured locally.  The global `.gitconfig` is untouched.

# Usage

Initialize a new Git repository, copy bootstrap files to it and install Git hooks:

```bash
git init-wrapper -d my-new-repo --hooks go --yes
```

List the installed hooks:

```bash
git config --local --get-all hooks.pre-commit.hook
go-fmt.sh
golangci-lint.sh
gosec.sh
go-vet.sh
```

List the installed scripts:

```bash
$ ls .git/hooks/pre-commit.d
f.sh  ggshield.sh  go-fmt.sh  go-vet.sh  hadolint.sh  shellcheck.sh  trivy.sh
```

> `f.sh` is a helper script.

Multiple hooks are separated by commas:

```bash
git init-wrapper -d my-new-repo --hooks _,go,python
```

Copy bootstrap files into an existing repository:

```bash
cd my-new-repo
git bootstrap
```

Copy Git hooks into an existing repository:

```bash
cd my-new-repo
git hooks -t go
```

Multiple hooks are separated by commas:

```bash
git hooks -t _,go,python
```

---

Note that `ggshield` can install its own `pre-commmit` hook:

```bash
ggshield install [OPTIONS]
```

[`podman`]: https://podman.io/
[`gh`]: https://cli.github.com/
[ggshield install]: https://docs.gitguardian.com/ggshield-docs/reference/install
[`ggshield`]: https://github.com/GitGuardian/ggshield
[`Trivy`]: https://github.com/aquasecurity/trivy

