#!/bin/bash

set -eo pipefail

LANG=C
umask 0022

# Args
# 1 = program
# 2 = regex to get changed files
# 3 = subcommand (if different from program)
verify go "\.go$" vet

