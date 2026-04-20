#!/bin/bash
# shellcheck disable=1091

. colors.sh

set -euo pipefail

BINDIR="$HOME/.local/bin/git-tools"
mkdir -p "$BINDIR"
echo -e "$INFO Installing git extensions into $BINDIR..."
ln -s "$(pwd)/bin" "$BINDIR"

echo -e "$INFO Installing git hooks into $BINDIR..."
cp -r "$(pwd)/hooks" "$BINDIR"

SHAREDIR="$HOME/.local/share/git-tools/bootstrap/"
mkdir -p "$SHAREDIR"
echo -e "$INFO Installing git bootstrap files into $SHAREDIR..."
cp bootstrap/* "$SHAREDIR"

export PATH=$PATH:$HOME/.local/bin/git-tools/
echo -e "$SUCCESS Installation complete."

