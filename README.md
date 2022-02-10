# How to install

Make sure you have [https://nixos.org/](nix package manager) installed.

``` sh
$ nix-env -if ./local.nix
```

# How to Use

Make sure you have the following packages installed:
- `pandoc`
- `xclip`

1. Copy comment or issue text in JIRA (Ctrl+C)
2. Run `a2md`. This re-populates your clipboard with the contents converted to Markdown.
3. Paste to your favorite editor and edit
4. Copy&paste markdown back to JIRA
