function debugLog() {
    /usr/bin/echo "[$0:${BASH_LINENO[0]}] $@"
}

function echo() {
    /usr/bin/echo "[$0:${BASH_LINENO[0]}] $@"
}

function yq() {
    # debugLog "yq $@"
    /usr/bin/yq "$@"
}