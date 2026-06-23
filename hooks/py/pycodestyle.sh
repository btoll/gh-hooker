#!/bin/bash

set -eo pipefail

LANG=C
umask 0022

verify_changed pycodestyle py

