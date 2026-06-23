#!/bin/bash
# shellcheck disable=1091

. ./share/colors.sh

set -euo pipefail

echo -e "$INFO Removing links for git extensions, hooks and bootstrap files..."
rm -rf "$HOME"/.local/bin/git-hooks-and-extensions
rm -rf "$HOME"/.local/share/git-hooks-and-extensions

MANDIR="$HOME"/.local/share/man/man1
if [ -d "$MANDIR" ]
then
    echo -e "$INFO Removing git man pages..."
    rm -f "$MANDIR/git-bootstrap.1"
    rm -f "$MANDIR/git-hooks.1"
    rm -f "$MANDIR/git-hub.1"
    rm -f "$MANDIR/git-init-wrapper.1"
    rm -f "$MANDIR/git-ls.1"
fi

echo -e "$SUCCESS Uninstall complete."

