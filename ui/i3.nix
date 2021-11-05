let
  user = import ../user.nix;
in
{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ./i3.conf;
      #workspaceNaming = true;
      extraPackages = with pkgs; [
        dmenu
        rofi
        i3status
        i3lock-color
        libnotify
        dunst
        pywal
        # i3wsr
        # swaywsr
      ];
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
  };
}
