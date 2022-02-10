#!/usr/bin/env python3

from pandocfilters import toJSONFilter, Emph, Para, Code
import os

LOGGING = bool(os.environ.get('JIRA_FILTER_LOGGING', '0'))
logfile = None

def setup_logging():
    global logfile
    logfile = open("/tmp/jira-pando-filter.txt", "w")

def flatten_string(elements):
    s = ''
    for el in elements:
        if el['t'] == 'Str':
            s += el['c']
        if el['t'] == 'Space':
            s += ' '
    return s

def handle_jira_mess(key, value, format, meta):
    if LOGGING:
        msg = f"key: {key}\n value:{value}\n format:{format}\n {meta}\n\n"
        logfile.write(msg)

    # detected inline code
    if key == 'Span':
        id_, classes, pairs = value[0]
        content = value[1]
        if classes == ['code']:
            txt = flatten_string(content)
            return Code(['', [], []], txt)

def main():
    if LOGGING:
        setup_logging()
    toJSONFilter(handle_jira_mess)
    if LOGGING:
        logfile.close()

if __name__ == "__main__":
    main()
