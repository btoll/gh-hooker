#!/bin/bash

set -eo pipefail

LANG=C
umask 0022

# Args
# 1 = program
# 2 = regex to get changed files
# 3 = subcommand (if different from program)
verify hadolint "Dockerfile.*"
#FILES=$(git diff-index --cached --name-only HEAD 2> /dev/null | grep -i "Dockerfile.*")

