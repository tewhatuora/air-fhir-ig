#!/bin/bash
set -eo pipefail

# the history.md is built from scratch in the IG builder
# we want some custom content in it
# The content must be html as this is done post render

# find the <h2>History</h2> and insert our content after it

awk '
/<h2>History<\/h2>/ {
    print
    while ((getline line < "input/snippet/custom.history.html") > 0)
        print line
    close("input/snippet/custom.history.html")
    next
}
{ print }
' output/history.html > temp/history.html.tmp && mv temp/history.html.tmp output/history.html
