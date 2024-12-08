#!/bin/bash

set -eo pipefail

LANG=C
umask 0022

# Args
# 1 = program
# 2 = regex to get changed files
# 3 = subcommand (if different from program)
# Note that pycodestyle's error messages are verbose enough that we don't need to have our own.
verify pycodestyle py

