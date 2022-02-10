#!/usr/bin/env bash
set -euo pipefail

cat "$1" | JIRA_FILTER_LOGGING=1 pandoc --from html --to gfm --filter ./jira_filter.py --wrap none
