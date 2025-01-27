#!/bin/bash

set -eo pipefail

LANG=C
umask 0022

# Args
# 1 = program
# 2 = regex to get changed files
# 3 = subcommand (if different from program)
verify trivy ".*" "fs --scanners misconfig,license,secret,vuln --severity HIGH,CRITICAL --exit-code 1"

