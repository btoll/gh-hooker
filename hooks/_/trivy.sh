#!/bin/bash

set -eo pipefail

LANG=C
umask 0022

# Create an SBOM with vulnerability, et al., information included.
verify_all trivy "fs . --format cyclonedx --scanners misconfig,license,secret,vuln --output sbom.json --severity CRITICAL --exit-code 1"
# Now, scan the SBOM for vulnerabilities.
verify_all trivy "sbom sbom.json -o vuln.table --severity CRITICAL --exit-code 1"

