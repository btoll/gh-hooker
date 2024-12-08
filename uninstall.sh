#!/bin/bash
# shellcheck disable=1091

. colors.sh

set -euo pipefail

echo -e "$INFO Removing symbolic links for git extensions..."
echo -e "$INFO Removing symbolic links for git bootstrap files..."
rm -rf "$HOME"/.local/{bin,share}/gh-hooker

MANDIR=/usr/share/man/man1
echo -e "$INFO Removing git man pages..."
sudo rm -f "$MANDIR/git-bootstrap.1"
sudo rm -f "$MANDIR/git-cleanup.1"
sudo rm -f "$MANDIR/git-init-wrapper.1"
sudo rm -f "$MANDIR/git-hub.1"
sudo rm -f "$MANDIR/git-ls.1"
sudo rm -f "$MANDIR/git-package-and-install.1"

echo -e "$SUCCESS Uninstall complete."

