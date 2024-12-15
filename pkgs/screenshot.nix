{ pkgs ? import <nixpkgs> { }, ... }:
let
  gnome-screenshot = "${pkgs.gnome-screenshot}/bin/gnome-screenshot";
  pinta = "${pkgs.pinta}/bin/pinta";
  xclip = "${pkgs.xclip}/bin/xclip";
in
pkgs.writeShellScriptBin "screenshot" ''
  set -e #Crash on failure
  case $1 in
      area )
          TYPE="-a" ;;
      window )
          TYPE="-w" ;;
      fullscreen )
          TYPE="" ;;
  esac
  mkdir -p "$HOME/pictures/screenshots"
  filename="$HOME/pictures/screenshots/$(date +%Y-%m-%d-%H-%M-%S.png)"
  ${gnome-screenshot} $TYPE -f "$filename" && \
    [ -f "$filename" ] && \
    ${pinta} "$filename" && \
    ${xclip} -sel clipboard -t image/png < "$filename"
''
