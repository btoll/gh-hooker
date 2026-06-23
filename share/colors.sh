#!/bin/bash
# https://www.shellhacks.com/bash-colors/

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

export PURPLE="${FG_PURPLE}[PURPLE]${OFF}"
export WHITE="${FG_WHITE}[WHITE]${OFF}"

export ERROR="${FG_RED}[ERROR]${OFF}"
export INFO="${FG_BLUE}[INFO]${OFF}"
export SUCCESS="${FG_GREEN}[SUCCESS]${OFF}"
export WARN="${FG_YELLOW}[WARN]${OFF}"

export MATCH="${FG_GREEN}[MATCH]${OFF}"
export NO_MATCH="${FG_RED}[NO MATCH]${OFF}"

export CHECK="[$FG_GREEN✓$OFF]"
export CROSS="[$FG_RED✗$OFF]"

