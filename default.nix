{ stdenv, writeShellScriptBin, config, lib, pkgs, python3, bash }:

let
  files = stdenv.mkDerivation {
    name = "jira_filter_files";
    src = ./.;
    installPhase = ''
    mkdir -p "$out"
    cp $src/jira_filter.py $out
    cp $src/a2md.sh $out
    '';
  };

  py = python3.withPackages(ps: [ps.pandocfilters]);

  jira_filter = writeShellScriptBin "jira_filter" ''
    ${py}/bin/python3 "${files}/jira_filter.py"
  '';

  a2md = writeShellScriptBin "a2md" ''
    PATH=${jira_filter}/bin:$PATH ${bash}/bin/bash ${files}/a2md.sh
  '';
in
  a2md
