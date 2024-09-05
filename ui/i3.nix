let
  user = import ../user.nix;
in
{ pkgs, ... }:
{
  services.displayManager = {
    defaultSession = "none+i3";
  };

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
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
        xdotool
        # i3wsr
        # swaywsr
      ];
    };
  };
}
