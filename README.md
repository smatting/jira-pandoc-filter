An attempt to escape the horrible JIRA editor.

`jira_filter.py` is a [pandoc filter](https://pandoc.org/filters.html) that cleans up some of JIRA's html so that it can be converted to Markdown without too much loss.

This repo also contains script `a2md` that enables a somewhat crappy workflow:

1. Copy comment or issue text in JIRA (Ctrl+C)
2. Run `a2md`. This re-populates your clipboard with the contents converted to Markdown.
3. Paste to your favorite editor and edit
4. Copy&paste markdown back to JIRA
5. 🥲


# How to install

Make sure you have the following packages installed:
- `pandoc`
- `xclip`

Make sure you have [https://nixos.org/](nix package manager) installed.

```sh
$ nix-env -if ./local.nix
```
