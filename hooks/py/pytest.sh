#!/bin/bash

set -uo pipefail

BIN=pytest

if ! command -v pytest > /dev/null
then
    echo -e "$WARN ${BOLD}${BIN}${OFF} is not present on the system..."
    exit 0
fi

FILES=$(git diff --diff-filter=d --cached --name-only HEAD 2> /dev/null | grep ".py\b" || true)

if [ -n "$FILES" ]
then
    echo -e "$INFO Running ${BOLD}${BIN}${OFF} pre-commit hook..."

    cd tests || exit
    $BIN -v
    EXIT_CODE="$?"

    if [ $EXIT_CODE -eq 0 ]
    then
        echo -e "$SUCCESS Completed successfully."
    fi
fi

exit "$EXIT_CODE"

