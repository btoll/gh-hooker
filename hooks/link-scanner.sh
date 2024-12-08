#!/bin/bash

set -uo pipefail

BIN=link-scanner

if ! command -v $BIN > /dev/null
then
    echo -e "$WARN ${BOLD}${BIN}${OFF} is not present on the system..."
    exit 0
fi

EXIT_CODE=0
FILES=$(git diff-index --cached --name-only HEAD 2> /dev/null | grep ".md\b")

if [ -n "$FILES" ]
then
    echo -e "$INFO Running ${BOLD}${BIN}${OFF} pre-commit hook..."

    for file in $FILES
    do
        if ! $BIN -filetype ".md" -filename "$file"
        then
            EXIT_CODE=1
        fi
    done

    if [ $EXIT_CODE -eq 0 ]
    then
        echo -e "$SUCCESS Completed successfully."
    fi
fi

exit $EXIT_CODE

