#!/bin/bash
# https://www.shellhacks.com/bash-colors/

set -eo pipefail

LANG=C
umask 0022

export FG_BLUE='\e[34m'
export BG_BLUE='\e[44m'
export FG_YELLOW='\e[33m'
export BG_YELLOW='\e[43m'
export FG_WHITE='\e[37m'
export BG_WHITE='\e[47m'
export FG_GREEN='\e[32m'
export BG_GREEN='\e[42m'
export FG_PURPLE='\e[35m'
export BG_PURPLE='\e[45m'
export FG_RED='\e[31m'
export BG_RED='\e[41m'

export BOLD='\e[1m'
export UNDERLINE='\e[4m'

export OFF='\e[0m'

#PURPLE="$FG_PURPLE[PURPLE]$FG_PURPLE"
#WHITE="$FG_WHITE[WHITE]$FG_WHITE"

export ERROR="${FG_RED}[ERROR]${FG_RED}${OFF}"
export INFO="${FG_BLUE}[INFO]${FG_BLUE}${OFF}"
export SUCCESS="${FG_GREEN}[SUCCESS]${FG_GREEN}${OFF}"
export WARN="${FG_YELLOW}[WARN]${FG_YELLOW}${OFF}"

export MATCH="${FG_GREEN}[MATCH]${FG_GREEN}${OFF}"
export NO_MATCH="${FG_RED}[NO MATCH]${FG_RED}${OFF}"

export CHECK="[$FG_GREEN✓$OFF]"
export CROSS="[$FG_RED✗$OFF]"

