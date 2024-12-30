#!/usr/bin/env bash
#
# Generate dokan stubs from the source directory.
#

HEADER=$'/**\n * Generated stub declarations for dokan.\n * @see https://dokan.co\n * @see https://github.com/0zd0/dokan-stubs\n */'

FILE="dokan-stubs.php"

set -e

test -f "$FILE" || touch "$FILE"
test -d "source/dokan-lite"

"$(dirname "$0")/vendor/bin/generate-stubs" \
    --force \
    --finder=finder.php \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --constants \
    --out="$FILE"