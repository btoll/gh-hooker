#!/bin/bash
# shellcheck disable=1091

. colors.sh

set -euo pipefail

BINDIR="$HOME/.local/bin/git-tools"
echo -e "$INFO Removing symbolic links for git extensions..."
rm -f "$BINDIR/bin"

echo -e "$INFO Removing git hooks..."
rm -rf "$BINDIR/hooks"

SHAREDIR="$HOME/.local/share/git-tools/bootstrap"
echo -e "$INFO Removing git bootstrap files..."
rm -rf "$SHAREDIR"

#MANDIR=/usr/share/man/man1
#echo -e "$INFO Removing git man pages..."
#rm "$MANDIR/git-bootstrap.1"
#rm "$MANDIR/git-cleanup.1"
#rm "$MANDIR/git-init-wrapper.1"
#rm "$MANDIR/git-hub.1"
#rm "$MANDIR/git-ls.1"
#rm "$MANDIR/git-package-and-install.1"

echo -e "$SUCCESS Uninstall complete."

