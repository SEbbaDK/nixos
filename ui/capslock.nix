{ pkgs, ... }:
let
  modmapconf = pkgs.writeText  "xkb-layout" ''
      clear Lock
      keycode 66 = Hyper_L
      remove mod4 = Hyper_L
      add mod3 = Hyper_L
  '';
in
{
  services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xmodmap}/bin/xmodmap ${modmapconf}";
}

