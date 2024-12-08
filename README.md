# `gh-hooker`

This extension provides three custom Git extensions:

- `git-init-wrapper`
- `git-hooks`
- `git-bootstrap`

## `git-init-wrapper`

Use this extension when a Git repository should be initialized.  It will do the following things:

- Initialize the new repository (`git-init`).
- Install pre-defined bootstrap files that should be copied into each new repository.
- Optionally install one or more groups of Git hooks scripts, defined by language:
    + `go`
    + `js`
    + `python`
    + `_`
        - This is a catch-all.
    + Each group contains symlinks to security tools such as [`GitGuardian`](https://github.com/GitGuardian/ggshield) and [`Trivy`](https://github.com/aquasecurity/trivy).

## `git-hooks`

Use this extension when installing Git hooks into an existing repository.

## `git-bootstrap`

Use this extension when installing bootstrap files into an existing repository.

# Installation

```bash
gh extension install btoll/gh-hooker
```

# Initialize

```bash
gh hooker
```

This will copy custom Git extensions and Git hooks to `$HOME/.local/bin/gh-hooker`.  In addition, files that are common to all repositories of an organization are copied to `$HOME/.local/share/gh-hooker`.

The hooks are configured locally.  The global `.gitconfig` is untouched.

# Usage

Initialize a new Git repository, copy bootstrap files to it and install Git hooks:

```bash
git init-wrapper -d my-new-repo --hooks go
```

List the installed hooks:

```bash
git config --local --get-all hooks.pre-commit.hook
gitguardian.sh
go-fmt.sh
go-vet.sh
hadolint.sh
shellcheck.sh
trivy.sh
```

List the installed scripts:

```bash
$ ls .git/hooks/pre-commit.d
f.sh  gitguardian.sh  go-fmt.sh  go-vet.sh  hadolint.sh  shellcheck.sh  trivy.sh
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

