with import <nixpkgs> {};
(python3.withPackages (ps: [ps.pandocfilters ps.ipython ps.ipdb])).env
