#!/bin/bash

set -uo pipefail

EXIT_CODE=0
FILES=$(git diff --diff-filter=d --cached --name-only 2> /dev/null)

echo -e "$INFO Running ${BOLD}EOF${OFF} pre-commit hook..."

for file in $FILES
do
    MIMETYPE=$(file --mime-type -b "$file")

    if [[
        ( "$MIMETYPE" == image/gif ) ||
        ( "$MIMETYPE" == image/jpg ) ||
        ( "$MIMETYPE" == image/jpeg ) ||
        ( "$MIMETYPE" == image/png )
    ]]
    then
        continue
    fi

    if [[ $(awk 'END{print ($0=="")}' "$file" 2> /dev/null) == 0 ]]
    then
        echo -e "$ERROR The script $file does not end with a blank line."
        EXIT_CODE=1
    fi
done

if [ $EXIT_CODE -eq 0 ]
then
    echo -e "$SUCCESS Completed successfully."
fi

exit $EXIT_CODE

