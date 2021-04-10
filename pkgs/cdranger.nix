{ pkgs ? import <nixpkgs> {}, ...}:
pkgs.writeShellScriptBin "cdranger" ''
  tmpfile="$(mktemp -t 'ranger.XXXX')"
  ${pkgs.ranger}/bin/ranger --choosedir="$tmpfile" "$@"
  cd "$(cat "$tmpfile")"
  rm -f -- "$tmpfile"
''
