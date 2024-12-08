#!/bin/bash
# shellcheck disable=1091

. colors.sh

set -euo pipefail

if [ $EUID -ne 0 ]; then
echo -e "$ERROR This script must be run as root!" 1>&2
    exit 1
fi

MANDIR=/usr/share/man/man1
echo -e "$INFO Installing git man pages..."
pushd man
ln -s "$PWD"/git-bootstrap.1 "$MANDIR/git-bootstrap.1"
ln -s "$PWD"/git-cleanup.1 "$MANDIR/git-cleanup.1"
ln -s "$PWD"/git-init-wrapper.1 "$MANDIR/git-init-wrapper.1"
ln -s "$PWD"/git-hub.1 "$MANDIR/git-hub.1"
ln -s "$PWD"/git-ls.1 "$MANDIR/git-ls.1"
ln -s "$PWD"/git-package-and-release.1 "$MANDIR/git-package-and-release.1"
popd

echo -e "$INFO Installation complete."

