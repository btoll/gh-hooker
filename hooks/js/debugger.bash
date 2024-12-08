#!/bin/bash

set -uo pipefail

EXIT_CODE=0
FILES=$(git diff-index --cached --name-only HEAD 2> /dev/null | ag -l --vimgrep "^\s*debugger;?")

echo -e "$INFO Running ${BOLD}debugger${OFF} pre-commit hook..."

if [ -n "$FILES" ]; then
    echo -e "$ERROR There is an uncommented debugger statement in the following files(s):"
    echo -e "$FILES"

    EXIT_CODE=1
fi

if [ $EXIT_CODE -eq 0 ]; then
    echo -e "$SUCCESS Completed successfully."
fi

exit $EXIT_CODE

