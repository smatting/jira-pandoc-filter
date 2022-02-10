#!/usr/bin/env bash
set -euo pipefail

xclip -selection clipboard -o -t text/html \
    | tr -cd '[:print:]' \
    | pandoc --from html --to gfm --filter jira_filter --wrap none \
    | xclip -selection clipboard -i
