#!/bin/bash

set -eo pipefail

LANG=C
umask 0022

verify_all go "test -race ./..."

