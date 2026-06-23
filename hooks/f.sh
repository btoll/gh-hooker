#!/bin/bash
# https://www.shellhacks.com/bash-colors/

set -eo pipefail

LANG=C
umask 0022

augment_command() {
    local subcommand=$1

    if [ -n "$subcommand" ]
    then
        # Important to copy before re-assigning to `bin`.
        cmd="$bin $subcommand"
#        bin="${bin} ${subcommand}"
    fi

    echo "$cmd"
}

if_success() {
    local exit_code=$1

    if [ "$exit_code" -eq 0 ]
    then
        echo -e "$SUCCESS Completed successfully."
    fi
}

is_installed() {
    local bin="$1"

    if ! command -v "$bin" > /dev/null
    then
        echo -e "$WARN ${BOLD}${bin}${OFF} is not present on the system..."
        exit 0
    fi
}

verify_all() {
    local bin=$1
    local subcommand=$2
    local cmd=$bin
    local exit_code=0

    is_installed "$bin"

    cmd=$(augment_command "$subcommand")
    echo -e "$INFO Running ${BOLD}${cmd}${OFF}"

    if ! eval "$cmd"
    then
        exit_code=1
    fi

    if_success $exit_code
    return $exit_code
}

# Args
# 1 = program
# 2 = regex to get changed files
# 3 = subcommand (if different from program)
verify_changed() {
    local bin=$1
    local regex=$2
    local subcommand=$3
    local cmd=$bin
    local exit_code=0

    is_installed "$bin"

    # Force an empty value if there are no matches using `|| true` else the script
    # exits prematurely when there are no matches for a particular regex.
    # The lowercase 'x' in the `--diff-filter` option will exclude deleted files
    # from being considered. (TODO, what happened to this?)
    # Importantly, this works when there is no HEAD, i.e., when a repo has not been
    # cloned.
    FILES=$(git diff --diff-filter=d --cached --name-only | grep -E ''"$regex"'' || true)

    if [ -n "$FILES" ]
    then
        cmd=$(augment_command "$subcommand")
        echo -e "$INFO Running ${BOLD}${cmd}${OFF}"

        for file in $FILES
        do
            if ! eval "$cmd" "$file"
            then
                exit_code=1
            fi
        done

        if_success $exit_code
    fi

    return $exit_code
}

export -f augment_command
export -f if_success
export -f is_installed
export -f verify_all
export -f verify_changed

