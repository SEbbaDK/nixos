{ pkgs, ... }:
let
  ff = pkgs.flashfocus.overrideAttrs (attrs: prevAttrs: {
    propagatedBuildInputs = prevAttrs.propagatedBuildInputs ++ [ pkgs.procps ];
  });
in
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
        brightnessctl
        ff
        # i3wsr
        # swaywsr
      ];
    };
  };

  systemd.user.services.flashfocus = {
    description = "Flashfocus wm utility";
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    #environment = { PATH = "${pkgs.procps}/bin"; };
    serviceConfig = {
      ExecStart = "${ff}/bin/flashfocus --time 100 -n 2";
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
    settings = {
      detect-client-opacity = true; # Used for flashing on focus
      opacity-rule = [
    	"0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      ];
    };
  };
}
