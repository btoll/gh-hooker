# `gh-hooker`

- [About](#about)
    + [`git-init-wrapper`](#git-init-wrapper)
    + [`git-hooks`](#git-hooks)
    + [`git-bootstrap`](#git-bootstrap)
- [Installation](#installation)
    + [`gh`](#gh)
    + [`podman`](#podman)
    + [tar](#tar)
- [Usage](#Usage)

---

# About

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
    + Each group contains symlinks to security tools such as [`ggshield`](https://github.com/GitGuardian/ggshield) and [`Trivy`](https://github.com/aquasecurity/trivy).

## `git-hooks`

Use this extension when installing Git hooks into an existing repository.

## `git-bootstrap`

Use this extension when installing bootstrap files into an existing repository.

# Installation

## `gh`

```bash
gh extension install btoll/gh-hooker
```

```bash
gh hooker
```

This will copy custom Git extensions and Git hooks to `$HOME/.local/bin/gh-hooker`.  In addition, files that are common to all repositories of an organization are copied to `$HOME/.local/share/gh-hooker`.

The hooks are configured locally.  The global `.gitconfig` is untouched.

## `podman`

```bash
podman run --rm -v "$HOME/.local":/root/.local docker.io/btoll/gh-hooker:latest
```

## tar

Create the tarball:

```bash
tar -cjf gh-hooker_0.1.0.bz2 --exclude .git gh-hooker
```

Unpack:

```bash
tar -xjf gh-hooker_0.1.0.bz2
cd gh-hooker
mkdir -p "$HOME"/.local/{bin,share}/gh-hooker
cp -r {bin,hooks} "$HOME"/.local/bin/gh-hooker/
cp -r bootstrap "$HOME"/.local/share/gh-hooker/
export PATH="$PATH":"$HOME"/.local/bin/gh-hooker/bin
```

# Usage

Initialize a new Git repository, copy bootstrap files to it and install Git hooks:

```bash
git init-wrapper -d my-new-repo --hooks go
```

List the installed hooks:

```bash
git config --local --get-all hooks.pre-commit.hook
ggshield.sh
go-fmt.sh
go-vet.sh
hadolint.sh
shellcheck.sh
trivy.sh
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

[ggshield install](https://docs.gitguardian.com/ggshield-docs/reference/install)

