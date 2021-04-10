{ pkgs ? import <nixpkgs> {}, ... }:
pkgs.writeShellScriptBin "nix-convert" ''
  usage() {
  cat << EOF
  USAGE: $0 [FLAG] <CONTENT>
  FLAG:
    --yaml  output yaml (default)
    --json  output json (same as nix eval --json)
    --toml  output toml
    --hcl   output hcl
    --help  print this help menu
  EOF
  }
  case "$1" in
    "--help")
      usage
      exit
      ;;
    "--yaml")
      FLAG="-jy"
      shift
      ;;
    "--json")
      FLAG=""
      shift
      ;;
    "--toml")
      FLAG="-jt"
      shift
      ;;
    "--hcl")
      FLAG="-jc"
      shift
      ;;
    *)
      usage
      exit 1
      ;;
  esac

  if [ "$1" != "" ]
  then
    CODE="$1"
  else
    CODE="$(cat /dev/stdin)"
  fi

  if [ $FLAG == "" ]
  then
    ${pkgs.nix}/bin/nix eval "($CODE)" --json
  else
    ${pkgs.nix}/bin/nix eval "($CODE)" --json | ${pkgs.yj}/bin/yj $FLAG
  fi
''
